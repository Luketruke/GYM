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
using OfficeOpenXml.Table;

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

                MaintainScrollPositionOnPostBack = true; //La pagina scrollea a donde estaba luego de un postback

                if (IsPostBack)
                {
                    var filtroPeleadores = Session["FiltroPeleadores"] != null ? Session["FiltroPeleadores"].ToString() : string.Empty;
                    Session.Remove("FiltroPeleadores");
                    ClientScript.RegisterStartupScript(this.GetType(), "SetFiltroPeleadores", $"setFiltroPeleadores('{filtroPeleadores}');", true);
                }

                if (!IsPostBack || Session["listaPeleadores"] == null)
                {
                    if (usuario.TipoUsuario.Id == 1)
                    {
                        PeleadoresNegocio pn = new PeleadoresNegocio();
                        Session["listaPeleadores"] = null;
                        Session.Remove("FiltroPeleadores");
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

                Session["FiltroPeleadores"] = txtFiltro.Value.ToString();
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

                Session["FiltroPeleadores"] = txtFiltro.Value.ToString();
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

                        Session["FiltroPeleadores"] = txtFiltro.Value.ToString();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "CerrarModal", "cerrarModal();", true);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "MostrarAlerta", "mostrarAlertaPeleasRelacionadas();", true);
                    }
                }
                else
                {
                    Session["IdDojoEliminar"] = null;

                    Session["FiltroPeleadores"] = txtFiltro.Value.ToString();
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
                EventosNegocio en = new EventosNegocio();
                if (en.VerificarHayEventoActivo())
                {
                    Response.Redirect("PeleadoresABM.aspx?a=1");
                }
                else
                {
                    Session["FiltroPeleadores"] = txtFiltro.Value.ToString();
                    ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalNoHayEventoActivo = " +
                        "new bootstrap.Modal(document.getElementById('modalNoHayEventoActivo')); modalNoHayEventoActivo.show();</script>", false);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        protected void btnModalPeleadoresAExcelXEvento_Click(object sender, EventArgs e)
        {
            try
            {
                EventosNegocio en = new EventosNegocio();

                if (ddlEventos.Items.Count == 0)
                {
                    DataTable Eventos = en.ObtenerEventos();
                    ddlEventos.DataSource = Eventos;
                    ddlEventos.DataTextField = "Evento";
                    ddlEventos.DataValueField = "Id";
                    ddlEventos.DataBind();

                    ddlEventos.Items.Insert(0, new ListItem("Todos los eventos", "0"));
                }
                Session["FiltroPeleadores"] = txtFiltro.Value.ToString();
                ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalPeleadoresAExcelXEvento = " +
                    "new bootstrap.Modal(document.getElementById('modalPeleadoresAExcelXEvento')); modalPeleadoresAExcelXEvento.show();</script>", false);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnGenerarExcelXEvento_Click(object sender, EventArgs e)
        {
            try
            {
                PeleadoresNegocio pn = new PeleadoresNegocio();
                DataTable dt = null;

                if (Convert.ToInt32(ddlEventos.SelectedValue)==0)
                {
                    dt = (DataTable)pn.ExportarPeleadoresTodosAExcel();
                    GenerarExcelPeleadores(dt);
                }
                else
                {
                    dt = (DataTable)pn.ExportarPeleadoresXEventoAExcel(Convert.ToInt32(ddlEventos.SelectedValue));
                    GenerarExcelPeleadores(dt);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void GenerarExcelPeleadores(DataTable dt)
        {
            try
            {
                string fileName = "ListaPeleadores.xlsx";

                ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

                using (ExcelPackage package = new ExcelPackage())
                {
                    ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("Hoja1");

                    // Establecer encabezados de columna y centrarlos
                    for (int i = 0; i < dt.Columns.Count; i++)
                    {
                        worksheet.Cells[1, i + 1].Value = dt.Columns[i].ColumnName;
                        worksheet.Cells[1, i + 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                    }

                    // Establecer valores de celdas y centrar el contenido
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        for (int j = 0; j < dt.Columns.Count; j++)
                        {
                            worksheet.Cells[i + 2, j + 1].Value = dt.Rows[i][j].ToString();
                            worksheet.Cells[i + 2, j + 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                        }
                    }

                    // Crear tabla Excel y dar formato de tabla
                    ExcelRange tableRange = worksheet.Cells[1, 1, dt.Rows.Count + 1, dt.Columns.Count];
                    ExcelTable excelTable = worksheet.Tables.Add(tableRange, "Table1");
                    excelTable.TableStyle = OfficeOpenXml.Table.TableStyles.Medium2;

                    // Ajustar el ancho de las columnas automáticamente
                    worksheet.Cells[worksheet.Dimension.Address].AutoFitColumns();

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