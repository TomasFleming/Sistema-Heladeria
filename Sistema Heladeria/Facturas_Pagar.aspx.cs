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
            con.Open();
            SqlCommand sql = new SqlCommand("select * from Facturas_Proveedor FP left join Factura_Prov_Pagada Fpp on FP.ID=Fpp.ID_fact inner join Proveedores P on P.ID=Fp.ID_prov where P.ID=2", con.GetConnection());
            sql.ExecuteNonQuery();
            SqlDataAdapter Facts = new SqlDataAdapter(sql);
            DataTable art = new DataTable();
            Facts.Fill(art);
            Lista_facturas.DataSource = art;
            Lista_facturas.DataBind();
            con.Close();
        }

        protected void PopUp_Prov_bt_Click(object sender, EventArgs e)
        {

        }

        protected void Pop_Facts_bt_Click(object sender, EventArgs e)
        {

        }
    }
}