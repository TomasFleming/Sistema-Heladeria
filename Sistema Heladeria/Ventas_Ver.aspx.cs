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
            string comando = "select * from Ventas V inner join Clientes C on C.ID=V.ID_Cliente where V.ID like '" + Buscador_Vents_tx.Text + "'  or C.NombreCompleto like '%" + Buscador_Vents_tx.Text + "%' ";//and Total>=@prTotMin and Total<=@prTotMax and Fecha_Emision>=@prFechaInicio and Fecha_Emision<=@prFechaFin and ID_prov=@prProveedor";

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
            //if (Prov_select_lt.SelectedValue != "0")
            //{
            //    comando = comando + " and ID_prov=" + Prov_select_lt.SelectedValue + " ";
            //}
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
        }
    }
}