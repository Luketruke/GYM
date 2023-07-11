<%@ Page Language="C#" MasterPageFile="~/Site.Mobile.Master" AutoEventWireup="true" CodeBehind="Eventos.aspx.cs" Inherits="Gimnasio_Peleas.Formularios.Eventos.Eventos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        document.title = 'Eventos';
    </script>

    <div class="container">
        <div class="row" style="margin-bottom: 8px;">
            <div class="col-md-12">
                <div class="widget custom-border">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="element-container" style="display: flex; align-items: center; justify-content: flex-end; gap: 10px;">
                                <input type="text" id="txtBusqueda" class="form-control" onkeyup="filterGrid(event)" placeholder="Filtrar eventos..." />
                                <input type="hidden" id="txtFiltro" runat="server" />
                                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                    <asp:LinkButton ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success btn-lg" onkeypress="return disableEnterKey(event)" data-bs-toggle="tooltip" ToolTip="Nuevo evento">
        <i class="fa-solid fa-plus"></i>
                                    </asp:LinkButton>
                                </div>
                                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <asp:GridView runat="server" ID="dgvEventos" DataKeyNames="Id" CssClass="table table-striped table-white" AutoGenerateColumns="false" ClientIDMode="Static">
                        <Columns>
                            <asp:BoundField HeaderText="Evento" DataField="Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="Fecha" DataField="FechaEvento" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="Estado" DataField="EstadoEvento" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:TemplateField HeaderText="Acción" ItemStyle-Width="150" HeaderStyle-Width="150" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle">
                                <ItemTemplate>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <asp:LinkButton ID="btnAbrirModalDetalleEvento" runat="server" OnClick="btnAbrirModalDetalleEvento_Click" Text="Abrir Modal" data-bs-toggle="tooltip" ToolTip="Detalle" CssClass="btn btn-info me-1">
            <i class="fa-solid fa-search"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnAbrirModalModificarEvento" OnClick="btnAbrirModalModificarEvento_Click" runat="server" CssClass="btn btn-success me-1" data-bs-toggle="tooltip" ToolTip="Modificar">
            <i class="fa-solid fa-pen-to-square"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnAbrirModalFinalizarEvento" runat="server" OnClick="btnAbrirModalFinalizarEvento_Click" data-bs-toggle="tooltip" CssClass="btn btn-danger" ToolTip="Finalizar" ClientIDMode="Static">
            <i class="fa-regular fa-flag"></i>
                                        </asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <%--Modales--%>

    <div class="modal fade" id="modalEvento" tabindex="-1" role="dialog" aria-labelledby="miModalEvento" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="miModalLabel">Evento</h5>
                </div>
                <div class="modal-body">
                    <label for="txtDescripcionDetalle" class="form-label">Evento</label>
                    <asp:TextBox runat="server" ID="txtDescripcionDetalle" class="form-control" disabled="" Style="display: flex; align-items: center; margin-bottom: 5px;" />

                    <label for="txtFechaEventoDetalle" class="form-label">Fecha</label>
                    <asp:TextBox runat="server" ID="txtFechaEventoDetalle" class="form-control" disabled="" Style="display: flex; align-items: center; margin-bottom: 5px;" />

                    <label for="txtEstadoEventoDetalle" class="form-label">Estado</label>
                    <asp:TextBox runat="server" ID="txtEstadoEventoDetalle" class="form-control" disabled="" Style="display: flex; align-items: center; margin-bottom: 5px;" />

                    <label for="txtObservacionesDetalle" class="form-label">Observaciones</label>
                    <asp:TextBox runat="server" ID="txtObservacionesDetalle" MaxLength="255" class="form-control" TextMode="MultiLine" Rows="2" disabled="" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalAgregarModificarEvento" tabindex="-1" role="dialog" aria-labelledby="mimodalAgregarEvento" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-center" id="miModalAgregarLabel">Nuevo evento</h5>
                </div>
                <div class="modal-body">
                    <div class="mb-0">
                        <label for="txtDescripcionAgregarModificar" class="form-label">Nombre</label>
                        <asp:TextBox runat="server" ID="txtDescripcionAgregarModificar" MaxLength="50" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDescripcionAgregarModificar" ErrorMessage="*" ValidationGroup="ValidarEvento" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <div class="mb-0" style="display: flex; align-items: center;">
                        <div style="flex: 1;">
                            <label for="txtFechaAgregarModificar">Fecha</label>
                            <asp:TextBox runat="server" ID="txtFechaAgregarModificar" CssClass="form-control" type="date"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFechaAgregarModificar" ErrorMessage="*" ValidationGroup="ValidarEvento" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                        <div style="width: 10px;"></div>
                        <div style="flex: 1;">
                            <label for="txtHoraAgregarModificar">Hora</label>
                            <asp:TextBox runat="server" ID="txtHoraAgregarModificar" CssClass="form-control" type="time"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtHoraAgregarModificar" ErrorMessage="*" ValidationGroup="ValidarEvento" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="mb-0" style="margin-bottom: 0;">
                        <label for="txtObservacionesAgregarModificar" class="form-label">Observaciones</label>
                        <asp:TextBox runat="server" ID="txtObservacionesAgregarModificar" MaxLength="255" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button runat="server" ID="btnAgregarEvento" ValidationGroup="ValidarEvento" OnClientClick="return validarControles();" OnClick="btnAgregarEvento_Click" Text="Agregar" CssClass="btn btn-success" Visible="false" />
                    <asp:Button runat="server" ID="btnModificarEvento" ValidationGroup="ValidarEvento" OnClientClick="return validarControles();" OnClick="btnModificarEvento_Click" Text="Modificar" CssClass="btn btn-success" Visible="false" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalFinalizarEvento" tabindex="-1" role="dialog" aria-labelledby="modalFinalizarEventoLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalFinalizarEventoLabel">Confirmar finalizacion</h5>
                </div>
                <div class="modal-body" style="text-align: center; margin-bottom: -14px">
                    <div class="alert alert-danger" role="alert">
                        <b>La finalizacion del evento hara que todos los peleadores y peleas relacionadas ya no puedan utilizarce. Solamente podra consultar su informacion a traves de listados.</b>
                        <br />
                        <b>¿Estás seguro que deseas finalizar el evento?</b>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnFinalizarEvento" OnClick="btnFinalizarEvento_Click" runat="server" Text="Aceptar" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalHayEventoPendiente" tabindex="-1" role="dialog" aria-labelledby="modalFinalizarEventoLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body" style="text-align: center; margin-bottom: -14px">
                    <div class="alert alert-danger" role="alert">
                        <b>No puede agregar un nuevo evento debido a que ya hay otro en curso.</b>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <%--Modales--%>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });
        });
    </script>

    <script>
        function cerrarModal() {
            var modal = document.getElementById('modalFinalizarEvento');
            var bootstrapModal = new bootstrap.Modal(modal);
            bootstrapModal.hide();
        }

        function cerrarModal() {
            var modal = document.getElementById('modalAgregarModificarEvento');
            var bootstrapModal = new bootstrap.Modal(modal);
            bootstrapModal.hide();
        }
    </script>

    <script>
        function validarControles() {
            // Obtener los valores de los controles
            var descripcion = document.getElementById('<%= txtDescripcionAgregarModificar.ClientID %>').value;
            var fecha = document.getElementById('<%= txtFechaAgregarModificar.ClientID %>').value;
            var hora = document.getElementById('<%= txtHoraAgregarModificar.ClientID %>').value;

            // Realizar la validación
            if (descripcion.trim() === '' || fecha.trim() === '' || hora.trim() === '') {
                // Mostrar mensaje de error o realizar alguna acción adicional si es necesario
                alert('Por favor, complete todos los campos.');
                return false; // Evitar que el modal se cierre
            }
            return true;
        }
    </script>

    <script>
        function disableEnterKey(e) {
            var key;
            if (window.event)
                key = window.event.keyCode; // Para navegadores antiguos
            else
                key = e.which; // Para navegadores modernos

            if (key === 13) { // 13 es el código de tecla para "Enter"
                return false; // Cancela el comportamiento predeterminado del "Enter"
            }
        }
        document.onkeydown = disableEnterKey; // Intercepta todas las pulsaciones de teclas
    </script>

    <script type="text/javascript">
        function normalize(text) {
            return text.replace(/\s+/g, '');
        }

        window.onload = function () {
            var txtBusqueda = document.getElementById("txtBusqueda");
            var valor = '<%= Session["FiltroEventos"] != null ? Session["FiltroEventos"].ToString() : string.Empty %>';
            txtBusqueda.value = valor;
            filterGrid();
        }

        function setFiltroEventos(valor) {
            var txtBusqueda = document.getElementById("txtBusqueda");
            txtBusqueda.value = valor;
            filterGrid();
        }

        function filterGrid() {
            var input, filter, table, tr, td, i, j, txtValue;
            input = document.getElementById("txtBusqueda");
            filter = normalize(input.value.toUpperCase());
            table = document.getElementById("dgvEventos");
            tr = table.getElementsByTagName("tr");

            for (i = 1; i < tr.length; i++) {
                var found = false;
                for (j = 0; j < tr[i].cells.length; j++) {
                    td = tr[i].cells[j];
                    if (td) {
                        txtValue = normalize(td.textContent || td.innerText).toUpperCase();
                        if (txtValue.indexOf(filter) > -1) {
                            found = true;
                            break;
                        }
                    }
                }
                if (found) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }

            // Guardar el valor del filtro en el campo oculto
            var filtroInput = document.getElementById('<%= txtFiltro.ClientID %>');
            filtroInput.value = input.value;
        }
    </script>
</asp:Content>
