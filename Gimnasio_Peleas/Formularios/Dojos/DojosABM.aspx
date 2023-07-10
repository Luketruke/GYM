<%@ Page Language="C#" MasterPageFile="~/Site.Mobile.Master" AutoEventWireup="true" CodeBehind="DojosABM.aspx.cs" Inherits="Gimnasio_Peleas.Formularios.Dojos.DojosABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--CSS--%>
    <link href="~/Stylesheets/dojos.css" rel="stylesheet" />

    <script type="text/javascript">
        document.title = 'TeamsABM';
    </script>

    <br />

    <h1 style="text-align: center;"><%: Title %>Team</h1>

    <div>
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <div class="mb-0">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" MaxLength="50" class="form-control" />
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                        ControlToValidate="txtNombre" ErrorMessage="*" ValidationGroup="ValidarDojo"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-0">
                    <label for="txtProfesor" class="form-label">Profesor</label>
                    <asp:TextBox runat="server" ID="txtProfesor" MaxLength="50" class="form-control" />
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                        ControlToValidate="txtProfesor" ErrorMessage="*" ValidationGroup="ValidarDojo"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-0">
                    <label for="txtTelefonoProfesor" class="form-label">Telefono del Profesor</label>
                    <asp:TextBox runat="server" ID="txtTelefonoProfesor" MaxLength="25" class="form-control" />
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                        ControlToValidate="txtTelefonoProfesor" ErrorMessage="*" ValidationGroup="ValidarDojo"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-0">
                    <label for="txtTelefonoDojo" class="form-label">Telefono del Team</label>
                    <asp:TextBox runat="server" ID="txtTelefonoDojo" MaxLength="25" class="form-control" />
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                        ControlToValidate="txtTelefonoDojo" ErrorMessage="*" ValidationGroup="ValidarDojo"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-0" style="margin-bottom: 0;">
                    <label for="txtDireccion" class="form-label">Direccion</label>
                    <asp:TextBox runat="server" ID="txtDireccion" MaxLength="50" class="form-control" />
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                        ControlToValidate="txtDireccion" ErrorMessage="*" ValidationGroup="ValidarDojo"></asp:RequiredFieldValidator>
                </div>

                <asp:UpdatePanel ID="uplProvincia" runat="server">
                    <ContentTemplate>
                        <div>
                            <label for="ddlProvincias" class="form-label">Provincia</label>
                            <asp:DropDownList ID="ddlProvincias" CssClass="form-select" runat="server" OnSelectedIndexChanged="ddlProvincias_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                            <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="ddlProvincias"
                                ErrorMessage="*" ValidationGroup="ValidarDojo" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>

                        <div>
                            <label for="ddlLocalidades" class="form-label">Localidad</label>
                            <asp:DropDownList ID="ddlLocalidades" CssClass="form-select" runat="server"></asp:DropDownList>
                            <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="ddlLocalidades"
                                ErrorMessage="*" ValidationGroup="ValidarDojo" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="mb-3">
                    <label for="txtObservaciones" class="form-label">Observaciones</label>
                    <asp:TextBox runat="server" ID="txtObservaciones" MaxLength="255" class="form-control" TextMode="MultiLine" Rows="5" />
                </div>

                <div class="mb-0">
                    <asp:Button ID="btnCancelar" OnClick="btnCancelar_Click" runat="server" CausesValidation="false" CssClass="btn btn-danger" Text="Cancelar" />
                    <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" ValidationGroup="ValidarDojo" runat="server" CssClass="btn btn-success" Text="Agregar" />
                    <asp:Button ID="btnModificar" OnClick="btnModificar_Click" ValidationGroup="ValidarDojo" runat="server" CssClass="btn btn-success" Text="Modificar" Visible="false" />
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

        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
    </script>

    <script>
            document.addEventListener('DOMContentLoaded', function () {
                var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
                var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                    return new bootstrap.Tooltip(tooltipTriggerEl);
                });
            });
    </script>

</asp:Content>
