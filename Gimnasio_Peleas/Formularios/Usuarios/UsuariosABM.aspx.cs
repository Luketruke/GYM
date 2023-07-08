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

namespace Gimnasio_Peleas.Formularios.Usuarios
{
    public partial class UsuariosABM : System.Web.UI.Page
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
                UsuarioNegocio un = new UsuarioNegocio();
                DojosNegocio dn = new DojosNegocio();

                if (Convert.ToInt32(Request.QueryString["a"]) == 1) //Agregar
                {
                    if (ddlDojos.Items.Count == 0)
                    {
                        DataTable dojos = dn.obtenerDojos();
                        ddlDojos.DataSource = dojos;
                        ddlDojos.DataTextField = "NombreDojo";
                        ddlDojos.DataValueField = "IdDojo";
                        ddlDojos.DataBind();

                        ddlDojos.Items.Insert(0, new ListItem("Seleccione team...", "0"));
                    }

                    if (ddlTiposUsuario.Items.Count == 0)
                    {
                        DataTable tipousuarios = un.obtenerTiposUsuario();
                        ddlTiposUsuario.DataSource = tipousuarios;
                        ddlTiposUsuario.DataTextField = "TipoUsuario";
                        ddlTiposUsuario.DataValueField = "IdTipoUsuario";
                        ddlTiposUsuario.DataBind();

                        ddlTiposUsuario.Items.Insert(0, new ListItem("Seleccione tipo de usuario...", "0"));
                    }
                }

                if (Convert.ToInt32(Request.QueryString["a"]) == 2 && !IsPostBack) //Modificar
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    List<Usuario> temp = (List<Usuario>)Session["listaUsuarios"];
                    Usuario selected = temp.Find(x => x.Id == id);

                    DataTable dtDojos = dn.obtenerDojos();
                    DataTable dtTiposUsuario = un.obtenerTiposUsuario();

                    foreach (DataRow r in dtDojos.Rows)
                    {
                        li = new ListItem(r["NombreDojo"].ToString(), r["IdDojo"].ToString());
                        ddlDojos.Items.Add(li);
                    }

                    foreach (DataRow r in dtTiposUsuario.Rows)
                    {
                        li = new ListItem(r["TipoUsuario"].ToString(), r["IdTipoUsuario"].ToString());
                        ddlTiposUsuario.Items.Add(li);
                    }
                    btnAgregar.Visible = false;
                    btnModificar.Visible = true;
                    txtUsuario.Text = selected.User;
                    txtPassword.Text = selected.Contrasenia;
                    ddlDojos.SelectedValue = selected.Dojo.Id.ToString();
                    ddlTiposUsuario.SelectedValue = selected.TipoUsuario.Id.ToString();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        public void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                UsuarioNegocio un = new UsuarioNegocio();
                Usuario u = new Usuario();

                u.User = txtUsuario.Text;
                u.Contrasenia = txtPassword.Text;

                u.Dojo = new Dojo();
                u.Dojo.Id = Convert.ToInt32(ddlDojos.SelectedValue);

                u.TipoUsuario = new TipoUsuario();
                u.TipoUsuario.Id = Convert.ToInt32(ddlTiposUsuario.SelectedValue);

                if (!un.VerificarUsuario(u.User))
                {
                    if (un.agregarUsuario(u))
                    {
                        Response.Redirect("Usuarios.aspx");
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalYaExisteUsuarioAgregar = new bootstrap.Modal(document.getElementById('modalYaExisteUsuarioAgregar')); modalYaExisteUsuarioAgregar.show();</script>", false);
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
                UsuarioNegocio un = new UsuarioNegocio();
                Usuario u = new Usuario();

                u.Id = Convert.ToInt32(Request.QueryString["id"]);
                u.User = txtUsuario.Text;
                u.Contrasenia = txtPassword.Text;

                u.Dojo = new Dojo();
                u.Dojo.Id = Convert.ToInt32(ddlDojos.SelectedValue);

                u.TipoUsuario = new TipoUsuario();
                u.TipoUsuario.Id = Convert.ToInt32(ddlTiposUsuario.SelectedValue);

                if (Convert.ToInt32(ddlDojos.SelectedValue) > 0) //Verifico que se seleccionen valores
                {
                    if (Convert.ToInt32(ddlTiposUsuario.SelectedValue) > 0) //Verifico que se seleccionen valores
                    {
                        if (!un.VerificarUsuarioModificar(u.User, u.Id))
                        {
                            if (un.modificarUsuario(u))
                            {
                                Response.Redirect("Usuarios.aspx");
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalYaExisteUsuarioModificar = new bootstrap.Modal(document.getElementById('modalYaExisteUsuarioModificar')); modalYaExisteUsuarioModificar.show();</script>", false);
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
            try
            {
                Response.Redirect("Usuarios.aspx");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}