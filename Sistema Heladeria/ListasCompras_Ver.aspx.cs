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

        }
    }
}