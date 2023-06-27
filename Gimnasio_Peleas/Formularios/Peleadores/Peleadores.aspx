<%@ Page Language="C#" MasterPageFile="~/Site.Mobile.Master" AutoEventWireup="true" CodeBehind="Peleadores.aspx.cs" Inherits="Gimnasio_Peleas.Formularios.Peleadores.Peleadores" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--CSS--%>
    <link href="~/Stylesheets/peleadores.css" rel="stylesheet" />

    <script type="text/javascript">
        document.title = 'Peleadores';
    </script>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div class="container">
                <div class="row" style="margin-bottom: 8px;">
                    <div class="col-md-12">
                        <div class="widget custom-border">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <input type="text" id="txtBusqueda" class="form-control" onkeyup="filterGrid(event)" placeholder="Filtrar peleadores..." />
                                </div>
                                <div class="col-md-6 text-end">
                                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                        <asp:LinkButton ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success btn-lg" onkeypress="return disableEnterKey(event)" data-toggle="tooltip" ToolTip="Nuevo peleador">
                                    <i class="fa-solid fa-plus"></i>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                        <asp:LinkButton ID="btnFiltrar" OnClick="btnFiltrar_Click" runat="server" CssClass="btn btn-primary btn-lg" onkeypress="return disableEnterKey(event)" data-toggle="tooltip" ToolTip="Exportar a Excel">
                                    <i class="fa-solid fa-download"></i>                                        
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:GridView runat="server" ID="dgvPeleadores" DataKeyNames="Id" CssClass="table table-striped table-white" AutoGenerateColumns="false" ClientIDMode="Static">
                            <Columns>
                                <asp:BoundField HeaderText="Nombre" DataField="NombreCompleto" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                                <asp:BoundField HeaderText="Categoría" DataField="Categoria.Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                                <asp:BoundField HeaderText="Modalidad" DataField="TipoPelea.Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                                <asp:BoundField HeaderText="Cantidad de Peleas" DataField="CantidadPeleas" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                                <asp:BoundField HeaderText="Team" DataField="Dojo.Nombre" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle" />
                                <asp:TemplateField HeaderText="Acción" ItemStyle-Width="150" HeaderStyle-Width="150" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center align-middle">
                                    <ItemTemplate>
                                        <div class="d-flex justify-content-center align-items-center">
                                            <asp:LinkButton ID="btnAbrirModalPeleador" runat="server" Text="Abrir Modal" OnClick="btnAbrirModalPeleador_Click" data-bs-toggle="tooltip" ToolTip="Detalle" CssClass="btn btn-info me-1">
            <i class="fa-solid fa-search"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-success me-1" data-bs-toggle="tooltip" ToolTip="Modificar">
            <i class="fa-solid fa-pen-to-square"></i>
                                            </asp:LinkButton>

                                            <asp:LinkButton ID="btnAbrirModalEliminarPeleador" runat="server" OnClick="btnAbrirModalEliminarPeleador_Click" data-bs-toggle="tooltip" CssClass="btn btn-danger" ToolTip="Eliminar" ClientIDMode="Static">
            <i class="fa-solid fa-trash"></i>
                                            </asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <!-- Modales -->

            <div class="modal fade" id="modalPeleador" tabindex="-1" role="dialog" aria-labelledby="miModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="miModalLabel" runat="server">Informacion del peleador</h5>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="txtDojo" class="form-label">Team</label>
                                    <asp:TextBox runat="server" ID="txtDojo" class="form-control" disabled="" />

                                    <label for="txtCategoria" class="form-label">Categoria</label>
                                    <asp:TextBox runat="server" ID="txtCategoria" class="form-control" disabled="" />

                                    <label for="txtModalidad" class="form-label">Modalidad</label>
                                    <asp:TextBox runat="server" ID="txtModalidad" class="form-control" disabled="" />

                                    <label for="txtPeso" class="form-label">Peso</label>
                                    <asp:TextBox runat="server" ID="txtPeso" class="form-control" disabled="" />

                                    <label for="txtEdad" class="form-label">Edad</label>
                                    <asp:TextBox runat="server" ID="txtEdad" class="form-control" disabled="" />

                                    <label for="txtAltura" class="form-label">Altura</label>
                                    <asp:TextBox runat="server" ID="txtAltura" class="form-control" disabled="" />
                                </div>
                                <div class="col-md-6">
                                    <asp:Image ID="ImageDetalle" runat="server" style="margin-top:11px;" CssClass="modal-photo img-fluid" />

                                    <label for="txtCantidadPeleas" class="form-label">Cantidad de Peleas</label>
                                    <asp:TextBox runat="server" ID="txtCantidadPeleas" class="form-control" disabled="" />

                                    <label for="txtGenero" class="form-label">Genero</label>
                                    <asp:TextBox runat="server" ID="txtGenero" class="form-control" disabled="" />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="modalEliminar" tabindex="-1" role="dialog" aria-labelledby="modalEliminarLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalEliminarLabel">Confirmar eliminación</h5>
                        </div>
                        <div class="modal-body">
                            ¿Estás seguro de que deseas eliminar el peleador?
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger" data-bs-dismiss="modal" />
                            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" CssClass="btn btn-success" />
                        </div>
                    </div>
                </div>
            </div>

            <%--Modales--%>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>

    <script>
        function disableEnterKey(e) {
            var key;
            if (window.event)
                key = window.event.keyCode; // Para navegadores antiguos
            else
                key = e.which; // Para navegadores modernos

            if (key === 13) { // 13 es el código de tecla para "Enter"
                return false; // Cancela el comportamiento predeterminado del "Enter"
            }
        }
        document.onkeydown = disableEnterKey; // Intercepta todas las pulsaciones de teclas
    </script>


    <script type="text/javascript">
        function normalize(text) {
            return text.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
        }

        function filterGrid() {
            var input, filter, table, tr, td, i, j, txtValue;
            input = document.getElementById("txtBusqueda");
            filter = normalize(input.value.toUpperCase());
            table = document.getElementById("dgvPeleadores");
            tr = table.getElementsByTagName("tr");

            for (i = 1; i < tr.length; i++) {
                var found = false;
                for (j = 0; j < tr[i].cells.length; j++) {
                    td = tr[i].cells[j];
                    if (td) {
                        txtValue = normalize(td.textContent || td.innerText).toUpperCase();
                        if (txtValue.indexOf(filter) > -1) {
                            found = true;
                            break;
                        }
                    }
                }
                if (found) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    </script>

    <script>
        function resizeImage() {
            var fileInput = document.getElementById('fileUpload');
            var file = fileInput.files[0];
            var reader = new FileReader();

            reader.onload = function (e) {
                var img = document.createElement('img');
                img.onload = function () {
                    var canvas = document.createElement('canvas');
                    var ctx = canvas.getContext('2d');

                    // Define el nuevo tamaño deseado
                    var nuevoAncho = 800;
                    var nuevoAlto = 600;

                    // Calcula las dimensiones proporcionales para mantener la relación de aspecto
                    var proporcion = Math.min(nuevoAncho / img.width, nuevoAlto / img.height);
                    var anchoRedimensionado = img.width * proporcion;
                    var altoRedimensionado = img.height * proporcion;

                    // Configura el tamaño del lienzo
                    canvas.width = anchoRedimensionado;
                    canvas.height = altoRedimensionado;

                    // Dibuja la imagen redimensionada en el lienzo
                    ctx.drawImage(img, 0, 0, anchoRedimensionado, altoRedimensionado);

                    // Obtiene la imagen redimensionada en formato base64
                    var imagenRedimensionadaBase64 = canvas.toDataURL('image/jpeg');

                    // Envía la imagen redimensionada al servidor
                    // Aquí puedes usar AJAX o enviarla mediante un formulario
                    // por ejemplo, utilizando FormData

                    // Ejemplo utilizando AJAX
                    var xhr = new XMLHttpRequest();
                    xhr.open('POST', 'GuardarImagen.aspx', true);
                    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            // La imagen se ha guardado correctamente
                        }
                    };
                    xhr.send('imagenBase64=' + encodeURIComponent(imagenRedimensionadaBase64));
                };

                img.src = e.target.result;
            };

            reader.readAsDataURL(file);
        }
    </script>

</asp:Content>
