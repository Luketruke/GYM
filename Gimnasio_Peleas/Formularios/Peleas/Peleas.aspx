<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="Peleas.aspx.cs" Inherits="Gimnasio_Peleas.Formularios.Peleas.Peleas" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        document.title = 'Peleas';
    </script>

    <style>
        .btn-group {
            margin-bottom: 10px;
        }

        .btn {
            margin-top: 10px;
        }
    </style>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="widget custom-border">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <input type="text" id="txtBusqueda" class="form-control" onkeyup="filterGrid(event)" placeholder="Filtrar peleas..." />
                        </div>
                        <div class="col-md-6 text-end">
                            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                <asp:LinkButton ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success btn-lg" onkeypress="return disableEnterKey(event)" data-bs-toggle="tooltip" ToolTip="Nueva pelea">
                                        <i class="fa-solid fa-plus"></i>
                                </asp:LinkButton>
                            </div>
                            <%--<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                <asp:LinkButton ID="btnFiltrar" OnClick="btnFiltrar_Click" runat="server" CssClass="btn btn-primary btn-lg" onkeypress="return disableEnterKey(event)" data-toggle="tooltip" ToolTip="Exportar a Excel">
                                        <i class="fa-solid fa-download"></i>                                        
                                </asp:LinkButton>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView runat="server" ID="dgvPeleas" DataKeyNames="Id" CssClass="table table-striped table-white" AutoGenerateColumns="false" ClientIDMode="Static">
                    <Columns>
                        <asp:BoundField HeaderText="Código" DataField="Codigo" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                        <asp:BoundField HeaderText="Peleador1" DataField="Peleador1.NombreCompleto" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                        <asp:BoundField HeaderText="Peleador2" DataField="Peleador2.NombreCompleto" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                        <asp:BoundField HeaderText="Dojo" DataField="Dojo.Nombre" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                        <asp:BoundField HeaderText="Fecha" DataField="FechaPelea" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                        <asp:TemplateField HeaderText="Acción" ItemStyle-Width="150" HeaderStyle-Width="150" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle">
                            <ItemTemplate>
                                <div class="d-flex justify-content-center align-items-center">

                                    <asp:LinkButton ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-warning me-1" data-bs-toggle="tooltip" ToolTip="Modificar">
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

    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
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
            return text.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
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
        }
    </script>


</asp:Content>
