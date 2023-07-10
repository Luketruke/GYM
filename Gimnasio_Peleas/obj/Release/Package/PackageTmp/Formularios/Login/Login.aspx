<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gimnasio_Peleas.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="center">
        <form id="loginForm" runat="server" class="d-flex flex-column align-items-center mt-5">

            <div class="text-center">
                <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                        <h4 class="my-0 fw-normal">Inicie sesión</h4>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control" placeholder="Usuario"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" placeholder="Contraseña"></asp:TextBox>
                        </div>
                        <asp:Button runat="server" ID="Button1" Text="Ingresar" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
                    </div>
                </div>
            </div>

            <%--Alerta usuario incorrecto--%>
            <div class="alert alert-danger" role="alert" id="AlertaUserIncorrecto" runat="server" visible="false">
                Usuario incorrecto, intente nuevamente.
            </div>
            <%-------%>

            <%--Alerta password incorrecta--%>
            <div class="alert alert-danger" role="alert" id="AlertaPasswordIncorrecta" runat="server" visible="false">
                Contraseña incorrecta, intente nuevamente.
            </div>
            <%-------%>



        </form>
    </div>

</asp:Content>
