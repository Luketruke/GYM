<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gimnasio_Peleas.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="center">
        <h1>Login</h1>
        <form method="post" runat="server">
            <div class="txt_field">
                <asp:TextBox runat="server" ID="txtUser" placeholder="" CssClass="form-control" />
                <span></span>
                <label>Usuario</label>
            </div>
            <div class="txt_field">
                <asp:TextBox runat="server" placeholder="" ID="txtPassword" CssClass="form-control" TextMode="Password" />
                <span></span>
                <label>Contraseña</label>
            </div>
            <asp:Button ID="btnLogin" CssClass="btn btn-success" runat="server" Text="Login" OnClick="btnLogin_Click " />
            <div class="signup_link">
                No esta registrado? <a href="#">Registrarse</a>
            </div>
            <i class="fas fa-walking"></i>
        </form>
    </div>
</asp:Content>