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
    public partial class Facturas_Crear_Nueva : System.Web.UI.Page
    {
        Conectar con = new Conectar();

        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
            try
            {
                con.Open();
                SqlCommand a = new SqlCommand("SELECT TOP 1 * FROM Facturas_Proveedor ORDER BY ID DESC", con.GetConnection());
                SqlDataReader leer = a.ExecuteReader();
                leer.Read();
                int i = (Convert.ToInt32(leer["ID"].ToString()) + 1);
                Nro_Fact_lb.Text = i.ToString();
                con.Close();
            }
            catch(Exception ex)
            {
                con.Close();
                Nro_Fact_lb.Text = "1";
            }
            if (Session["ListaFactura"] == null)
            {
                List<ItemFactura> ListaFactura = new List<ItemFactura>();
                Session["ListaFactura"] = ListaFactura;
            }
        }

        protected void PopUp_Prov_bt_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalProv();", true);
        }

        protected void Pop_Art_bt_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalSelectArt();", true);
        }
        protected void Quitar_art_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Art_Fact.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Art_Fact.DataKeys[Lista_Art_Fact.SelectedIndex].Value);
            List<ItemFactura> ListaOrden = (List<ItemFactura>)Session["ListaFactura"];
            ListaOrden.RemoveAt(ListaOrden.FindIndex(item => item.ID == ID));

            Lista_Art_Fact.DataSource = ListaOrden;
            Lista_Art_Fact.DataBind();
        }

        protected void Guardar_Fact_btn_Click(object sender, EventArgs e)
        {

        }

        protected void Cancelar_Fact_btn_Click(object sender, EventArgs e)
        {
            List<ItemFactura> ListaFactura = (List<ItemFactura>)Session["ListaFactura"];
            ListaFactura.Clear();
            Response.Redirect("~/ListasCompras_Ver.aspx");
        }
        protected void Art_Agregar_btn_Click(object sender, EventArgs e)
        {
            List<ItemFactura> ListaFactura = (List<ItemFactura>)Session["ListaFactura"];
            ListaFactura.Add(new ItemFactura { ID = Convert.ToInt32(ID_Art_sel_lb.Text), Nombre = Nomb_art_lb.Text, Categoria = Cat_art_lb.Text, Descripcion = Desc_art_lb.Text, Cantidad = Convert.ToInt32(Cantidad_tx.Text),Precio=Convert.ToInt32(Precio_tx.Text) });

            Lista_Art_Fact.DataSource = ListaFactura;
            Lista_Art_Fact.DataBind();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalSelectArt();", true);

            ID_art_tx.Text = "";
            Nomb_art_lb.Text = "";
            Desc_art_lb.Text = "";
            Cantidad_tx.Text = "";
            Cat_art_lb.Text = "";
            Precio_tx.Text = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalArt();", true);
        }
        protected void Art_Cancelar_btn_Click(object sender, EventArgs e)
        {

        }
        protected void Selecc_Prov_btn_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Proveedores.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Proveedores.DataKeys[Lista_Proveedores.SelectedIndex].Value);

            con.Open();
            string qry = "select * from Proveedores where ID=" + ID;
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            SqlDataReader Leer = Com.ExecuteReader();
            Leer.Read();
            Prov_nom_lb.Text = Leer["NombreCompleto"].ToString();
            Prov_ID_lb.Text = Leer["ID"].ToString();
            Correo_lb.Text = Leer["Correo"].ToString();
            Direc_lb.Text = Leer["Direccion"].ToString();
            Telf_lb.Text = Leer["Telefono"].ToString();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalProv();", true);
            //Para dejar bacio
            DataTable clrear = new DataTable();
            Lista_Proveedores.DataSource = clrear;
            Lista_Proveedores.DataBind();
        }
        protected void Buscar_prov_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            string qry = "select * from Proveedores ";
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Proveedores = new SqlDataAdapter(Com);
            DataTable prov = new DataTable();
            Proveedores.Fill(prov);
            Lista_Proveedores.DataSource = prov;
            Lista_Proveedores.DataBind();
            con.Close();
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
            try
            {
                con.Open();
                SqlCommand Com = new SqlCommand("Select A.ID,A.Nombre,C.Nombre_Categoria,A.Descripcion from Articulos A inner join Categorias C on C.ID=A.Categoria where A.ID=" + ID_art_tx.Text, con.GetConnection());
                SqlDataReader Leer = Com.ExecuteReader();
                Leer.Read();
                ID_Art_sel_lb.Text = Leer["ID"].ToString();
                //ID_art_tx.Text = Leer["ID"].ToString();
                Nomb_art_lb.Text = Leer["Nombre"].ToString();
                Cat_art_lb.Text = Leer["Nombre_Categoria"].ToString();
                Desc_art_lb.Text = Leer["Descripcion"].ToString();
                con.Close();
            }
            catch
            {

            }
            finally
            {

            }
        }
        protected void Selecc_Art_bt_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Articulos.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Articulos.DataKeys[Lista_Articulos.SelectedIndex].Value);

            //Session["ID_art"] = ID.ToString();

            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalSelArt();", true);

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
        class ItemFactura
        {
            public int ID { get; set; }
            public string Nombre { get; set; }
            public string Categoria { get; set; }
            public string Descripcion { get; set; }
            public int Cantidad { get; set; }
            public int Precio { get; set; }
        }
    }
}