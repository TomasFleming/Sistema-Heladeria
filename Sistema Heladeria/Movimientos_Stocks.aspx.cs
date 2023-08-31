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
    public partial class Movimientos_Stocks : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
            if (Session["ListaOrden"] == null)
            {
                List<ItemMovimiento> ListaOrden = new List<ItemMovimiento>();
                Session["ListaOrden"] = ListaOrden;
            }
        }
        class ItemMovimiento
        {
            public int ID { get; set; }
            public string Nombre { get; set; }
            public string Categoria { get; set; }
            public string Descripcion { get; set; }
            public string Movimiento { get; set; }
            public int Cantidad { get; set; }
        }
        protected void Quitar_Mov_Click(object sender, EventArgs e)
        {

        }
        protected void Lista_Movs_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Mov = (e.Row.DataItem, "Movimiento").ToString();

                if (Mov =="Ingreso")
                {
                    e.Row.CssClass = "filaAgregarStock";
                }
            }
        }

        protected void PopUp_Depos_bt_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalDep();", true);
        }

        protected void Select_Dept_btn_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Depositos.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Depositos.DataKeys[Lista_Depositos.SelectedIndex].Value);

            con.Open();
            string qry = "select * from Depositos where ID=" + ID;
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            SqlDataReader Leer = Com.ExecuteReader();
            Leer.Read();
            Deposit_nom_lb.Text = Leer["Nombre"].ToString();
            Deposit_ID_lb.Text = Leer["ID"].ToString();
            Deposit_Ubic_lb.Text = Leer["Ubicacion"].ToString();

            con.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalDep();", true);
            //Para dejar bacio
            DataTable clrear = new DataTable();
            Lista_Depositos.DataSource = clrear;
            Lista_Depositos.DataBind();
        }

        protected void Selecc_Art_bt_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Articulos.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Articulos.DataKeys[Lista_Articulos.SelectedIndex].Value);

            con.Open();
            SqlCommand Com = new SqlCommand("Select A.ID,A.Nombre,C.Nombre_Categoria,A.Descripcion from Articulos A inner join Categorias C on C.ID=A.Categoria where A.ID=" + ID, con.GetConnection());
            SqlDataReader Leer = Com.ExecuteReader();
            Leer.Read();
            ID_Art_sel_lb.Text = Leer["ID"].ToString();
            ID_art_tx.Text = Leer["ID"].ToString();
            Nomb_art_lb.Text = Leer["Nombre"].ToString();
            Cat_art_lb.Text = Leer["Nombre_Categoria"].ToString();
            Desc_art_lb.Text = Leer["Descripcion"].ToString();
            con.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalArt();", true);
        }

        protected void Art_Agregar_btn_Click(object sender, EventArgs e)
        {

        }

        protected void Art_Cancelar_byn_Click(object sender, EventArgs e)
        {

        }

        protected void Buscar_art_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            string qry = "select A.ID, A.Nombre,C.Nombre_Categoria, A.Descripcion, A.Precio from Articulos A inner join Categorias C on A.Categoria=C.ID where A.ID like '" + Buscador_art.Text + "' or A.Nombre like '%" + Buscador_art.Text + "%' or C.Nombre_Categoria like '%" + Buscador_art.Text + "%' ";
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Articulos = new SqlDataAdapter(Com);
            DataTable art = new DataTable();
            Articulos.Fill(art);
            Lista_Articulos.DataSource = art;
            Lista_Articulos.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalArt();", true);
        }

        protected void Cargar_Art_btn_Click(object sender, EventArgs e)
        {

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

        protected void Pop_Art_bt_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalSelArt();", true);
        }
    }
}