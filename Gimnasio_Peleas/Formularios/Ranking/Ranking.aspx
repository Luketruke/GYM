<%@ Page Language="C#" MasterPageFile="~/Site.Mobile.Master" AutoEventWireup="true" CodeBehind="Ranking.aspx.cs" Inherits="Gimnasio_Peleas.Formularios.Ranking.Ranking" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--CSS--%>
    <link href="~/Stylesheets/dojos.css" rel="stylesheet" />

    <script type="text/javascript">
        document.title = 'Ranking';
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <asp:GridView runat="server" ID="dgvRanking" DataKeyNames="DNI" CssClass="table table-striped table-white" AutoGenerateColumns="false" ClientIDMode="Static">
                        <Columns>
                            <asp:BoundField HeaderText="Peleador" DataField="NombreCompleto" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="DNI" DataField="DNI" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="CantidadPeleas" DataField="CantidadPeleas" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="Modalidad" DataField="TipoPelea.Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                            <asp:TemplateField HeaderText="Acción" ItemStyle-Width="150" HeaderStyle-Width="150" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle">
                                <ItemTemplate>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <asp:LinkButton ID="btnAbrirModalPeleador" runat="server" Text="Abrir Modal" OnClick="btnAbrirModalPeleador_Click" data-bs-toggle="tooltip" ToolTip="Historial" CssClass="btn btn-info me-1">
            <i class="fa-solid fa-search"></i>
                                        </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle VerticalAlign="Middle" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalHistorialPeleador" tabindex="-1" role="dialog" aria-labelledby="miModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="miModalLabel">Historial de carga del peleador</h5>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <asp:GridView runat="server" ID="dgvHistorialPeleador" CssClass="table table-striped-columns" AutoGenerateColumns="false" ClientIDMode="Static">
                            <HeaderStyle CssClass="thead-dark" />
                            <Columns>
                                <asp:BoundField HeaderText="Nombre" DataField="NombreCompleto" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />

                                <asp:BoundField HeaderText="Peso" DataField="Peso" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Edad" DataField="Edad" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Altura" DataField="Altura" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Peleas" DataField="CantidadPeleas" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false"/>
                                <asp:BoundField HeaderText="Modalidad" DataField="TipoPelea.Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false"/>
                                <asp:BoundField HeaderText="Team" DataField="Dojo.Nombre" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false"/>
                                <asp:BoundField HeaderText="FechaInformacion" DataField="FechaInformacion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false"/>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });
        });
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
            var valor = '<%= Session["FiltroRanking"] != null ? Session["FiltroRanking"].ToString() : string.Empty %>';
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
            table = document.getElementById("dgvRanking");
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
        var modal = document.getElementById('modalHistorialPeleador');
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
