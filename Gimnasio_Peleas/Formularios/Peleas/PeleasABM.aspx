<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="PeleasABM.aspx.cs" Inherits="Gimnasio_Peleas.Formularios.Peleas.PeleasABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

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
    <h1 style="text-align: center;"><%: Title %>Peleas</h1>

    <br />

    <div>
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <div class="mb-0" runat="server" id="divCodigo">
                    <label for="txtCodigo" class="form-label" runat="server">Codigo</label>
                    <asp:TextBox runat="server" ID="txtCodigo" class="form-control" disabled="" /><br />
                </div>

                <div>
                    <label for="ddlDojos" class="form-label">Sede de la pelea</label>
                    <asp:DropDownList ID="ddlDojos" CssClass="form-select" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="ddlDojos"
                        ErrorMessage="*" ValidationGroup="ValidarPeleador" InitialValue="Seleccione dojo..."></asp:RequiredFieldValidator>
                </div>

                <div class="row">
                    <div>
                        <div style="display: flex; flex-direction: column;">
                            <label for="txtPeleador1" class="form-label">Primer peleador</label>
                            <div style="display: flex;">
                                <asp:TextBox runat="server" ID="txtPeleador1" class="form-control" placeholder="Buscar peleador..." onkeypress="javascript:return SoloLetras(event)" Style="margin-right: 5px;" />
                                <asp:LinkButton ID="btnBuscarPeleador1" runat="server" CssClass="btn btn-info" OnClick="btnBuscarPeleador1_Click" data-toggle="tooltip" ToolTip="Filtrar">
                    <i class="fa-solid fa-search"></i>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <asp:DropDownList ID="ddlPeleador1" CssClass="form-select mt-2" runat="server" OnSelectedIndexChanged="ddlPeleador1_SelectedIndexChanged" AutoPostBack="true" ValidationGroup="ValidarPelea">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="ddlPeleador1"
                            ErrorMessage="*" ValidationGroup="ValidarPelea" InitialValue="Seleccione peleador..."></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row">
                    <div>
                        <div style="display: flex; flex-direction: column;">
                            <label for="txtPeleador2" class="form-label">Segundo peleador</label>
                            <div style="display: flex;">
                                <asp:TextBox runat="server" ID="txtPeleador2" class="form-control" placeholder="Buscar peleador..." onkeypress="javascript:return SoloLetras(event)" Style="margin-right: 5px;"></asp:TextBox>
                                <asp:LinkButton ID="btnBuscarPeleador2" runat="server" CssClass="btn btn-info" OnClick="btnBuscarPeleador2_Click" AutoPostBack="true" data-toggle="tooltip" ToolTip="Filtrar">
                    <i class="fa-solid fa-search"></i>
                                </asp:LinkButton>
                            </div>
                        </div>

                        <div style="display: flex;">
                            <asp:DropDownList ID="ddlPeleador2" CssClass="form-select mt-2" runat="server" AutoPostBack="true" ValidationGroup="ValidarPelea" Style="margin-right: 5px;"></asp:DropDownList>
                            <asp:Button ID="btnModalPeleadoresSimilares" runat="server" CssClass="btn btn-info ml-2" OnClick="btnModalPeleadoresSimilares_Click" Text="Peleadores similares" Style="margin-top: 8px;" />
                        </div>
                        <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="ddlPeleador2"
                            ErrorMessage="*" ValidationGroup="ValidarPelea" InitialValue="Seleccione peleador..."></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label for="txtFechaHora">Fecha</label>
                    <input type="datetime-local" id="txtFechaHora" class="form-control" runat="server" />
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtFechaHora"
                        ErrorMessage="*" ValidationGroup="ValidarPelea" InitialValue="Seleccione peleador..."></asp:RequiredFieldValidator>
                </div>

                <div class="mb-3">
                    <label for="txtObservaciones" class="form-label">Observaciones</label>
                    <asp:TextBox runat="server" ID="txtObservaciones" MaxLength="255" class="form-control" TextMode="MultiLine" Rows="5" />
                </div>

                <div class="mb-0">
                    <asp:Button ID="btnAgregar" ValidationGroup="ValidarPelea" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success" Text="Agregar" />
                    <asp:Button ID="btnModificar" ValidationGroup="ValidarPelea" runat="server" CssClass="btn btn-success" Text="Modificar" Visible="false" />
                    <asp:Button ID="btnCancelar" runat="server" CausesValidation="false" CssClass="btn btn-danger" Text="Cancelar" />
                </div>

            </div>
            <div class="col-md-2">
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalPeleadoresSimilares" tabindex="-1" role="dialog" aria-labelledby="miModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="miModalLabel">Peleadores similares</h5>
                </div>
                <div class="modal-body">
                    <%--DataGridView--%>
                    <asp:GridView runat="server" ID="dgvPeleadoresSimilares" DataKeyNames="Id" CssClass="table table-striped-columns" AutoGenerateColumns="false" ClientIDMode="Static">
                        <HeaderStyle CssClass="thead-dark" />
                        <Columns>
                            <asp:BoundField HeaderText="Código" DataField="Codigo" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            <asp:BoundField HeaderText="Nombre" DataField="NombreCompleto" ItemStyle-Width="700" HeaderStyle-Width="700" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            <asp:BoundField HeaderText="Peso" DataField="Peso" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            <asp:BoundField HeaderText="Altura" DataField="Altura" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            <asp:BoundField HeaderText="Peleas" DataField="CantidadPeleas" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            <asp:TemplateField HeaderText="Acción" ItemStyle-Width="50" HeaderStyle-Width="50" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnSeleccionarPeleadorSimilar" runat="server" OnClick="btnSeleccionarPeleadorSimilar_Click" CssClass="btn btn-info" data-toggle="tooltip" ToolTip="Seleccionar">
                    <i class="fa-solid fa-check"></i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                </div>
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

</asp:Content>
