using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;
using dominios;

namespace Gimnasio_Peleas.Formularios.Dojos
{
    public partial class Dojos : System.Web.UI.Page
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
                DojosNegocio dn = new DojosNegocio();

                if (!IsPostBack || Session["listaDojos"] == null)
                {
                    Session["listaDojos"] = null;
                    Session.Add("listaDojos", dn.obtenerDojosTodos());
                    dgvDojos.DataSource = Session["listaDojos"];
                    dgvDojos.DataBind();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        
        protected void btnAbrirModalDojo_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                DojosNegocio dn = new DojosNegocio();
                Dojo d = dn.obtenerDojoPorId(Convert.ToInt32(id));

                txtNombre.Text = d.Nombre;
                txtTelefonoDojo.Text = d.TelefonoDojo;
                txtProfesor.Text = d.Observaciones;
                txtTelefonoProfesor.Text = d.TelefonoProfesor;        
                txtDireccion.Text = d.Direccion.DireccionCompleta;
                txtObservaciones.Text = d.Observaciones;

                ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalDojo = new bootstrap.Modal(document.getElementById('modalDojo')); modalDojo.show();</script>", false);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnAbrirModalEliminarDojo_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                Session["IdDojoEliminar"] = Convert.ToInt32(id);
                ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalEliminar = new bootstrap.Modal(document.getElementById('modalEliminar')); modalEliminar.show();</script>", false);
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
                DojosNegocio dn = new DojosNegocio();
                int id = Convert.ToInt32(Session["IdDojoEliminar"]);
                if (id>0)
                {
                    dn.eliminarDojo(id);
                    Session["listaDojos"] = null;
                    Session["IdDojoEliminar"] = null;
                    Response.Redirect("Dojos.aspx");
                }
                else
                {
                    Session["IdDojoEliminar"] = null;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "$('#modalEliminar').modal('hide');", true);
                    Response.Redirect("Dojos.aspx");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }   
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("DojosABM.aspx?a=1");
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            //Desarrollar
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                Response.Redirect("DojosABM.aspx?a=2&id=" + id);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}