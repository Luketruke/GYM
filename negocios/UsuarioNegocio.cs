using dominios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocios
{
    public class UsuarioNegocio
    {
        public bool Loguear(Usuario user)
        {
            ConexionSQL datos = new ConexionSQL();
            try
            {
                datos.setearQuery("SELECT Id FROM Usuarios WHERE Usuario = @user AND Contrasenia = @pass");
                datos.setearParametro("@user", user.User);
                datos.setearParametro("@pass", user.Contrasenia);
                datos.ejecutarConexion();
                while (datos.Lector.Read())
                {
                    user.Id = (int)datos.Lector["Id"];
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
