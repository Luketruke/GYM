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
                else if (usuario.TipoUsuario.Id != 1) //Verifico si el usuario es Administrador
                {
                    Response.Redirect("/Default.aspx", false);
                }

                ListItem li;
                DojosNegocio dn = new DojosNegocio();
                PeleasNegocio pn = new PeleasNegocio();

                if (Convert.ToInt32(Request.QueryString["a"]) == 1) //Agregar
                {
                    if (!IsPostBack)
                    {
                        txtFiltroEdad.Text = "0";
                        txtFiltroPeso.Text = "0";
                        txtFiltroCantidadPeleas.Text = "0";
                    }

                    if (ddlDojos.Items.Count == 0)
                    {
                        DataTable dojos = dn.obtenerDojos();
                        ddlDojos.DataSource = dojos;
                        ddlDojos.DataTextField = "NombreDojo";
                        ddlDojos.DataValueField = "IdDojo";
                        ddlDojos.DataBind();

                        ddlDojos.Items.Insert(0, new ListItem("Seleccione sede...", "0"));
                    }

                    if (ddlPeleador1.Items.Count == 0)
                    {
                        DataTable peleadores1 = pn.obtenerPeleadores1();
                        if (peleadores1.Rows.Count>0)
                        {
                            ddlPeleador1.DataSource = peleadores1;
                            ddlPeleador1.DataTextField = "DatosDDL";
                            ddlPeleador1.DataValueField = "Id";
                            ddlPeleador1.DataBind();

                            ddlPeleador1.Items.Insert(0, new ListItem("Seleccione peleador...", "0"));
                        }
                        else
                        {
                            ddlPeleador1.DataSource = peleadores1;
                            ddlPeleador1.DataTextField = "DatosDDL";
                            ddlPeleador1.DataValueField = "Id";
                            ddlPeleador1.DataBind();
                            ddlPeleador1.Items.Insert(0, new ListItem("No se encontraron peleadores...", "0"));
                        }
                    }
                }

                if (Convert.ToInt32(Request.QueryString["a"]) == 2 && !IsPostBack) //Modificar
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    List<Pelea> temp = (List<Pelea>)Session["listaPeleas"];
                    Pelea selected = temp.Find(x => x.Id == id);

                    DataTable dtDojos = dn.obtenerDojos();
                    DataTable dtPeleador1 = pn.obtenerPeleadores1();
                    DataTable dtPeleador2 = pn.obtenerPeleadores2(selected.Peleador1.Id);

                    foreach (DataRow r in dtDojos.Rows)
                    {
                        li = new ListItem(r["NombreDojo"].ToString(), r["IdDojo"].ToString());
                        ddlDojos.Items.Add(li);
                    }

                    foreach (DataRow r in dtPeleador1.Rows)
                    {
                        li = new ListItem(r["DatosDDL"].ToString(), r["Id"].ToString());
                        ddlPeleador1.Items.Add(li);
                    }

                    foreach (DataRow r in dtPeleador2.Rows)
                    {
                        li = new ListItem(r["DatosDDL"].ToString(), r["Id"].ToString());
                        ddlPeleador2.Items.Add(li);
                    }

                    btnAgregar.Visible = false;
                    btnModificar.Visible = true;
                    ddlDojos.SelectedValue = selected.Dojo.Id.ToString();
                    ddlPeleador1.SelectedValue = selected.Peleador1.Id.ToString();
                    ddlPeleador2.SelectedValue = selected.Peleador2.Id.ToString();
                    txtObservaciones.Text = selected.Observaciones;
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
                    if (peleadores1.Rows.Count>0)
                    {
                        ddlPeleador1.DataSource = peleadores1;
                        ddlPeleador1.DataTextField = "DatosDDL";
                        ddlPeleador1.DataValueField = "Id";
                        ddlPeleador1.DataBind();
                        ddlPeleador1.Items.Insert(0, new ListItem("Seleccione peleador...", "0"));
                        //txtPeleador2.Text = "";
                    }
                    else
                    {
                        ddlPeleador1.DataSource = peleadores1;
                        ddlPeleador1.DataTextField = "DatosDDL";
                        ddlPeleador1.DataValueField = "Id";
                        ddlPeleador1.DataBind();
                        ddlPeleador1.Items.Insert(0, new ListItem("No se encontraron peleadores...", "0"));
                    }
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

                if (Convert.ToInt32(ddlPeleador1.SelectedValue) == 0)
                {
                    ddlPeleador2.DataBind();
                    ddlPeleador2.Items.Insert(0, new ListItem("Seleccione primer peleador primero...", "0"));
                }
                else if (ddlPeleador2.Items.Count == 0)
                    {
                        DataTable peleadores2 = pn.obtenerPeleadores2Filtrados(Convert.ToInt32(ddlPeleador1.SelectedValue), txtPeleador2.Text);

                        if (peleadores2.Rows.Count>0)
                        {
                            ddlPeleador2.DataSource = peleadores2;
                            ddlPeleador2.DataTextField = "DatosDDL";
                            ddlPeleador2.DataValueField = "Id";
                            ddlPeleador2.DataBind();
                            ddlPeleador2.Items.Insert(0, new ListItem("Seleccione segundo peleador...", "0"));
                        }
                        else
                        {
                            ddlPeleador2.DataSource = peleadores2;
                            ddlPeleador2.DataTextField = "DatosDDL";
                            ddlPeleador2.DataValueField = "Id";
                            ddlPeleador2.DataBind();
                            ddlPeleador2.Items.Insert(0, new ListItem("No se encontraron peleadores...", "0"));
                        }
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

                int FiltrarXPeso, FiltrarXPeleas, FiltrarXEdad, FiltrarXCategoria, FiltrarXModalidad, Edad, CantidadPeleas;
                decimal Peso;

                if (checkboxPeso.Checked)
                {
                    FiltrarXPeso = 1;
                    Peso = Convert.ToDecimal(txtFiltroPeso.Text);
                }
                else
                {
                    FiltrarXPeso = 0;
                    Peso = 0;
                }
                if (checkboxCantidadPeleas.Checked)
                {
                    FiltrarXPeleas = 1;
                    CantidadPeleas = Convert.ToInt32(txtFiltroCantidadPeleas.Text);
                }
                else
                {
                    FiltrarXPeleas = 0;
                    CantidadPeleas = 0;
                }
                if (checkboxEdad.Checked)
                {
                    FiltrarXEdad = 1;
                    Edad = Convert.ToInt32(txtFiltroEdad.Text);
                }
                else
                {
                    FiltrarXEdad = 0;
                    Edad = 0;
                }
                if (checkboxCategoria.Checked)
                {
                    FiltrarXCategoria = 1;
                }
                else
                {
                    FiltrarXCategoria = 0;
                }
                if (checkboxModalidad.Checked)
                {
                    FiltrarXModalidad = 1;
                }
                else
                {
                    FiltrarXModalidad = 0;
                }

                dgvPeleadoresSimilares.DataSource = pn.obtenerPeleadoresSimilares(Convert.ToInt32(ddlPeleador1.SelectedValue), FiltrarXPeso, FiltrarXPeleas, FiltrarXEdad, FiltrarXCategoria, FiltrarXModalidad, Peso, Edad, CantidadPeleas);
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

                    if (peleadores2.Rows.Count>0)
                    {
                        ddlPeleador2.DataSource = peleadores2;
                        ddlPeleador2.DataTextField = "DatosDDL";
                        ddlPeleador2.DataValueField = "Id";
                        ddlPeleador2.DataBind();
                        ddlPeleador2.Items.Insert(0, new ListItem("Seleccione segundo peleador...", "0"));
                    }
                    else
                    {
                        ddlPeleador2.DataSource = peleadores2;
                        ddlPeleador2.DataTextField = "DatosDDL";
                        ddlPeleador2.DataValueField = "Id";
                        ddlPeleador2.DataBind();
                        ddlPeleador2.Items.Insert(0, new ListItem("No se encontraron peleadores...", "0"));
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Peleas.aspx");
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
                p.TipoPelea.Id = 1;

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
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                PeleasNegocio pn = new PeleasNegocio();
                Pelea p = new Pelea();

                p.Id = Convert.ToInt32(Request.QueryString["id"]);

                p.Peleador1 = new Peleador();
                p.Peleador1.Id = Convert.ToInt32(ddlPeleador1.SelectedValue);

                p.Peleador2 = new Peleador();
                p.Peleador2.Id = Convert.ToInt32(ddlPeleador2.SelectedValue);

                p.Dojo = new Dojo();
                p.Dojo.Id = Convert.ToInt32(ddlDojos.SelectedValue);

                p.TipoPelea = new TipoPelea();
                p.TipoPelea.Id = 1;

                p.Observaciones = txtObservaciones.Text;

                if (pn.modificarPelea(p))
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