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
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2();", true);
        }

        protected void Guardar_Mov_bt_Click(object sender, EventArgs e)//guarda primera vez
        {
            con.Open();
            SqlCommand sql = new SqlCommand("insert into Actividades(Nombre,Descripcion,Detalle) values ('" + Nombre_mov_tx.Text + "','" + Descp_tx.Text + "','" + Detalle_tx.Text + "')", con.GetConnection());
            sql.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);

        }

        protected void Mov_guard_btn_Click(object sender, EventArgs e)//edita 
        {

            con.Open();
            SqlCommand sql = new SqlCommand("update Actividades set Nombre='" + Nomb_Edit_tx.Text + "', Descripcion='" + Descript_Edit_tx.Text + "',Detalle='" + Desc_Edit_tx.Text + "' where ID=" + ID_Art_edit_lb.Text, con.GetConnection());
            sql.ExecuteNonQuery();
            con.Close();
            Buscar_mov_btn_Click(sender, e);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal2();", true);
            

        }

        protected void Cancelar_mov_btn_Click(object sender, EventArgs e)
        {

        }

        protected void Eliminar_Mov_btn_Click(object sender, EventArgs e)
        {

        }
    }
}