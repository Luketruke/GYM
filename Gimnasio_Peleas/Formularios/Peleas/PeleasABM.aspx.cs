using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;
using dominios;
using System.Data;

namespace Gimnasio_Peleas.Formularios.Peleas
{
    public partial class PeleasABM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Verifico login
                Usuario usuario = (Usuario)Session["Usuario"];
                if (usuario==null)
                {
                    Response.Redirect("/Formularios/Login/Login.aspx", false);
                }

                ListItem li;
                DojosNegocio dn = new DojosNegocio();
                PeleadoresNegocio pn = new PeleadoresNegocio();

                txtCodigo.Text = Request.QueryString["id"];

                if (Convert.ToInt32(Request.QueryString["a"]) == 1) //Agregar
                {
                    divCodigo.Visible = false;

                    if (ddlDojos.Items.Count == 0)
                    {
                        DataTable dojos = dn.obtenerDojos();
                        ddlDojos.DataSource = dojos;
                        ddlDojos.DataTextField = "NombreDojo";
                        ddlDojos.DataValueField = "IdDojo";
                        ddlDojos.DataBind();

                        ddlDojos.Items.Insert(0, new ListItem("Seleccione dojo...", "0"));
                    }

                    if (ddlPeleador1.Items.Count == 0)
                    {
                        DataTable peleadores1 = pn.obtenerPeleadores1Pelea();
                        ddlPeleador1.DataSource = peleadores1;
                        ddlPeleador1.DataTextField = "NombreCompleto";
                        ddlPeleador1.DataValueField = "Id";
                        ddlPeleador1.DataBind();

                        ddlPeleador1.Items.Insert(0, new ListItem("Seleccione primer peleador...", "0"));
                    }
                }

                if (Convert.ToInt32(Request.QueryString["a"]) == 2 && !IsPostBack) //Modificar
                {
                    //Desarrollar
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

        }

        protected void btnBuscarPeleador1_Click(object sender, EventArgs e)
        {

        }

        protected void btnBuscarPeleador2_Click(object sender, EventArgs e)
        {

        }

        protected void btnBuscarPeleadoresSimilares_Click(object sender, EventArgs e)
        {

        }

        protected void btnSeleccionarPeleadorSimilar_Click(object sender, EventArgs e)
        {

        }

        protected void ddlPeleador1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}