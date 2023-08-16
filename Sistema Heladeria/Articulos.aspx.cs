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
    public partial class Insertar_y_mostrar : System.Web.UI.Page
    {
        Conectar con = new Conectar();

        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();

        }

        protected void Agregar_Art_btn_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);

            //con.Open();
            //string qry = "insert Articulos (Nombre,Cantidad) values(@prNombre,@prCat)";
            //SqlCommand SqlCom = new SqlCommand(qry, con.GetConnection());
            //SqlCom.Parameters.Add(new SqlParameter("@prNombre", Art_nom.Text));
            //SqlCom.Parameters.Add(new SqlParameter("@prCat", Art_stock.Text));
            //SqlCom.ExecuteNonQuery();
            //con.Close();
        }

        protected void Buscar_art_btn_Click(object sender, EventArgs e)
        {
            //con.Open();
            //string qry = "select * from Helados ";
            //SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            //Com.ExecuteNonQuery();
            //SqlDataAdapter Articulos = new SqlDataAdapter(Com);
            //DataTable art = new DataTable();
            //Articulos.Fill(art);
            //Articulos_Colum.DataSource = art;
            //Articulos_Colum.DataBind();
        }

        protected void Art_camb_btn_Click(object sender, EventArgs e)
        {

        }

        protected void Art_elin_byn_Click(object sender, EventArgs e)
        {

        }
    }
}