using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominios;
using negocios;

namespace Gimnasio_Peleas.Formularios.Usuarios
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Usuario usuario = (Usuario)Session["Usuario"];
                if (usuario==null)
                {
                    Response.Redirect("/Formularios/Login/Login.aspx", false);
                } else if (usuario.TipoUsuario.Id != 1) //Verifico si el usuario es Administrador
                {
                    Response.Redirect("/Default.aspx", false);
                }

                if (!IsPostBack || Session["listaUsuarios"] == null)
                {
                    UsuarioNegocio un = new UsuarioNegocio();
                    Session["listaUsuarios"] = null;
                    Session.Add("listaUsuarios", un.obtenerUsuariosTodos());
                    dgvUsuarios.DataSource = Session["listaUsuarios"];
                    dgvUsuarios.DataBind();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        protected void btnAbrirModalEliminarUsuario_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                Session["IdUsuarioEliminar"] = Convert.ToInt32(id);
                ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalEliminar = new bootstrap.Modal(document.getElementById('modalEliminar')); modalEliminar.show();</script>", false);
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
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                Response.Redirect("UsuariosABM.aspx?a=2&id=" + id);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("UsuariosABM.aspx?a=1");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                UsuarioNegocio un = new UsuarioNegocio();
                int id = Convert.ToInt32(Session["IdUsuarioEliminar"]);
                if (id>0)
                {
                    un.eliminarUsuario(id);
                    Session["listaUsuarios"] = null;
                    Session["IdUsuarioEliminar"] = null;
                    Response.Redirect("Usuarios.aspx");
                }
                else
                {
                    Session["IdUsuarioEliminar"] = null;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "$('#modalEliminar').modal('hide');", true);
                    Response.Redirect("Usuarios.aspx");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}