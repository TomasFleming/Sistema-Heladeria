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
    public partial class Facturas_Ver : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
        }

        protected void Ver_Detalle_btn_Click(object sender, EventArgs e)
        {

        }

        protected void Buscar_dep_btn_Click(object sender, EventArgs e)
        {

        }

        protected void Buscar_fact_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand Com = new SqlCommand("select * from Facturas_Proveedor FP left join Factura_Prov_Pagada Fpp on FP.ID=Fpp.ID_fact inner join Proveedores P on P.ID=Fp.ID_prov", con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Proveedores = new SqlDataAdapter(Com);
            DataTable prov = new DataTable();
            Proveedores.Fill(prov);
            Lista_facturas.DataSource = prov;
            Lista_facturas.DataBind();
            con.Close();
        }

        protected void Crear_fact_btn_Click(object sender, EventArgs e)
        {

        }
    }
}