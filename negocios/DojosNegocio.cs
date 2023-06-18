using dominios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocios
{
    public class DojosNegocio
    {
        public List<Dojo> obtenerDojosTodos() //Para llenar las tables
        {
            List<Dojo> lista = new List<Dojo>();
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ObtenerDojosTodos");
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Dojo d = new Dojo();

                    d.Id = (int)conexion.Lector["IdDojo"];
                    d.Codigo = (int)conexion.Lector["Codigo"];
                    d.Nombre = (string)conexion.Lector["NombreDojo"];
                    d.Observaciones = (string)conexion.Lector["Observaciones"];

                    d.Direccion = new Direccion();
                    d.Direccion.DireccionDojo = (string)conexion.Lector["Direccion"];
                    d.Direccion.Localidad = (string)conexion.Lector["Localidad"];
                    d.Direccion.IdLocalidad = (int)conexion.Lector["IdLocalidad"];
                    d.Direccion.Provincia = (string)conexion.Lector["Provincia"];
                    d.Direccion.IdProvincia = (int)conexion.Lector["IdProvincia"];

                    lista.Add(d);
                }
                return lista;
            }
            catch (Exception ex)
            {
                lista = null;
                return lista;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }

        public DataTable obtenerDojos() //Para llenar los DropDownList
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                {
                    conexion.setearProcedure("ObtenerDojosTodos");
                    dt.Load(conexion.ejecutarConexion());
                }
                return dt;
            }
            catch (Exception ex)
            {
                dt = null;
                return dt;
            }
        }
        public bool agregarDojo(Dojo d)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarDojo");
                conexion.setearParametro("@CodigoDojo", 0);
                conexion.setearParametro("@Nombre", d.Nombre);
                conexion.setearParametro("@Direccion", d.Direccion.DireccionDojo);
                conexion.setearParametro("@Provincia", d.Direccion.Provincia);
                conexion.setearParametro("@Localidad", d.Direccion.Localidad);        
                conexion.setearParametro("@Observaciones", d.Observaciones);

                conexion.ejecutarConexion();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public bool modificarDojo(Dojo d)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ModificarDojo");
                conexion.setearParametro("@Id", d.Id);
                conexion.setearParametro("@Nombre", d.Nombre);
                conexion.setearParametro("@Direccion", d.Direccion.DireccionDojo);
                conexion.setearParametro("@Provincia", d.Direccion.IdProvincia);
                conexion.setearParametro("@Localidad", d.Direccion.IdLocalidad);
                conexion.setearParametro("@Observaciones", d.Observaciones);

                conexion.ejecutarConexion();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public bool eliminarDojo(int IdDojo)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("EliminarDojo");
                conexion.setearParametro("@IdDojo", IdDojo);

                conexion.ejecutarConexion();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public DataTable obtenerProvincias()
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                {
                    conexion.setearProcedure("ObtenerProvincias");
                    dt.Load(conexion.ejecutarConexion());
                }
                return dt;
            }
            catch (Exception ex)
            {
                dt = null;
                return dt;
            }
        }
        public DataTable obtenerLocalidades(int IdProvincia)
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                {
                    conexion.setearProcedure("ObtenerLocalidadesXProvincia");
                    conexion.setearParametro("@IdProvincia", IdProvincia);
                    dt.Load(conexion.ejecutarConexion());
                }
                return dt;
            }
            catch (Exception ex)
            {
                dt = null;
                return dt;
            }
        }
        public DataTable obtenerLocalidades()
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                {
                    conexion.setearProcedure("ObtenerLocalidades");
                    dt.Load(conexion.ejecutarConexion());
                }
                return dt;
            }
            catch (Exception ex)
            {
                dt = null;
                return dt;
            }
        }
        public Dojo obtenerDojoPorId(int IdDojo)
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                conexion.setearProcedure("ObtenerDojoPorId");
                conexion.setearParametro("@IdDojo", IdDojo);
                dt.Load(conexion.ejecutarConexion());

                Dojo d = new Dojo();

                d.Id = Convert.ToInt32(dt.Rows[0]["IdDojo"]);
                d.Codigo = Convert.ToInt32(dt.Rows[0]["Codigo"]);
                d.Nombre = dt.Rows[0]["Nombre"].ToString();
                d.Observaciones = dt.Rows[0]["Observaciones"].ToString();

                d.Direccion = new Direccion();
                d.Direccion.DireccionDojo = dt.Rows[0]["Direccion"].ToString();
                d.Direccion.Localidad = dt.Rows[0]["Localidad"].ToString();
                d.Direccion.IdLocalidad = Convert.ToInt32(dt.Rows[0]["IdLocalidad"]);
                d.Direccion.Provincia = dt.Rows[0]["Provincia"].ToString();
                d.Direccion.IdProvincia = Convert.ToInt32(dt.Rows[0]["IdProvincia"]);

                return d;
            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
    }
}
