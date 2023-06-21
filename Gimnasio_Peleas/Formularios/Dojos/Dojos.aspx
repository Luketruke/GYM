<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="Dojos.aspx.cs" Inherits="Gimnasio_Peleas.Formularios.Dojos.Dojos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .btn-group {
            margin-bottom: 10px;
        }

        .btn {
            margin-top: 10px;
        }
    </style>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success btn-lg" Text="Nuevo dojo" onkeypress="return disableEnterKey(event)" />
            </div>

            <div class="row">
                <div class="col-md-4">
                    <label for="txtSearch">Buscar:</label>
                    <input type="text" id="txtBusqueda" class="form-control" onkeyup="filterGrid(event)" />
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-md-12">
                    <asp:GridView runat="server" ID="dgvDojos" DataKeyNames="Id" CssClass="table table-striped-columns" AutoGenerateColumns="false" ClientIDMode="Static">
                        <HeaderStyle CssClass="thead-dark" />
                        <Columns>
                            <asp:BoundField HeaderText="Código" DataField="Codigo" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            <asp:BoundField HeaderText="Nombre" DataField="Nombre" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            <asp:BoundField HeaderText="Direccion" DataField="Direccion.DireccionDojo" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            <asp:BoundField HeaderText="Localidad" DataField="Direccion.Localidad" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            <asp:BoundField HeaderText="Provincia" DataField="Direccion.Provincia" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            <asp:TemplateField HeaderText="Acción" ItemStyle-Width="150" HeaderStyle-Width="150" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnAbrirModalDojo" runat="server" Text="Abrir Modal" OnClick="btnAbrirModalDojo_Click" CssClass="btn btn-info">
                    <i class="fa-solid fa-search"></i>
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-info" data-toggle="tooltip" ToolTip="Modificar">
                    <i class="fa-solid fa-pencil"></i>
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="btnAbrirModalEliminarDojo" runat="server" OnClick="btnAbrirModalEliminarDojo_Click" CssClass="btn btn-info" ClientIDMode="Static">
                    <i class="fa-solid fa-trash"></i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="modal fade" id="modalDojo" tabindex="-1" role="dialog" aria-labelledby="miModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="miModalLabel">Dojo</h5>
                            </div>
                            <div class="modal-body">
                                <label for="txtCodigo" class="form-label" runat="server">Codigo</label>
                                <asp:TextBox runat="server" ID="txtCodigo" class="form-control" disabled="" />

                                <label for="txtNombre" class="form-label">Dojo</label>
                                <asp:TextBox runat="server" ID="txtNombre" class="form-control" disabled="" />

                                <label for="txtDireccion" class="form-label">Direccion</label>
                                <asp:TextBox runat="server" ID="txtDireccion" class="form-control" disabled="" />

                                <label for="txtProvincia" class="form-label">Provincia</label>
                                <asp:TextBox runat="server" ID="txtProvincia" class="form-control" disabled="" />

                                <label for="txtLocalidad" class="form-label">Localidad</label>
                                <asp:TextBox runat="server" ID="txtLocalidad" class="form-control" disabled="" />

                                <label for="txtObservaciones" class="form-label">Observaciones</label>
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
                                ¿Estás seguro de que deseas eliminar el dojo?
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger" data-bs-dismiss="modal" />
                                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" CssClass="btn btn-success" />
                            </div>
                        </div>
                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>

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
        }
    </script>

</asp:Content>
