using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net;
namespace Sistema_Heladeria
{
    public partial class Historial_Movs : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
        }
        protected void Filtrar_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            string comando = "select Top 10 MS.ID,A.Nombre,D.Nombre'Deposito',Ac.Nombre as Actividad,MS.Cantidad,Fecha_Registro from Mov_Stock MS inner join Stock_Depo SD on SD.ID=MS.ID_Stock_Depo inner join Depositos D on D.ID=SD.ID_dep inner join Articulos A on A.ID=SD.ID_art inner join Actividades Ac on Ac.ID=MS.Actividad where D.ID!=99999 ";

            if (!string.IsNullOrWhiteSpace(Precio_min_tx.Text))//quiere decir que si selecciono algo 
            {
                comando = comando + " and MS.Cantidad>=" + Precio_min_tx.Text + " ";
            }
            if (!string.IsNullOrWhiteSpace(Precio_Max_tx.Text))
            {
                comando = comando + " and MS.Cantidad<=" + Precio_Max_tx.Text + " ";
            }
            if (!string.IsNullOrWhiteSpace(Fecha_min_tx.Text))
            {
                comando = comando + " and Fecha_Registro>='" + Fecha_min_tx.Text + "' ";
            }
            if (!string.IsNullOrWhiteSpace(Fecha_Max_tx.Text))
            {
                comando = comando + " and Fecha_Registro<='" + Fecha_Max_tx.Text + "' ";
            }
            //if (!string.IsNullOrWhiteSpace(Cliente_Filt_tx.Text))
            //{
            //    comando = comando + " and C.NombreCompleto='" + Cliente_Filt_tx.Text + "' ";
            //}
            comando = comando + " ORDER BY MS.ID DESC";
            SqlCommand sql = new SqlCommand(comando, con.GetConnection());
            sql.ExecuteNonQuery();
            SqlDataAdapter Articulos = new SqlDataAdapter(sql);
            DataTable hist = new DataTable();
            Articulos.Fill(hist);
            Lista_Historial.DataSource = hist;
            Lista_Historial.DataBind();
            con.Close();
            
        }

        protected void Lipiar_Filt_btn_Click(object sender, EventArgs e)
        {
            Fecha_min_tx.Text = "";
            Fecha_Max_tx.Text = "";
            Precio_min_tx.Text = "";
            Precio_Max_tx.Text = "";
            Filtrar_btn_Click(sender, e);
        }
    }
}