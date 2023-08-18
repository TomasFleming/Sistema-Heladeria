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
    public partial class Depositos : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
        }

        protected void Buscar_dep_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            string qry = "select * from Depositos where Nombre like'%"+Buscador_dep.Text+"%' or ID like '%"+Buscador_dep.Text+"%' ";
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Depositos = new SqlDataAdapter(Com);
            DataTable dep = new DataTable();
            Depositos.Fill(dep);
            Lista_Depositos.DataSource = dep;
            Lista_Depositos.DataBind();
            con.Close();
        }

        protected void Agregar_dep_btn_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            
        }

        protected void Dep_guard_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sql = new SqlCommand("insert into Depositos(Nombre,Ubicacion) values (@prNombre,@prUbic)", con.GetConnection());
            sql.Parameters.Add(new SqlParameter("@prNombre", Nomb_tx.Text));
            sql.Parameters.Add(new SqlParameter("@prUbic", Ubic_tx.Text));
            sql.ExecuteNonQuery();
            con.Close();
            Nomb_tx.Text = "";
            Ubic_tx.Text = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
        }

        protected void Dep_elin_byn_Click(object sender, EventArgs e)
        {

        }

        protected void Ver_Articulos_btn_Click(object sender, EventArgs e)
        {
            Button ARTBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)ARTBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Depositos.SelectedIndex = I;
            int ID_dep = Convert.ToInt32(Lista_Depositos.DataKeys[I].Value);

            Num_Dep.Text = ID_dep.ToString();

            con.Open();
            string qry = "select A.ID,A.Nombre,A.Descripcion,C.Nombre_Categoria,DS.Stock from Articulos A inner join Categorias C on C.ID=A.Categoria inner Join Stock_Depo Ds on DS.ID_art=A.ID inner join Depositos D on D.ID=DS.ID_dep where ID_dep like '"+ID_dep+"' ";
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Articulos = new SqlDataAdapter(Com);
            DataTable art = new DataTable();
            Articulos.Fill(art);
            Lista_Articulos.DataSource = art;
            Lista_Articulos.DataBind();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2();", true);
        }
    }
}