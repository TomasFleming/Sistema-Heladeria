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
    public class Parabdd
    {
    }
    class Conectar
    {
        SqlConnection con;


        //public void Open()
        //{
        //    string nomb_serv = Dns.GetHostName();
        //    Sqlcon = new SqlConnection("Data Source=" + nomb_serv + "\\Local;Initial Catalog=Heladeria Sistemas 3;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        //}
        public void CrearConexion()
        {
            
            SqlConnectionStringBuilder cs = new SqlConnectionStringBuilder();

            cs.DataSource = @"DESKTOP-EFUNQE434";
            cs.InitialCatalog = "Heladeria Sistemas 3";
            cs.UserID = "Visual";
            cs.Password = "123456";
            string ad = "prueba";
           
            con = new SqlConnection(cs.ConnectionString);
        }
        public void Close()
        {
            con.Close();
        }
        public void Open()
        {
            con.Open();
        }
        public string Cadena()
        {
            return con.ConnectionString;
        }
        public SqlConnection GetConnection()
        {
            return con;
        }

        public void Dispose()
        {
            con.Dispose();
        }
    }
    class NuevoArticulo
    {

    }
}