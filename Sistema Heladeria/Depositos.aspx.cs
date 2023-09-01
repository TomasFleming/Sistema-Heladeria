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
            string qry = "select * from Depositos where Nombre like'%" + Buscador_dep.Text + "%' or ID like '%" + Buscador_dep.Text + "%' ";
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
            ID_dep_lb2.Text = ID_dep.ToString();

            con.Open();
            string qry = "select A.ID,A.Nombre,A.Descripcion,C.Nombre_Categoria,DS.Stock,DS.Stock_Min from Articulos A inner join Categorias C on C.ID=A.Categoria inner Join Stock_Depo Ds on DS.ID_art=A.ID inner join Depositos D on D.ID=DS.ID_dep where ID_dep like '" + ID_dep + "' ";
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
        protected void Lista_Articulos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int cantidad = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Stock"));
                int stockMinimo = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Stock_Min"));

                if (cantidad < stockMinimo)
                {
                    e.Row.CssClass = "filaBajaStock";

                    //Literal literalIconoStockMin = new Literal();
                    //literalIconoStockMin.Text = "<div class='iconoAdvertencia'></div>"; 
                    //e.Row.Cells[5].Controls.Add(literalIconoStockMin); 
                }
            }
        }

        protected void Stock_Min_btn_Click(object sender, EventArgs e)
        {
            Button IDTBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDTBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Articulos.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Articulos.DataKeys[I].Value);
            ID_Art_st_lb.Text = ID.ToString();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal3();", true);
            con.Open();
            SqlCommand sql = new SqlCommand("select * from Stock_Depo where ID_art= "+ID+" and ID_dep= "+ID_dep_lb2.Text, con.GetConnection());
            SqlDataReader reader = sql.ExecuteReader();
            reader.Read();
            Stock_Min_Acct_tx.Text = reader["Stock_Min"].ToString();
            con.Close();
        }

        protected void Guardar_MinStock_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sql = new SqlCommand("update Stock_Depo set Stock_Min= "+Stock_Min_Nuevo_tx.Text+" where ID_art= " + ID_Art_st_lb.Text + " and ID_dep= " + ID_dep_lb2.Text, con.GetConnection());
            sql.ExecuteNonQuery();
            con.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal3();", true);


            con.Open();
            string qry = "select A.ID,A.Nombre,A.Descripcion,C.Nombre_Categoria,DS.Stock,DS.Stock_Min from Articulos A inner join Categorias C on C.ID=A.Categoria inner Join Stock_Depo Ds on DS.ID_art=A.ID inner join Depositos D on D.ID=DS.ID_dep where ID_dep like '" + ID_dep_lb2.Text + "' ";
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Articulos = new SqlDataAdapter(Com);
            DataTable art = new DataTable();
            Articulos.Fill(art);
            Lista_Articulos.DataSource = art;
            Lista_Articulos.DataBind();
            con.Close();
            Stock_Min_Nuevo_tx.Text = "";
        }

        protected void Cancelar_MinStk_btn_Click(object sender, EventArgs e)
        {
            Stock_Min_Nuevo_tx.Text = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal3();", true);
        }

        protected void Historial_Movs_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sql = new SqlCommand("select Top 10 MS.ID,A.Nombre,D.Nombre'Deposito',Actividad,MS.Cantidad,Fecha_Registro from Mov_Stock MS inner join Stock_Depo SD on SD.ID=MS.ID_Stock_Depo inner join Depositos D on D.ID=SD.ID_dep inner join Articulos A on A.ID=SD.ID_art ORDER BY MS.ID DESC", con.GetConnection());
            sql.ExecuteNonQuery();
            SqlDataAdapter Articulos = new SqlDataAdapter(sql);
            DataTable hist = new DataTable();
            Articulos.Fill(hist);
            Lista_Historial.DataSource = hist;
            Lista_Historial.DataBind();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal4();", true);
        }
    }
}