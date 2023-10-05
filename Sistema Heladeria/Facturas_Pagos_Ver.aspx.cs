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
    public partial class Facturas_Pagos_Ver : System.Web.UI.Page
    {
        Conectar con= new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
        }

        protected void Buscar_Pago_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            string comando = "select RP.ID,P.NombreCompleto,Numero_Cuenta,Fecha_Pago,MetodoPago,RP.Total  from Registro_Pagos RP left join Proveedores P on P.ID=RP.ID_Prov where RP.ID like '" + Buscador_Pago_tx.Text+"' or P.NombreCompleto like '%"+Buscador_Pago_tx.Text+"%'";

            if (!string.IsNullOrWhiteSpace(Precio_min_tx.Text))//quiere decir que si selecciono algo 
            {
                comando = comando + " and RP.Total>=" + Precio_min_tx.Text + " ";
            }
            if (!string.IsNullOrWhiteSpace(Precio_Max_tx.Text))
            {
                comando = comando + " and RP.Total<=" + Precio_Max_tx.Text + " ";
            }
            if (!string.IsNullOrWhiteSpace(Fecha_min_tx.Text))
            {
                comando = comando + " and Fecha_Pago>='" + Fecha_min_tx.Text + "' ";
            }
            if (!string.IsNullOrWhiteSpace(Fecha_Max_tx.Text))
            {
                comando = comando + " and Fecha_Pago<='" + Fecha_Max_tx.Text + "' ";
            }
            //if (Prov_select_lt.SelectedValue != "0")
            //{
            //    comando = comando + " and ID_prov=" + Prov_select_lt.SelectedValue + " ";
            //}
            SqlCommand Com = new SqlCommand(comando, con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Proveedores = new SqlDataAdapter(Com);
            DataTable prov = new DataTable();
            Proveedores.Fill(prov);
            Lista_Pagos.DataSource = prov;
            Lista_Pagos.DataBind();
            con.Close();
        }

        protected void Realizar_Pago_btn_Click(object sender, EventArgs e)
        {

        }

        protected void Lipiar_Filt_btn_Click(object sender, EventArgs e)
        {

        }
    }
}