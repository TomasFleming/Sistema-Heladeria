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
    public partial class ListasCompras_Ver : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
        }

        protected void Buscar_Ord_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand Com = new SqlCommand("select OC.ID,P.NombreCompleto,ID_Deposito,Estado,Fecha_Creacion,Fecha_Entrega from OrdenesCompra OC inner join Proveedores P on P.ID=OC.ID_Proveedor inner join Depositos D on D.ID=OC.ID_Deposito where OC.ID like '%" + Buscador_Ord.Text+"%'", con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Proveedores = new SqlDataAdapter(Com);
            DataTable prov = new DataTable();
            Proveedores.Fill(prov);
            Lista_Ordenes_Compra.DataSource = prov;
            Lista_Ordenes_Compra.DataBind();
            con.Close();
        }

        protected void Agregar_Ord_btn_Click(object sender, EventArgs e)
        {

        }

        protected void Ver_Detalle_btn_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Ordenes_Compra.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Ordenes_Compra.DataKeys[Lista_Ordenes_Compra.SelectedIndex].Value);
            ID_Ord_lb.Text = ID.ToString();
            con.Open();
            SqlCommand detalle = new SqlCommand("select DO.ID,A.Nombre,A.Descripcion,C.Nombre_Categoria,Cantidad  from Detalle_Ord DO inner join Articulos A on A.ID=DO.ID_Art inner join Categorias C on C.ID=A.Categoria  where ID_ord= "+ID+"", con.GetConnection());
            detalle.ExecuteNonQuery();

            SqlDataAdapter Depositos = new SqlDataAdapter(detalle);
            DataTable det = new DataTable();
            Depositos.Fill(det);
            Lista_Detalle.DataSource = det;
            Lista_Detalle.DataBind();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }
    }
}