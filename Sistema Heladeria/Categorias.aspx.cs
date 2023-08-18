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
    public partial class Categorias : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
        }

        protected void Agregar_Cat_btn_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);

        }

        protected void Art_camb_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sqlc = new SqlCommand("insert into Categorias(Nombre_Categoria,Descripcion) values (@prNomb, @prDesc)", con.GetConnection());
            sqlc.Parameters.Add(new SqlParameter("@prNomb",Nomb_tx.Text));
            sqlc.Parameters.Add(new SqlParameter("@prDesc", Descrip_tx.Text));
            sqlc.ExecuteNonQuery();
            con.Close();
            Nomb_tx.Text = "";
            Descrip_tx.Text = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);

        }

        protected void Art_elin_byn_Click(object sender, EventArgs e)
        {

        }

        protected void Buscar_cat_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sqlc = new SqlCommand("select * from Categorias where Nombre_Categoria like '%"+Buscador_cat.Text+ "%' or ID like '" + Buscador_cat.Text+"'", con.GetConnection());
            sqlc.ExecuteNonQuery();
            SqlDataAdapter Categorias = new SqlDataAdapter(sqlc);
            DataTable cat = new DataTable();
            Categorias.Fill(cat);
            Lista_Categorias.DataSource = cat;
            Lista_Categorias.DataBind();
            con.Close();

        }

        protected void Editar_cat_Click(object sender, EventArgs e)
        {

        }
    }
}