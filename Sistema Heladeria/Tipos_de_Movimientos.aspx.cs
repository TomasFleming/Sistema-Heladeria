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
    public partial class Tipos_de_Movimientos : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
        }

        protected void Agregar_mov_btn_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal1();", true);
        }

        protected void Buscar_mov_btn_Click(object sender, EventArgs e)
        {

        }

        protected void Editar_mov_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2();", true);
        }

        protected void Guardar_Mov_bt_Click(object sender, EventArgs e)
        {
            try
            {

            }
            finally
            {

            }
        }

        protected void Mov_guard_btn_Click(object sender, EventArgs e)
        {

        }

        protected void Cancelar_mov_btn_Click(object sender, EventArgs e)
        {

        }
    }
}