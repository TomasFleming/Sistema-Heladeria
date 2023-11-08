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
            SqlCommand check = new SqlCommand("select * from Proveedores where NombreCompleto='" + Nomb_tx.Text + "' or Correo='" + Correo_tx.Text + "'", con.GetConnection());
            SqlDataReader leer = check.ExecuteReader();
            if (leer.Read())
            {
                if (leer["Correo"].ToString() == Correo_tx.Text)
                {
                    Alert_correo_lb.Visible = true;
                }
                else
                {
                    Alert_lb.Visible = true;
                }
            }
            else
            {
                Alert_correo_lb.Visible = false;
                Alert_lb.Visible = false;
            }
            con.Close();
            if (Nomb_tx.Text != "" && Telefono_tx.Text != "" && Correo_tx.Text != "" && Direcc_tx.Text!="" && Alert_lb.Visible == false && Alert_correo_lb.Visible == false)
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
                Completos_lb.Visible = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
            }
            else
            {
                if (Alert_lb.Visible == false && Alert_correo_lb.Visible == false)
                {
                    Completos_lb.Visible = true;
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
            }
        }

        protected void Prov_elin_byn_Click(object sender, EventArgs e)//cancelar proveedor
        {
            Nomb_tx.Text = "";
            Direcc_tx.Text = "";
            Telefono_tx.Text = "";
            Correo_tx.Text = "";
            Completos_lb.Visible = false; 
            Alert_lb.Visible = false;
            Alert_correo_lb.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
        }

        protected void Eliminar_Prov_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sql = new SqlCommand("delete Proveedores where ID= " + ID_Prov_edit.Text, con.GetConnection());
            sql.ExecuteNonQuery();
            con.Close();
            Alert_Edit_lb.Visible = false;
            Alert_Correo_Edit_lb.Visible = false;
            Completos_Edit_lb.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal2();", true);
        }

        protected void Guardar_Edit_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand check = new SqlCommand("select * from Proveedores where (NombreCompleto='" + Nomb_Edit_tx.Text + "' or Correo='" + Correo_Edit_tx.Text + "') and ID!="+ID_Prov_edit.Text, con.GetConnection());
            SqlDataReader leer = check.ExecuteReader();
            if (leer.Read())
            {
                if (leer["Correo"].ToString() == Correo_Edit_tx.Text)
                {
                    Alert_Correo_Edit_lb.Visible = true;
                }
                else
                {
                    Alert_Edit_lb.Visible = true;
                }
            }
            else
            {
                Alert_Correo_Edit_lb.Visible = false;
                Alert_Edit_lb.Visible = false;
            }
            con.Close();
            if (Nomb_Edit_tx.Text != "" && Telf_Edit_tx.Text != "" && Correo_Edit_tx.Text != "" && Direcc_Edit_tx.Text != "" && Alert_Edit_lb.Visible == false && Alert_Correo_Edit_lb.Visible == false)
            {
                con.Open();
                SqlCommand sql = new SqlCommand("update Proveedores set NombreCompleto='" + Nomb_Edit_tx.Text + "',Telefono=" + Telf_Edit_tx.Text + ",Direccion='" + Direcc_Edit_tx.Text + "',Correo='" + Correo_Edit_tx.Text + "' where ID= " + ID_Prov_edit.Text, con.GetConnection());
                sql.ExecuteNonQuery();
                con.Close();
                Completos_Edit_lb.Visible = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal2();", true);
            }
            else
            {
                if (Alert_Edit_lb.Visible == false && Alert_Correo_Edit_lb.Visible == false)
                {
                    Completos_Edit_lb.Visible = true;
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
            }
        }

        protected void Edit_prov_btn_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Proveedores.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Proveedores.DataKeys[Lista_Proveedores.SelectedIndex].Value);

            con.Open();
            SqlCommand sql = new SqlCommand("select * from Proveedores where ID= "+ID, con.GetConnection());
            SqlDataReader leer = sql.ExecuteReader();
            leer.Read();
            ID_Prov_edit.Text = leer["ID"].ToString();
            Nomb_Edit_tx.Text = leer["NombreCompleto"].ToString();
            Telf_Edit_tx.Text = leer["Telefono"].ToString();
            Correo_Edit_tx.Text = leer["Correo"].ToString();
            Direcc_Edit_tx.Text = leer["Direccion"].ToString();
            con.Close();
            Alert_Correo_Edit_lb.Visible = false;
            Alert_Edit_lb.Visible = false;
            Completos_Edit_lb.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2();", true);
        }
    }
}