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
using System.Drawing;
using System.Drawing.Imaging;

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
                PeleasNegocio pen = new PeleasNegocio();

                if (Convert.ToInt32(Request.QueryString["a"]) == 1) //Agregar
                {
                    if (ddlDojos.Items.Count == 0)
                    {
                        if (usuario.TipoUsuario.Id == 1)
                        {
                            DataTable dojos = dn.obtenerDojos();
                            ddlDojos.DataSource = dojos;
                            ddlDojos.DataTextField = "NombreDojo";
                            ddlDojos.DataValueField = "IdDojo";
                            ddlDojos.DataBind();

                            ddlDojos.Items.Insert(0, new ListItem("Seleccione dojo...", "0"));
                        }
                        else
                        {
                            DataTable dojos = dn.obtenerDojosXId(usuario.Dojo.Id);
                            ddlDojos.DataSource = dojos;
                            ddlDojos.DataTextField = "NombreDojo";
                            ddlDojos.DataValueField = "IdDojo";
                            ddlDojos.DataBind();

                            ddlDojos.Items.Insert(0, new ListItem("Seleccione dojo...", "0"));
                        }
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

                    if (ddlModalidades.Items.Count == 0)
                    {
                        DataTable tipoPeleas = pen.obtenerTipoPeleas();
                        ddlModalidades.DataSource = tipoPeleas;
                        ddlModalidades.DataTextField = "TipoPelea";
                        ddlModalidades.DataValueField = "IdTipoPelea";
                        ddlModalidades.DataBind();

                        ddlModalidades.Items.Insert(0, new ListItem("Seleccione modalidad...", "0"));
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
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    List<Peleador> temp = (List<Peleador>)Session["listaPeleadores"];
                    Peleador selected = temp.Find(x => x.Id == id);
                    DataTable dtDojos = null;

                    if (ddlDojos.Items.Count == 0)
                    {
                        if (usuario.TipoUsuario.Id == 1)
                        {
                            dtDojos = dn.obtenerDojos();
                        }
                        else
                        {
                            dtDojos = dn.obtenerDojosXId(usuario.Dojo.Id);
                        }
                    }
                    DataTable dtCategorias = pn.obtenerCategorias();
                    DataTable dtGeneros = pn.obtenerGeneros();
                    DataTable dtModalidades = pen.obtenerTipoPeleas();

                    foreach (DataRow r in dtDojos.Rows)
                    {
                        li = new ListItem(r["NombreDojo"].ToString(), r["IdDojo"].ToString());
                        ddlDojos.Items.Add(li);
                    }

                    foreach (DataRow r in dtModalidades.Rows)
                    {
                        li = new ListItem(r["TipoPelea"].ToString(), r["IdTipoPelea"].ToString());
                        ddlModalidades.Items.Add(li);
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

                    btnAgregar.Visible = false;
                    btnModificar.Visible = true;
                    txtNombre.Text = selected.Nombre;
                    txtApellido.Text = selected.Apellido;
                    txtCantidadPeleas.Text = selected.CantidadPeleas.ToString();
                    txtPeso.Text = selected.Peso.ToString();
                    txtAltura.Text = selected.Altura.ToString();
                    txtEdad.Text = selected.Edad.ToString();
                    ddlCategorias.SelectedValue = selected.Categoria.Id.ToString();
                    ddlModalidades.SelectedValue = selected.TipoPelea.Id.ToString();
                    ddlDojos.SelectedValue = selected.Dojo.Id.ToString();
                    ddlGeneros.SelectedValue = selected.Genero.Id.ToString();
                    txtObservaciones.Text = selected.Observaciones;
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
                p.Edad = Convert.ToInt32(txtEdad.Text);
                p.Peso = Convert.ToDecimal(txtPeso.Text);
                p.Observaciones = txtObservaciones.Text;

                p.Categoria = new Categoria();
                p.Categoria.Id = Convert.ToInt32(ddlCategorias.SelectedValue);

                p.TipoPelea = new TipoPelea();
                p.TipoPelea.Id = Convert.ToInt32(ddlModalidades.SelectedValue);

                p.Dojo = new Dojo();
                p.Dojo.Id = Convert.ToInt32(ddlDojos.SelectedValue);

                p.Genero = new Genero();
                p.Genero.Id = Convert.ToInt32(ddlGeneros.SelectedValue);

                int IdNuevoPeleador = pn.AgregarPeleador(p);

                if (IdNuevoPeleador > 0)
                {
                    if (fileUpload.HasFile)
                    {
                        string rutaArchivoRedimensionado = Server.MapPath("~/Fotos/" + IdNuevoPeleador + Path.GetExtension(this.fileUpload.FileName));
                        string rutaArchivoOriginal = Server.MapPath("~/Fotos/" + IdNuevoPeleador + "_Original" + Path.GetExtension(this.fileUpload.FileName));

                        if (File.Exists(rutaArchivoOriginal))
                            File.Delete(rutaArchivoOriginal);

                        fileUpload.SaveAs(rutaArchivoOriginal);

                        using (var imagenOriginal = System.Drawing.Image.FromFile(rutaArchivoOriginal))
                        {
                            using (var imagenRedimensionada = new Bitmap(500, 600)) //Ancho y alto
                            {
                                using (var g = Graphics.FromImage(imagenRedimensionada))
                                {
                                    g.DrawImage(imagenOriginal, 0, 0, 500, 600); //Ancho y alto
                                }
                                imagenRedimensionada.Save(rutaArchivoRedimensionado);
                            }
                        }
                        // Eliminar el archivo nuevo sin redimencionar
                        File.Delete(rutaArchivoOriginal);
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
                p.Edad = Convert.ToInt32(txtEdad.Text);
                p.Observaciones = txtObservaciones.Text;

                p.Categoria = new Categoria();
                p.Categoria.Id = Convert.ToInt32(ddlCategorias.SelectedValue);

                p.TipoPelea = new TipoPelea();
                p.TipoPelea.Id = Convert.ToInt32(ddlModalidades.SelectedValue);

                p.Dojo = new Dojo();
                p.Dojo.Id = Convert.ToInt32(ddlDojos.SelectedValue);

                p.Genero = new Genero();
                p.Genero.Id = Convert.ToInt32(ddlGeneros.SelectedValue);

                if (fileUpload.HasFile)
                {
                    string rutaArchivoRedimensionado = Server.MapPath("~/Fotos/" + p.Id + Path.GetExtension(this.fileUpload.FileName));
                    string rutaArchivoOriginal = Server.MapPath("~/Fotos/" + p.Id + "_Original" + Path.GetExtension(this.fileUpload.FileName));

                    if (File.Exists(rutaArchivoOriginal))
                        File.Delete(rutaArchivoOriginal);

                    fileUpload.SaveAs(rutaArchivoOriginal);

                    using (var imagenOriginal = System.Drawing.Image.FromFile(rutaArchivoOriginal))
                    {
                        using (var imagenRedimensionada = new Bitmap(500, 600)) //Ancho y alto
                        {
                            using (var g = Graphics.FromImage(imagenRedimensionada))
                            {
                                g.DrawImage(imagenOriginal, 0, 0, 500, 600); //Ancho y alto
                            }
                            imagenRedimensionada.Save(rutaArchivoRedimensionado);
                        }
                    }
                    // Eliminar el archivo nuevo sin redimencionar
                    File.Delete(rutaArchivoOriginal);
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
            try
            {
                Response.Redirect("Peleadores.aspx");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}