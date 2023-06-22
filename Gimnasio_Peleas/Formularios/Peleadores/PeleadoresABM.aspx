<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="PeleadoresABM.aspx.cs" Inherits="Gimnasio_Peleas.Formularios.Peleadores.PeleadoresABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        document.title = 'PeleadoresABM';
    </script>

    <style>
        .upload-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 10px;
        }

            .upload-btn:hover {
                background-color: #45a049;
            }

        .file-input {
            display: none;
        }

        .file-label {
            background-color: #ddd;
            padding: 10px 35px;
            display: inline-block;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>

    <br />
    <h1 style="text-align: center;"><%: Title %>PeleadoresABM</h1>

    <div>
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <div class="mb-0" runat="server" id="divCodigo">
                    <label for="txtCodigo" class="form-label" runat="server">Codigo</label>
                    <asp:TextBox runat="server" ID="txtCodigo" class="form-control" disabled="" />
                    <br />
                </div>

                <div class="mb-0">
                    <label for="txtNombre" class="form-label">Nombres</label>
                    <asp:TextBox runat="server" ID="txtNombre" MaxLength="50" class="form-control" />
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                        ControlToValidate="txtNombre" ErrorMessage="*" ValidationGroup="ValidarPeleador"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-0">
                    <label for="txtApellido" class="form-label">Apellidos</label>
                    <asp:TextBox runat="server" ID="txtApellido" MaxLength="50" class="form-control" />
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                        ControlToValidate="txtApellido" ErrorMessage="*" ValidationGroup="ValidarPeleador"></asp:RequiredFieldValidator>
                </div>

                <div>
                    <label for="ddlDojos" class="form-label">Dojo</label>
                    <asp:DropDownList ID="ddlDojos" CssClass="form-select" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="ddlDojos"
                        ErrorMessage="*" ValidationGroup="ValidarPeleador" InitialValue="Seleccione dojo..."></asp:RequiredFieldValidator>
                </div>

                <div>
                    <label for="ddlCategorias" class="form-label">Categoria</label>
                    <asp:DropDownList ID="ddlCategorias" CssClass="form-select" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="ddlCategorias"
                        ErrorMessage="*" ValidationGroup="ValidarPeleador" InitialValue="Seleccione categoria..."></asp:RequiredFieldValidator>
                </div>

                <div>
                    <label for="ddlGeneros" class="form-label">Genero</label>
                    <asp:DropDownList ID="ddlGeneros" CssClass="form-select" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="ddlGeneros"
                        ErrorMessage="*" ValidationGroup="ValidarPeleador" InitialValue="Seleccione genero..."></asp:RequiredFieldValidator>
                </div>

                <div class="mb-0" style="display: flex; align-items: center;">
                    <div style="flex: 1;">
                        <label for="txtPeso" class="form-label">Peso</label>
                        <asp:TextBox runat="server" ID="txtPeso" MaxLength="6" class="form-control" onkeypress="return validarInput(event);" />
                        <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtPeso" ErrorMessage="*" ValidationGroup="ValidarPeleador"></asp:RequiredFieldValidator>
                    </div>
                    <div style="width: 10px;"></div>
                    <div style="flex: 1;">
                        <label for="txtAltura" class="form-label">Altura en CM</label>
                        <asp:TextBox runat="server" ID="txtAltura" MaxLength="3" class="form-control" onkeypress="javascript:return validarSoloNro(event)" />
                        <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtAltura" ErrorMessage="*" ValidationGroup="ValidarPeleador"></asp:RequiredFieldValidator>
                    </div>
                    <div style="width: 10px;"></div>
                    <div style="flex: 1;">
                        <label for="txtCantidadPeleas" class="form-label">Cantidad de Peleas</label>
                        <asp:TextBox runat="server" ID="txtCantidadPeleas" MaxLength="4" class="form-control" onkeypress="javascript:return validarSoloNro(event)" />
                        <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtCantidadPeleas" ErrorMessage="*" ValidationGroup="ValidarPeleador"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div>
                    <table style="width: 100%;">
                        <tr style="width: 100%;">
                            <td style="width: 100%;">
                                <label for="fileUpload" class="form-label">Cargar foto</label>
                            </td>
                        </tr>
                        <tr style="width: 100%;">
                            <td style="width: 100%;">
                                <div class="input-group" style="width: 100%;">
                                    <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" onchange="handleFileSelect(this)" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>


                <br />

                <div id="botones" style="margin-left: auto;">
                    <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" ValidationGroup="ValidarPeleador" runat="server" CssClass="btn btn-success" Text="Agregar" />
                    <asp:Button ID="btnModificar" OnClick="btnModificar_Click" ValidationGroup="ValidarPeleador" runat="server" CssClass="btn btn-success" Text="Modificar" Visible="false" />
                    <asp:Button ID="btnCancelar" OnClick="btnCancelar_Click" runat="server" CausesValidation="false" CssClass="btn btn-danger" Text="Cancelar" />
                </div>
            </div>
            <div class="col-md-2">
            </div>
        </div>
    </div>

    <script>
        //Valida que se puedan escribir solamente numeros
        function validarInput(event) {
            const charCode = event.which ? event.which : event.keyCode;
            const inputValue = event.target.value;

            if (inputValue.indexOf('.') === -1 && inputValue.length >= 3 && charCode !== 46) {
                event.preventDefault();
                return false;
            }

            if (charCode >= 48 && charCode <= 57) {
                return true;
            }

            if (charCode === 46 && inputValue.indexOf('.') === -1 && inputValue.length > 0) {
                return true;
            }

            event.preventDefault();
            return false;
        }

        //valida los campos solo numeros
        function validarSoloNro(e) {
            var key;
            if (window.event) // IE
            {
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
        function handleFileSelect(input) {
            var fileUpload = document.getElementById('<%= fileUpload.ClientID %>');
            var fileName = input.value;
            var ext = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();

            if (ext === "jpg") {
                fileUpload.value = fileName;
            } else {
                alert("Por favor, seleccione un archivo JPG válido.");
                input.value = "";
                fileUpload.value = "";
            }
        }
    </script>


</asp:Content>
