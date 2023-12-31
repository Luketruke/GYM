﻿<%@ Page Language="C#" MasterPageFile="~/Site.Mobile.Master" AutoEventWireup="true" CodeBehind="UsuariosABM.aspx.cs" Inherits="Gimnasio_Peleas.Formularios.Usuarios.UsuariosABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        document.title = 'UsuariosABM';
    </script>

    <br />
    <h1 style="text-align: center;"><%: Title %>Usuarios</h1>

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
                        ErrorMessage="*" ValidationGroup="ValidarUsuario" InitialValue="0"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-0">
                    <label for="ddlDojos" class="form-label">Team</label>
                    <asp:DropDownList ID="ddlDojos" CssClass="form-select" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="ddlDojos"
                        ErrorMessage="*" ValidationGroup="ValidarUsuario" InitialValue="0"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-0">
                    <asp:Button ID="btnCancelar" OnClick="btnCancelar_Click" runat="server" CausesValidation="false" CssClass="btn btn-danger" Text="Cancelar" />
                    <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" ValidationGroup="ValidarUsuario" runat="server" CssClass="btn btn-success" Text="Agregar" />
                    <asp:Button ID="btnModificar" OnClick="btnModificar_Click" ValidationGroup="ValidarUsuario" runat="server" CssClass="btn btn-success" Text="Modificar" Visible="false" />
                </div>
            </div>
            <div class="col-md-2">
            </div>
        </div>
    </div>

    <%--Modales--%>

    <div class="modal fade" id="modalYaExisteUsuarioAgregar" tabindex="-1" role="dialog" aria-labelledby="modalYaExisteUsuarioLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body" style="text-align: center; margin-bottom: -14px">
                    <div class="alert alert-danger" role="alert">
                        <b>No puede agregar el nombre de usuario debido a que ya existe.</b>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="CerrarModalYaExisteUsuarioAgregar" runat="server" Text="Cerrar" CssClass="btn btn-danger" data-bs-dismiss="modal" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalYaExisteUsuarioModificar" tabindex="-1" role="dialog" aria-labelledby="modalYaExisteUsuarioLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body" style="text-align: center; margin-bottom: -14px">
                    <div class="alert alert-danger" role="alert">
                        <b>No puede modificar el nombre de usuario debido a que ya existe.</b>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="CerrarModalYaExisteUsuarioModificar" runat="server" Text="Cerrar" CssClass="btn btn-danger" data-bs-dismiss="modal" />
                </div>
            </div>
        </div>
    </div>

    <%--Modales--%>

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

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });
        });
    </script>

</asp:Content>
