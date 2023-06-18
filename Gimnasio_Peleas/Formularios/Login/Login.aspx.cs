using dominios;
using negocios;
using System;
using System.Web.UI;

namespace Gimnasio_Peleas
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Request.QueryString["a"]) == 3) //Cerrar sesion
            {
                Session.Clear();
                Response.Redirect("Login.aspx");
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Usuario user;
            UsuarioNegocio negocio = new UsuarioNegocio();
            try
            {
                user = new Usuario(txtUser.Text, txtPassword.Text);
                if (negocio.Loguear(user))
                {
                    Session.Add("Usuario", user);
                    Response.Redirect("../../Default.aspx", false);
                }
                else
                {
                    Response.Redirect("Login.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }
    }
}