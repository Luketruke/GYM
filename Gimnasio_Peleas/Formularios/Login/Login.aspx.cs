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
            try
            {
                if (Convert.ToInt32(Request.QueryString["a"]) == 3) //Cerrar sesion
                {
                    Session.Clear();
                    Response.Redirect("Login.aspx");
                }

                //Mostrar alertas login
                if (Convert.ToBoolean(Session["PasswordIncorrecta"]) == true)
                {
                    AlertaPasswordIncorrecta.Visible = true;
                    Session["PasswordIncorrecta"] = null;
                }

                if (Convert.ToBoolean(Session["UsuarioIncorrecto"]) == true)
                {
                    AlertaUserIncorrecto.Visible = true;
                    Session["UsuarioIncorrecto"] = null;
                }

                MaintainScrollPositionOnPostBack = true; //La pagina scrollea a donde estaba luego de un postback
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario user;
                UsuarioNegocio un = new UsuarioNegocio();
                user = new Usuario(txtUsername.Text, txtPassword.Text);
                if (un.VerificarUsuario(txtUsername.Text))
                {
                    if (un.Loguear(user) != null)
                    {
                        Session.Add("Usuario", user);
                        Session.Add("IdTipoUsuario", user.TipoUsuario.Id);
                        Response.Redirect("../../Default.aspx", false);
                    }
                    else
                    {
                        //Password incorrecta
                        Session.Add("PasswordIncorrecta", true);
                        Response.Redirect("Login.aspx", false);
                    }
                }
                else
                {
                    //Usuario incorrecto
                    Session.Add("UsuarioIncorrecto", true);
                    Response.Redirect("Login.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}