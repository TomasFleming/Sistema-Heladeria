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
    public partial class Facturas_Ver : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
        }

        protected void Ver_Detalle_btn_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_facturas.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_facturas.DataKeys[Lista_facturas.SelectedIndex].Value);
            ID_Ord_lb.Text = ID.ToString();
            con.Open();
            SqlCommand detalle = new SqlCommand("select A.ID,A.Nombre,A.Descripcion,C.Nombre_Categoria,DFP.Cant_fact,DFP.Precio_Unit  from Detalle_Fact_Prov DFP inner join Articulos A on A.ID=DFP.ID_Art inner join Categorias C on C.ID=A.Categoria  where DFP.ID_fact= " + ID + "", con.GetConnection());
            detalle.ExecuteNonQuery();

            SqlDataAdapter Depositos = new SqlDataAdapter(detalle);
            DataTable det = new DataTable();
            Depositos.Fill(det);
            Lista_Detalle.DataSource = det;
            Lista_Detalle.DataBind();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }
        protected void Buscar_fact_btn_Click(object sender, EventArgs e)
        {
            //con.Open();
            //string comando = "select * from Facturas_Proveedor FP left join Factura_Prov_Pagada Fpp on FP.ID=Fpp.ID_fact inner join Proveedores P on P.ID=Fp.ID_prov where FP.ID like '" + Buscador_Fact_tx.Text + "'  or P.NombreCompleto like '%" + Buscador_Fact_tx.Text + "%'";
            //SqlCommand Com = new SqlCommand(comando, con.GetConnection());
            //Com.ExecuteNonQuery();
            //SqlDataAdapter Proveedores = new SqlDataAdapter(Com);
            //DataTable prov = new DataTable();
            //Proveedores.Fill(prov);
            //Lista_facturas.DataSource = prov;
            //Lista_facturas.DataBind();
            //con.Close();
            con.Open();
            string comando = "select * from Facturas_Proveedor FP left join Detalle_Pago Fpp on FP.ID=Fpp.ID_fact inner join Proveedores P on P.ID=Fp.ID_prov  where FP.ID ";//and Total>=@prTotMin and Total<=@prTotMax and Fecha_Emision>=@prFechaInicio and Fecha_Emision<=@prFechaFin and ID_prov=@prProveedor";
            if (!string.IsNullOrWhiteSpace(Buscador_Fact_tx.Text))
            {
                comando = comando + "= " + Buscador_Fact_tx.Text + " ";
                
            }
            else
            {
                comando = comando + "like '%" + Buscador_Fact_tx.Text + "%'";
            }
            if (!string.IsNullOrWhiteSpace(Precio_min_tx.Text))//quiere decir que si selecciono algo 
            {
                comando = comando + " and Total>=" + Precio_min_tx.Text + " ";
            }
            if (!string.IsNullOrWhiteSpace(Precio_Max_tx.Text))
            {
                comando = comando + " and Total<=" + Precio_Max_tx.Text + " ";
            }
            if (!string.IsNullOrWhiteSpace(Fecha_min_tx.Text))
            {
                comando = comando + " and Fecha_Emision>='" + Fecha_min_tx.Text + "' ";
            }
            if (!string.IsNullOrWhiteSpace(Fecha_Max_tx.Text))
            {
                comando = comando + " and Fecha_Emision<='" + Fecha_Max_tx.Text + "' ";
            }
            if (!string.IsNullOrWhiteSpace(Prov_Filt_tx.Text))
            {
                comando = comando + " and P.NombreCompleto='" + Prov_Filt_tx.Text + "' ";
            }
            SqlCommand Com = new SqlCommand(comando, con.GetConnection());

            //Com.Parameters.Add(new SqlParameter("@prTotMax", Precio_Max_tx.Text));
            //Com.Parameters.Add(new SqlParameter("@prFechaInicio", Fecha_min_tx.Text));
            //Com.Parameters.Add(new SqlParameter("@prFechaFin", Fecha_Max_tx.Text));
            //Com.Parameters.Add(new SqlParameter("@prProveedor", (Prov_select_lt.SelectedValue)));
            Com.ExecuteNonQuery();
            SqlDataAdapter Proveedores = new SqlDataAdapter(Com);
            DataTable prov = new DataTable();
            Proveedores.Fill(prov);
            Lista_facturas.DataSource = prov;
            Lista_facturas.DataBind();
            con.Close();
        }

        protected void Crear_fact_btn_Click(object sender, EventArgs e)
        {

        }

        protected void Lipiar_Filt_btn_Click(object sender, EventArgs e)
        {
            Fecha_min_tx.Text = "";
            Fecha_Max_tx.Text = "";
            Precio_min_tx.Text = "";
            Precio_Max_tx.Text = "";
            Prov_Filt_tx.Text = "";
        }

        protected void Filtrar_btn_Click(object sender, EventArgs e)
        {
            //con.Open();
            //string comando = "select * from Facturas_Proveedor FP left join Factura_Prov_Pagada Fpp on FP.ID=Fpp.ID_fact inner join Proveedores P on P.ID=Fp.ID_prov where FP.ID like '" + Buscador_Fact_tx.Text + "'  or P.NombreCompleto like '%" + Buscador_Fact_tx.Text + "%' ";//and Total>=@prTotMin and Total<=@prTotMax and Fecha_Emision>=@prFechaInicio and Fecha_Emision<=@prFechaFin and ID_prov=@prProveedor";
            
            //if (!string.IsNullOrWhiteSpace(Precio_min_tx.Text))//quiere decir que si selecciono algo 
            //{
            //    comando = comando + " and Total>="+Precio_min_tx.Text+" ";
            //}
            //if (!string.IsNullOrWhiteSpace(Precio_Max_tx.Text))
            //{
            //    comando = comando + " and Total<=" + Precio_Max_tx.Text + " ";
            //}
            //if (!string.IsNullOrWhiteSpace(Fecha_min_tx.Text))
            //{
            //    comando = comando + " and Fecha_Emision>='" + Fecha_min_tx.Text + "' ";
            //}
            //if (!string.IsNullOrWhiteSpace(Fecha_Max_tx.Text))
            //{
            //    comando = comando + " and Fecha_Emision<='" + Fecha_Max_tx.Text + "' ";
            //}
            //if (Prov_select_lt.SelectedValue!="0")
            //{
            //    comando = comando + " and ID_prov=" + Prov_select_lt.SelectedValue + " ";
            //}
            //SqlCommand Com = new SqlCommand(comando, con.GetConnection());

            ////Com.Parameters.Add(new SqlParameter("@prTotMax", Precio_Max_tx.Text));
            ////Com.Parameters.Add(new SqlParameter("@prFechaInicio", Fecha_min_tx.Text));
            ////Com.Parameters.Add(new SqlParameter("@prFechaFin", Fecha_Max_tx.Text));
            ////Com.Parameters.Add(new SqlParameter("@prProveedor", (Prov_select_lt.SelectedValue)));
            //Com.ExecuteNonQuery();
            //SqlDataAdapter Proveedores = new SqlDataAdapter(Com);
            //DataTable prov = new DataTable();
            //Proveedores.Fill(prov);
            //Lista_facturas.DataSource = prov;
            //Lista_facturas.DataBind();
            //con.Close();
        }

        protected void Popup_Prov_bt_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalProv();", true);
        }

        protected void Selecc_Prov_btn_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Proveedores.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Proveedores.DataKeys[Lista_Proveedores.SelectedIndex].Value);

            con.Open();
            string qry = "select * from Proveedores where ID=" + ID;
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            SqlDataReader Leer = Com.ExecuteReader();
            Leer.Read();
            Prov_Filt_tx.Text = Leer["NombreCompleto"].ToString();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalProv();", true);
            //Para dejar bacio
            DataTable clrear = new DataTable();
            Lista_Proveedores.DataSource = clrear;
            Lista_Proveedores.DataBind();
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
    }
}