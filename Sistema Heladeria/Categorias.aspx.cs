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
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Categorias.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Categorias.DataKeys[Lista_Categorias.SelectedIndex].Value);

            con.Open();
            SqlCommand sql = new SqlCommand("select * from Categorias where ID="+ID,con.GetConnection());
            SqlDataReader leer = sql.ExecuteReader();
            leer.Read();
            ID_cat_edit.Text = leer["ID"].ToString();
            Nomb_Edit_tx.Text = leer["Nombre_Categoria"].ToString();
            Descrip_Edit_tx.Text = leer["Descripcion"].ToString();
            con.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2();", true);
        }

        protected void Cancelar_btn_Click(object sender, EventArgs e)
        {

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
        }

        protected void Borrar_cat_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sql = new SqlCommand("delete Categorias where ID= " + ID_cat_edit.Text, con.GetConnection());
            sql.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal2();", true);
        }

        protected void Guardar_Editado_bt_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sql = new SqlCommand("update Categorias set Nombre_Categoria='"+Nomb_Edit_tx.Text+"', Descripcion='"+Descrip_Edit_tx.Text+"' where ID= "+ID_cat_edit.Text, con.GetConnection());
            sql.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal2();", true);
        }
    }
}