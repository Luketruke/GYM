using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;
using dominios;
using System.Data;
using System.Globalization;

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
                PeleasNegocio pn = new PeleasNegocio();

                txtCodigo.Text = Request.QueryString["id"];

                if (Convert.ToInt32(Request.QueryString["a"]) == 1) //Agregar
                {
                    divCodigo.Visible = false;
                    //Cargo la hora a las variables
                    txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
                    txtHora.Text = DateTime.Now.ToString("HH:mm");

                    if (ddlDojos.Items.Count == 0)
                    {
                        DataTable dojos = dn.obtenerDojos();
                        ddlDojos.DataSource = dojos;
                        ddlDojos.DataTextField = "NombreDojo";
                        ddlDojos.DataValueField = "IdDojo";
                        ddlDojos.DataBind();

                        ddlDojos.Items.Insert(0, new ListItem("Seleccione dojo...", "0"));
                    }

                    if (ddlTipoPeleas.Items.Count == 0)
                    {
                        DataTable tipoPeleas = pn.obtenerTipoPeleas();
                        ddlTipoPeleas.DataSource = tipoPeleas;
                        ddlTipoPeleas.DataTextField = "TipoPelea";
                        ddlTipoPeleas.DataValueField = "IdTipoPelea";
                        ddlTipoPeleas.DataBind();

                        ddlTipoPeleas.Items.Insert(0, new ListItem("Seleccione modalidad...", "0"));
                    }

                    if (ddlPeleador1.Items.Count == 0)
                    {
                        DataTable peleadores1 = pn.obtenerPeleadores1();
                        ddlPeleador1.DataSource = peleadores1;
                        ddlPeleador1.DataTextField = "DatosDDL";
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
            try
            {
                PeleasNegocio pn = new PeleasNegocio();

                ddlPeleador1.Items.Clear();

                if (ddlPeleador1.Items.Count == 0)
                {
                    DataTable peleadores1 = pn.obtenerPeleadores1Filtrados(txtPeleador1.Text);
                    ddlPeleador1.DataSource = peleadores1;
                    ddlPeleador1.DataTextField = "DatosDDL";
                    ddlPeleador1.DataValueField = "Id";
                    ddlPeleador1.DataBind();

                    ddlPeleador1.Items.Insert(0, new ListItem("Seleccione primer peleador...", "0"));
                }
                else
                {
                    ddlPeleador1.Items.Insert(0, new ListItem("No se encontraron peleadores...", "0"));

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnBuscarPeleador2_Click(object sender, EventArgs e)
        {
            try
            {
                PeleasNegocio pn = new PeleasNegocio();

                ddlPeleador2.Items.Clear();

                if (ddlPeleador2.Items.Count == 0)
                {
                    DataTable peleadores2 = pn.obtenerPeleadores2Filtrados(Convert.ToInt32(ddlPeleador1.SelectedValue), txtPeleador2.Text);
                    ddlPeleador2.DataSource = peleadores2;
                    ddlPeleador2.DataTextField = "DatosDDL";
                    ddlPeleador2.DataValueField = "Id";
                    ddlPeleador2.DataBind();

                    ddlPeleador2.Items.Insert(0, new ListItem("Seleccione segundo peleador...", "0"));
                }
                else
                {
                    ddlPeleador1.Items.Insert(0, new ListItem("No se encontraron peleadores...", "0"));
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        protected void btnModalPeleadoresSimilares_Click(object sender, EventArgs e)
        {
            try
            {
                PeleasNegocio pn = new PeleasNegocio();

                dgvPeleadoresSimilares.DataSource = pn.obtenerPeleadoresSimilares(Convert.ToInt32(ddlPeleador1.SelectedValue));
                dgvPeleadoresSimilares.DataBind();

                ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalPeleadoresSimilares = new bootstrap.Modal(document.getElementById('modalPeleadoresSimilares')); modalPeleadoresSimilares.show();</script>", false);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnSeleccionarPeleadorSimilar_Click(object sender, EventArgs e)
        {
            try
            {
                PeleasNegocio pn = new PeleasNegocio();
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                int IdPeleador = Convert.ToInt32(gv.DataKeys[clickedRow.RowIndex].Values[0]);

                ddlPeleador2.Items.Clear();

                if (ddlPeleador2.Items.Count == 0)
                {
                    DataTable peleadores2 = pn.obtenerPeleadorPorId(IdPeleador);
                    ddlPeleador2.DataSource = peleadores2;
                    ddlPeleador2.DataTextField = "DatosDDL";
                    ddlPeleador2.DataValueField = "IdPeleador";
                    ddlPeleador2.DataBind();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void ddlPeleador1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PeleasNegocio pn = new PeleasNegocio();

                ddlPeleador2.Items.Clear();

                if (ddlPeleador2.Items.Count == 0)
                {
                    DataTable peleadores2 = pn.obtenerPeleadores2(Convert.ToInt32(ddlPeleador1.SelectedValue));
                    ddlPeleador2.DataSource = peleadores2;
                    ddlPeleador2.DataTextField = "DatosDDL";
                    ddlPeleador2.DataValueField = "Id";
                    ddlPeleador2.DataBind();

                    ddlPeleador2.Items.Insert(0, new ListItem("Seleccione segundo peleador...", "0"));
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            //Session["alerta"] = "cancelado";
            Response.Redirect("Peleadores.aspx");
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                PeleasNegocio pn = new PeleasNegocio();
                Pelea p = new Pelea();

                p.Peleador1 = new Peleador();
                p.Peleador1.Id = Convert.ToInt32(ddlPeleador1.SelectedValue);

                p.Peleador2 = new Peleador();
                p.Peleador2.Id = Convert.ToInt32(ddlPeleador2.SelectedValue);

                p.Dojo = new Dojo();
                p.Dojo.Id = Convert.ToInt32(ddlDojos.SelectedValue);

                p.TipoPelea = new TipoPelea();
                p.TipoPelea.Id = Convert.ToInt32(ddlTipoPeleas.SelectedValue);

                string dateValue = txtFecha.Text;
                string timeValue = txtHora.Text;

                DateTime dateTime = DateTime.ParseExact(dateValue + " " + timeValue, "yyyy-MM-dd HH:mm", CultureInfo.InvariantCulture);

                p.FechaPelea = dateTime;
                p.Observaciones = txtObservaciones.Text;

                if (pn.agregarPelea(p))
                {
                    Response.Redirect("Peleas.aspx");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}