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
            CalcularTotales(sender, e);
        }

        protected void Guardar_Fact_btn_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime fechaEmitido = DateTime.Parse(Fecha_Creacion_tx.Text);
                DateTime fechaVencimiento = DateTime.Parse(Fecha_Venc_tx.Text);

                if (fechaVencimiento <= fechaEmitido)
                {
                    Alert_lb.Visible = true;
                }
                else
                {
                    try
                    {
                        con.Open();
                        //primero creo orden
                        string query = "INSERT INTO Facturas_Proveedor (Fecha_Emision, Fecha_Vencimiento, Cod_Prov, Total, ID_prov, Fecha_Registro, Tipo) VALUES (@FechaEmision, @FechaVencimiento, @CodProv, @Total, @IDProv, @FechaRegistro, @Tipo)";
                        SqlCommand Orden = new SqlCommand(query, con.GetConnection());
                        Orden.Parameters.Add(new SqlParameter("@FechaEmision", Fecha_Creacion_tx.Text));
                        Orden.Parameters.Add(new SqlParameter("@FechaVencimiento", Fecha_Venc_tx.Text));
                        Orden.Parameters.Add(new SqlParameter("@CodProv", Cod_Prov_tx.Text));
                        Orden.Parameters.Add(new SqlParameter("@Total", Convert.ToDouble(Total_lb.Text)));
                        Orden.Parameters.Add(new SqlParameter("@IDProv", Prov_ID_lb.Text));
                        Orden.Parameters.Add(new SqlParameter("@FechaRegistro", DateTime.Now));
                        Orden.Parameters.Add(new SqlParameter("@Tipo", Tipo_Fact.Text));
                        Orden.ExecuteNonQuery();
                        con.Close();
                        //Luego el detalle

                        con.Open();
                        SqlCommand Detalle = new SqlCommand("SELECT TOP 1 * FROM Facturas_Proveedor ORDER BY ID DESC", con.GetConnection());
                        SqlDataReader Leer = Detalle.ExecuteReader();
                        Leer.Read();
                        int ID_Fact = Convert.ToInt32(Leer["ID"].ToString());
                        con.Close();
                        List<ItemFactura> ListaFactura = (List<ItemFactura>)Session["ListaFactura"];
                        foreach (var item in ListaFactura)
                        {
                            int ID = item.ID;
                            int Cant = item.Cantidad;
                            con.Open();
                            SqlCommand Detalle2 = new SqlCommand("insert into Detalle_Fact_Prov(ID_fact,ID_art,Cant_fact,Precio_Unit) values (" + ID_Fact + "," + ID + "," + Cant + "," + item.Precio + ")", con.GetConnection());
                            Detalle2.ExecuteNonQuery();
                            con.Close();

                        }
                        ListaFactura.Clear();

                        Response.Redirect("~/Facturas_Ver.aspx");
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert(' Error : Todos los campos del formulario deben estar completos');</script>");
                    }
                }
            }

            catch(Exception ex)
            {
                Response.Write("<script>alert(' Error : Todos los campos del formulario deben estar completos');</script>");
            }


        }

        protected void Cancelar_Fact_btn_Click(object sender, EventArgs e)
        {
            List<ItemFactura> ListaFactura = (List<ItemFactura>)Session["ListaFactura"];
            ListaFactura.Clear();
            Response.Redirect("~/Facturas_Ver.aspx");
        }
        protected void Art_Agregar_btn_Click(object sender, EventArgs e)
        {
            try
            {
                List<ItemFactura> ListaFactura = (List<ItemFactura>)Session["ListaFactura"];
                Boolean check = ListaFactura.Any(item => item.ID == Convert.ToInt32(ID_Art_sel_lb.Text));

                if (check)
                {

                }
                else
                {
                    ListaFactura.Add(new ItemFactura { ID = Convert.ToInt32(ID_Art_sel_lb.Text), Nombre = Nomb_art_lb.Text, Categoria = Cat_art_lb.Text, Descripcion = Desc_art_lb.Text, Cantidad = Convert.ToInt32(Cantidad_tx.Text), Precio = Convert.ToInt32(Precio_tx.Text) });

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
            catch (Exception)
            {

            }
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
            string qry = "select * from Proveedores where Estado!='Desactivado' and (ID like '%" + Buscador_prov.Text + "%' or NombreCompleto like '%" + Buscador_prov.Text + "%') ";
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
            string qry = "select A.ID, A.Nombre,C.Nombre_Categoria, A.Descripcion, A.Precio from Articulos A inner join Categorias C on A.Categoria=C.ID where (A.ID like '" + Buscador_art.Text + "' or A.Nombre like '%" + Buscador_art.Text + "%' or C.Nombre_Categoria like '%" + Buscador_art.Text + "%') and A.Estado!='Desactivado' and A.Destino='Materia Prima' ";
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
                SqlCommand Com = new SqlCommand("Select A.ID,A.Nombre,C.Nombre_Categoria,A.Descripcion from Articulos A inner join Categorias C on C.ID=A.Categoria where A.Estado!='Desactivado' and A.Destino='Materia Prima' and A.ID=" + ID_art_tx.Text, con.GetConnection());
                SqlDataReader Leer = Com.ExecuteReader();
                Leer.Read();
                ID_Art_sel_lb.Text = Leer["ID"].ToString();
                //ID_art_tx.Text = Leer["ID"].ToString();
                Nomb_art_lb.Text = Leer["Nombre"].ToString();
                Cat_art_lb.Text = Leer["Nombre_Categoria"].ToString();
                Desc_art_lb.Text = Leer["Descripcion"].ToString();
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
        protected void CalcularTotales(object sender,EventArgs e)
        {
            List<ItemFactura> ListaFactura = (List<ItemFactura>)Session["ListaFactura"];
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
        class ItemFactura
        {
            public int ID { get; set; }
            public string Nombre { get; set; }
            public string Categoria { get; set; }
            public string Descripcion { get; set; }
            public int Cantidad { get; set; }
            public int Precio { get; set; }
        }

        protected void Buscar_btn_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalArt();", true);
            con.Open();
            string qry = "select A.ID, A.Nombre,C.Nombre_Categoria, A.Descripcion, A.Precio from Articulos A inner join Categorias C on A.Categoria=C.ID where (A.ID like '" + ID_art_tx.Text + "' or A.Nombre like '%" + ID_art_tx.Text + "%' or C.Nombre_Categoria like '%" + ID_art_tx.Text + "%') and A.Estado!='Desactivado' and A.Destino='Materia Prima' ";
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