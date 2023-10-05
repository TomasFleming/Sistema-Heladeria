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
    public partial class Facturas_Pagar : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
            //con.Open();
            //SqlCommand sql = new SqlCommand("select * from Facturas_Proveedor FP left join Factura_Prov_Pagada Fpp on FP.ID=Fpp.ID_fact inner join Proveedores P on P.ID=Fp.ID_prov where P.ID=2", con.GetConnection());
            //sql.ExecuteNonQuery();
            //SqlDataAdapter Facts = new SqlDataAdapter(sql);
            //DataTable art = new DataTable();
            //Facts.Fill(art);
            //Lista_facturas.DataSource = art;
            //Lista_facturas.DataBind();
            //con.Close();
            if (Session["ListaFacturasPago"] == null)
            {
                List<Facturas> ListaFactura = new List<Facturas>();
                Session["ListaFacturasPago"] = ListaFactura;
            }
        }
        class Facturas
        {
            public int ID { get; set; }
            public string NombreCompleto { get; set; }
            public int Cod_Prov { get; set; }
            public string Tipo { get; set; }
            public string Estado { get; set; }
            public string Fecha_Emision { get; set; }
            public string Fecha_Vencimiento { get; set; }
            public decimal Total { get; set; }
        }
        protected void PopUp_Prov_bt_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalProv();", true);
        }

        protected void CalcularTotales(object sender, EventArgs e)
        {
            List<Facturas> ListaFactura = (List<Facturas>)Session["ListaFacturasPago"];
            decimal total = 0;
            foreach (var item in ListaFactura)
            {
                int ID = item.ID;
                decimal Precio = item.Total;
                total = total + Precio;
            }
            Total_lb.Text = total.ToString();
        }
        protected void ReActualizar(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sql = new SqlCommand("select * from Facturas_Proveedor FP left join Detalle_Pago Fpp on FP.ID=Fpp.ID_fact inner join Proveedores P on P.ID=Fp.ID_prov where P.ID=" + Prov_ID_lb.Text + " and Estado='Pendiente'", con.GetConnection());
            sql.ExecuteNonQuery();
            SqlDataAdapter fact = new SqlDataAdapter(sql);
            DataTable f = new DataTable();
            fact.Fill(f);

            con.Close();

            //para filtrarlas de la lista
            List<Facturas> facturasSeleccionadas = (List<Facturas>)Session["ListaFacturasPago"];
            List<int> idsEnLista = new List<int>();
            foreach (var item in facturasSeleccionadas)
            {
                idsEnLista.Add(item.ID);
            }

            if (f != null && f.Rows.Count > 0)
            {
                var filasFiltradas = f.AsEnumerable().Where(row => !idsEnLista.Contains(row.Field<int>("ID"))).ToList();

                if (filasFiltradas.Count > 0)
                {
                    DataTable tablaFiltrada = filasFiltradas.CopyToDataTable();
                    Facts_Seleccionar_list.DataSource = tablaFiltrada;
                    Facts_Seleccionar_list.DataBind();
                }
                else
                {
                    // No hay filas para mostrar
                    DataTable bacia = new DataTable();
                    Facts_Seleccionar_list.DataSource = bacia;
                    Facts_Seleccionar_list.DataBind();
                }
            }
            else
            {
                // No hay filas originales para mostrar
                DataTable bacia = new DataTable();
                Facts_Seleccionar_list.DataSource = bacia;
                Facts_Seleccionar_list.DataBind();
            }
        }
        protected void Pop_Facts_bt_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand sql = new SqlCommand("select * from Facturas_Proveedor FP left join Detalle_Pago Fpp on FP.ID=Fpp.ID_fact inner join Proveedores P on P.ID=Fp.ID_prov where P.ID=" + Prov_ID_lb.Text + " and Estado='Pendiente'", con.GetConnection());
                sql.ExecuteNonQuery();
                SqlDataAdapter fact = new SqlDataAdapter(sql);
                DataTable f = new DataTable();
                fact.Fill(f);

                con.Close();

                //para filtrarlas de la lista
                List<Facturas> facturasSeleccionadas = (List<Facturas>)Session["ListaFacturasPago"];
                List<int> idsEnLista = new List<int>();
                foreach (var item in facturasSeleccionadas)
                {
                    idsEnLista.Add(item.ID);
                }

                if (f != null && f.Rows.Count > 0)
                {
                    var filasFiltradas = f.AsEnumerable().Where(row => !idsEnLista.Contains(row.Field<int>("ID"))).ToList();

                    if (filasFiltradas.Count > 0)
                    {
                        DataTable tablaFiltrada = filasFiltradas.CopyToDataTable();
                        Facts_Seleccionar_list.DataSource = tablaFiltrada;
                        Facts_Seleccionar_list.DataBind();
                    }
                    else
                    {
                        // No hay filas para mostrar
                        DataTable bacia = new DataTable();
                        Facts_Seleccionar_list.DataSource = bacia;
                        Facts_Seleccionar_list.DataBind();
                    }
                }
                else
                {
                    // No hay filas originales para mostrar
                    DataTable bacia = new DataTable();
                    Facts_Seleccionar_list.DataSource = bacia;
                    Facts_Seleccionar_list.DataBind();
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {

            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalFacts();", true);
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
            label2.Text = Leer["NombreCompleto"].ToString();
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

            //Para borrar la lista 
            List<Facturas> ListaFactura = (List<Facturas>)Session["ListaFacturasPago"];
            ListaFactura.Clear();
            CalcularTotales(sender, e);
            Lista_facturas.DataSource = ListaFactura;
            Lista_facturas.DataBind();
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

        protected void Ver_Detalle_btn2_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Facts_Seleccionar_list.SelectedIndex = I;
            int ID = Convert.ToInt32(Facts_Seleccionar_list.DataKeys[Facts_Seleccionar_list.SelectedIndex].Value);
            ID_Fact_lb.Text = ID.ToString();
            con.Open();
            SqlCommand detalle = new SqlCommand("select A.ID,A.Nombre,A.Descripcion,C.Nombre_Categoria,DFP.Cant_fact,DFP.Precio_Unit  from Detalle_Fact_Prov DFP inner join Articulos A on A.ID=DFP.ID_Art inner join Categorias C on C.ID=A.Categoria  where DFP.ID_fact= " + ID, con.GetConnection());
            detalle.ExecuteNonQuery();

            SqlDataAdapter Depositos = new SqlDataAdapter(detalle);
            DataTable det = new DataTable();
            Depositos.Fill(det);
            Lista_Detalle.DataSource = det;
            Lista_Detalle.DataBind();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalDetalle();", true);
        }

        protected void Quitar_btn_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_facturas.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_facturas.DataKeys[Lista_facturas.SelectedIndex].Value);
            List<Facturas> ListaFactura = (List<Facturas>)Session["ListaFacturasPago"];
            ListaFactura.RemoveAt(ListaFactura.FindIndex(item => item.ID == ID));

            Lista_facturas.DataSource = ListaFactura;
            Lista_facturas.DataBind();
            CalcularTotales(sender, e);
        }

        protected void Cancelar_Pago_btn_Click(object sender, EventArgs e)
        {
            List<Facturas> ListaFactura = (List<Facturas>)Session["ListaFacturasPago"];
            ListaFactura.Clear();
            Response.Redirect("~/Pre_Facts.aspx");
        }

        protected void Guardar_Pagos_btn_Click(object sender, EventArgs e)
        {
            if (Total_lb.Text != "" && Prov_ID_lb.Text != "")
            {
                try
                {
                    //Primero creo el registro
                    con.Open();
                    SqlCommand sql = new SqlCommand("insert into Registro_Pagos(ID_Prov,Numero_Cuenta,Fecha_Pago,MetodoPago,Total) values ("+Prov_ID_lb.Text+","+Num_Cuenta_tx.Text+",'"+Fecha_Pago_tx.Text+"','"+Forma_Pago_tx.SelectedValue+"',@Total)", con.GetConnection());
                    //SqlCommand sql = new SqlCommand("insert into Registro_Pagos(ID_Prov,Numero_Cuenta,Fecha_Pago,MetodoPago,Total) values (@ID_Prov,@NumCuent,@Fecha,@FormaPago,@Total)", con.GetConnection());
                    //sql.Parameters.Add(new SqlParameter("@ID_Prov", Prov_ID_lb.Text));
                    //sql.Parameters.Add(new SqlParameter("@FormaPago", Forma_Pago_tx.Text));
                    sql.Parameters.Add(new SqlParameter("@Total", Convert.ToDouble(Total_lb.Text)));
                    //sql.Parameters.Add(new SqlParameter("@NumCuent", Num_Cuenta_tx.Text));
                    //sql.Parameters.Add(new SqlParameter("@Fecha", Fecha_Pago_tx.Text));
                    sql.ExecuteNonQuery();
                    con.Close();

                    //Luego el detalle y cambio los estados
                    con.Open();
                    SqlCommand Detalle = new SqlCommand("SELECT TOP 1 * FROM Registro_Pagos ORDER BY ID DESC", con.GetConnection());
                    SqlDataReader Leer = Detalle.ExecuteReader();
                    Leer.Read();
                    int ID_Pago = Convert.ToInt32(Leer["ID"].ToString());
                    con.Close();
                    List<Facturas> ListaFactura = (List<Facturas>)Session["ListaFacturasPago"];
                    foreach (var item in ListaFactura)
                    {
                        int ID = item.ID;
                        con.Open();
                        SqlCommand Detalle2 = new SqlCommand("insert into Detalle_Pago (ID_pago,ID_fact) values ("+ID_Pago+","+ID+")", con.GetConnection());
                        Detalle2.ExecuteNonQuery();
                        con.Close();

                        con.Open();
                        SqlCommand Estado = new SqlCommand("update Facturas_Proveedor set Estado ='Pagada' where ID="+ID, con.GetConnection());
                        Estado.ExecuteNonQuery();
                        con.Close();

                    }
                    ListaFactura.Clear();

                    Response.Redirect("~/Pre_Facts.aspx");
                }
                catch(Exception ex)
                {

                }
                finally
                {

                }
            }



        }

        protected void Seleccionar_Facts_btn_Click(object sender, EventArgs e)
        {
            
            //List<Facturas> facturasSeleccionadas = (List<Facturas>)Session["ListaFactura"];

            //foreach (GridViewRow row in Facts_Seleccionar_list.Rows)
            //{
            //    CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");

            //    // Verifica si el checkbox está seleccionado
            //    if (chkSelect != null && chkSelect.Checked)
            //    {
            //        int ID = Convert.ToInt32(Facts_Seleccionar_list.DataKeys[row.RowIndex].Value);
            //        string nombreCompleto = row.Cells[1].Text;
            //        int codProv = Convert.ToInt32(row.Cells[2].Text);
            //        string tipo = row.Cells[3].Text;
            //        string estado = row.Cells[4].Text;
            //        DateTime fechaEmision = Convert.ToDateTime(row.Cells[5].Text);
            //        DateTime fechaVencimiento = Convert.ToDateTime(row.Cells[6].Text);
            //        decimal total = Convert.ToDecimal(row.Cells[7].Text);

            //        // Agrega la factura seleccionada a la lista
            //        facturasSeleccionadas.Add(new Facturas
            //        {
            //            ID = ID,
            //            NombreCompleto = nombreCompleto,
            //            Cod_Prov = codProv,
            //            Tipo = tipo,
            //            Estado = estado,
            //            Fecha_Emision = fechaEmision,
            //            Fecha_Vencimiento = fechaVencimiento,
            //            Total = total
            //        });
            //    }
            //}
            //Lista_facturas.DataSource = facturasSeleccionadas;
            //Lista_facturas.DataBind();
        }

        protected void Ver_Detalle_btn_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_facturas.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_facturas.DataKeys[Lista_facturas.SelectedIndex].Value);
            ID_Fact_lb.Text = ID.ToString();
            con.Open();
            SqlCommand detalle = new SqlCommand("select A.ID,A.Nombre,A.Descripcion,C.Nombre_Categoria,DFP.Cant_fact,DFP.Precio_Unit  from Detalle_Fact_Prov DFP inner join Articulos A on A.ID=DFP.ID_Art inner join Categorias C on C.ID=A.Categoria  where DFP.ID_fact= " + ID, con.GetConnection());
            detalle.ExecuteNonQuery();

            SqlDataAdapter Depositos = new SqlDataAdapter(detalle);
            DataTable det = new DataTable();
            Depositos.Fill(det);
            Lista_Detalle.DataSource = det;
            Lista_Detalle.DataBind();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalDetalle();", true);
        }

        protected void Seleccionar_Click(object sender, EventArgs e)//esto agrega la factura a la lista y la quita del popup
        {
            List<Facturas> facturasSeleccionadas = (List<Facturas>)Session["ListaFacturasPago"];

            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Facts_Seleccionar_list.SelectedIndex = I;
            int ID = Convert.ToInt32(Facts_Seleccionar_list.DataKeys[Facts_Seleccionar_list.SelectedIndex].Value);

            con.Open();
            SqlCommand sql = new SqlCommand("select * from Facturas_Proveedor FP left join Detalle_Pago Fpp on FP.ID=Fpp.ID_fact inner join Proveedores P on P.ID=Fp.ID_prov where FP.ID=" + ID, con.GetConnection());
            SqlDataReader reader = sql.ExecuteReader();
            reader.Read();
            

            facturasSeleccionadas.Add(new Facturas{ID = Convert.ToInt32(reader["ID"].ToString()),NombreCompleto = reader["NombreCompleto"].ToString(),Cod_Prov = Convert.ToInt32(reader["Cod_Prov"].ToString()),Tipo = reader["Tipo"].ToString(),Estado = reader["Estado"].ToString(),Fecha_Emision = reader["Fecha_Emision"].ToString(),Fecha_Vencimiento = reader["Fecha_Vencimiento"].ToString(),Total = Convert.ToDecimal(reader["Total"].ToString())});
            con.Close();
            Lista_facturas.DataSource = facturasSeleccionadas;
            Lista_facturas.DataBind();

            ReActualizar(sender,e);
            CalcularTotales(sender, e);
        }
    }
}