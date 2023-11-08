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
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }

        protected void Buscar_mov_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            string comando = "select * from Actividades";
            SqlCommand Com = new SqlCommand(comando, con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Proveedores = new SqlDataAdapter(Com);
            DataTable prov = new DataTable();
            Proveedores.Fill(prov);
            Lista_Movimientos.DataSource = prov;
            Lista_Movimientos.DataBind();
            con.Close();
        }

        protected void Editar_mov_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Movimientos.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Movimientos.DataKeys[Lista_Movimientos.SelectedIndex].Value);
            con.Open();
            SqlCommand sql = new SqlCommand("select * from Actividades where ID= "+ID, con.GetConnection());
            SqlDataReader leer = sql.ExecuteReader();
            leer.Read();
            ID_Art_edit_lb.Text = leer["ID"].ToString();
            Nomb_Edit_tx.Text = leer["Nombre"].ToString();
            Descript_Edit_tx.Text = leer["Descripcion"].ToString();
            Desc_Edit_tx.Text = leer["Detalle"].ToString();
            con.Close();
            Alert_Edit_lb.Visible = false;
            Completos_Edit_lb.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2();", true);
        }

        protected void Guardar_Mov_bt_Click(object sender, EventArgs e)//guarda primera vez
        {
            con.Open();
            SqlCommand check = new SqlCommand("select * from Actividades where Nombre='" + Nombre_mov_tx.Text + "'", con.GetConnection());
            SqlDataReader leer = check.ExecuteReader();
            if (leer.Read())
            {
                Alert_lb.Visible = true;
            }
            else
            {
                Alert_lb.Visible = false;
            }
            con.Close();
            if (Nombre_mov_tx.Text != "" && Descp_tx.Text != "" && Alert_lb.Visible == false)
            {
                con.Open();
                SqlCommand sql = new SqlCommand("insert into Actividades(Nombre,Descripcion,Detalle) values ('" + Nombre_mov_tx.Text + "','" + Descp_tx.Text + "','" + Detalle_list.SelectedValue + "')", con.GetConnection());
                sql.ExecuteNonQuery();
                con.Close();
                Nombre_mov_tx.Text = "";
                Descp_tx.Text = "";
                Completos_lb.Visible = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
            }
            else
            {
                if (Alert_lb.Visible == false)
                {
                    Completos_lb.Visible = true;
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
            }

        }

        protected void Mov_guard_btn_Click(object sender, EventArgs e)//edita 
        {
            con.Open();
            SqlCommand check = new SqlCommand("select * from Actividades where Nombre='" + Nomb_Edit_tx.Text + "'", con.GetConnection());
            SqlDataReader leer = check.ExecuteReader();
            if (leer.Read())
            {
                Alert_Edit_lb.Visible = true;
            }
            else
            {
                Alert_Edit_lb.Visible = false;
            }
            con.Close();
            if (Nomb_Edit_tx.Text != "" && Descript_Edit_tx.Text != "" && Alert_Edit_lb.Visible == false)
            {

                con.Open();
                SqlCommand sql = new SqlCommand("update Actividades set Nombre='" + Nomb_Edit_tx.Text + "', Descripcion='" + Descript_Edit_tx.Text + "',Detalle='" + Desc_Edit_tx.Text + "' where ID=" + ID_Art_edit_lb.Text, con.GetConnection());
                sql.ExecuteNonQuery();
                con.Close();
                Buscar_mov_btn_Click(sender, e);
                Completos_Edit_lb.Visible = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal2();", true);
            }
            else
            {
                if (Alert_Edit_lb.Visible == false)
                {
                    Completos_Edit_lb.Visible = true;
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2();", true);
                }
            }



        }

        protected void Cancelar_mov_btn_Click(object sender, EventArgs e)
        {
            Nombre_mov_tx.Text = "";
            Descp_tx.Text = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
        }

        protected void Eliminar_Mov_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sql = new SqlCommand("delete Actividades where ID=" + ID_Art_edit_lb.Text, con.GetConnection());
            sql.ExecuteNonQuery();
            con.Close();
            Buscar_mov_btn_Click(sender, e);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal2();", true);
        }
    }
}