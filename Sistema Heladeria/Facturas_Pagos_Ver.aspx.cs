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
    public partial class Facturas_Pagos_Ver : System.Web.UI.Page
    {
        Conectar con= new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
        }

        protected void Buscar_Pago_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            string comando = "select RP.ID,P.NombreCompleto,Numero_Cuenta,Fecha_Pago,MetodoPago,RP.Total  from Registro_Pagos RP left join Proveedores P on P.ID=RP.ID_Prov where RP.ID ";

            if (!string.IsNullOrWhiteSpace(Buscador_Pago_tx.Text))
            {
                comando = comando + "= " + Buscador_Pago_tx.Text + " ";
            }
            else
            {
                comando = comando + "like '%" + Buscador_Pago_tx.Text + "%'";
            }
            if (!string.IsNullOrWhiteSpace(Precio_min_tx.Text))//quiere decir que si selecciono algo 
            {
                comando = comando + " and RP.Total>=" + Precio_min_tx.Text + " ";
            }
            if (!string.IsNullOrWhiteSpace(Precio_Max_tx.Text))
            {
                comando = comando + " and RP.Total<=" + Precio_Max_tx.Text + " ";
            }
            if (!string.IsNullOrWhiteSpace(Fecha_min_tx.Text))
            {
                comando = comando + " and Fecha_Pago>='" + Fecha_min_tx.Text + "' ";
            }
            if (!string.IsNullOrWhiteSpace(Fecha_Max_tx.Text))
            {
                comando = comando + " and Fecha_Pago<='" + Fecha_Max_tx.Text + "' ";
            }
            if (!string.IsNullOrWhiteSpace(Prov_Filt_tx.Text))
            {
                comando = comando + " and P.NombreCompleto='" + Prov_Filt_tx.Text + "' ";
            }
            SqlCommand Com = new SqlCommand(comando, con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Proveedores = new SqlDataAdapter(Com);
            DataTable prov = new DataTable();
            Proveedores.Fill(prov);
            Lista_Pagos.DataSource = prov;
            Lista_Pagos.DataBind();
            con.Close();
        }

        protected void Realizar_Pago_btn_Click(object sender, EventArgs e)
        {

        }

        protected void Lipiar_Filt_btn_Click(object sender, EventArgs e)
        {
            Precio_Max_tx.Text = "";
            Precio_min_tx.Text = "";
            Prov_Filt_tx.Text = "";
            Fecha_Max_tx.Text = "";
            Fecha_min_tx.Text = "";
            Buscar_Pago_btn_Click(sender, e);
        }

        protected void Ver_Detalle_btn_Click(object sender, EventArgs e)//es para ver las facturas del pago
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Pagos.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Pagos.DataKeys[Lista_Pagos.SelectedIndex].Value);
            ID_Pago_lb.Text = ID.ToString();
            con.Open();
            SqlCommand sql = new SqlCommand("select NombreCompleto,Numero_Cuenta,CONVERT(varchar, Fecha_Pago, 103) as Fecha_Pago,CONVERT(varchar, Fecha_Registro, 103) as Fecha_Registro,MetodoPago,Total from Registro_Pagos Rp inner join Proveedores P on P.ID=Rp.ID_Prov where Rp.ID= "+ID, con.GetConnection());
            SqlDataReader leer = sql.ExecuteReader();
            leer.Read();
            Prov_nom_lb.Text = leer["NombreCompleto"].ToString();
            Num_Cuenta_lb.Text = leer["Numero_Cuenta"].ToString();
            Fecha_Pago_lb.Text = leer["Fecha_Pago"].ToString();
            Fecha_Reg_lb.Text = leer["Fecha_Registro"].ToString();
            Met_Pago_lb.Text = leer["MetodoPago"].ToString();
            Total_lb.Text = leer["Total"].ToString();
            con.Close();
            con.Open();
            SqlCommand detalle = new SqlCommand("select FP.ID,NombreCompleto,Cod_Prov,Tipo,FP.Estado,Fecha_Emision,FP.Total from Facturas_Proveedor FP inner join Proveedores P on FP.ID_Prov=P.ID inner join Detalle_Pago DP on DP.ID_Fact=FP.ID inner join Registro_Pagos RP on RP.ID=DP.ID_Pago where RP.ID=" + ID, con.GetConnection());
            detalle.ExecuteNonQuery();

            SqlDataAdapter Depositos = new SqlDataAdapter(detalle);
            DataTable det = new DataTable();
            Depositos.Fill(det);
            Facts_Seleccionar_list.DataSource = det;
            Facts_Seleccionar_list.DataBind();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalFacts();", true);
        }

        protected void Ver_Articulos_btn_Click(object sender, EventArgs e)
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
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalArt();", true);
        }

        protected void Popup_Prov_bt_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalProv();", true);
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
            Prov_Filt_tx.Text = Leer["NombreCompleto"].ToString();
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
    }
}