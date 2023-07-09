using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Office.Interop.Excel;
using dominios;
using negocios;
using System.IO;
using DataTable = System.Data.DataTable;
using OfficeOpenXml;
using OfficeOpenXml.Table;
using TableStyles = Microsoft.Office.Interop.Excel.TableStyles;

namespace Gimnasio_Peleas.Formularios.Peleas
{
    public partial class Peleas : System.Web.UI.Page
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

                MaintainScrollPositionOnPostBack = true;

                if (!IsPostBack || Session["listaPeleas"] == null)
                {
                    PeleasNegocio pn = new PeleasNegocio();
                    Session["listaPeleas"] = null;
                    Session.Add("listaPeleas", pn.obtenerPeleasTodas());
                    dgvPeleas.DataSource = Session["listaPeleas"];
                    dgvPeleas.DataBind();
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
                    Response.Redirect("PeleasABM.aspx?a=1");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalNoHayEventoActivo = " +
                        "new bootstrap.Modal(document.getElementById('modalNoHayEventoActivo')); modalNoHayEventoActivo.show();</script>", false);
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
                Response.Redirect("PeleasABM.aspx?a=2&id=" + id);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
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

                txtPeleador1.Text = p.Peleador1.NombreCompleto;
                txtTeam1.Text = p.Peleador1.Dojo.Nombre;
                txtCategoria1.Text = p.Peleador1.Categoria.Descripcion;
                txtModalidad1.Text = p.Peleador1.TipoPelea.Descripcion;
                txtPeso1.Text = p.Peleador1.Peso.ToString() + "KG";
                txtEdad1.Text = p.Peleador1.Edad.ToString();
                txtAltura1.Text = (Convert.ToDecimal(p.Peleador1.Altura) / 100).ToString() + "M";
                txtPeleas1.Text = p.Peleador1.CantidadPeleas.ToString();

                txtPeleador2.Text = p.Peleador2.NombreCompleto;
                txtTeam2.Text = p.Peleador2.Dojo.Nombre;
                txtCategoria2.Text = p.Peleador2.Categoria.Descripcion;
                txtModalidad2.Text = p.Peleador2.TipoPelea.Descripcion;
                txtPeso2.Text = p.Peleador2.Peso.ToString() + "KG";
                txtEdad2.Text = p.Peleador2.Edad.ToString();
                txtAltura2.Text = (Convert.ToDecimal(p.Peleador2.Altura) / 100).ToString() + "M";
                txtPeleas2.Text = p.Peleador2.CantidadPeleas.ToString();

                txtObservaciones.Text = p.Observaciones;

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
        protected void btnModalPeleasAExcelXEvento_Click(object sender, EventArgs e)
        {
            try
            {
                EventosNegocio en = new EventosNegocio();
                PeleasNegocio pn = new PeleasNegocio();

                if (ddlEventos.Items.Count == 0)
                {
                    DataTable Eventos = en.ObtenerEventos();
                    ddlEventos.DataSource = Eventos;
                    ddlEventos.DataTextField = "Evento";
                    ddlEventos.DataValueField = "Id";
                    ddlEventos.DataBind();

                    ddlEventos.Items.Insert(0, new ListItem("Todos los eventos", "0"));
                }
                ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalPeleasAExcelXEvento = " +
                    "new bootstrap.Modal(document.getElementById('modalPeleasAExcelXEvento')); modalPeleasAExcelXEvento.show();</script>", false);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnModalPeleasAExcelConHorario_Click(object sender, EventArgs e)
        {

        }

        protected void btnGenerarExcelXEvento_Click(object sender, EventArgs e)
        {
            try
            {
                PeleasNegocio pn = new PeleasNegocio();
                DataTable dt = null;

                if (Convert.ToInt32(ddlEventos.SelectedValue)==0)
                {
                    dt = (DataTable)pn.ExportarPeleasTodasAExcel();
                    GenerarExcelPeleas(dt);
                }
                else
                {
                    dt = (DataTable)pn.ExportarPeleasXEventoAExcel(Convert.ToInt32(ddlEventos.SelectedValue));
                    GenerarExcelPeleas(dt);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void GenerarExcelPeleas(DataTable dt)
        {
            try
            {
                string fileName = "ListaPeleas.xlsx";

                ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

                using (ExcelPackage package = new ExcelPackage())
                {
                    ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("Hoja1");

                    // Establecer encabezados de columna
                    for (int i = 0; i < dt.Columns.Count; i++)
                    {
                        worksheet.Cells[1, i + 1].Value = dt.Columns[i].ColumnName;
                    }

                    // Establecer valores de celdas
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        for (int j = 0; j < dt.Columns.Count; j++)
                        {
                            worksheet.Cells[i + 2, j + 1].Value = dt.Rows[i][j].ToString();
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