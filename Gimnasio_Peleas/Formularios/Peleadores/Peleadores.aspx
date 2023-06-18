<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="Peleadores.aspx.cs" Inherits="Gimnasio_Peleas.Formularios.Peleadores.Peleadores" %>

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
                <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success btn-lg" Text="Nuevo peleador" />
            </div>
            <asp:GridView runat="server" ID="dgvPeleadores" DataKeyNames="Id" CssClass="table table-striped-columns" AutoGenerateColumns="false" ClientIDMode="Static">
                <Columns>
                    <asp:BoundField HeaderText="Código" DataField="Codigo" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                    <asp:BoundField HeaderText="Nombre Completo" DataField="NombreCompleto" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                    <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                    <asp:BoundField HeaderText="Cantidad de Peleas" DataField="CantidadPeleas" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                    <asp:BoundField HeaderText="Dojo" DataField="Dojo.Nombre" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                    <asp:TemplateField HeaderText="Accion" ItemStyle-Width="150" HeaderStyle-Width="150" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnAbrirModalPeleador" runat="server" Text="Abrir Modal" OnClick="btnAbrirModalPeleador_Click" CssClass="btn btn-info">
                            <i class="fa-solid fa-search"></i>
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-info" data-toggle="tooltip" ToolTip="Modificar">
                            <i class="fa-solid fa-pencil"></i>
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnAbrirModalEliminarPeleador" runat="server" OnClick="btnAbrirModalEliminarPeleador_Click" CssClass="btn btn-info" ClientIDMode="Static">
                            <i class="fa-solid fa-trash"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div class="modal fade" id="modalPeleador" tabindex="-1" role="dialog" aria-labelledby="miModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="miModalLabel">Peleador</h5>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="txtCodigo" class="form-label" runat="server">Codigo</label>
                                    <asp:TextBox runat="server" ID="txtCodigo" class="form-control" disabled="" />

                                    <label for="txtNombreCompleto" class="form-label">Nombre</label>
                                    <asp:TextBox runat="server" ID="txtNombreCompleto" class="form-control" disabled="" />

                                    <label for="txtDojo" class="form-label">Dojo</label>
                                    <asp:TextBox runat="server" ID="txtDojo" class="form-control" disabled="" />

                                    <label for="txtCategoria" class="form-label">Categoria</label>
                                    <asp:TextBox runat="server" ID="txtCategoria" class="form-control" disabled="" />

                                    <label for="txtGenero" class="form-label">Genero</label>
                                    <asp:TextBox runat="server" ID="txtGenero" class="form-control" disabled="" />

                                    <label for="txtCantidadPeleas" class="form-label">Cantidad Peleas</label>
                                    <asp:TextBox runat="server" ID="txtCantidadPeleas" class="form-control" disabled="" />

                                    <label for="txtPeso" class="form-label">Peso en KG</label>
                                    <asp:TextBox runat="server" ID="txtPeso" class="form-control" disabled="" />

                                    <label for="txtAltura" class="form-label">Altura en CM</label>
                                    <asp:TextBox runat="server" ID="txtAltura" class="form-control" disabled="" />
                                </div>
                                <div class="col-md-6">
                                    <asp:Image ID="ImageDetalle" runat="server" CssClass="modal-photo img-fluid" />
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
</asp:Content>
