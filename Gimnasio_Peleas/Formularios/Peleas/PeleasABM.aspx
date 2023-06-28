<%@ Page Language="C#" MasterPageFile="~/Site.Mobile.Master" AutoEventWireup="true" CodeBehind="PeleasABM.aspx.cs" Inherits="Gimnasio_Peleas.Formularios.Peleas.PeleasABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--CSS--%>
    <link href="~/Stylesheets/peleas.css" rel="stylesheet" />

    <script type="text/javascript">
        document.title = 'PeleasABM';
    </script>

    <br />
    <h1 style="text-align: center;"><%: Title %>Peleas</h1>

    <div>
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <div>
                    <label for="ddlDojos" class="form-label">Sede</label>
                    <asp:DropDownList ID="ddlDojos" CssClass="form-select" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="ddlDojos"
                        ErrorMessage="*" ValidationGroup="ValidarPelea" InitialValue="0"></asp:RequiredFieldValidator>
                </div>

                <div class="row">
                    <div>
                        <div style="display: flex; flex-direction: column;">
                            <label for="txtPeleador1" class="form-label">Rincon rojo</label>
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
                            ErrorMessage="*" ValidationGroup="ValidarPelea" InitialValue="0"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row">
                    <div>
                        <div style="display: flex; flex-direction: column;">
                            <label for="txtPeleador2" class="form-label">Rincon azul</label>
                            <div style="display: flex;">
                                <asp:TextBox runat="server" ID="txtPeleador2" class="form-control" placeholder="Buscar peleador..." onkeypress="javascript:return SoloLetras(event)" Style="margin-right: 5px;"></asp:TextBox>
                                <asp:LinkButton ID="btnBuscarPeleador2" runat="server" CssClass="btn btn-info" OnClick="btnBuscarPeleador2_Click" AutoPostBack="true" data-toggle="tooltip" ToolTip="Filtrar">
                    <i class="fa-solid fa-search"></i>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div style="display: flex;">
                            <asp:DropDownList ID="ddlPeleador2" CssClass="form-select mt-2" runat="server" AutoPostBack="true" ValidationGroup="ValidarPelea" Style="margin-right: 5px;"></asp:DropDownList>
                            <asp:Button ID="btnModalPeleadoresSimilares" runat="server" CssClass="btn btn-info ml-2" OnClick="btnModalPeleadoresSimilares_Click" Text="Peleadores similares" Style="margin-top: 8px;" data-bs-toggle="tooltip" ToolTip="Filtrar" />
                        </div>
                        <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="ddlPeleador2"
                            ErrorMessage="*" ValidationGroup="ValidarPelea" InitialValue="0"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <label class="form-label">Filtros para peleadores similares</label>
                <div class="form-check-container" style="flex: 1px; margin-bottom: 15px;">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="checkboxPeso" runat="server" />
                        <label class="form-check-label" for="checkboxPeso">Peso</label>
                        <asp:TextBox ID="txtFiltroPeso" runat="server" MaxLength="6" oninput="validarInput(this)" Style="width: 30px; font-size: 10px;"></asp:TextBox>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="checkboxEdad" runat="server" />
                        <label class="form-check-label" for="checkboxEdad">Edad</label>
                        <asp:TextBox ID="txtFiltroEdad" runat="server" MaxLength="2" oninput="soloNumeros(this)" Style="width: 30px; font-size: 10px;"></asp:TextBox>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="checkboxCantidadPeleas" runat="server" />
                        <label class="form-check-label" for="checkboxCantidadPeleas">Peleas</label>
                        <asp:TextBox ID="txtFiltroCantidadPeleas" runat="server" oninput="soloNumeros(this)" MaxLength="3" Style="width: 30px; font-size: 10px;"></asp:TextBox>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="checkboxCategoria" runat="server" />
                        <label class="form-check-label" for="checkboxCategoria">Categoría</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="checkboxModalidad" runat="server" />
                        <label class="form-check-label" for="checkboxModalidad">Modalidad</label>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="txtObservaciones" class="form-label">Observaciones para la pelea</label>
                    <asp:TextBox runat="server" ID="txtObservaciones" MaxLength="255" class="form-control" TextMode="MultiLine" Rows="5" />
                </div>

                <div class="mb-0">
                    <asp:Button ID="btnAgregar" ValidationGroup="ValidarPelea" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success" Text="Agregar" />
                    <asp:Button ID="btnModificar" ValidationGroup="ValidarPelea" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-success" Text="Modificar" Visible="false" />
                    <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" CausesValidation="false" CssClass="btn btn-danger" Text="Cancelar" />
                </div>

            </div>
            <div class="col-md-2">
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalPeleadoresSimilares" tabindex="-1" role="dialog" aria-labelledby="miModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="miModalLabel">Peleadores similares</h5>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <asp:GridView runat="server" ID="dgvPeleadoresSimilares" DataKeyNames="Id" CssClass="table table-striped-columns" AutoGenerateColumns="false" ClientIDMode="Static">
                            <HeaderStyle CssClass="thead-dark" />
                            <Columns>
                                <asp:BoundField HeaderText="Nombre" DataField="NombreCompleto" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center word-break-all" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Peso" DataField="PesoTexto" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Edad" DataField="Edad" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Altura" DataField="AlturaTexto" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Peleas" DataField="CantidadPeleas" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Modalidad" DataField="TipoPelea.Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" />
                                <asp:TemplateField HeaderText="Info" ItemStyle-Width="100" HeaderStyle-Width="100" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <i class="fa-solid fa-info-circle observaciones-icon" title='<%# Eval("Observaciones") %>'></i>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Acción" ItemStyle-Width="50" HeaderStyle-Width="50" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnSeleccionarPeleadorSimilar" runat="server" OnClick="btnSeleccionarPeleadorSimilar_Click" CssClass="btn btn-info" data-bs-toggle="tooltip" data-bs-placement="top" ToolTip="Seleccionar">
                    <i class="fa-solid fa-check"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        //Valida solo numeros
        function soloNumeros(elemento) {
            if (elemento.value.length > 3) {
                elemento.value = elemento.value.slice(0, 3);
            }
            if (isNaN(elemento.value)) {
                elemento.value = "";
            }
        }

        //Valida numeros decimales
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
