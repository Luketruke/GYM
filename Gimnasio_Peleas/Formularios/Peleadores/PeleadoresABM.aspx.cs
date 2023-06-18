using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominios;
using negocios;
using System.IO;

namespace Gimnasio_Peleas.Formularios.Peleadores
{
    public partial class PeleadoresABM : System.Web.UI.Page
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

                    if (ddlGeneros.Items.Count == 0)
                    {
                        DataTable generos = pn.obtenerGeneros();
                        ddlGeneros.DataSource = generos;
                        ddlGeneros.DataTextField = "Genero";
                        ddlGeneros.DataValueField = "IdGenero";
                        ddlGeneros.DataBind();

                        ddlGeneros.Items.Insert(0, new ListItem("Seleccione genero...", "0"));
                    }

                    if (ddlCategorias.Items.Count == 0)
                    {
                        DataTable categorias = pn.obtenerCategorias();
                        ddlCategorias.DataSource = categorias;
                        ddlCategorias.DataTextField = "Descripcion";
                        ddlCategorias.DataValueField = "IdCategoria";
                        ddlCategorias.DataBind();

                        ddlCategorias.Items.Insert(0, new ListItem("Seleccione categoria...", "0"));
                    }
                }

                if (Convert.ToInt32(Request.QueryString["a"]) == 2 && !IsPostBack) //Modificar
                {
                    DataTable dtDojos = dn.obtenerDojos();
                    DataTable dtCategorias = pn.obtenerCategorias();
                    DataTable dtGeneros = pn.obtenerGeneros();

                    foreach (DataRow r in dtDojos.Rows)
                    {
                        li = new ListItem(r["NombreDojo"].ToString(), r["IdDojo"].ToString());
                        ddlDojos.Items.Add(li);
                    }

                    foreach (DataRow r in dtCategorias.Rows)
                    {
                        li = new ListItem(r["Descripcion"].ToString(), r["IdCategoria"].ToString());
                        ddlCategorias.Items.Add(li);
                    }

                    foreach (DataRow r in dtGeneros.Rows)
                    {
                        li = new ListItem(r["Genero"].ToString(), r["IdGenero"].ToString());
                        ddlGeneros.Items.Add(li);
                    }

                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    List<Peleador> temp = (List<Peleador>)Session["listaPeleadores"];
                    Peleador selected = temp.Find(x => x.Id == id);
                    btnAgregar.Visible = false;
                    btnModificar.Visible = true;
                    txtCodigo.Text = selected.Codigo.ToString();
                    txtNombre.Text = selected.Nombre;
                    txtApellido.Text = selected.Apellido;
                    txtCantidadPeleas.Text = selected.CantidadPeleas.ToString();
                    txtPeso.Text = selected.Peso.ToString();
                    txtAltura.Text = selected.Altura.ToString();
                    ddlCategorias.SelectedValue = selected.Categoria.Id.ToString();
                    ddlDojos.SelectedValue = selected.Dojo.Id.ToString();
                    ddlGeneros.SelectedValue = selected.Genero.Id.ToString();
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
                PeleadoresNegocio pn = new PeleadoresNegocio();
                Peleador p = new Peleador();
                p.Nombre = txtNombre.Text;
                p.Apellido = txtApellido.Text;
                p.CantidadPeleas = Convert.ToInt32(txtCantidadPeleas.Text);
                p.Altura = Convert.ToInt32(txtAltura.Text);
                p.Peso = Convert.ToDecimal(txtPeso.Text);

                p.Categoria = new Categoria();
                p.Categoria.Id = Convert.ToInt32(ddlCategorias.SelectedValue);

                p.Dojo = new Dojo();
                p.Dojo.Id = Convert.ToInt32(ddlDojos.SelectedValue);

                p.Genero = new Genero();
                p.Genero.Id = Convert.ToInt32(ddlGeneros.SelectedValue);

                if (fileUpload.HasFile)
                {
                    string rutaArchivo = Server.MapPath("~/Fotos/" + fileUpload.FileName);
                    fileUpload.SaveAs(rutaArchivo);
                }

                int IdNuevoPeleador = pn.agregarPeleador(p);

                if (IdNuevoPeleador > 0)
                {
                    if (fileUpload.HasFile)
                    {
                        string rutaArchivo = Server.MapPath("~/Fotos/" + IdNuevoPeleador + Path.GetExtension(this.fileUpload.FileName));
                        fileUpload.SaveAs(rutaArchivo);
                    }
                    Response.Redirect("Peleadores.aspx");
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
                PeleadoresNegocio pn = new PeleadoresNegocio();
                Peleador p = new Peleador();

                p.Id = Convert.ToInt32(Request.QueryString["id"]);
                p.Nombre = txtNombre.Text;
                p.Apellido = txtApellido.Text;
                p.CantidadPeleas = Convert.ToInt32(txtCantidadPeleas.Text);
                p.Altura = Convert.ToInt32(txtAltura.Text);
                p.Peso = Convert.ToDecimal(txtPeso.Text);

                p.Categoria = new Categoria();
                p.Categoria.Id = Convert.ToInt32(ddlCategorias.SelectedValue);

                p.Dojo = new Dojo();
                p.Dojo.Id = Convert.ToInt32(ddlDojos.SelectedValue);

                p.Genero = new Genero();
                p.Genero.Id = Convert.ToInt32(ddlGeneros.SelectedValue);

                if (fileUpload.HasFile)
                {
                    string rutaArchivo = Server.MapPath("~/Fotos/" + p.Id + Path.GetExtension(this.fileUpload.FileName));
                    fileUpload.SaveAs(rutaArchivo);
                    
                }

                if (pn.modificarPeleador(p))
                {
                    Response.Redirect("Peleadores.aspx");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                PeleadoresNegocio pn = new PeleadoresNegocio();
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                pn.eliminarPeleador(Convert.ToInt32(id));
                //Session["alerta"] = "eliminado";
                Session["listaPeleadores"] = null;
                Response.Redirect("Peleadores.aspx");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            //Session["alerta"] = "cancelado";
            Response.Redirect("Peleadores.aspx");
        }

    }
}