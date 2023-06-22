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
        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }
        protected void btnAbrirModalEliminarPelea_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                Session["IdPeleaEliminar"] = Convert.ToInt32(id);
                ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalEliminar = new bootstrap.Modal(document.getElementById('modalEliminar')); modalEliminar.show();</script>", false);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnAbrirModalPelea_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                PeleasNegocio pn = new PeleasNegocio();
                Pelea p = pn.obtenerPeleaPorId(Convert.ToInt32(id));

                //txtCodigo.Text = d.Codigo.ToString();
                //txtNombre.Text = d.Nombre;
                //txtObservaciones.Text = d.Observaciones;

                //txtDireccion.Text = d.Direccion.DireccionDojo;
                //txtProvincia.Text = d.Direccion.Provincia;
                //txtLocalidad.Text = d.Direccion.Localidad;

                ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalPelea = new bootstrap.Modal(document.getElementById('modalPelea')); modalPelea.show();</script>", false);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                PeleasNegocio pn = new PeleasNegocio();
                int id = Convert.ToInt32(Session["IdPeleaEliminar"]);
                if (id>0)
                {
                    pn.eliminarPelea(id);
                    Session["listaPeleas"] = null;
                    Session["IdPeleaEliminar"] = null;
                    Response.Redirect("Peleas.aspx");
                }
                else
                {
                    Session["IdPeleaEliminar"] = null;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "$('#modalEliminar').modal('hide');", true);
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