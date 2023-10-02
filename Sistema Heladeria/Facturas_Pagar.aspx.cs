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
        }

        protected void PopUp_Prov_bt_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalProv();", true);
        }

        protected void Pop_Facts_bt_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand sql = new SqlCommand("select * from Facturas_Proveedor FP left join Factura_Prov_Pagada Fpp on FP.ID=Fpp.ID_fact inner join Proveedores P on P.ID=Fp.ID_prov where P.ID=" + Prov_ID_lb.Text, con.GetConnection());
                sql.ExecuteNonQuery();
                SqlDataAdapter fact = new SqlDataAdapter(sql);
                DataTable f = new DataTable();
                fact.Fill(f);
                Facts_Seleccionar_list.DataSource = f;
                Facts_Seleccionar_list.DataBind();
                con.Close();
            }
            catch(Exception ex)
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

        protected void Ver_Detalle_btn_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_facturas.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_facturas.DataKeys[Lista_facturas.SelectedIndex].Value);
            ID_Ord_lb.Text = ID.ToString();
            con.Open();
            SqlCommand detalle = new SqlCommand("select A.ID,A.Nombre,A.Descripcion,C.Nombre_Categoria,DFP.Cant_fact,DFP.Precio_Unit  from Detalle_Fact_Prov DFP inner join Articulos A on A.ID=DFP.ID_Art inner join Categorias C on C.ID=A.Categoria  where DFP.ID_fact= " + ID + " where Estado='Pendiente'", con.GetConnection());
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
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalFacts();", true);
        }

        protected void Cancelar_Pago_btn_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalDetalle();", true);
        }

        protected void Guardar_Pagos_btn_Click(object sender, EventArgs e)
        {

        }
    }
}