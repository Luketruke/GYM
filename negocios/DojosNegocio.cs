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
        public List<Dojo> obtenerDojosTodos() //Para llenar los DataGridView
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                List<Dojo> lista = new List<Dojo>();
                conexion.setearProcedure("ObtenerDojosTodos");
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Dojo d = new Dojo();

                    d.Id = (int)conexion.Lector["IdDojo"];
                    d.Codigo = (int)conexion.Lector["Codigo"];
                    d.Nombre = (string)conexion.Lector["NombreDojo"];
                    d.NombreProfesor = (string)conexion.Lector["NombreProfesor"];
                    d.TelefonoProfesor = (string)conexion.Lector["TelefonoProfesor"];
                    d.TelefonoDojo = (string)conexion.Lector["TelefonoDojo"];
                    d.Observaciones = (string)conexion.Lector["Observaciones"];

                    d.Direccion = new Direccion();
                    d.Direccion.DireccionDojo = (string)conexion.Lector["Direccion"];
                    d.Direccion.DireccionCompleta = (string)conexion.Lector["DireccionCompleta"];
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
                return null;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public DataTable obtenerDojos() //Para llenar los DropDownList de Dojos
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("ObtenerDojos");
                dt.Load(conexion.ejecutarConexion());

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }

        public DataTable obtenerDojosXId(int IdDojo) //Para llenar los DropDownList de Dojos x Profesor
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("obtenerDojosXId");
                conexion.setearParametro("@IdDojo", IdDojo);
                dt.Load(conexion.ejecutarConexion());

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                conexion.cerrarConexion();
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
                conexion.setearParametro("@Profesor", d.NombreProfesor);
                conexion.setearParametro("@TelefonoProfesor", d.TelefonoProfesor);
                conexion.setearParametro("@TelefonoDojo", d.TelefonoDojo);
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
                conexion.setearParametro("@TelefonoProfesor", d.TelefonoProfesor);
                conexion.setearParametro("@TelefonoDojo", d.TelefonoDojo);
                conexion.setearParametro("@Profesor", d.NombreProfesor);
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
        public DataTable obtenerProvincias() //Para llenar los DropDownList de Provincias
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("ObtenerProvincias");
                dt.Load(conexion.ejecutarConexion());

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public DataTable obtenerLocalidades(int IdProvincia) //Para llenar los DropDownList de Localidades X Provincia
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("ObtenerLocalidadesXProvincia");
                conexion.setearParametro("@IdProvincia", IdProvincia);
                dt.Load(conexion.ejecutarConexion());

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public DataTable obtenerLocalidades() //Para llenar los DropDownList de Localidades
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("ObtenerLocalidades");
                dt.Load(conexion.ejecutarConexion());

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public Dojo obtenerDojoPorId(int IdDojo) //Para llenar Modal del Dojo
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("ObtenerDojoPorId");
                conexion.setearParametro("@IdDojo", IdDojo);
                dt.Load(conexion.ejecutarConexion());

                Dojo d = new Dojo();

                d.Id = Convert.ToInt32(dt.Rows[0]["IdDojo"]);
                d.Codigo = Convert.ToInt32(dt.Rows[0]["Codigo"]);
                d.Nombre = dt.Rows[0]["Nombre"].ToString();
                d.NombreProfesor = dt.Rows[0]["Profesor"].ToString();
                d.TelefonoProfesor = dt.Rows[0]["TelefonoDojo"].ToString();
                d.TelefonoDojo = dt.Rows[0]["TelefonoProfesor"].ToString();
                d.Observaciones = dt.Rows[0]["Observaciones"].ToString();

                d.Direccion = new Direccion();
                d.Direccion.DireccionDojo = dt.Rows[0]["Direccion"].ToString();
                d.Direccion.DireccionCompleta = dt.Rows[0]["DireccionCompleta"].ToString();
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
