<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="Peleas.aspx.cs" Inherits="Gimnasio_Peleas.Formularios.Peleas.Peleas" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .btn-group {
            margin-bottom: 10px;
        }

        .btn {
            margin-top: 10px;
        }
    </style>

    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
        <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success btn-lg" Text="Nueva pelea" />
    </div>


    <asp:GridView runat="server" ID="dgvPeleas" DataKeyNames="Id" CssClass="table table-striped-columns" AutoGenerateColumns="false" ClientIDMode="Static">
        <Columns>
            <asp:BoundField HeaderText="Código" DataField="Codigo" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
            <asp:BoundField HeaderText="Nombre Completo" DataField="NombreCompleto" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
            <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
            <asp:BoundField HeaderText="Cantidad de Peleas" DataField="CantidadPeleas" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
            <asp:BoundField HeaderText="Dojo" DataField="Dojo.Nombre" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
            <asp:TemplateField HeaderText="Accion" ItemStyle-Width="120" HeaderStyle-Width="120" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                <ItemTemplate>
                    <asp:LinkButton ID="btnModificar" runat="server" CssClass="btn btn-info" data-toggle="tooltip" ToolTip="Modificar">
                            <i class="fa-solid fa-pencil"></i>
                    </asp:LinkButton>

                    <asp:LinkButton ID="btnEliminar" runat="server" CssClass="btn btn-info" OnClientClick="return confirm('Estas seguro de eliminar el cliente?');" data-toggle="tooltip" ToolTip="Eliminar">
                            <i class="fa-solid fa-trash"></i>
                    </asp:LinkButton>

                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>

</asp:Content>
