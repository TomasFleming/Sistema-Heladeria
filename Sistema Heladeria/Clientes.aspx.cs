﻿using System;
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
    public partial class Clientes : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
        }

        protected void Buscar_client_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            string qry = "select * from Clientes where ID like '%" + Buscador_client.Text + "%' ";
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Articulos = new SqlDataAdapter(Com);
            DataTable art = new DataTable();
            Articulos.Fill(art);
            Lista_Clientes.DataSource = art;
            Lista_Clientes.DataBind();
        }

        protected void Agregar_Client_btn_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }

        protected void Editar_client_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Clientes.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Clientes.DataKeys[Lista_Clientes.SelectedIndex].Value);

            con.Open();
            SqlCommand sql = new SqlCommand("select * from Clientes where ID= " + ID, con.GetConnection());
            SqlDataReader leer = sql.ExecuteReader();
            leer.Read();
            ID_Art_edit_lb.Text = leer["ID"].ToString();
            Nomb_Edit_tx.Text = leer["NombreCompleto"].ToString();
            Telf_Edit_tx.Text = leer["Telefono"].ToString();
            Doc_Edit_tx.Text = leer["DNI"].ToString();
            Correo_Edit_tx.Text = leer["Correo"].ToString();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2();", true);
        }

        protected void Cliente_guard_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sql = new SqlCommand("insert into Clientes(NombreCompleto,Telefono,DNI,Correo) values (@prNombre,@prTelf,@prDNI,@prCorreo)", con.GetConnection());
            sql.Parameters.Add(new SqlParameter("@prNombre", Nombre_tx.Text));
            sql.Parameters.Add(new SqlParameter("@prTelf", Telefono_tx.Text));
            sql.Parameters.Add(new SqlParameter("@prDNI", Doc_tx.Text));
            sql.Parameters.Add(new SqlParameter("@prCorreo", Mail_tx.Text));
            sql.ExecuteNonQuery();
            con.Close();
            Nombre_tx.Text = "";
            Telefono_tx.Text = "";
            Doc_tx.Text = "";
            Mail_tx.Text = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
        }

        protected void Cancelar_client_btn_Click(object sender, EventArgs e)
        {
            Nombre_tx.Text = "";
            Telefono_tx.Text = "";
            Doc_tx.Text = "";
            Mail_tx.Text = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
        }

        protected void Guardar_Camb_bt_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sql = new SqlCommand("update Clientes set NombreCompleto='" + Nomb_Edit_tx.Text + "', DNI="+Doc_Edit_tx.Text+", Telefono="+Telf_Edit_tx.Text+", Correo='"+Correo_Edit_tx.Text+"' where ID="+ID_Art_edit_lb.Text, con.GetConnection());
            sql.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal2();", true);
        }

        protected void Eliminar_Client_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sql = new SqlCommand("delete Clientes where ID= " + ID_Art_edit_lb.Text, con.GetConnection());
            sql.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal2();", true);
        }
    }
}