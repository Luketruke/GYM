using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominios;
using negocios;

namespace Gimnasio_Peleas.Formularios.Dojos
{
    public partial class DojosABM : System.Web.UI.Page
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
                txtCodigo.Text = Request.QueryString["id"];

                if (Convert.ToInt32(Request.QueryString["a"]) == 1) //Agregar
                {
                    divCodigo.Visible = false;

                    if (ddlProvincias.Items.Count == 0)
                    {
                        DataTable provincias = dn.obtenerProvincias();
                        ddlProvincias.DataSource = provincias;
                        ddlProvincias.DataTextField = "Provincia";
                        ddlProvincias.DataValueField = "Id";
                        ddlProvincias.DataBind();

                        ddlProvincias.Items.Insert(0, new ListItem("Seleccione provincia...", "0"));
                    }
                }

                if (Convert.ToInt32(Request.QueryString["a"]) == 2 && !IsPostBack) //Modificar
                {
                    DataTable dtProvincias = dn.obtenerProvincias();
                    DataTable dtLocalidades = dn.obtenerLocalidades();

                    foreach (DataRow r in dtProvincias.Rows)
                    {
                        li = new ListItem(r["Provincia"].ToString(), r["Id"].ToString());
                        ddlProvincias.Items.Add(li);
                    }

                    foreach (DataRow r in dtLocalidades.Rows)
                    {
                        li = new ListItem(r["Localidad"].ToString(), r["Id"].ToString());
                        ddlLocalidades.Items.Add(li);
                    }

                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    List<Dojo> temp = (List<Dojo>)Session["listaDojos"];
                    Dojo selected = temp.Find(x => x.Id == id);
                    btnAgregar.Visible = false;
                    btnModificar.Visible = true;
                    txtCodigo.Text = selected.Codigo.ToString();
                    txtNombre.Text = selected.Nombre;
                    txtObservaciones.Text = selected.Observaciones;
                    txtDireccion.Text = selected.Direccion.DireccionDojo;
                    ddlProvincias.SelectedValue = selected.Direccion.IdProvincia.ToString();
                    ddlLocalidades.SelectedValue = selected.Direccion.IdLocalidad.ToString();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void ddlProvincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlProvincias.SelectedIndex >= 0)
                {
                    DojosNegocio dn = new DojosNegocio();
                    int IdProvincia = int.Parse(ddlProvincias.SelectedValue);
                    DataTable localidades = dn.obtenerLocalidades(IdProvincia);
                    ddlLocalidades.DataSource = localidades;
                    ddlLocalidades.DataTextField = "Localidad";
                    ddlLocalidades.DataValueField = "Id";
                    ddlLocalidades.DataBind();
                    ddlLocalidades.Items.Insert(0, new ListItem("Seleccione localidad...", "0"));
                }
                else
                {
                    ddlLocalidades.Items.Clear();
                }
            }
            catch (Exception ex)
            {
            }
        }
        public void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                DojosNegocio dn = new DojosNegocio();
                Dojo d = new Dojo();
                d.Nombre = txtNombre.Text;
                d.Observaciones = txtObservaciones.Text;

                d.Direccion = new Direccion();
                d.Direccion.DireccionDojo = txtDireccion.Text;
                d.Direccion.Provincia = ddlProvincias.SelectedValue;
                d.Direccion.Localidad = ddlLocalidades.SelectedValue;

                if (dn.agregarDojo(d))
                {
                    //Session["alerta"] = "agregado";
                    Response.Redirect("Dojos.aspx");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        public void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                DojosNegocio dn = new DojosNegocio();
                Dojo d = new Dojo();

                d.Id = Convert.ToInt32(Request.QueryString["id"]);
                d.Nombre = txtNombre.Text;
                d.Observaciones = txtObservaciones.Text;

                d.Direccion = new Direccion();
                d.Direccion.DireccionDojo = txtDireccion.Text;
                if (Convert.ToInt32(ddlProvincias.SelectedValue) > 0) //Verifico que se seleccionen valores
                {
                    d.Direccion.IdProvincia = Convert.ToInt32(ddlProvincias.SelectedValue);
                    if (Convert.ToInt32(ddlLocalidades.SelectedValue) > 0) //Verifico que se seleccionen valores
                    {
                        d.Direccion.IdLocalidad = Convert.ToInt32(ddlLocalidades.SelectedValue);
                        if (dn.modificarDojo(d))
                        {
                            //Session["alerta"] = "modificado";
                            Response.Redirect("Dojos.aspx");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            //Session["alerta"] = "cancelado";
            Response.Redirect("Dojos.aspx");
        }
    }
}