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

            
        }

        protected void Buscar_art_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            string qry = "select * from Articulos ";
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Articulos = new SqlDataAdapter(Com);
            DataTable art = new DataTable();
            Articulos.Fill(art);
            Lista_Articulos.DataSource = art;
            Lista_Articulos.DataBind();
        }

        protected void Art_camb_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sql = new SqlCommand("insert into Articulos(Nombre,Categoria,Precio,Descripcion) values (@prNombre,@prCat,@prPrecio,@prDesc)", con.GetConnection());
            sql.Parameters.Add(new SqlParameter("@prNombre",Nomb_tx.Text));
            sql.Parameters.Add(new SqlParameter("@prCat",Categorias_list.SelectedValue));
            sql.Parameters.Add(new SqlParameter("@prPrecio",Precio_tx.Text));
            sql.Parameters.Add(new SqlParameter("@prDesc",Descrip_tx.Text));
            sql.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
        }

        protected void Art_elin_byn_Click(object sender, EventArgs e)
        {

        }
    }
}