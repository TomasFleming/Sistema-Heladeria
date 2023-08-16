using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_Heladeria
{
    public partial class Categorias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Agregar_Cat_btn_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);

        }

        protected void Art_camb_btn_Click(object sender, EventArgs e)
        {

        }

        protected void Art_elin_byn_Click(object sender, EventArgs e)
        {

        }

        protected void Buscar_cat_btn_Click(object sender, EventArgs e)
        {

        }
    }
}