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
    public partial class Proveedores : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();

        }

        protected void Agregar_prov_btn_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);

        }

        protected void Buscar_prov_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            string qry = "select * from Proveedores ";
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Proveedores = new SqlDataAdapter(Com);
            DataTable prov = new DataTable();
            Proveedores.Fill(prov);
            Lista_Proveedores.DataSource = prov;
            Lista_Proveedores.DataBind();
            con.Close();
        }

        protected void Prov_guard_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sql = new SqlCommand("insert into Proveedores(NombreCompleto,Telefono,Correo,Direccion) values (@prNombre,@prTelf,@prCorre,@prDirecc)", con.GetConnection());
            sql.Parameters.Add(new SqlParameter("@prNombre", Nomb_tx.Text));
            sql.Parameters.Add(new SqlParameter("@prTelf", Telefono_tx.Text));
            sql.Parameters.Add(new SqlParameter("@prCorre", Correo_tx.Text));
            sql.Parameters.Add(new SqlParameter("@prDirecc", Direcc_tx.Text));
            sql.ExecuteNonQuery();
            con.Close();
            Nomb_tx.Text = "";
            Direcc_tx.Text = "";
            Telefono_tx.Text = "";
            Correo_tx.Text = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
        }

        protected void Prov_elin_byn_Click(object sender, EventArgs e)
        {

        }
    }
}