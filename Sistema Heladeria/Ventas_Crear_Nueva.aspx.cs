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
    public partial class Ventas_Crear_Nueva : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
            //Efectivo.Checked = true;
            DateTime fechaActual = DateTime.Now;
            Fecha_Creacion_tx.Text = fechaActual.ToString("yyyy-MM-dd");
            try
            {
                con.Open();
                SqlCommand a = new SqlCommand("SELECT TOP 1 * FROM Ventas ORDER BY ID DESC", con.GetConnection());
                SqlDataReader leer = a.ExecuteReader();
                leer.Read();
                int i = (Convert.ToInt32(leer["ID"].ToString()) + 1);
                Nro_Venta_lb.Text = i.ToString();
                con.Close();
            }
            catch (Exception ex)
            {
                con.Close();
                Nro_Venta_lb.Text = "1";
            }
            if (Session["ListaVenta"] == null)
            {
                List<ItemVenta> ListaVenta = new List<ItemVenta>();
                Session["ListaVenta"] = ListaVenta;
            }
        }
        class ItemVenta
        {
            public int ID { get; set; }
            public string Nombre { get; set; }
            public string Categoria { get; set; }
            public string Descripcion { get; set; }
            public int Precio { get; set; }
            public int Cantidad { get; set; }
        }
        protected void PopUp_Cliente_btn_Click(object sender, EventArgs e)
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
            List<ItemVenta> ListaVenta= (List<ItemVenta>)Session["ListaVenta"];
            ListaVenta.RemoveAt(ListaVenta.FindIndex(item => item.ID == ID));

            Lista_Art_Fact.DataSource = ListaVenta;
            Lista_Art_Fact.DataBind();
            CalcularTotales(sender, e);
        }

        protected void Selecc_Cliente_btn_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Clientes.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Clientes.DataKeys[Lista_Clientes.SelectedIndex].Value);

            con.Open();
            string qry = "select * from Clientes where ID=" + ID;
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            SqlDataReader Leer = Com.ExecuteReader();
            Leer.Read();
            Client_nom_lb.Text = Leer["NombreCompleto"].ToString();
            Client_ID_lb.Text = Leer["ID"].ToString();
            Correo_lb.Text = Leer["Correo"].ToString();
            DNI_lb.Text = Leer["DNI"].ToString();
            Telf_lb.Text = Leer["Telefono"].ToString();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalProv();", true);
            //Para dejar bacio
            DataTable clrear = new DataTable();
            Lista_Clientes.DataSource = clrear;
            Lista_Clientes.DataBind();
        }

        protected void Art_Agregar_btn_Click(object sender, EventArgs e)
        {
            try
            {
                List<ItemVenta> ListaFactura = (List<ItemVenta>)Session["ListaVenta"];

                Boolean check = ListaFactura.Any(item => item.ID == Convert.ToInt32(ID_Art_sel_lb.Text));
                if (check)
                {

                }
                else
                {
                    ListaFactura.Add(new ItemVenta { ID = Convert.ToInt32(ID_Art_sel_lb.Text), Nombre = Nomb_art_lb.Text, Categoria = Cat_art_lb.Text, Descripcion = Desc_art_lb.Text, Cantidad = Convert.ToInt32(Cantidad_tx.Text), Precio = Convert.ToInt32(Precio_tx.Text) });

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
                    CalcularTotales(sender, e);
                }
                
            }
            catch(Exception ex)
            {

            }
        }

        protected void Art_Cancelar_btn_Click(object sender, EventArgs e)
        {

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
            SqlCommand Com = new SqlCommand("Select A.ID,A.Nombre,C.Nombre_Categoria,A.Descripcion,A.Precio from Articulos A inner join Categorias C on C.ID=A.Categoria where A.ID=" + ID, con.GetConnection());
            SqlDataReader Leer = Com.ExecuteReader();
            Leer.Read();
            ID_Art_sel_lb.Text = Leer["ID"].ToString();
            ID_art_tx.Text = Leer["ID"].ToString();
            Nomb_art_lb.Text = Leer["Nombre"].ToString();
            Cat_art_lb.Text = Leer["Nombre_Categoria"].ToString();
            Desc_art_lb.Text = Leer["Descripcion"].ToString();
            Precio_tx.Text = Leer["Precio"].ToString();
            con.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalArt();", true);
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
        }

        protected void Cargar_Art_btn_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand Com = new SqlCommand("Select A.ID,A.Nombre,C.Nombre_Categoria,A.Descripcion,A.Precio from Articulos A inner join Categorias C on C.ID=A.Categoria where A.ID=" + ID_art_tx.Text, con.GetConnection());
                SqlDataReader Leer = Com.ExecuteReader();
                Leer.Read();
                ID_Art_sel_lb.Text = Leer["ID"].ToString();
                //ID_art_tx.Text = Leer["ID"].ToString();
                Nomb_art_lb.Text = Leer["Nombre"].ToString();
                Cat_art_lb.Text = Leer["Nombre_Categoria"].ToString();
                Desc_art_lb.Text = Leer["Descripcion"].ToString();
                Precio_tx.Text = Leer["Precio"].ToString();
                con.Close();
                //con.Open();
                //string qry = "select A.ID, A.Nombre,C.Nombre_Categoria, A.Descripcion, A.Precio from Articulos A inner join Categorias C on A.Categoria=C.ID where A.ID like '" + ID_art_tx.Text + "' or A.Nombre like '%" + Buscador_art.Text + "%' or C.Nombre_Categoria like '%" + Buscador_art.Text + "%' ";
                //SqlCommand Com = new SqlCommand(qry, con.GetConnection());
                //Com.ExecuteNonQuery();
                //SqlDataAdapter Articulos = new SqlDataAdapter(Com);
                //DataTable art = new DataTable();
                //Articulos.Fill(art);
                //Lista_Articulos.DataSource = art;
                //Lista_Articulos.DataBind();
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalArt();", true);
            }
            catch
            {

            }
            finally
            {

            }
        }

        protected void Buscar_btn_Click(object sender, EventArgs e)//abre el popup para buscarlo
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

        protected void Guardar_Venta_btn_Click(object sender, EventArgs e)
        {
            if (Tarjeta.Checked == true && (string.IsNullOrEmpty(Numero_tj_tx.Text) || string.IsNullOrEmpty(Cod_tj_tx.Text) || string.IsNullOrEmpty(Nomb_tj_lb.Text) || string.IsNullOrEmpty(Fecha_Tarjeta_tx.Text) || string.IsNullOrEmpty(Fecha_Tarjeta_tx0.Text)))
            {
                Label_Tarjeta.Visible = true;
            }
            else
            {
                try
                {
                    con.Open();
                    //primero creo orden
                    string query = "insert into Ventas (ID_Cliente,Total";
                    if (Efectivo.Checked== true)
                    {
                        query = query + ",MetodoPago) values(@prID,@prTotal,'Efectivo')";
                    }
                    else
                    {
                        query = query + ",NumeroCuenta,MetodoPago) values (@prID,@prTotal," + Numero_tj_tx.Text + ",'Tarjeta')";
                    }
                    SqlCommand Orden = new SqlCommand(query, con.GetConnection());
                    //Orden.Parameters.Add(new SqlParameter("@FechaEmision", Fecha_Creacion_tx.Text));
                    //Orden.Parameters.Add(new SqlParameter("@FechaVencimiento", Fecha_Venc_tx.Text));
                    Orden.Parameters.Add(new SqlParameter("@prID", Client_ID_lb.Text));
                    Orden.Parameters.Add(new SqlParameter("@prTotal", Convert.ToDouble(Total_lb.Text)));
                    Orden.ExecuteNonQuery();
                    con.Close();
                    //Luego el detalle

                    con.Open();
                    SqlCommand Detalle = new SqlCommand("SELECT TOP 1 * FROM Ventas ORDER BY ID DESC", con.GetConnection());
                    SqlDataReader Leer = Detalle.ExecuteReader();
                    Leer.Read();
                    int ID_Fact = Convert.ToInt32(Leer["ID"].ToString());
                    con.Close();
                    List<ItemVenta> ListaVenta = (List<ItemVenta>)Session["ListaVenta"];
                    foreach (var item in ListaVenta)
                    {
                        int ID = item.ID;
                        int Cant = item.Cantidad;
                        con.Open();
                        SqlCommand Detalle2 = new SqlCommand("insert into DetalleVentas(ID_Venta,ID_Articulo,Cantidad,PrecioUnid) values (" + ID_Fact + "," + ID + "," + Cant + "," + item.Precio + ")", con.GetConnection());
                        Detalle2.ExecuteNonQuery();
                        con.Close();

                    }
                    ListaVenta.Clear();

                    Response.Redirect("~/Ventas_Ver.aspx");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert(' Error : Todos los campos del formulario deben estar completos');</script>");
                }
            }
            
        }

        protected void Cancelar_Venta_btn_Click(object sender, EventArgs e)
        {
            List<ItemVenta> ListaVenta = (List<ItemVenta>)Session["ListaVenta"];
            ListaVenta.Clear();
            Response.Redirect("~/Ventas_Ver.aspx");
        }

        protected void Buscar_client_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            string qry = "select * from Clientes where ID like '%" + Buscador_cliente.Text + "%' and ID not like '2'";
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Articulos = new SqlDataAdapter(Com);
            DataTable art = new DataTable();
            Articulos.Fill(art);
            Lista_Clientes.DataSource = art;
            Lista_Clientes.DataBind();
        }
        protected void CalcularTotales(object sender, EventArgs e)
        {
            List<ItemVenta> ListaFactura = (List<ItemVenta>)Session["ListaVenta"];
            double Subtotal = 0;
            foreach (var item in ListaFactura)
            {
                int ID = item.ID;
                int Cant = item.Cantidad;
                int Precio = item.Precio;
                Subtotal = Subtotal + Cant * Precio;
            }
            double Total = Subtotal + (Subtotal * 0.30);
            Sub_tot_lb.Text = Subtotal.ToString("N2");
            Total_lb.Text = Total.ToString("N2");
        }

        protected void Efectivo_CheckedChanged(object sender, EventArgs e)
        {
            Tarjeta.Checked = false;
            Det_tj_lb.Visible = false;
            Nomb_tj_lb.Visible = false;
            Nombre_tj_tx.Visible = false;
            Num_tarj_lb.Visible = false;
            Numero_tj_tx.Visible = false;
            Cod_tj_lb.Visible = false;
            Cod_tj_tx.Visible = false;
            Fecha_tj_lb.Visible = false;
            Fecha_Tarjeta_tx.Visible = false;
            Fecha_Tarjeta_tx0.Visible = false;
            Label_Tarjeta.Visible = false;
        }

        protected void Tarjeta_CheckedChanged(object sender, EventArgs e)
        {
            Efectivo.Checked = false;
            Det_tj_lb.Visible = true;
            Nomb_tj_lb.Visible = true;
            Nombre_tj_tx.Visible = true;
            Num_tarj_lb.Visible = true;
            Numero_tj_tx.Visible = true;
            Cod_tj_lb.Visible = true;
            Cod_tj_tx.Visible = true;
            Fecha_tj_lb.Visible = true;
            Fecha_Tarjeta_tx.Visible = true;
            Fecha_Tarjeta_tx0.Visible = true;
        }

        protected void Cliente_Default_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand Com = new SqlCommand("Select * from Clientes where ID=2 ", con.GetConnection());
            SqlDataReader Leer = Com.ExecuteReader();
            Leer.Read();
            Client_ID_lb.Text = Leer["ID"].ToString();
            //ID_art_tx.Text = Leer["ID"].ToString();
            Client_nom_lb.Text = Leer["NombreCompleto"].ToString();
            con.Close();
        }
    }
}