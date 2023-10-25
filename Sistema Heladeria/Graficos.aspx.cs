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
    public partial class Graficos : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
        }

        protected void Flitrar_Ganancias_Click(object sender, EventArgs e)
        {

        }

        protected void Lipiar_Ganancias_btn_Click(object sender, EventArgs e)
        {

        }
    }
}