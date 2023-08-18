using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Net;

namespace Sistema_Heladeria
{

    public class Clases
    {
    }
    public class Helado
    {
        // Propiedades de la clase
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Sabor { get; set; }
        public double Precio { get; set; }

        // Propiedad para la conexión a la base de datos
        private SqlConnection con { get; set; }

        // Constructor que recibe la conexión a la base de datos
        public Helado(SqlConnection conexion)
        {
            SqlConnection con = conexion;
        }

        // Método para insertar un helado en la base de datos
        public void InsertarHelado()
        {
            // Aquí puedes implementar la lógica para insertar un helado en la base de datos
            // Usar la propiedad 'Conexion' para ejecutar comandos SQL
        }

        // Otros métodos relacionados con operaciones de helados
    }
    public class ArticuloCompra
    {
        public int Id { get; set; }
        public int Cantidad { get; set; }

        public ArticuloCompra(int id, int cantidad)
        {
            Id = id;
            Cantidad = cantidad;
        }
    }
}