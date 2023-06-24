<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gimnasio_Peleas.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="center">
        <form id="loginForm" runat="server" class="d-flex flex-column align-items-center mt-5">
            <h2 class="mb-4">Inicie sesion</h2>
            <div class="mb-3">
                <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control" placeholder="Usuario"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" placeholder="Contraseña"></asp:TextBox>
            </div>
            <asp:Button runat="server" ID="btnLogin" Text="Ingresar" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
        </form>
    </div>

</asp:Content>