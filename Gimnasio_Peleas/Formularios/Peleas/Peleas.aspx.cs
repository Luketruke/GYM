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
            Response.Redirect("PeleasABM.aspx?a=1");
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

                //Desarrollar

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

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            try
            {
                PeleasNegocio pn = new PeleasNegocio();
                DataTable dt = (DataTable)pn.ExportarPeleasAExcel();
                string desktopPath = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
                string fileName = "ListaPeleas.xlsx";
                string filePath = Path.Combine(desktopPath, fileName);

                ExportToExcel(dt, filePath);
            }
            catch (Exception ex)
            {

            }
        }
        private void ExportToExcel(System.Data.DataTable dataTable, string filePath)
        {
            try
            {
                Application excelApp = new Application();

                Workbook workbook = excelApp.Workbooks.Add();
                Worksheet worksheet = workbook.ActiveSheet;

                for (int i = 0; i < dataTable.Columns.Count; i++)
                {
                    worksheet.Cells[1, i + 1] = dataTable.Columns[i].ColumnName;
                }

                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    for (int j = 0; j < dataTable.Columns.Count; j++)
                    {
                        worksheet.Cells[i + 2, j + 1] = dataTable.Rows[i][j].ToString();
                    }
                }

                workbook.SaveAs(filePath);

                workbook.Close();
                excelApp.Quit();
            }
            catch (Exception ex)
            {
            }
        }
    }
}