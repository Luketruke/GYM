﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using dominios;
using negocios;

namespace Gimnasio_Peleas.Formularios.Peleadores
{
    public partial class Peleadores : System.Web.UI.Page
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

                if (!IsPostBack || Session["listaPeleadores"] == null)
                {
                    PeleadoresNegocio pn = new PeleadoresNegocio();
                    Session["listaPeleadores"] = null;
                    Session.Add("listaPeleadores", pn.obtenerPeleadoresTodos());
                    dgvPeleadores.DataSource = Session["listaPeleadores"];
                    dgvPeleadores.DataBind();
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
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                Response.Redirect("PeleadoresABM.aspx?a=2&id=" + id);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnAbrirModalPeleador_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                PeleadoresNegocio pn = new PeleadoresNegocio();
                Peleador p = pn.obtenerPeleadorPorId(Convert.ToInt32(id));

                miModalLabel.InnerText = p.NombreCompleto.ToString();
                txtDojo.Text = p.Dojo.Nombre;
                txtCategoria.Text = p.Categoria.Descripcion;
                txtModalidad.Text = p.TipoPelea.Descripcion;
                txtGenero.Text = p.Genero.GeneroPersona;
                txtAltura.Text = (Convert.ToDecimal(p.Altura) / 100).ToString() + "M";
                txtEdad.Text = p.Edad.ToString();
                txtPeso.Text = p.Peso.ToString() + "KG";
                txtCantidadPeleas.Text = p.CantidadPeleas.ToString();
                string rutaImagen = Path.Combine(Server.MapPath("~/Fotos/"), id.ToString() + ".jpg");

                if (File.Exists(rutaImagen))
                {
                    string url = Path.Combine(Server.MapPath("~/Fotos/"), id.ToString() + ".jpg");
                    btnTooltip.Attributes["title"] = $"<img src='{url}' alt='Imagen'>";
                }
                else
                {
                    string url = Path.Combine(Server.MapPath("~/Fotos/"), "default_picture.jpg");
                    btnTooltip.Attributes["title"] = $"<img src='{url}' alt='Imagen'>";
                }
                ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalPeleador = new bootstrap.Modal(document.getElementById('modalPeleador')); modalPeleador.show();</script>", false);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnAbrirModalEliminarPeleador_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                Session["IdPeleadorEliminar"] = Convert.ToInt32(id);
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
                PeleadoresNegocio pn = new PeleadoresNegocio();
                int id = Convert.ToInt32(Session["IdPeleadorEliminar"]);
                if (id>0)
                {
                    pn.eliminarPeleador(id);
                    Session["listaPeleadores"] = null;
                    Session["IdPeleadorEliminar"] = null;
                    Response.Redirect("Peleadores.aspx");
                }
                else
                {
                    Session["IdPeleadorEliminar"] = null;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "$('#modalEliminar').modal('hide');", true);
                    Response.Redirect("Peleadores.aspx");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {

        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("PeleadoresABM.aspx?a=1");
        }
    }
}