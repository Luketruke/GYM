using System;
using System.Data.SqlClient;

namespace negocios
{
    public class ConexionSQL
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private SqlDataReader lector;
        public ConexionSQL()
        {
            try
            {
                comando = new SqlCommand();
                //conexion = new SqlConnection("server=localhost; database=Gimnasio; integrated security=true;"); //Local
                conexion = new SqlConnection("server=WIN-K3KHU78QKDH; database=Gimnasio_Unlimited; integrated security=true;"); //Servidor        
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void setearProcedure(string procedure)
        {
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.CommandText = procedure;
        }
        public void setearQuery(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }
        public void cerrarConexion()
        {
            if (lector != null)
                lector.Close();
            conexion.Close();
        }
        public SqlDataReader ejecutarConexion()
        {
            try
            {
                comando.Connection = conexion;
                conexion.Open();
                lector = comando.ExecuteReader();
                return lector;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public SqlCommand ejecutarComando()
        {
            try
            {
                comando.Connection = conexion;
                conexion.Open();
                lector = comando.ExecuteReader();
                return comando;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public int ejecutarScalar()
        {
            try
            {
                comando.Connection = conexion;
                conexion.Open();
                int id = (int)comando.ExecuteScalar();
                return id;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void setearParametro(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }
        public void setearParametroOutput(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }
        public SqlDataReader Lector { get { return lector; } }
    }
}