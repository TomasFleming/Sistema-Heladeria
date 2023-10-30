﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net;
using System.Web.UI.DataVisualization.Charting;
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

            //Ahora para Ingresos

            con.Open();
            String rangoE = @"WITH Meses AS (
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
                )
                SELECT
                    Meses.NombreMes,
                    ISNULL(Ingresos, 0) AS Ganancias
                FROM Meses
                LEFT JOIN VentasGanancias ON Meses.MesNumero = VentasGanancias.MesNumero
                WHERE Meses.MesNumero BETWEEN @MesInicio AND @MesFin
                ORDER BY Meses.MesNumero";

            SqlCommand sqlE = new SqlCommand(rangoE, con.GetConnection());
            sqlE.Parameters.Add(new SqlParameter("@MesInicio", mesInicio));
            sqlE.Parameters.Add(new SqlParameter("@MesFin", mesFin));

            using (SqlDataReader Ingresos = sqlE.ExecuteReader())
            {
                while (Ingresos.Read())
                {
                    Series Datos = GraficoIngresos.Series["Series1"];
                    Datos.Points.AddXY(Ingresos["NombreMes"].ToString(), Ingresos["Ganancias"]);
                }
            }

            con.Close();

            //ahora para perdidas
            con.Open();
            String rangoP = @"WITH Meses AS (
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
                ,PagosGanancias AS (
                    SELECT
                        DATEPART(MONTH, Fecha_Pago) AS MesNumero,
                        SUM(Total) AS Salidas
                    FROM Registro_Pagos
                    WHERE YEAR(Fecha_Pago) = 2023
                    GROUP BY DATEPART(MONTH, Fecha_Pago)
                )

                SELECT
                    Meses.NombreMes,
                     ISNULL(Salidas, 0) AS Ganancias
                FROM Meses
                LEFT JOIN PagosGanancias ON Meses.MesNumero = PagosGanancias.MesNumero
                WHERE Meses.MesNumero BETWEEN @MesInicio AND @MesFin
                ORDER BY Meses.MesNumero";

            SqlCommand sql2 = new SqlCommand(rangoP, con.GetConnection());
            sql2.Parameters.Add(new SqlParameter("@MesInicio", mesInicio));
            sql2.Parameters.Add(new SqlParameter("@MesFin", mesFin));

            using (SqlDataReader Salidas = sql2.ExecuteReader())
            {
                while (Salidas.Read())
                {
                    Series Datos = GraficoSalidas.Series["Series1"];
                    Datos.Points.AddXY(Salidas["NombreMes"].ToString(), Salidas["Ganancias"]);
                }
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