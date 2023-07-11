<%@ Page Language="C#" MasterPageFile="~/Site.Mobile.Master" AutoEventWireup="true" CodeBehind="Peleas.aspx.cs" Inherits="Gimnasio_Peleas.Formularios.Peleas.Peleas" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--CSS--%>
    <link href="~/Stylesheets/peleas.css" rel="stylesheet" />

    <script type="text/javascript">
        document.title = 'Peleas';
    </script>

    <div class="container">
        <div class="row" style="margin-bottom: 8px;">
            <div class="col-md-12">
                <div class="widget custom-border">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="element-container" style="display: flex; align-items: center; justify-content: flex-end; gap: 10px;">
                                <input type="text" id="txtBusqueda" class="form-control" onkeyup="filterGrid(event)" placeholder="Filtrar peleas..." />
                                <input type="hidden" id="txtFiltro" runat="server" />
                                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                    <asp:LinkButton ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success btn-lg" onkeypress="return disableEnterKey(event)" data-bs-toggle="tooltip" ToolTip="Nueva pelea">
        <i class="fa-solid fa-plus"></i>
                                    </asp:LinkButton>
                                </div>
                                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                    <asp:LinkButton ID="btnModalPeleasAExcelXEvento" OnClick="btnModalPeleasAExcelXEvento_Click" runat="server" CssClass="btn btn-primary btn-lg" onkeypress="return disableEnterKey(event)" data-bs-toggle="tooltip" ToolTip="Peleas X Evento a Excel">
        <i class="fa-solid fa-file-excel"></i>                                
                                    </asp:LinkButton>
                                </div>

                                <%---------------Por si quieren un excel con horarios, usar este boton.--------------------%>
                                <%--<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                    <asp:LinkButton ID="btnModalPeleasAExcelConHorario" OnClick="btnModalPeleasAExcelConHorario_Click" runat="server" CssClass="btn btn-primary btn-lg" onkeypress="return disableEnterKey(event)" data-bs-toggle="tooltip" ToolTip="Peleas con Horario a Excel">
        <i class="fa-solid fa-file-arrow-down"></i>                                       
                                    </asp:LinkButton>
                                </div>--%>
                                <%----------------------------------------------------------------------------------------%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <asp:GridView runat="server" ID="dgvPeleas" DataKeyNames="Id" CssClass="table table-striped table-white" AutoGenerateColumns="false" ClientIDMode="Static">
                        <Columns>
                            <asp:BoundField HeaderText="#" DataField="Codigo" ItemStyle-Width="60" HeaderStyle-Width="60" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="Rincon Rojo" DataField="Peleador1.NombreCompleto" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="Team" DataField="Peleador1.Dojo.Nombre" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="Rincon Azul" DataField="Peleador2.NombreCompleto" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="Team" DataField="Peleador2.Dojo.Nombre" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="Modalidad" DataField="Peleador1.TipoPelea.Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:TemplateField HeaderText="Acción" ItemStyle-Width="150" HeaderStyle-Width="150" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle">
                                <ItemTemplate>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <asp:LinkButton ID="btnAbrirModalPelea" runat="server" Text="Abrir Modal" OnClick="btnAbrirModalPelea_Click" data-bs-toggle="tooltip" ToolTip="Detalle" CssClass="btn btn-info me-1">
            <i class="fa-solid fa-search"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnModalOrdenPelea" runat="server" Text="Abrir Modal" OnClick="btnModalOrdenPelea_Click" data-bs-toggle="tooltip" ToolTip="Orden" CssClass="btn btn-info me-1">
            <i class="fa-solid fa-sort"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-success me-1" data-bs-toggle="tooltip" ToolTip="Modificar">
            <i class="fa-solid fa-pen-to-square"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnAbrirModalEliminarPelea" OnClick="btnAbrirModalEliminarPelea_Click" runat="server" CssClass="btn btn-danger" ClientIDMode="Static" data-bs-toggle="tooltip" ToolTip="Eliminar">
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

    <%--Modales--%>

    <div class="modal fade" id="modalPelea" tabindex="-1" role="dialog" aria-labelledby="miModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="miModalLabel">Detalle de la pelea</h5>
                </div>
                <div class="modal-body">
                    <div style="display: flex; align-items: center; margin-bottom: 5px;">
                        <div style="flex: 1;">
                            <label for="txtPeleador1" class="form-label">Rincon Rojo</label>
                            <asp:TextBox runat="server" ID="txtPeleador1" class="form-control" disabled="" />
                        </div>
                        <div style="width: 10px;"></div>
                        <div style="flex: 1;">
                            <label for="txtPeleador2" class="form-label">Rincon Azul</label>
                            <asp:TextBox runat="server" ID="txtPeleador2" class="form-control" disabled="" />
                        </div>
                    </div>

                    <div style="display: flex; align-items: center; margin-bottom: 5px;">
                        <div style="flex: 1;">
                            <label for="txtTeam1" class="form-label">Team</label>
                            <asp:TextBox runat="server" ID="txtTeam1" class="form-control" disabled="" />
                        </div>
                        <div style="width: 10px;"></div>
                        <div style="flex: 1;">
                            <label for="txtTeam2" class="form-label">Team</label>
                            <asp:TextBox runat="server" ID="txtTeam2" class="form-control" disabled="" />
                        </div>
                    </div>

                    <div style="display: flex; align-items: center; margin-bottom: 5px;">
                        <div style="flex: 1;">
                            <label for="txtCategoria1" class="form-label">Categoria</label>
                            <asp:TextBox runat="server" ID="txtCategoria1" class="form-control" disabled="" />
                        </div>
                        <div style="width: 10px;"></div>
                        <div style="flex: 1;">
                            <label for="txtCategoria2" class="form-label">Categoria</label>
                            <asp:TextBox runat="server" ID="txtCategoria2" class="form-control" disabled="" />
                        </div>
                    </div>

                    <div style="display: flex; align-items: center; margin-bottom: 5px;">
                        <div style="flex: 1;">
                            <label for="txtModalidad1" class="form-label">Modalidad</label>
                            <asp:TextBox runat="server" ID="txtModalidad1" class="form-control" disabled="" />
                        </div>
                        <div style="width: 10px;"></div>
                        <div style="flex: 1;">
                            <label for="txtModalidad2" class="form-label">Modalidad</label>
                            <asp:TextBox runat="server" ID="txtModalidad2" class="form-control" disabled="" />
                        </div>
                    </div>

                    <div style="display: flex; align-items: center; margin-bottom: 5px;">
                        <div style="flex: 1;">
                            <label for="txtPeso1" class="form-label">Peso</label>
                            <asp:TextBox runat="server" ID="txtPeso1" class="form-control" disabled="" />
                        </div>
                        <div style="width: 10px;"></div>
                        <div style="flex: 1;">
                            <label for="txtEdad1" class="form-label">Edad</label>
                            <asp:TextBox runat="server" ID="txtEdad1" class="form-control" disabled="" />
                        </div>
                        <div style="width: 10px;"></div>
                        <div style="flex: 1;">
                            <label for="txtPeso2" class="form-label">Peso</label>
                            <asp:TextBox runat="server" ID="txtPeso2" class="form-control" disabled="" />
                        </div>
                        <div style="width: 10px;"></div>
                        <div style="flex: 1;">
                            <label for="txtEdad2" class="form-label">Edad</label>
                            <asp:TextBox runat="server" ID="txtEdad2" class="form-control" disabled="" />
                        </div>
                    </div>

                    <div style="display: flex; align-items: center; margin-bottom: 5px;">
                        <div style="flex: 1;">
                            <label for="txtAltura1" class="form-label">Altura</label>
                            <asp:TextBox runat="server" ID="txtAltura1" class="form-control" disabled="" />
                        </div>
                        <div style="width: 10px;"></div>
                        <div style="flex: 1;">
                            <label for="txtPeleas1" class="form-label">Peleas</label>
                            <asp:TextBox runat="server" ID="txtPeleas1" class="form-control" disabled="" />
                        </div>
                        <div style="width: 10px;"></div>
                        <div style="flex: 1;">
                            <label for="txtAltura2" class="form-label">Altura</label>
                            <asp:TextBox runat="server" ID="txtAltura2" class="form-control" disabled="" />
                        </div>
                        <div style="width: 10px;"></div>
                        <div style="flex: 1;">
                            <label for="txtPeleas2" class="form-label">Peleas</label>
                            <asp:TextBox runat="server" ID="txtPeleas2" class="form-control" disabled="" />
                        </div>
                    </div>

                    <label for="txtObservaciones" class="form-label">Observaciones para la pelea</label>
                    <asp:TextBox runat="server" ID="txtObservaciones" MaxLength="255" class="form-control" TextMode="MultiLine" Rows="2" disabled="" />
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
                    ¿Estás seguro de que deseas eliminar la pelea?
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
                        <b>No puede agregar una nueva pelea debido a que no hay un evento activo.</b>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalPeleasAExcelXEvento" tabindex="-1" role="dialog" aria-labelledby="modalPeleasAExcelXEventoLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalPeleasAExcelXEventoLabel">Exportar Peleas X Evento a Excel</h5>
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

    <div class="modal fade" id="modalOrdenPelea" tabindex="-1" role="dialog" aria-labelledby="modalOrdenPeleaLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalOrdenPeleaLabel">Numero de pelea</h5>
                </div>
                <div class="modal-body">
                    <div>
                        <asp:TextBox runat="server" ID="txtOrdenPelea" placeholder="Escribe orden..." onkeypress="javascript:return validarSoloNro(event)" MaxLength="4" class="form-control" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button ID="btnAgregarOrdenPelea" OnClick="btnAgregarOrdenPelea_Click" runat="server" Text="Generar" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
    </div>

    <%--Modales--%>

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
        document.onkeydown = disableEnterKey;
    </script>

    <script type="text/javascript">
        function normalize(text) {
            return text.replace(/\s+/g, '');
        }

        window.onload = function () {
            var txtBusqueda = document.getElementById("txtBusqueda");
            var valor = '<%= Session["FiltroPeleas"] != null ? Session["FiltroPeleas"].ToString() : string.Empty %>';
            txtBusqueda.value = valor;
            filterGrid();
        }

        function setFiltroPeleas(valor) {
            var txtBusqueda = document.getElementById("txtBusqueda");
            txtBusqueda.value = valor;
            filterGrid();
        }

        function filterGrid() {
            var input, filter, table, tr, td, i, j, txtValue;
            input = document.getElementById("txtBusqueda");
            filter = normalize(input.value.toUpperCase());
            table = document.getElementById("dgvPeleas");
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

        //valida los campos solo numeros
        function validarSoloNro(e) {
            var key;
            if (window.event) // IE
            {
                key = e.keyCode;
            }
            else if (e.which) // Netscape/Firefox/Opera
            {
                key = e.which;
            }

            if (key < 48 || key > 57) {
                return false;
            }
            else { return true; }
        }
    </script>

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
            var modal = document.getElementById('modalOrdenPelea');
            var bootstrapModal = new bootstrap.Modal(modal);
            bootstrapModal.hide();
        }

        function mostrarAlertaExisteNumeroPelea() {
            alert('El numero de pelea ya existe!');
        }

        function mostrarAlertaIngreseNumeroValido() {
            alert('Ingrese un numero de pelea valido!');
        }
    </script>

</asp:Content>
