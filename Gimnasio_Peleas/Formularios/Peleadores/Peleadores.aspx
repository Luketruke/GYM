<%@ Page Language="C#" MasterPageFile="~/Site.Mobile.Master" AutoEventWireup="true" CodeBehind="Peleadores.aspx.cs" Inherits="Gimnasio_Peleas.Formularios.Peleadores.Peleadores" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--CSS--%>
    <link href="~/Stylesheets/peleadores.css" rel="stylesheet" />

    <script type="text/javascript">
        document.title = 'Peleadores';
    </script>

    <div class="container">
        <div class="row" style="margin-bottom: 8px;">
            <div class="col-md-12">
                <div class="widget custom-border">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="element-container" style="display: flex; align-items: center; justify-content: flex-end; gap: 10px;">
                                <input type="text" id="txtBusqueda" class="form-control" onkeyup="filterGrid(event)" placeholder="Filtrar peleadores..." />
                                <input type="hidden" id="txtFiltro" runat="server" />
                                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                    <asp:LinkButton ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success btn-lg" onkeypress="return disableEnterKey(event)" data-bs-toggle="tooltip" ToolTip="Nuevo peleador">
        <i class="fa-solid fa-plus"></i>
                                    </asp:LinkButton>
                                </div>
                                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                    <asp:LinkButton ID="btnModalPeleadoresAExcelXEvento" OnClick="btnModalPeleadoresAExcelXEvento_Click" runat="server" CssClass="btn btn-primary btn-lg" onkeypress="return disableEnterKey(event)" data-bs-toggle="tooltip" ToolTip="Exportar a Excel">
        <i class="fa-solid fa-file-excel"></i>                                    
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
                    <asp:GridView runat="server" ID="dgvPeleadores" DataKeyNames="Id" CssClass="table table-striped table-white" AutoGenerateColumns="false" ClientIDMode="Static">
                        <Columns>
                            <asp:BoundField HeaderText="Nombre" DataField="NombreCompleto" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="Categoría" DataField="Categoria.Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="Modalidad" DataField="TipoPelea.Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="Cantidad de Peleas" DataField="CantidadPeleas" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="Team" DataField="Dojo.Nombre" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:TemplateField HeaderText="Acción" ItemStyle-Width="150" HeaderStyle-Width="150" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle">
                                <ItemTemplate>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <asp:LinkButton ID="btnAbrirModalPeleador" runat="server" Text="Abrir Modal" OnClick="btnAbrirModalPeleador_Click" data-bs-toggle="tooltip" ToolTip="Detalle" CssClass="btn btn-info me-1">
            <i class="fa-solid fa-search"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-success me-1" data-bs-toggle="tooltip" ToolTip="Modificar">
            <i class="fa-solid fa-pen-to-square"></i>
                                        </asp:LinkButton>

                                        <asp:LinkButton ID="btnAbrirModalEliminarPeleador" runat="server" OnClick="btnAbrirModalEliminarPeleador_Click" data-bs-toggle="tooltip" CssClass="btn btn-danger" ToolTip="Eliminar" ClientIDMode="Static">
            <i class="fa-solid fa-trash"></i>
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

    <!-- Modales -->

    <div class="modal fade" id="modalPeleador" tabindex="-1" role="dialog" aria-labelledby="miModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="miModalLabel" runat="server">Informacion del peleador</h5>
                    <button type="button" id="btnTooltip" class="btn btn-info" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-html="true" runat="server">
                        <i class="fa-solid fa-image"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <label for="txtDojo" class="form-label">Team</label>
                            <asp:TextBox runat="server" ID="txtDojo" class="form-control" disabled="" Style="display: flex; align-items: center; margin-bottom: 5px;" />

                            <label for="txtCategoria" class="form-label">Categoria</label>
                            <asp:TextBox runat="server" ID="txtCategoria" class="form-control" disabled="" Style="display: flex; align-items: center; margin-bottom: 5px;" />

                            <label for="txtModalidad" class="form-label">Modalidad</label>
                            <asp:TextBox runat="server" ID="txtModalidad" class="form-control" disabled="" Style="display: flex; align-items: center; margin-bottom: 5px;" />

                            <div class="mb-0" style="display: flex; align-items: center;">
                                <div style="flex: 1;">
                                    <label for="txtPeso" class="form-label">Peso</label>
                                    <asp:TextBox runat="server" ID="txtPeso" class="form-control" disabled="" Style="display: flex; align-items: center; margin-bottom: 5px;" />
                                </div>
                                <div style="width: 10px;"></div>
                                <div style="flex: 1;">
                                    <label for="txtEdad" class="form-label">Edad</label>
                                    <asp:TextBox runat="server" ID="txtEdad" class="form-control" disabled="" Style="display: flex; align-items: center; margin-bottom: 5px;" />
                                </div>
                                <div style="width: 10px;"></div>
                                <div style="flex: 1;">
                                    <label for="txtAltura" class="form-label">Altura</label>
                                    <asp:TextBox runat="server" ID="txtAltura" class="form-control" disabled="" Style="display: flex; align-items: center; margin-bottom: 5px;" />
                                </div>
                                <div style="width: 10px;"></div>
                                <div style="flex: 1;">
                                    <label for="txtCantidadPeleas" class="form-label">Peleas</label>
                                    <asp:TextBox runat="server" ID="txtCantidadPeleas" class="form-control" disabled="" Style="display: flex; align-items: center; margin-bottom: 5px;" />
                                </div>
                            </div>
                            <label for="txtGenero" class="form-label">Genero</label>
                            <asp:TextBox runat="server" ID="txtGenero" class="form-control" disabled="" Style="display: flex; align-items: center; margin-bottom: 5px;" />

                            <label for="txtObservaciones" class="form-label">Observaciones</label>
                            <asp:TextBox runat="server" ID="txtObservaciones" MaxLength="255" class="form-control" TextMode="MultiLine" Rows="2" disabled="" Style="display: flex; align-items: center; margin-bottom: 5px;" />
                        </div>
                    </div>
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
                    ¿Estás seguro de que deseas eliminar el peleador?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalNoHayEventoActivo" tabindex="-1" role="dialog" aria-labelledby="modalNoHayEventoActivoLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body" style="text-align: center; margin-bottom: -14px">
                    <div class="alert alert-danger" role="alert">
                        <b>No puede agregar un nuevo peleador debido a que no hay un evento activo.</b>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalPeleadoresAExcelXEvento" tabindex="-1" role="dialog" aria-labelledby="modalPeleadoresAExcelXEventoLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalPeleadoresAExcelXEventoLabel">Exportar Peleadores X Evento a Excel</h5>
                </div>
                <div class="modal-body">
                    <div>
                        <label for="ddlEventos" class="form-label">Evento</label>
                        <asp:DropDownList ID="ddlEventos" CssClass="form-select" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button ID="btnGenerarExcelXEvento" OnClick="btnGenerarExcelXEvento_Click" runat="server" Text="Generar" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
    </div>

    <%--Modales--%>

    <script>
        function cerrarModal() {
            var modal = document.getElementById('modalEliminar');
            var bootstrapModal = new bootstrap.Modal(modal);
            bootstrapModal.hide();
        }

        function mostrarAlertaPeleasRelacionadas() {
            alert('El peleador tiene peleas relacionadas, no puede eliminarlo!');
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
            var valor = '<%= Session["FiltroPeleadores"] != null ? Session["FiltroPeleadores"].ToString() : string.Empty %>';
            txtBusqueda.value = valor;
            filterGrid();
        }

        function setFiltroPeleadores(valor) {
            var txtBusqueda = document.getElementById("txtBusqueda");
            txtBusqueda.value = valor;
            filterGrid();
        }

        function filterGrid() {
            var input, filter, table, tr, td, i, j, txtValue;
            input = document.getElementById("txtBusqueda");
            filter = normalize(input.value.toUpperCase());
            table = document.getElementById("dgvPeleadores");
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

        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        })
    </script>
</asp:Content>
