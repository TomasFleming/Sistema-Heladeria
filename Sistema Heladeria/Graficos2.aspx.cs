using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;

namespace Sistema_Heladeria
{
    public partial class Graficos2 : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
            //Fecha_Max_tx.SelectedValue = "12";
        }

        protected void Flitrar_Ganancias_Click(object sender, EventArgs e)
        {
            con.Open();

            // Define el rango de meses que deseas, por ejemplo, de enero (1) a marzo (3).
            int mesInicio = Convert.ToInt32(Fecha_min_tx.SelectedValue);
            int mesFin = Convert.ToInt32(Fecha_Max_tx.SelectedValue);

            String rango = @"WITH Meses AS (
                    SELECT 1 AS MesNumero, 'Enero' AS NombreMes
                    UNION SELECT 2, 'Febrero'
                    UNION SELECT 3, 'Marzo'
                    UNION SELECT 4, 'Abril'
                    UNION SELECT 5, 'Mayo'
                    UNION SELECT 6, 'Junio'
                    UNION SELECT 7, 'Julio'
                    UNION SELECT 8, 'Agosto'
                    UNION SELECT 9, 'Septiembre'
                    UNION SELECT 10, 'Octubre'
                    UNION SELECT 11, 'Noviembre'
                    UNION SELECT 12, 'Diciembre'
                )
                , VentasGanancias AS (
                    SELECT
                        DATEPART(MONTH, Fecha) AS MesNumero,
                        SUM(Total) AS Ingresos
                    FROM Ventas
                    WHERE YEAR(Fecha) = 2023
                    GROUP BY DATEPART(MONTH, Fecha)
                ),
                PagosGanancias AS (
                    SELECT
                        DATEPART(MONTH, Fecha_Pago) AS MesNumero,
                        SUM(Total) AS Salidas
                    FROM Registro_Pagos
                    WHERE YEAR(Fecha_Pago) = 2023
                    GROUP BY DATEPART(MONTH, Fecha_Pago)
                )

                SELECT
                    Meses.NombreMes,
                    ISNULL(Ingresos, 0) - ISNULL(Salidas, 0) AS Ganancias
                FROM Meses
                LEFT JOIN VentasGanancias ON Meses.MesNumero = VentasGanancias.MesNumero
                LEFT JOIN PagosGanancias ON Meses.MesNumero = PagosGanancias.MesNumero
                WHERE Meses.MesNumero BETWEEN @MesInicio AND @MesFin
                ORDER BY Meses.MesNumero";

            SqlCommand sql = new SqlCommand(rango, con.GetConnection());
            sql.Parameters.Add(new SqlParameter("@MesInicio", mesInicio));
            sql.Parameters.Add(new SqlParameter("@MesFin", mesFin));

            using (SqlDataReader Ganancias = sql.ExecuteReader())
            {
                while (Ganancias.Read())
                {
                    Series Datos = GraficoGanancias.Series["Series1"];
                    Datos.Points.AddXY(Ganancias["NombreMes"].ToString(), Ganancias["Ganancias"]);
                }
            }

            con.Close();

            con.Open();

            // Consulta para Ingresos
            string consultaIngresos = @"WITH Meses AS (
    SELECT 1 AS MesNumero, 'Enero' AS NombreMes
    UNION SELECT 2, 'Febrero'
    UNION SELECT 3, 'Marzo'
    UNION SELECT 4, 'Abril'
    UNION SELECT 5, 'Mayo'
    UNION SELECT 6, 'Junio'
    UNION SELECT 7, 'Julio'
    UNION SELECT 8, 'Agosto'
    UNION SELECT 9, 'Septiembre'
    UNION SELECT 10, 'Octubre'
    UNION SELECT 11, 'Noviembre'
    UNION SELECT 12, 'Diciembre'
), VentasGanancias AS (
    SELECT
        DATEPART(MONTH, Fecha) AS MesNumero,
        SUM(Total) AS Ingresos
    FROM Ventas
    WHERE YEAR(Fecha) = 2023
    GROUP BY DATEPART(MONTH, Fecha)
), PagosGanancias AS (
    SELECT
        DATEPART(MONTH, Fecha_Pago) AS MesNumero,
        SUM(Total) AS Salidas
    FROM Registro_Pagos
    WHERE YEAR(Fecha_Pago) = 2023
    GROUP BY DATEPART(MONTH, Fecha_Pago)
)

SELECT
    Meses.NombreMes,
    ISNULL(Ingresos, 0) AS Ingresos,
    ISNULL(Salidas, 0) AS Salidas
FROM Meses
LEFT JOIN VentasGanancias ON Meses.MesNumero = VentasGanancias.MesNumero
LEFT JOIN PagosGanancias ON Meses.MesNumero = PagosGanancias.MesNumero
WHERE Meses.MesNumero BETWEEN @MesInicio AND @MesFin
ORDER BY Meses.MesNumero;";

            SqlCommand cmd = new SqlCommand(consultaIngresos, con.GetConnection());
            cmd.Parameters.Add(new SqlParameter("@MesInicio", mesInicio));
            cmd.Parameters.Add(new SqlParameter("@MesFin", mesFin));

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                Series Ingresos = GraficoComparativo.Series["Series1"];
                Ingresos.ChartType = SeriesChartType.Column;

                Series Salidas = GraficoComparativo.Series["Series2"];
                Salidas.ChartType = SeriesChartType.Column;

                while (reader.Read())
                {
                    string nombreMes = reader["NombreMes"].ToString();
                    float ingresos = Convert.ToInt32(reader["Ingresos"]);
                    float salidas = Convert.ToInt32(reader["Salidas"]);

                    Ingresos.Points.AddXY(nombreMes, ingresos);
                    Salidas.Points.AddXY(nombreMes, salidas);
                }
                Color colorIngresos = Color.Green; // Puedes cambiar esto al color que desees.
                Color colorSalidas = Color.Red;    // Puedes cambiar esto al color que desees.

                // Asigna los colores a las series.
                Ingresos.Color = colorIngresos;
                Salidas.Color = colorSalidas;

                GraficoComparativo.ChartAreas[0].AxisY.LabelStyle.Format = "C2";

            }

            con.Close();

        }

        protected void Lipiar_Ganancias_btn_Click(object sender, EventArgs e)
        {
            Fecha_Max_tx.SelectedValue = "12";
            Fecha_min_tx.SelectedValue = "1";
            Flitrar_Ganancias_Click(sender, e);
        }

        protected void Filtro_Ingresos_Click(object sender, EventArgs e)
        {
            
        }

        protected void Limpiar_Ingresos_Click(object sender, EventArgs e)
        {

        }

        protected void Filtro_Retiro_Click(object sender, EventArgs e)
        {
            
        }

        protected void Limpiar_Retiro_Click(object sender, EventArgs e)
        {

        }

        protected void CargaTotal_btn_Click(object sender, EventArgs e)
        {
            Lipiar_Ganancias_btn_Click(sender, e);
            Limpiar_Ingresos_Click(sender, e);
            Limpiar_Retiro_Click(sender, e);
        }
    }
}