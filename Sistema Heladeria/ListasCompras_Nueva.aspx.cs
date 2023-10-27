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
    public partial class ListasCompras_Nueva : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        //List<ItemCompra> ListaOrden = new List<ItemCompra>();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
            try
            {
                con.Open();
                SqlCommand a = new SqlCommand("SELECT TOP 1 * FROM OrdenesCompra ORDER BY ID DESC", con.GetConnection());
                SqlDataReader leer = a.ExecuteReader();
                leer.Read();
                int i = (Convert.ToInt32(leer["ID"].ToString()) + 1);
                Nro_ord_lb.Text = i.ToString();
                con.Close();
            }
            catch(Exception ex)
            {
                con.Close();
                Nro_ord_lb.Text = "1";
            }
            
            if (Session["ListaOrden"] == null)
            {
                List<ItemCompra> ListaOrden = new List<ItemCompra>();
                Session["ListaOrden"] = ListaOrden;
            }
        }

        protected void Quitar_art_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Art_Ord.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Art_Ord.DataKeys[Lista_Art_Ord.SelectedIndex].Value);
            List<ItemCompra> ListaOrden = (List<ItemCompra>)Session["ListaOrden"];
            ListaOrden.RemoveAt(ListaOrden.FindIndex(item => item.ID == ID));

            Lista_Art_Ord.DataSource = ListaOrden;
            Lista_Art_Ord.DataBind();
        }

        protected void Selecc_Prov_btn_Click(object sender, EventArgs e)
        {
            //esta forma para tomar la id no se si es la mejor pero simpre funciono:
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Proveedores.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Proveedores.DataKeys[Lista_Proveedores.SelectedIndex].Value);

            con.Open();
            string qry = "select * from Proveedores where ID="+ID;
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

        protected void PopUp_Prov_bt_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalProv();", true);
        }

        protected void PopUp_Depos_bt_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalDep();", true);
        }

        protected void Pop_Art_bt_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalSelArt();", true);
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
            SqlCommand Com = new SqlCommand("Select A.ID,A.Nombre,C.Nombre_Categoria,A.Descripcion from Articulos A inner join Categorias C on C.ID=A.Categoria where A.ID="+ID, con.GetConnection());
            SqlDataReader Leer = Com.ExecuteReader();
            Leer.Read();
            ID_Art_sel_lb.Text = Leer["ID"].ToString();
            ID_art_tx.Text = Leer["ID"].ToString();
            Nomb_art_lb.Text = Leer["Nombre"].ToString();
            Cat_art_lb.Text = Leer["Nombre_Categoria"].ToString();
            Desc_art_lb.Text = Leer["Descripcion"].ToString();
            con.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalArt();", true);
            ////Para dejar bacio
            //DataTable clrear = new DataTable();
            //Lista_Articulos.DataSource = clrear;
            //Lista_Articulos.DataBind();


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

        protected void Art_Agregar_btn_Click(object sender, EventArgs e)
        {
            try
            {
                List<ItemCompra> ListaOrden = (List<ItemCompra>)Session["ListaOrden"];

                Boolean check = ListaOrden.Any(item => item.ID == Convert.ToInt32(ID_Art_sel_lb.Text));
                if (check) //Faltaria poner un label que diga por que no puede hacerlo
                {

                }
                else
                {
                    ListaOrden.Add(new ItemCompra { ID = Convert.ToInt32(ID_Art_sel_lb.Text), Nombre = Nomb_art_lb.Text, Categoria = Cat_art_lb.Text, Descripcion = Desc_art_lb.Text, Cantidad = Convert.ToInt32(Cantidad_tx.Text) });

                    //int ID = Convert.ToInt32(Session[""].ToString());

                    Lista_Art_Ord.DataSource = ListaOrden;
                    Lista_Art_Ord.DataBind();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalSelArt();", true);


                    //Para dejar bacio
                    //DataTable clrear = new DataTable();
                    //Lista_Articulos.DataSource = clrear;
                    //Lista_Articulos.DataBind();
                    ID_art_tx.Text = "";
                    Nomb_art_lb.Text = "";
                    Desc_art_lb.Text = "";
                    Cantidad_tx.Text = "";
                    Cat_art_lb.Text = "";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalArt();", true);
                }                
            }
            catch(Exception ex)
            {

            }
        }

        protected void Art_elin_byn_Click(object sender, EventArgs e)//cual era este ??????
        {

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalDep();", true);
            //Para dejar bacio
            DataTable clrear = new DataTable();
            Lista_Depositos.DataSource = clrear;
            Lista_Depositos.DataBind();
        }
        class ItemCompra
        {
            public int ID { get; set; }
            public string Nombre { get; set; }
            public string Categoria { get; set; }
            public string Descripcion { get; set; }
            public int Cantidad { get; set; }
        }

        protected void Guardar_Ord_btn_Click(object sender, EventArgs e)
        {
            try{
                con.Open();
                //primero creo orden

                SqlCommand Orden = new SqlCommand("insert into OrdenesCompra (ID_Proveedor,ID_Deposito,Fecha_Creacion,Fecha_Entrega) values (" + Prov_ID_lb.Text + "," + Deposit_ID_lb.Text + ",'" + Fecha_Creacion_lb.Text + "','" + Fechar_ord_tx.Text + "') ", con.GetConnection());
                Orden.ExecuteNonQuery();
                con.Close();
                //Luego el detalle

                con.Open();
                SqlCommand Detalle = new SqlCommand("SELECT TOP 1 * FROM OrdenesCompra ORDER BY ID DESC", con.GetConnection());
                SqlDataReader Leer = Detalle.ExecuteReader();
                Leer.Read();
                int ID_Orden = Convert.ToInt32(Leer["ID"].ToString());
                con.Close();
                List<ItemCompra> ListaOrden = (List<ItemCompra>)Session["ListaOrden"];
                foreach (var item in ListaOrden)
                {
                    int ID = item.ID;
                    int Cant = item.Cantidad;
                    con.Open();
                    SqlCommand Detalle2 = new SqlCommand("insert into Detalle_Ord(ID_ord,ID_Art,Cantidad) values (" + ID_Orden + "," + ID + "," + Cant + ")", con.GetConnection());
                    Detalle2.ExecuteNonQuery();
                    con.Close();

                }
                ListaOrden.Clear();

                Response.Redirect("~/ListasCompras_Ver.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(' Error : Todos los Campos del formulario deben estar completos');</script>");
            }
            finally
            {

            }
        }

        protected void Cancelar_Ord_btn_Click(object sender, EventArgs e)
        {
            List<ItemCompra> ListaOrden = (List<ItemCompra>)Session["ListaOrden"];
            ListaOrden.Clear();
            Response.Redirect("~/ListasCompras_Ver.aspx");
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

        protected void Buscar_btn_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalArt();", true);
            con.Open();
            string qry = "select A.ID, A.Nombre,C.Nombre_Categoria, A.Descripcion, A.Precio from Articulos A inner join Categorias C on A.Categoria=C.ID where A.ID like '" + ID_art_tx.Text + "' or A.Nombre like '%" + ID_art_tx.Text + "%' or C.Nombre_Categoria like '%" + ID_art_tx.Text + "%' ";
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Articulos = new SqlDataAdapter(Com);
            DataTable art = new DataTable();
            Articulos.Fill(art);
            Lista_Articulos.DataSource = art;
            Lista_Articulos.DataBind();
        }
    }
}