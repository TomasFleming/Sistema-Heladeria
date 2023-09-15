using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_Heladeria
{
    public partial class Facturas_Crear_Nueva : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PopUp_Prov_bt_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalProv();", true);
        }

        protected void Pop_Art_bt_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalSelectArt();", true);
        }
        protected void Quitar_art_Click(object sender, EventArgs e)
        {

        }

        protected void Guardar_Fact_btn_Click(object sender, EventArgs e)
        {

        }

        protected void Cancelar_Fact_btn_Click(object sender, EventArgs e)
        {

        }
        protected void Art_Agregar_btn_Click(object sender, EventArgs e)
        {

        }
        protected void Art_Cancelar_btn_Click(object sender, EventArgs e)
        {

        }
        protected void Selecc_Prov_btn_Click(object sender, EventArgs e)
        {

        }
        protected void Buscar_prov_btn_Click(object sender, EventArgs e)
        {

        }
        protected void Buscar_art_btn_Click(object sender, EventArgs e)
        {

        }
        protected void Cargar_Art_btn_Click(object sender, EventArgs e)
        {

        }
    }
}