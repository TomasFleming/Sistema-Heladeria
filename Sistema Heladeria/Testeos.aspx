<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Testeos.aspx.cs" Inherits="Sistema_Heladeria.Testeos" EnableSessionState="True" EnableEventValidation="False" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header class="jumbotron text-center">
     <h2><strong>Lista de Facturas</strong></h2>
        <div class="header-right">
            <div class="date-time">
                <span id="currentDate"></span>
                <span id="currentTime"></span>
            </div>
        </div>
    </header>
<%--    <center><p style="font-size: 40px; font-weight: bold; color:#0094ff;font-family: Arial, sans-serif;">Listas De Facturas</p></center>--%>
    <div class="row">
    <div class="col-md-4"> <!-- Columna para el textbox -->
        <asp:TextBox ID="Buscador_Fact_tx" runat="server" class="form-control" placeholder="Insertar N° de Factura" style="width: 400px"></asp:TextBox>    </div>
    <div class="col-md-4"> <!-- Columna para los botones -->
         <asp:Button ID="Buscar_fact_btn" CssClass="btn btn-primary" runat="server"  Text="Buscar" OnClick="Buscar_fact_btn_Click"  />
         <asp:Button ID="Crear_fact_btn" CssClass="btn btn-default" runat="server" Text="Crear Nueva Factura" OnClick="Crear_fact_btn_Click" PostBackUrl="~/Facturas_Crear_Nueva.aspx"  />
        <%--<asp:Button ID="Abrir_Filt_btn" CssClass="btn btn-primary"  runat="server" Text="Agregar Filtros" />--%>
        <button id="Abrir_Filt_btn" class="btn btn-tertiary" type="button">Cambiar Filtros</button>
    </div>
</div><p>    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
    <div id="menu" style="display: block;">
        <table class="nav-justified">
            <tr>
                <td>
                    Proveedor:
                    <asp:DropDownList ID="Prov_select_lt" runat="server" DataSourceID="SqlDataSource1" DataTextField="NombreCompleto" DataValueField="ID" OnDataBound="Prov_select_lt_DataBound">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Heladeria Sistemas 3ConnectionString %>" SelectCommand="SELECT [ID], [NombreCompleto] FROM [Proveedores]"></asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Fecha Mínima:
                    <asp:TextBox ID="Fecha_min_tx" runat="server" TextMode="Date" Width="100px"></asp:TextBox>
                </td>
                <td>Fecha Máxima:
                    <asp:TextBox ID="Fecha_Max_tx" runat="server" TextMode="Date" Width="100px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="Filtrar_btn" runat="server" OnClick="Buscar_fact_btn_Click" Text="Filtrar" />
                </td>
            </tr>
            <tr>
                <td>
                    Precio Mínimo:
                    <asp:TextBox ID="Precio_min_tx" runat="server" TextMode="Number" Width="100px"></asp:TextBox>
                </td>
                <td>
                    Precio Máximo:
                    <asp:TextBox ID="Precio_Max_tx" runat="server" TextMode="Number" Width="100px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Lipiar_Filt_btn" runat="server" Text="Limpiar" OnClick="Lipiar_Filt_btn_Click" />
                </td>
            </tr>
        </table>
    </div>
            </ContentTemplate>
    </asp:UpdatePanel></p>
    <p>
        <center>
            <asp:UpdatePanel ID="UpdatePanel3" runat="server"><ContentTemplate>
            <asp:GridView ID="Lista_facturas" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="1235px">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="NombreCompleto" HeaderText="Proveedor" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Cod_Prov" HeaderText="Número Factura Proveedor" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Estado" HeaderText="Estado" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Fecha_Emision" HeaderText="Fecha Emisión" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Fecha_Vencimiento" HeaderText="Fecha Vencimiento" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                     <asp:BoundField DataField="Total" HeaderText="Total" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Ver_Detalle_btn" runat="server" OnClick="Ver_Detalle_btn_Click" Text="Ver Detalle" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
                </ContentTemplate></asp:UpdatePanel>
        </center>
    </p>



    <p></p>
    <p>

        <table class="auto-style6">
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Nomb_lb" runat="server" Text="Sabor de Helado Nuevo:"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="Sabor_tx" runat="server" CssClass="auto-style5" Width="225px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style9" style="height: 30px">
                    <asp:Label ID="Precio_lb" runat="server" Text="Precio:"></asp:Label>
                </td>
                <td class="auto-style10" style="height: 30px">
                    <asp:TextBox ID="Precio_txt" runat="server" CssClass="auto-style5" TextMode="Number" Width="225px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Descripcion_lb" runat="server" Text="Descripción:"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="Descrip_tx" runat="server" CssClass="auto-style5" Height="95px" Width="225px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Imag_lbl" runat="server" Text="Imagen"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:FileUpload ID="Imagen_Helado_direc" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="prueba_lb" runat="server" Text="no" Visible="False"></asp:Label>
                </td>
                <td class="auto-style12">
                    <center>
                    <asp:Button ID="Guardar_Helado_btn" runat="server" OnClick="Guardar_Nuevo_Click" Text="Guardar" />
                    </center>
                </td>
            </tr>
        </table>

    </p>

        <div class="row">
    <div class="col-md-4"> <!-- Columna para el textbox -->

    </div>
    <div class="col-md-4"> <!-- Columna para los botones -->

    </div>
</div>

    <p>
        <input id="Text1" type="text" class="form-control" placeholder="Buscador" style="width: 350px" />
    </p>
    <p>
        <asp:GridView ID="Articulos_Colum" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="1235px">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD" />
                <asp:TemplateField HeaderText="Imagen" ValidateRequestMode="Enabled">
                            <ItemTemplate>
                                <asp:Image Id="ImagenHelado" runat="server"  Height="150px" Width="150px" ImageUrl='<%#"data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Imagen")) %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                <asp:BoundField DataField="Sabor" HeaderText="Nombre" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                <asp:BoundField DataField="Precio" HeaderText="Precio" />
            </Columns>
        </asp:GridView>
    </p>
    <p>

    </p>
    <p>
        <%--      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>--%><%--  <script type="text/javascript">
      function openModal() {
          $('#myModal1').modal('show');
      }
      function closeModal() {
          $('#myModal1').modal('hide');
      }
  </script>--%>

    <!-- Modal content-->
        <%-- termina  --%>        <%-- Inicia el popup Articulos--%><%--aasasdasasadsads--%>          <%-- aca deberia empesar el asp:UpdatePanel y el contentemplate, pero solo los nesesitaria para aquellos que nesesito para editar --%><%--ass--%>              
                          
          <%--        </div>--%>
<%--      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>--%>
<%--  <script type="text/javascript">
      function openModal() {
          $('#myModal1').modal('show');
      }
      function closeModal() {
          $('#myModal1').modal('hide');
      }
  </script>--%>
    <%-- termina  --%>
        <asp:Button ID="Pop_Art_bt" runat="server" Text="Agregar Artículo" CssClass="btn btn-default" OnClick="Pop_Art_bt_Click" />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="pop2" runat="server" Text="Agregar Artículo" CssClass="btn btn-default" OnClick="pop2_Click" />
        </p>
    <p>
        <ajaxToolkit:CalendarExtender ID="Fechar_ord_tx_CalendarExtender" runat="server" TargetControlID="TextBox1" />
        </p>
    
    <%-- Inicia el popup --%>
    <div id="ModalArt" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Seleccionar Articulo<asp:Label ID="label2" runat="server" Text="Label" Visible="False"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p>
          <%--aasasdasasadsads--%>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
        <center>
            
        </center>
                  </ContentTemplate>
          </asp:UpdatePanel>
          <%--ass--%>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
  <script type="text/javascript">
      function openModalArt() {
          $('#ModalArt').modal('show');
      }
      function closeModalArt() {
          $('#ModalArt').modal('hide');
      }
  </script>
                <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Popup de Búsqueda</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Contenido del Popup</p>
                            <input type="text" id="txtBusqueda" placeholder="Ingrese su búsqueda" class="form-control" />
                            <asp:TextBox ID="TextBox2" runat="server" Width="257px" style="font-size: 15pt" Height="27px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="buscar2btn" CssClass="btn btn-primary" runat="server" OnClick="buscar2btn_Click" Text="Buscar" />
        <center>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Nombre_Categoria" HeaderText="Categoria" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Precio" HeaderText="Precio" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Selecc_Art_bt" runat="server" OnClick="Selecc_Art_bt_Click" Text="Seleccionar" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
        </center>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            <button type="button" class="btn btn-primary" onclick="realizarBusqueda()">Buscar</button>
                        </div>
                    </div>
                    
                </div>
            </div>
<%--        </div>--%>

        <script type="text/javascript">
            function realizarBusqueda() {
                // Agrega aquí la lógica de búsqueda o llamada AJAX
                var busqueda = document.getElementById('txtBusqueda').value;
                alert('Realizando búsqueda: ' + busqueda);
            }
            function openModal() {
                $('#myModal').modal('show');
            }


            document.getElementById("Abrir_Filt_btn").addEventListener("click", function () {
                var menu = document.getElementById("menu");
                if (menu.style.display === "none" || menu.style.display === "") {
                    menu.style.display = "block";
                    this.innerHTML = "Ocultar Filtros";
                } else {
                    menu.style.display = "none";
                    this.innerHTML = "Cambiar Filtros";
                }
            });


            const toggleButton = document.getElementById('Abrir_Filt_btn');
            const menuItems = document.getElementById('menu');

            toggleButton.addEventListener('click', (event) => {
                event.preventDefault();

                menuItems.classList.toggle('show');
            });

        </script>

        <script>
            function updateDateTime() {
                var now = new Date();
                var currentDate = now.toLocaleDateString();
                var currentTime = now.toLocaleTimeString();

                document.getElementById("currentDate").textContent = "Fecha: " + currentDate;
                document.getElementById("currentTime").textContent = " - Hora: " + currentTime;
            }

            // Actualiza la fecha y hora cada segundo
            setInterval(updateDateTime, 1000);

            // Ejecuta la función una vez para mostrar la fecha y hora de inmediato
            updateDateTime();
        </script>

</asp:Content>
