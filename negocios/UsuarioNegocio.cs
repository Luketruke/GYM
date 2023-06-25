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
    }
}
