using dominios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocios
{
    public class UsuarioNegocio
    {
        public Usuario Loguear(Usuario user)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("LoguearUsuario");
                conexion.setearParametro("@user", user.User);
                conexion.setearParametro("@pass", user.Contrasenia);
                dt.Load(conexion.ejecutarConexion());

                user.Id = Convert.ToInt32(dt.Rows[0]["Id"]);
                user.Codigo = Convert.ToInt32(dt.Rows[0]["Codigo"]);
                user.User = dt.Rows[0]["Usuario"].ToString();
                user.Contrasenia = dt.Rows[0]["Contrasenia"].ToString();

                user.TipoUsuario = new TipoUsuario();
                user.TipoUsuario.Id = Convert.ToInt32(dt.Rows[0]["IdTipoUsuario"]);
                user.TipoUsuario.Descripcion = dt.Rows[0]["TipoUsuario"].ToString();

                user.Dojo = new Dojo();
                user.Dojo.Id = Convert.ToInt32(dt.Rows[0]["IdDojo"]);
                user.Dojo.Nombre = dt.Rows[0]["NombreDojo"].ToString();

                return user;
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
        public List<Usuario> obtenerUsuariosTodos() //Para llenar los DataGridView
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                List<Usuario> lista = new List<Usuario>();
                conexion.setearProcedure("ObtenerUsuariosTodos");
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Usuario u = new Usuario();

                    u.Id = (int)conexion.Lector["Id"];
                    u.Codigo = (int)conexion.Lector["Codigo"];
                    u.User = (string)conexion.Lector["Usuario"];
                    u.Contrasenia = (string)conexion.Lector["Contrasenia"];

                    u.TipoUsuario = new TipoUsuario();
                    u.TipoUsuario.Id = (int)conexion.Lector["IdTipoUsuario"];
                    u.TipoUsuario.Descripcion = (string)conexion.Lector["TipoUsuario"];

                    u.Dojo = new Dojo();
                    u.Dojo.Id = (int)conexion.Lector["IdDojo"];
                    u.Dojo.Nombre = (string)conexion.Lector["Dojo"];

                    lista.Add(u);
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
        public DataTable obtenerTiposUsuario() //Para llenar los DropDownList de Tipos de Usuario
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                DataTable dt = new DataTable();
                conexion.setearProcedure("ObtenerTiposUsuario");
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
        public bool agregarUsuario(Usuario u)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarUsuario");
                conexion.setearParametro("@Codigo", 0);
                conexion.setearParametro("@Usuario", u.User);
                conexion.setearParametro("@Contrasenia", u.Contrasenia);
                conexion.setearParametro("@IdTipoUsuario", u.TipoUsuario.Id);
                conexion.setearParametro("@IdDojo", u.Dojo.Id);
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
        public bool modificarUsuario(Usuario u)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ModificarUsuario");
                conexion.setearParametro("@Id", u.Id);
                conexion.setearParametro("@Usuario", u.User);
                conexion.setearParametro("@Contrasenia", u.Contrasenia);
                conexion.setearParametro("@IdTipoUsuario", u.TipoUsuario.Id);
                conexion.setearParametro("@IdDojo", u.Dojo.Id);
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
        public bool eliminarUsuario(int IdUsuario)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("EliminarUsuario");
                conexion.setearParametro("@IdUsuario", IdUsuario);
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
    }
}
