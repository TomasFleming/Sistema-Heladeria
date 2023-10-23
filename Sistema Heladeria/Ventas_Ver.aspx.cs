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
    public partial class Ventas_Ver : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
        }

        protected void Buscar_Vent_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            string comando = "select * from Ventas V inner join Clientes C on C.ID=V.ID_Cliente where V.ID ";//and Total>=@prTotMin and Total<=@prTotMax and Fecha_Emision>=@prFechaInicio and Fecha_Emision<=@prFechaFin and ID_prov=@prProveedor";

            if (!string.IsNullOrWhiteSpace(Buscador_Vents_tx.Text))
            {
                comando = comando + "= " + Buscador_Vents_tx.Text + " ";
            }
            else
            {
                comando = comando + "like '%" + Buscador_Vents_tx.Text + "%'";
            }
            if (!string.IsNullOrWhiteSpace(Precio_min_tx.Text))//quiere decir que si selecciono algo 
            {
                comando = comando + " and Total>=" + Precio_min_tx.Text + " ";
            }
            if (!string.IsNullOrWhiteSpace(Precio_Max_tx.Text))
            {
                comando = comando + " and Total<=" + Precio_Max_tx.Text + " ";
            }
            if (!string.IsNullOrWhiteSpace(Fecha_min_tx.Text))
            {
                comando = comando + " and Fecha>='" + Fecha_min_tx.Text + "' ";
            }
            if (!string.IsNullOrWhiteSpace(Fecha_Max_tx.Text))
            {
                comando = comando + " and Fecha<='" + Fecha_Max_tx.Text + "' ";
            }
            if (!string.IsNullOrWhiteSpace(Cliente_Filt_tx.Text))
            {
                comando = comando + " and C.NombreCompleto='" + Cliente_Filt_tx.Text + "' ";
            }
            SqlCommand Com = new SqlCommand(comando, con.GetConnection());

            Com.ExecuteNonQuery();
            SqlDataAdapter Proveedores = new SqlDataAdapter(Com);
            DataTable prov = new DataTable();
            Proveedores.Fill(prov);
            Lista_facturas.DataSource = prov;
            Lista_facturas.DataBind();
            con.Close();
        }

        protected void Ver_Detalle_btn_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_facturas.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_facturas.DataKeys[Lista_facturas.SelectedIndex].Value);
            ID_Vemta.Text = ID.ToString();
            con.Open();
            SqlCommand detalle = new SqlCommand("select A.ID,A.Nombre,A.Descripcion,C.Nombre_Categoria,DV.Cantidad,DV.PrecioUnid  from DetalleVentas DV inner join Articulos A on A.ID=DV.ID_Articulo inner join Categorias C on C.ID=A.Categoria  where DV.ID_Venta= " + ID + "", con.GetConnection());
            detalle.ExecuteNonQuery();

            SqlDataAdapter Depositos = new SqlDataAdapter(detalle);
            DataTable det = new DataTable();
            Depositos.Fill(det);
            Lista_Detalle.DataSource = det;
            Lista_Detalle.DataBind();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalArt();", true);
        }

        protected void Lipiar_Filt_btn_Click(object sender, EventArgs e)
        {
            Fecha_min_tx.Text = "";
            Fecha_Max_tx.Text = "";
            Precio_min_tx.Text = "";
            Precio_Max_tx.Text = "";
            Cliente_Filt_tx.Text = "";
            Buscar_Vent_btn_Click(sender, e);
        }

        protected void Popup_Client_bt_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalProv();", true);
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
            Cliente_Filt_tx.Text = Leer["NombreCompleto"].ToString();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalProv();", true);
            //Para dejar bacio
            DataTable clrear = new DataTable();
            Lista_Clientes.DataSource = clrear;
            Lista_Clientes.DataBind();
        }

        protected void Buscar_client_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            string qry = "select * from Clientes where ID like '%" + Buscador_cliente.Text + "%' ";
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Articulos = new SqlDataAdapter(Com);
            DataTable art = new DataTable();
            Articulos.Fill(art);
            Lista_Clientes.DataSource = art;
            Lista_Clientes.DataBind();
        }
    }
}