<%@ Page Language="C#" MasterPageFile="~/Site.Mobile.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Gimnasio_Peleas.Formularios.Usuarios.Usuarios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        document.title = 'Usuarios';
    </script>

    <div class="container">
        <div class="row" style="margin-bottom: 8px;">
            <div class="col-md-12">
                <div class="widget custom-border">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <input type="text" id="txtBusqueda" class="form-control" onkeyup="filterGrid(event)" placeholder="Filtrar usuarios..." />
                        </div>
                        <div class="col-md-6 text-end">
                            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                <asp:LinkButton ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success btn-lg" onkeypress="return disableEnterKey(event)" data-toggle="tooltip" ToolTip="Nuevo usuario">
                                        <i class="fa-solid fa-plus"></i>
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView runat="server" ID="dgvUsuarios" DataKeyNames="Id" CssClass="table table-striped table-white" AutoGenerateColumns="false" ClientIDMode="Static">
                    <Columns>
                        <asp:BoundField HeaderText="Usuario" DataField="User" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                        <asp:BoundField HeaderText="Password" DataField="Contrasenia" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                        <asp:BoundField HeaderText="Tipo Usuario" DataField="TipoUsuario.Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                        <asp:BoundField HeaderText="Dojo" DataField="Dojo.Nombre" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                        <asp:TemplateField HeaderText="Acción" ItemStyle-Width="100" HeaderStyle-Width="100" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle">
                            <ItemTemplate>
                                <div class="d-flex justify-content-center align-items-center">
                                    <asp:LinkButton ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-success me-1" data-bs-toggle="tooltip" ToolTip="Modificar">
            <i class="fa-solid fa-pen-to-square"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnAbrirModalEliminarUsuario" OnClick="btnAbrirModalEliminarUsuario_Click" runat="server" CssClass="btn btn-danger" ClientIDMode="Static" data-bs-toggle="tooltip" ToolTip="Eliminar">
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

    <%--Modales--%>

    <div class="modal fade" id="modalEliminar" tabindex="-1" role="dialog" aria-labelledby="modalEliminarLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalEliminarLabel">Confirmar eliminación</h5>
                </div>
                <div class="modal-body">
                    ¿Estás seguro de que deseas eliminar el usuario?
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger" data-bs-dismiss="modal" />
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
    </div>

    <%--Modales--%>

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
        document.onkeydown = disableEnterKey;
    </script>

    <script type="text/javascript">
        function normalize(text) {
            return text.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
        }
        function filterGrid() {
            var input, filter, table, tr, td, i, j, txtValue;
            input = document.getElementById("txtBusqueda");
            filter = normalize(input.value.toUpperCase());
            table = document.getElementById("dgvUsuarios");
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
