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
            SqlCommand Com = new SqlCommand("select OC.ID,P.NombreCompleto,ID_Deposito,OC.Estado,CONVERT(varchar, Fecha_Creacion, 3) as 'Fecha_Creacion',CONVERT(varchar, Fecha_Entrega, 3)as 'Fecha_Entrega' from OrdenesCompra OC inner join Proveedores P on P.ID=OC.ID_Proveedor inner join Depositos D on D.ID=OC.ID_Deposito where OC.ID like '%" + Buscador_Ord.Text+"%'", con.GetConnection());
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

        protected void Aprobar_Popup_btn_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Ordenes_Compra.SelectedIndex = I;
            con.Open();
            int ID = Convert.ToInt32(Lista_Ordenes_Compra.DataKeys[Lista_Ordenes_Compra.SelectedIndex].Value);
            SqlCommand sql = new SqlCommand("select P.ID as Prov,D.ID as Dep,P.Telefono,P.NombreCompleto,D.Nombre,P.Correo,P.Direccion,D.Ubicacion,OC.Fecha_Entrega from OrdenesCompra OC inner join Depositos D on OC.ID_Deposito=D.ID inner join Proveedores P on P.ID=OC.ID_Proveedor where OC.ID= "+ID, con.GetConnection());
            SqlDataReader leer =sql.ExecuteReader();
            leer.Read();
            Prov_ID_lb.Text = leer["Prov"].ToString();
            Prov_nom_lb.Text = leer["NombreCompleto"].ToString();
            Correo_lb.Text = leer["Correo"].ToString();
            Direc_lb.Text = leer["Direccion"].ToString();
            Telf_lb.Text = leer["Telefono"].ToString();

            Deposit_ID_lb.Text = leer["Dep"].ToString();
            Deposit_nom_lb.Text = leer["Nombre"].ToString();
            Deposit_Ubic_lb.Text = leer["Ubicacion"].ToString();
            Fecha_Entrega.Text = leer["Fecha_Entrega"].ToString();
            con.Close();
            Session["ID_Aprob"] = ID.ToString();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2();", true);
        }

        protected void Cancelar_btn_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal2();", true);
        }

        protected void Aprobar_ord_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sql1 = new SqlCommand("update OrdenesCompra set Estado='Orden Aprobada' where ID=" +Session["ID_Aprob"].ToString(), con.GetConnection());
            sql1.ExecuteNonQuery();
            con.Close();
            Buscar_Ord_btn_Click(sender, e);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal2();", true);
            
        }
    }
}