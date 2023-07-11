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
using System.Globalization;

namespace Gimnasio_Peleas.Formularios.Eventos
{
    //Logica para los eventos
    //IdEstadoEvento = 1 = Pendiente
    //IdEstadoEvento = 1 = Finalizado
    public partial class Eventos : System.Web.UI.Page
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

                MaintainScrollPositionOnPostBack = true; //La pagina scrollea a donde estaba luego de un postback

                if (IsPostBack)
                {
                    var filtroEventos = Session["FiltroUsuarios"] != null ? Session["FiltroEventos"].ToString() : string.Empty;
                    Session.Remove("FiltroEventos");
                    ClientScript.RegisterStartupScript(this.GetType(), "SetFiltroEventos", $"setFiltroEventos('{filtroEventos}');", true);
                }

                if (!IsPostBack || Session["listaEventos"] == null)
                {
                    EventosNegocio en = new EventosNegocio();
                    Session["listaEventos"] = null;
                    Session.Remove("FiltroEventos");
                    Session.Add("listaEventos", en.obtenerEventosTodos());
                    dgvEventos.DataSource = Session["listaEventos"];
                    dgvEventos.DataBind();
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

                if (!en.VerificarHayEventoActivo())
                {
                    //Cargo la hora a las variables agregar
                    txtFechaAgregarModificar.Text = DateTime.Now.ToString("yyyy-MM-dd");
                    txtHoraAgregarModificar.Text = DateTime.Now.ToString("HH:mm");
                    btnAgregarEvento.Visible = true;

                    Session["FiltroEventos"] = txtFiltro.Value.ToString();
                    ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalAgregarModificarEvento = " +
                        "new bootstrap.Modal(document.getElementById('modalAgregarModificarEvento')); modalAgregarModificarEvento.show();</script>", false);
                }
                else
                {
                    Session["FiltroEventos"] = txtFiltro.Value.ToString();
                    ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalHayEventoPendiente = " +
                        "new bootstrap.Modal(document.getElementById('modalHayEventoPendiente')); modalHayEventoPendiente.show();</script>", false);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnAbrirModalFinalizarEvento_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                Session["IdEventoFinalizar"] = Convert.ToInt32(id);

                Session["FiltroEventos"] = txtFiltro.Value.ToString();
                ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalFinalizarEvento = " +
                    "new bootstrap.Modal(document.getElementById('modalFinalizarEvento')); modalFinalizarEvento.show();</script>", false);
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
                int id = Convert.ToInt32(Session["IdEventoFinalizar"]);
                if (id>0)
                {
                    pn.eliminarPelea(id);
                    Session["listaEventos"] = null;
                    Session["IdEventoFinalizar"] = null;
                    Response.Redirect("Eventos.aspx");
                }
                else
                {
                    Session["IdEventoFinalizar"] = null;

                    Session["FiltroEventos"] = txtFiltro.Value.ToString();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "$('#modalFinalizarEvento').modal('hide');", true);
                    Response.Redirect("Eventos.aspx");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnAbrirModalModificarEvento_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                EventosNegocio en = new EventosNegocio();
                Evento ev = en.obtenerEventoXId(Convert.ToInt32(id));
                Session["IdEventoModificar"] = Convert.ToInt32(id);
                btnModificarEvento.Visible = true;

                txtDescripcionAgregarModificar.Text = ev.Descripcion;
                txtObservacionesAgregarModificar.Text = ev.Observaciones;
                txtFechaAgregarModificar.Text = ev.FechaEvento.ToString("yyyy-MM-dd");
                txtHoraAgregarModificar.Text = ev.FechaEvento.ToString("HH:mm");

                Session["FiltroEventos"] = txtFiltro.Value.ToString();
                ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalAgregarModificarEvento = " +
                    "new bootstrap.Modal(document.getElementById('modalAgregarModificarEvento')); modalAgregarModificarEvento.show();</script>", false);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnAbrirModalDetalleEvento_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                EventosNegocio en = new EventosNegocio();
                Evento ev = en.obtenerEventoXId(Convert.ToInt32(id));

                txtDescripcionDetalle.Text = ev.Descripcion;
                txtFechaEventoDetalle.Text = ev.FechaEvento.ToString();
                txtEstadoEventoDetalle.Text = ev.EstadoEvento;
                txtObservacionesDetalle.Text = ev.Observaciones;

                Session["FiltroEventos"] = txtFiltro.Value.ToString();
                ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModal", "<script>var modalEvento = " +
                    "new bootstrap.Modal(document.getElementById('modalEvento')); modalEvento.show();</script>", false);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnAgregarEvento_Click(object sender, EventArgs e)
        {
            try
            {
                EventosNegocio en = new EventosNegocio();
                Evento ev = new Evento();
                ev.Descripcion = txtDescripcionAgregarModificar.Text;
                ev.Observaciones = txtObservacionesAgregarModificar.Text;
                string dateValue = txtFechaAgregarModificar.Text;
                string timeValue = txtHoraAgregarModificar.Text;
                DateTime dateTime = DateTime.ParseExact(dateValue + " " + timeValue, "yyyy-MM-dd HH:mm",
                    CultureInfo.InvariantCulture);
                ev.FechaEvento = dateTime;

                if (en.AgregarEvento(ev) > 0)
                {
                    Response.Redirect("Eventos.aspx");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnFinalizarEvento_Click(object sender, EventArgs e)
        {
            try
            {
                EventosNegocio en = new EventosNegocio();
                int IdEvento = Convert.ToInt32(Session["IdEventoFinalizar"]);
                Session["IdEventoFinalizar"] = null;

                if (en.FinalizarEvento(IdEvento))
                {
                    Response.Redirect("Eventos.aspx");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnModificarEvento_Click(object sender, EventArgs e)
        {
            try
            {
                EventosNegocio en = new EventosNegocio();
                Evento ev = new Evento();
                ev.Id = Convert.ToInt32(Session["IdEventoModificar"]);
                Session["IdEventoModificar"] = null;
                ev.Descripcion = txtDescripcionAgregarModificar.Text;
                ev.Observaciones = txtObservacionesAgregarModificar.Text;
                string dateValue = txtFechaAgregarModificar.Text;
                string timeValue = txtHoraAgregarModificar.Text;
                DateTime dateTime = DateTime.ParseExact(dateValue + " " + timeValue, "yyyy-MM-dd HH:mm",
                    CultureInfo.InvariantCulture);
                ev.FechaEvento = dateTime;

                if (en.ModificarEvento(ev))
                {
                    Response.Redirect("Eventos.aspx");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}