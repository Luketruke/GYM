﻿<%@ Page Language="C#" MasterPageFile="~/Site.Mobile.Master" AutoEventWireup="true" CodeBehind="Dojos.aspx.cs" Inherits="Gimnasio_Peleas.Formularios.Dojos.Dojos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--CSS--%>
    <link href="~/Stylesheets/dojos.css" rel="stylesheet" />

    <script type="text/javascript">
        document.title = 'Teams';
    </script>

    <div class="container">
        <div class="row" style="margin-bottom: 8px;">
            <div class="col-md-12">
                <div class="widget custom-border">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="element-container" style="display: flex; align-items: center; justify-content: flex-end; gap: 10px;">
                                <input type="text" id="txtBusqueda" class="form-control" onkeyup="filterGrid(event)" placeholder="Filtrar teams..." />
                                <input type="hidden" id="txtFiltro" runat="server" />
                                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                    <asp:LinkButton ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success btn-lg" onkeypress="return disableEnterKey(event)" data-bs-toggle="tooltip" ToolTip="Nuevo team">
        <i class="fa-solid fa-plus"></i>
                                    </asp:LinkButton>
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
                    <asp:GridView runat="server" ID="dgvDojos" DataKeyNames="Id" CssClass="table table-striped table-white" AutoGenerateColumns="false" ClientIDMode="Static">
                        <Columns>
                            <asp:BoundField HeaderText="Team" DataField="Nombre" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="Profesor" DataField="NombreProfesor" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="Contacto" DataField="TelefonoDojo" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="Direccion" DataField="Direccion.DireccionCompleta" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:TemplateField HeaderText="Acción" ItemStyle-Width="150" HeaderStyle-Width="150" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle">
                                <ItemTemplate>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <asp:LinkButton ID="btnAbrirModalDojo" runat="server" OnClick="btnAbrirModalDojo_Click" data-bs-toggle="tooltip" data-bs-target="#modalDojo" ToolTip="Detalle" CssClass="btn btn-info me-1">
            <i class="fa-solid fa-search"></i>
                                        </asp:LinkButton>

                                        <asp:LinkButton ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-success me-1" data-bs-toggle="tooltip" ToolTip="Modificar">
            <i class="fa-solid fa-pen-to-square"></i>
                                        </asp:LinkButton>

                                        <asp:LinkButton ID="btnAbrirModalEliminarDojo" runat="server" OnClick="btnAbrirModalEliminarDojo_Click" data-bs-toggle="tooltip" CssClass="btn btn-danger" ToolTip="Eliminar" ClientIDMode="Static">
            <i class="fa-solid fa-trash"></i>
                                        </asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle VerticalAlign="Middle" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <%--Modales--%>

    <div class="modal fade" id="modalDojo" tabindex="-1" role="dialog" aria-labelledby="miModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="miModalLabel">Detalle</h5>
                </div>
                <div class="modal-body">
                    <label for="txtNombre" class="form-label">Team</label>
                    <asp:TextBox runat="server" ID="txtNombre" class="form-control" disabled="" style="display: flex; align-items: center; margin-bottom: 5px;"/>

                    <label for="txtProfesor" class="form-label">Profesor</label>
                    <asp:TextBox runat="server" ID="txtProfesor" class="form-control" disabled="" style="display: flex; align-items: center; margin-bottom: 5px;"/>

                    <label for="txtTelefonoProfesor" class="form-label">Telefono del profesor</label>
                    <asp:TextBox runat="server" ID="txtTelefonoProfesor" class="form-control" disabled="" style="display: flex; align-items: center; margin-bottom: 5px;"/>

                    <label for="txtTelefonoDojo" class="form-label">Telefono del team</label>
                    <asp:TextBox runat="server" ID="txtTelefonoDojo" class="form-control" disabled="" style="display: flex; align-items: center; margin-bottom: 5px;"/>

                    <label for="txtDireccion" class="form-label">Direccion</label>
                    <asp:TextBox runat="server" ID="txtDireccion" class="form-control" disabled="" style="display: flex; align-items: center; margin-bottom: 5px;"/>

                    <label for="txtObservaciones" class="form-label">Observaciones</label>
                    <asp:TextBox runat="server" ID="txtObservaciones" MaxLength="255" class="form-control" TextMode="MultiLine" Rows="2" disabled="" style="display: flex; align-items: center; margin-bottom: 5px;"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalEliminar" tabindex="-1" role="dialog" aria-labelledby="modalEliminarLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalEliminarLabel">Confirmar eliminación</h5>
                </div>
                <div class="modal-body">
                    ¿Estás seguro de que deseas eliminar el dojo?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" CssClass="btn btn-success" />
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
            var modal = document.getElementById('modalEliminar');
            var bootstrapModal = new bootstrap.Modal(modal);
            bootstrapModal.hide();
        }

        function mostrarAlertaPeleadoresRelacionados() {
            alert('El dojo tiene peleadores relacionados, no puede eliminarlo!');
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
            var valor = '<%= Session["FiltroDojos"] != null ? Session["FiltroDojos"].ToString() : string.Empty %>';
            txtBusqueda.value = valor;
            filterGrid();
        }

        function setFiltroDojos(valor) {
            var txtBusqueda = document.getElementById("txtBusqueda");
            txtBusqueda.value = valor;
            filterGrid();
        }

        function filterGrid() {
            var input, filter, table, tr, td, i, j, txtValue;
            input = document.getElementById("txtBusqueda");
            filter = normalize(input.value.toUpperCase());
            table = document.getElementById("dgvDojos");
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

    <script>
        var modal = document.getElementById('modalDojo');
        var header = modal.querySelector('.modal-header');
        var isDragging = false;
        var dragStartX;
        var dragStartY;
        var initialModalTop;
        var initialModalLeft;

        header.addEventListener('mousedown', dragStart);

        document.addEventListener('mousemove', function (event) {
            if (isDragging) {
                event.preventDefault(); // Evitar el arrastre predeterminado
                var dx = event.clientX - dragStartX;
                var dy = event.clientY - dragStartY;
                modal.style.top = (initialModalTop + dy) + 'px';
                modal.style.left = (initialModalLeft + dx) + 'px';
            }
        });

        document.addEventListener('mouseup', function () {
            isDragging = false;
        });

        function dragStart(event) {
            // Verificar si el clic proviene del área del header
            if (event.target === header || event.target.parentNode === header) {
                isDragging = true;
                dragStartX = event.clientX;
                dragStartY = event.clientY;
                initialModalTop = modal.offsetTop;
                initialModalLeft = modal.offsetLeft;

                // Evitar la selección de texto durante el arrastre
                document.body.style.userSelect = 'none';
                document.body.style.webkitUserSelect = 'none';
                document.body.style.mozUserSelect = 'none';
                document.body.style.msUserSelect = 'none';
            }
        }
    </script>

</asp:Content>
