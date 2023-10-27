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
    public partial class Movimientos_Stocks : System.Web.UI.Page
    {
        Conectar con = new Conectar();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.CrearConexion();
            if (Session["ListaOps"] == null)
            {
                List<ItemMovimiento> ListaOrden = new List<ItemMovimiento>();
                Session["ListaOps"] = ListaOrden;
            }
        }
        class ItemMovimiento
        {
            public int ID { get; set; }
            public string Nombre { get; set; }
            public string Categoria { get; set; }
            public string Descripcion { get; set; }
            public int Cantidad { get; set; }
        }
        protected void Quitar_Mov_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Art_MOV.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Art_MOV.DataKeys[Lista_Art_MOV.SelectedIndex].Value);
            List<ItemMovimiento> ListaOrden = (List<ItemMovimiento>)Session["ListaOps"];
            ListaOrden.RemoveAt(ListaOrden.FindIndex(item => item.ID == ID));

            Lista_Art_MOV.DataSource = ListaOrden;
            Lista_Art_MOV.DataBind();
        }
        protected void Lista_Movs_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    string Mov = (DataBinder.Eval(e.Row.DataItem, "Movimiento")).ToString();

            //    if (Mov =="Agregar")
            //    {
            //        e.Row.CssClass = "filaAgregarStock";
            //    }
            //    else
            //    {
            //        e.Row.CssClass = "filaReducirStock";
            //    }
            //}
        }

        protected void PopUp_Depos_bt_Click(object sender, EventArgs e)
        {
            Buscar_dep_btn_Click(sender, e);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalDep();", true);
        }

        protected void Select_Dept_btn_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Depositos.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Depositos.DataKeys[Lista_Depositos.SelectedIndex].Value);

            con.Open();
            string qry = "select * from Depositos where ID=" + ID;
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            SqlDataReader Leer = Com.ExecuteReader();
            Leer.Read();
            Deposit_nom_lb.Text = Leer["Nombre"].ToString();
            Deposit_ID_lb.Text = Leer["ID"].ToString();
            Deposit_Ubic_lb.Text = Leer["Ubicacion"].ToString();

            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalDep();", true);


            //todabia no anda esta parte
            //con.Open();
            //int IDact = Lista_Mov.SelectedIndex + 1;
            //SqlCommand chec = new SqlCommand("select* from Actividades where ID= " + IDact, con.GetConnection());
            //SqlDataReader act = chec.ExecuteReader();
            //act.Read();
            //string Actividad = act["Detalle"].ToString();
            //con.Close();
            //if (Actividad == "Retiro")
            //{
            //    Lista_Mov_SelectedIndexChanged(sender, e);
            //    //List<ItemMovimiento> ListaOrden = (List<ItemMovimiento>)Session["ListaOps"];
            //    //if (ListaOrden.Count > 0)
            //    //{
            //    //    ReChequearListaCambios(sender, e);
            //    //    Lista_Art_MOV.DataSource = ListaOrden;
            //    //    Lista_Art_MOV.DataBind();
            //    //    //Page_Load(sender, e);
            //    //    Response.Write("<script>alert('" + Session["ListBorrados"].ToString() + "');</script>");
            //    //}
            //}


            //Para dejar bacio
            //DataTable clrear = new DataTable();
            //Lista_Depositos.DataSource = clrear;
            //Lista_Depositos.DataBind();
        }

        protected void Selecc_Art_bt_Click(object sender, EventArgs e)
        {
            Button IDBtn_ = sender as Button;
            GridViewRow row = (GridViewRow)IDBtn_.NamingContainer;
            int I = row.RowIndex;
            Lista_Articulos.SelectedIndex = I;
            int ID = Convert.ToInt32(Lista_Articulos.DataKeys[Lista_Articulos.SelectedIndex].Value);

            con.Open();
            SqlCommand Com = new SqlCommand("Select A.ID,A.Nombre,C.Nombre_Categoria,A.Descripcion from Articulos A inner join Categorias C on C.ID=A.Categoria where A.ID=" + ID, con.GetConnection());
            SqlDataReader Leer = Com.ExecuteReader();
            Leer.Read();
            ID_Art_sel_lb.Text = Leer["ID"].ToString();
            ID_art_tx.Text = Leer["ID"].ToString();
            Nomb_art_lb.Text = Leer["Nombre"].ToString();
            Cat_art_lb.Text = Leer["Nombre_Categoria"].ToString();
            Desc_art_lb.Text = Leer["Descripcion"].ToString();
            con.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalArt();", true);
        }

        protected void Art_Agregar_btn_Click(object sender, EventArgs e)//cambiarlo para que me valide si puedo quitar la cantidad de articulos que digo, o que me de una alerta de que quedaran con bajo stock
        {
            con.Open();
            int IDact = Lista_Mov.SelectedIndex + 1;
            SqlCommand chec = new SqlCommand("select* from Actividades where ID= " + IDact, con.GetConnection());
            SqlDataReader act = chec.ExecuteReader();
            act.Read();
            string Actividad = act["Detalle"].ToString();
            con.Close();
            try
            {
                if (Actividad == "Retiro")
                {
                    int checkeo = ChequearArt(Convert.ToInt32(ID_Art_sel_lb.Text), Convert.ToInt32(Cantidad_tx.Text));

                    if (checkeo == 0)//quiere decir que la cantidad que quiero quitar es menor a la que hay y si puedo moverlo
                    {
                        List<ItemMovimiento> ListaOrden = (List<ItemMovimiento>)Session["ListaOps"];
                        ListaOrden.Add(new ItemMovimiento { ID = Convert.ToInt32(ID_Art_sel_lb.Text), Nombre = Nomb_art_lb.Text, Categoria = Cat_art_lb.Text, Descripcion = Desc_art_lb.Text, Cantidad = Convert.ToInt32(Cantidad_tx.Text) });
                        Lista_Art_MOV.DataSource = ListaOrden;
                        Lista_Art_MOV.DataBind();

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalSelArt();", true);

                        ID_art_tx.Text = "";
                        Nomb_art_lb.Text = "";
                        Desc_art_lb.Text = "";
                        Cantidad_tx.Text = "";

                        Cat_art_lb.Text = "";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalArt();", true);
                        Cant_alert_lb.Visible = false;
                    }
                    else
                    {
                        //Response.Write("<script>alert('La cantidad que quiere sacar es mayor a la que hay disponible');</script>");
                        Cant_alert_lb.Visible = true;
                    }
                }
                else
                {
                    List<ItemMovimiento> ListaOrden = (List<ItemMovimiento>)Session["ListaOps"];
                    ListaOrden.Add(new ItemMovimiento { ID = Convert.ToInt32(ID_Art_sel_lb.Text), Nombre = Nomb_art_lb.Text, Categoria = Cat_art_lb.Text, Descripcion = Desc_art_lb.Text, Cantidad = Convert.ToInt32(Cantidad_tx.Text) });
                    Lista_Art_MOV.DataSource = ListaOrden;
                    Lista_Art_MOV.DataBind();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalSelArt();", true);

                    ID_art_tx.Text = "";
                    Nomb_art_lb.Text = "";
                    Desc_art_lb.Text = "";
                    Cantidad_tx.Text = "";

                    Cat_art_lb.Text = "";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalArt();", true);
                    Cant_alert_lb.Visible = false;
                }
            }
            catch(Exception ex)
            {
            }
            finally
            {

            }

            //int ID = Convert.ToInt32(Session[""].ToString());
        }
        protected int ChequearArt(int IDArt, int cantidad)
        {
            try
            {
                con.Open();
                SqlCommand sqlCommand = new SqlCommand("select COALESCE(SUM(Stock), 0) AS Stock from Stock_Depo where ID_dep = " + Deposit_ID_lb.Text + " and ID_art= " + IDArt, con.GetConnection());
                SqlDataReader ver = sqlCommand.ExecuteReader();
                ver.Read();
                int Stock = Convert.ToInt32(ver["Stock"]);
                con.Close();
                int resultado = 0;
                if (Stock < cantidad)
                {
                    resultado = 1;
                }
                else
                {
                    resultado = 0;
                }
                return resultado;
            }
            finally
            {

            }
        }
        protected void Art_Cancelar_byn_Click(object sender, EventArgs e)
        {
            ID_art_tx.Text = "";
            Nomb_art_lb.Text = "";
            Desc_art_lb.Text = "";
            Cantidad_tx.Text = "";

            Cat_art_lb.Text = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModalArt();", true);
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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalArt();", true);

        }

        protected void Cargar_Art_btn_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand Com = new SqlCommand("Select A.ID,A.Nombre,C.Nombre_Categoria,A.Descripcion from Articulos A inner join Categorias C on C.ID=A.Categoria where A.ID=" + ID_art_tx.Text, con.GetConnection());
                SqlDataReader Leer = Com.ExecuteReader();
                Leer.Read();
                ID_Art_sel_lb.Text = Leer["ID"].ToString();
                //ID_art_tx.Text = Leer["ID"].ToString();
                Nomb_art_lb.Text = Leer["Nombre"].ToString();
                Cat_art_lb.Text = Leer["Nombre_Categoria"].ToString();
                Desc_art_lb.Text = Leer["Descripcion"].ToString();
                con.Close();
            }
            catch
            {

            }
            finally
            {

            }
        }

        protected void Buscar_dep_btn_Click(object sender, EventArgs e)
        {
            con.Open();
            string qry = "select * from Depositos where Nombre like'%" + Buscador_dep.Text + "%' or ID like '%" + Buscador_dep.Text + "%' ";
            SqlCommand Com = new SqlCommand(qry, con.GetConnection());
            Com.ExecuteNonQuery();
            SqlDataAdapter Depositos = new SqlDataAdapter(Com);
            DataTable dep = new DataTable();
            Depositos.Fill(dep);
            Lista_Depositos.DataSource = dep;
            Lista_Depositos.DataBind();
            con.Close();
        }

        protected void Pop_Art_bt_Click(object sender, EventArgs e)
        {
            if (Deposit_ID_lb.Text != "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalSelArt();", true);
            }
            else
            {
                Response.Write("<script>alert('Por favor, primero seleccione el deposito donde se realizara la operacion para poder validar los datos');</script>");
            }
        }

        protected void Cancelar_Ops_btn_Click(object sender, EventArgs e)
        {
            List<ItemMovimiento> Lista_Art_MOV = (List<ItemMovimiento>)Session["ListaOps"];
            Lista_Art_MOV.Clear();

            Response.Redirect("~/Depositos.aspx");
        }

        protected void Guardar_Ops_btn_Click(object sender, EventArgs e)
        {
            try
            {
                List<ItemMovimiento> Lista_Art_MOV = (List<ItemMovimiento>)Session["ListaOps"];
                foreach (var item in Lista_Art_MOV)
                {

                    int ID = item.ID;
                    int Cant = item.Cantidad;
                    con.Open();
                    SqlCommand sql = new SqlCommand("select * from Stock_Depo where ID_Art= " + ID + " and ID_Dep= " + Deposit_ID_lb.Text, con.GetConnection());
                    SqlDataReader leer = sql.ExecuteReader();

                    if (leer.Read())//quiere decir que si esta ese articulo en el deposito
                    {
                        con.Close();
                        con.Open();
                        int IDact = Lista_Mov.SelectedIndex + 1;
                        SqlCommand chec = new SqlCommand("select* from Actividades where ID= "+IDact, con.GetConnection());
                        SqlDataReader act = chec.ExecuteReader();
                        act.Read();
                        string Actividad = act["Detalle"].ToString();
                        con.Close();
                        con.Open();
                        if (Actividad=="Ingreso")
                        {
                            SqlCommand sql1 = new SqlCommand("update Stock_Depo set Stock=(Stock +" + Cant + ") where ID_art= " + ID + " and ID_dep= " + Deposit_ID_lb.Text, con.GetConnection());
                            sql1.ExecuteNonQuery();
                            SqlCommand sql2 = new SqlCommand("INSERT INTO Mov_Stock (ID_Stock_Depo, Actividad, Cantidad, Fecha_Registro) SELECT SD.ID,"+ (Lista_Mov.SelectedIndex + 1)+"," +Cant+", GETDATE()  FROM Stock_Depo SD WHERE SD.ID_art = "+ID+" AND SD.ID_dep = "+Deposit_ID_lb.Text , con.GetConnection());
                            sql2.ExecuteNonQuery();
                        }
                        else
                        {
                            SqlCommand sql1 = new SqlCommand("update Stock_Depo set Stock=(Stock -" + Cant + ") where ID_art= " + ID + " and ID_dep= " + Deposit_ID_lb.Text, con.GetConnection());
                            sql1.ExecuteNonQuery();
                            SqlCommand sql2 = new SqlCommand("INSERT INTO Mov_Stock (ID_Stock_Depo, Actividad, Cantidad, Fecha_Registro) SELECT SD.ID," + (Lista_Mov.SelectedIndex + 1) + "," + Cant + ", GETDATE()  FROM Stock_Depo SD WHERE SD.ID_art = " + ID + " AND SD.ID_dep = " + Deposit_ID_lb.Text, con.GetConnection());
                            sql2.ExecuteNonQuery();
                        }
                    }
                    else
                    {

                        con.Close();
                        con.Open();
                        SqlCommand sql1 = new SqlCommand("insert into Stock_Depo(ID_art,ID_dep,Stock,Stock_Min) values(" + ID + "," + Deposit_ID_lb.Text + "," + Cant + ",0) ", con.GetConnection());
                        sql1.ExecuteNonQuery();
                        SqlCommand sql2 = new SqlCommand("INSERT INTO Mov_Stock (ID_Stock_Depo, Actividad, Cantidad, Fecha_Registro) SELECT SD.ID," + (Lista_Mov.SelectedIndex + 1) + "," + Cant + ", GETDATE()  FROM Stock_Depo SD WHERE SD.ID_art = " + ID + " AND SD.ID_dep = " + Deposit_ID_lb.Text, con.GetConnection());
                        sql2.ExecuteNonQuery();
                    }
                    con.Close();


                }
                Lista_Art_MOV.Clear();

                Response.Redirect("~/Depositos.aspx");
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Todos los campos deben estar cargados');</script>");
            }
            finally
            {

            }
        }

        protected void Lista_Mov_SelectedIndexChanged(object sender, EventArgs e)//cada que cambie de movimiento
        {
            con.Open();
            int IDact = Lista_Mov.SelectedIndex + 1;
            SqlCommand chec = new SqlCommand("select* from Actividades where ID= " + IDact, con.GetConnection());
            SqlDataReader act = chec.ExecuteReader();
            act.Read();
            string Actividad = act["Detalle"].ToString();
            con.Close();
            if (Actividad == "Retiro")
            {
                ReChequearListaCambios(sender, e);
                List<ItemMovimiento> ListaOrden = (List<ItemMovimiento>)Session["ListaOps"];
                Lista_Art_MOV.DataSource = ListaOrden;
                Lista_Art_MOV.DataBind();
                //Page_Load(sender, e);
                //Response.Write("<script>alert('"+Session["ListBorrados"].ToString()+"');</script>");
            }
        }
        public void ReChequearListaCambios(object sender,EventArgs e)
        {
            List<ItemMovimiento> Lista_Art_MOV = (List<ItemMovimiento>)Session["ListaOps"];
            string Borrados = "Los siguientes articulos fueron sacados de la lista por que su cantidad a mover superaba la cantindad disponible en el deposito con este cambio :";
            for (int i = Lista_Art_MOV.Count - 1; i >= 0; i--)
            {
                var item = Lista_Art_MOV[i];
                int ID = item.ID;
                int Cant = item.Cantidad;
                int Respuesta = ChequearArt(ID, Cant);
                if (Respuesta == 1)
                {
                    Borrados = Borrados + item.Nombre+"; ";
                    Lista_Art_MOV.RemoveAt(i);
                }
            }
            Session["ListBorrados"] = Borrados;
        }

        protected void Buscar_btn_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalArt();", true);
            con.Open();
            string qry = "select A.ID, A.Nombre,C.Nombre_Categoria, A.Descripcion, A.Precio from Articulos A inner join Categorias C on A.Categoria=C.ID where A.ID like '" + ID_art_tx.Text + "' or A.Nombre like '%" + ID_art_tx.Text + "%' or C.Nombre_Categoria like '%" + ID_art_tx.Text + "%' ";
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