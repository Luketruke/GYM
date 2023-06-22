using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominios;

namespace Gimnasio_Peleas
{
    public partial class Site_Mobile : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Usuario"] != null)
                {
                    Usuario user = (Usuario)HttpContext.Current.Session["Usuario"];
                    usuario_navbar.Text = user.User.ToString();
                    usuario_navbar.Visible = true;

                    usuario_navbar2.Text = user.User.ToString();
                    usuario_navbar2.Visible = true;
                }
            }
            catch
            {
            }
        }
    }
}