using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominios;
using negocios;

namespace Gimnasio_Peleas.Formularios.Peleas
{
    public partial class Peleas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Usuario usuario = (Usuario)Session["Usuario"];
                if (usuario==null)
                {
                    Response.Redirect("/Formularios/Login/Login.aspx", false);
                }
                PeleasNegocio pn = new PeleasNegocio();

                if (!IsPostBack)
                    Session["listaPeleas"] = null;

                Session.Add("listaPeleas", pn.obtenerPeleasTodas());
                dgvPeleas.DataSource = Session["listaPeleas"];
                dgvPeleas.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("PeleasABM.aspx?a=1");
        }
    }
}