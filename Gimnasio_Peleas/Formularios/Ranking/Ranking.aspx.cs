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

namespace Gimnasio_Peleas.Formularios.Ranking
{
    public partial class Ranking : System.Web.UI.Page
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

                MaintainScrollPositionOnPostBack = true; //La pagina scrollea a donde estaba luego de un postback

                if (IsPostBack)
                {
                    var filtroRaking = Session["FiltroRaking"] != null ? Session["FiltroRaking"].ToString() : string.Empty;
                    Session.Remove("FiltroRaking");
                    ClientScript.RegisterStartupScript(this.GetType(), "SetFiltroRaking", $"setFiltroRaking('{filtroRaking}');", true);
                }

                if (!IsPostBack || Session["listaRanking"] == null)
                {
                    PeleadoresNegocio pn = new PeleadoresNegocio();
                    Session["listaRanking"] = null;
                    Session.Remove("FiltroRanking");
                    Session.Add("listaRanking", pn.obtenerRankingTodo());
                    dgvRanking.DataSource = Session["listaRanking"];
                    dgvRanking.DataBind();
                }
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

                dgvHistorialPeleador.DataSource = pn.obtenerHistorialPeleador(Convert.ToInt32(id));
                dgvHistorialPeleador.DataBind();
    
                ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalHistorialPeleador = new bootstrap.Modal(document.getElementById('modalHistorialPeleador')); modalHistorialPeleador.show();</script>", false);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}