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
    public partial class Testeos : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
            
        }

        protected void Image1_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Guardar_Nuevo_Click(object sender, EventArgs e)
        {
            con.Open();
            string qry = "insert into Helados (Sabor, Imagen,Precio,Descripcion) values (@prSabor, @prImagen,@prPrecio,@prDescripcion)";
            SqlCommand Guardar = new SqlCommand(qry, con.GetConnection());
            string nombreArchivo = Imagen_Helado_direc.PostedFile.FileName;
            byte[] direc = System.IO.File.ReadAllBytes("C:/Users/Tomas/OneDrive/Imágenes/Imagenes Heladeria/" + nombreArchivo);
            Guardar.Parameters.Add(new SqlParameter("@prSabor", Sabor_tx.Text));
            Guardar.Parameters.Add(new SqlParameter("@prPrecio", Precio_txt.Text));
            Guardar.Parameters.Add(new SqlParameter("@prDescripcion", Descrip_tx.Text));
            Guardar.Parameters.Add(new SqlParameter("@prImagen", direc));
            Guardar.ExecuteNonQuery();
            con.Close();
        }

        protected void Selecc_Art_bt_Click(object sender, EventArgs e)
        {

        }

        protected void Pop_Art_bt_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalArt();", true);
        }

        protected void Buscar_art_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            string qry = "select A.ID, A.Nombre,C.Nombre_Categoria, A.Descripcion, A.Precio from Articulos A inner join Categorias C on A.Categoria=C.ID where A.ID like '" + Buscador_art.Text + "' or A.Nombre like '%" + Buscador_art.Text + "%' or C.Nombre_Categoria like '%" + Buscador_art.Text + "%' ";
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Articulos = new SqlDataAdapter(Com);
            DataTable art = new DataTable();
            Articulos.Fill(art);
            Lista_Articulos.DataSource = art;
            Lista_Articulos.DataBind();
        }
    }
}