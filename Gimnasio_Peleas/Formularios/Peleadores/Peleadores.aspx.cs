using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using dominios;
using negocios;
using System.Data;
using OfficeOpenXml;

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

                MaintainScrollPositionOnPostBack = true;

                if (!IsPostBack || Session["listaPeleadores"] == null)
                {
                    if (usuario.TipoUsuario.Id == 1)
                    {
                        PeleadoresNegocio pn = new PeleadoresNegocio();
                        Session["listaPeleadores"] = null;
                        Session.Add("listaPeleadores", pn.obtenerPeleadoresTodos());
                        dgvPeleadores.DataSource = Session["listaPeleadores"];
                        dgvPeleadores.DataBind();
                    }
                    else
                    {
                        PeleadoresNegocio pn = new PeleadoresNegocio();
                        Session["listaPeleadores"] = null;
                        Session.Add("listaPeleadores", pn.obtenerPeleadoresTodosXDojo(usuario.Dojo.Id));
                        dgvPeleadores.DataSource = Session["listaPeleadores"];
                        dgvPeleadores.DataBind();
                    }
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
                txtObservaciones.Text = p.Observaciones;
                string rutaImagen = Path.Combine(Server.MapPath("../../Fotos/"), id.ToString() + ".jpg");

                if (File.Exists(rutaImagen))
                {
                    string url = "../../Fotos/" + id.ToString() + ".jpg";
                    btnTooltip.Attributes["title"] = $"<img src='{url}' alt='Imagen'>";
                }
                else
                {
                    string url = "../../Fotos/default_picture.jpg";
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
                    if (!pn.VerificarPeleasAlEliminarPeleadores(id))
                    {
                        pn.eliminarPeleador(id);
                        Session["listaPeleadores"] = null;
                        Session["IdPeleadorEliminar"] = null;
                        Response.Redirect("Peleadores.aspx");
                    }
                    else
                    {
                        Session["IdDojoEliminar"] = null;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "CerrarModal", "cerrarModal();", true);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "MostrarAlerta", "mostrarAlertaPeleasRelacionadas();", true);
                    }
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
            try
            {
                Response.Redirect("PeleadoresABM.aspx?a=1");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnExcel_Click(object sender, EventArgs e)
        {
            try
            {
                PeleadoresNegocio pn = new PeleadoresNegocio();
                DataTable dt = (DataTable)pn.ExportarPeleadoresAExcel();
                string fileName = "ListaPeleadores.xlsx";

                ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

                using (ExcelPackage package = new ExcelPackage())
                {
                    ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("Sheet1");

                    for (int i = 0; i < dt.Columns.Count; i++)
                    {
                        worksheet.Cells[1, i + 1].Value = dt.Columns[i].ColumnName;
                    }

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        for (int j = 0; j < dt.Columns.Count; j++)
                        {
                            worksheet.Cells[i + 2, j + 1].Value = dt.Rows[i][j].ToString();
                        }
                    }

                    byte[] excelBytes = package.GetAsByteArray();

                    Response.Clear();
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName);
                    Response.BinaryWrite(excelBytes);
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}