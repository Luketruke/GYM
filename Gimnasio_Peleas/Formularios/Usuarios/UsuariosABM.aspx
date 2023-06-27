<%@ Page Language="C#" MasterPageFile="~/Site.Mobile.Master" AutoEventWireup="true" CodeBehind="UsuariosABM.aspx.cs" Inherits="Gimnasio_Peleas.Formularios.Usuarios.UsuariosABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--CSS--%>
    <link href="~/Stylesheets/dojos.css" rel="stylesheet" />

    <script type="text/javascript">
        document.title = 'DojosABM';
    </script>

    <br />

    <h1 style="text-align: center;"><%: Title %>Team</h1>

    <div>
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <div class="mb-0">
                    <label for="txtUsuario" class="form-label">Usuario</label>
                    <asp:TextBox runat="server" ID="txtUsuario" MaxLength="50" class="form-control" />
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                        ControlToValidate="txtUsuario" ErrorMessage="*" ValidationGroup="ValidarUsuario"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-0">
                    <label for="txtPassword" class="form-label">Contraseña</label>
                    <asp:TextBox runat="server" ID="txtPassword" MaxLength="50" class="form-control" />
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                        ControlToValidate="txtPassword" ErrorMessage="*" ValidationGroup="ValidarUsuario"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-0" style="margin-bottom: 0;">
                    <label for="ddlTiposUsuario" class="form-label">Tipo de Usuario</label>
                    <asp:DropDownList ID="ddlTiposUsuario" CssClass="form-select" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="ddlTiposUsuario"
                        ErrorMessage="*" ValidationGroup="ValidarUsuario" InitialValue="Seleccione tipo de usuario..."></asp:RequiredFieldValidator>
                </div>

                <div class="mb-0">
                    <label for="ddlDojos" class="form-label">Team</label>
                    <asp:DropDownList ID="ddlDojos" CssClass="form-select" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="ddlDojos"
                        ErrorMessage="*" ValidationGroup="ValidarUsuario" InitialValue="Seleccione team..."></asp:RequiredFieldValidator>
                </div>

                <div class="mb-0">
                    <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" ValidationGroup="ValidarUsuario" runat="server" CssClass="btn btn-success" Text="Agregar" />
                    <asp:Button ID="btnModificar" OnClick="btnModificar_Click" ValidationGroup="ValidarUsuario" runat="server" CssClass="btn btn-success" Text="Modificar" Visible="false" />
                    <asp:Button ID="btnCancelar" OnClick="btnCancelar_Click" runat="server" CausesValidation="false" CssClass="btn btn-danger" Text="Cancelar" />
                </div>
            </div>
            <div class="col-md-2">
            </div>
        </div>
    </div>

    <script>
        //valida los campos solo numeros
        function validarSoloNro(e) {
            var key;
            if (window.event) {
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

        function SoloLetras(e) {
            return (/^[a-zA-Z ]*$/.test(e.key));
        }
    </script>

</asp:Content>
