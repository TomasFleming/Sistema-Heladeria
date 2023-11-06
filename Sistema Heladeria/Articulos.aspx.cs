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
    public partial class Insertar_y_mostrar : System.Web.UI.Page
    {
        Conectar con = new Conectar();

        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();

        }

        protected void Agregar_Art_btn_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);

            
        }

        protected void Buscar_art_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            string qry = "select A.ID, A.Nombre,C.Nombre_Categoria, A.Descripcion, A.Precio from Articulos A inner join Categorias C on A.Categoria=C.ID where A.ID like '"+Buscador_art.Text+ "' or A.Nombre like '%" + Buscador_art.Text + "%' or C.Nombre_Categoria like '%" + Buscador_art.Text + "%' ";
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Articulos = new SqlDataAdapter(Com);
            DataTable art = new DataTable();
            Articulos.Fill(art);
            Lista_Articulos.DataSource = art;
            Lista_Articulos.DataBind();
        }

        protected void Art_camb_btn_Click(object sender, EventArgs e)//este los guarda por primera vez
        {
            con.Open();
            SqlCommand check = new SqlCommand("select * from Articulos where Nombre='"+Nomb_tx.Text+"'", con.GetConnection());
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
            if (Nomb_tx.Text != "" && Precio_tx.Text != "" && Descrip_tx.Text != "" && Alert_lb.Visible==false)
            {
                con.Open();
                SqlCommand sql = new SqlCommand("insert into Articulos(Nombre,Categoria,Precio,Descripcion) values (@prNombre,@prCat,@prPrecio,@prDesc)", con.GetConnection());
                sql.Parameters.Add(new SqlParameter("@prNombre", Nomb_tx.Text));
                sql.Parameters.Add(new SqlParameter("@prCat", Categorias_list.SelectedValue));
                sql.Parameters.Add(new SqlParameter("@prPrecio", Precio_tx.Text));
                sql.Parameters.Add(new SqlParameter("@prDesc", Descrip_tx.Text));
                sql.ExecuteNonQuery();
                con.Close();
                Nomb_tx.Text = "";
                Precio_tx.Text = "";
                Descrip_tx.Text = "";
                Categorias_list.SelectedValue = "1";
                Completos_lb.Visible = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
                Buscar_art_btn_Click(sender, e);
            }
            else
            {
                if (Alert_lb.Visible == false)
                {
                    Completos_lb.Visible = true;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
            }
            
        }
        protected void Editar_art_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Articulos.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Articulos.DataKeys[Lista_Articulos.SelectedIndex].Value);

            con.Open();
            SqlCommand sql = new SqlCommand("select * from Articulos where ID= "+ID,con.GetConnection());
            SqlDataReader leer = sql.ExecuteReader();
            leer.Read();
            ID_Art_edit_lb.Text = leer["ID"].ToString();
            Nomb_Edit_tx.Text = leer["Nombre"].ToString();
            Descript_Edit_tx.Text = leer["Descripcion"].ToString();
            Precio_Edit_tx.Text = leer["Precio"].ToString();
            Categoria_Edit_tx.SelectedValue = leer["Categoria"].ToString();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2();", true);
        }

        protected void Guardar_Camb_bt_Click(object sender, EventArgs e)//este edita al articulo
        {
            con.Open();
            SqlCommand check = new SqlCommand("select * from Articulos where Nombre='" + Nomb_Edit_tx.Text + "' and ID!="+ ID_Art_edit_lb.Text, con.GetConnection());
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
            if (Nomb_Edit_tx.Text != "" && Precio_Edit_tx.Text != "" && Descript_Edit_tx.Text != "" && Alert_Edit_lb.Visible == false)
            {
                con.Open();
                SqlCommand sql = new SqlCommand("update Articulos set Nombre='" + Nomb_Edit_tx.Text + "',Categoria=" + Categoria_Edit_tx.SelectedValue + ",Descripcion='" + Descript_Edit_tx.Text + "',Precio='" + Precio_Edit_tx.Text + "' where ID= " + ID_Art_edit_lb.Text + " ", con.GetConnection());
                sql.ExecuteNonQuery();
                con.Close();
                Completos_Edit_lb.Visible = false;
                Alert_Edit_lb.Visible = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal2();", true);
                Buscar_art_btn_Click(sender, e);
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

        protected void Eliminar_Art_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sql = new SqlCommand("delete Articulos where ID= "+ID_Art_edit_lb.Text, con.GetConnection());
            sql.ExecuteNonQuery();
            con.Close();
            Completos_Edit_lb.Visible = false;
            Alert_Edit_lb.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal2();", true);
            Buscar_art_btn_Click(sender, e);
        }

        protected void Cancelar_art_btn_Click(object sender, EventArgs e)
        {
            Nomb_tx.Text = "";
            Descrip_tx.Text = "";
            Precio_tx.Text = "";
            Descrip_tx.Text = "";
            Categorias_list.SelectedValue = "1";
            Completos_lb.Visible = false;
            Alert_lb.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
        }
    }
}