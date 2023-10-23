<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ventas_Ver.aspx.cs" Inherits="Sistema_Heladeria.Ventas_Ver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header class="jumbotron text-center">
     <h2><strong>Registro de Ventas</strong></h2>
    </header>
     <div class="row">
    <div class="col-md-4"> <!-- Columna para el textbox -->
        <asp:TextBox ID="Buscador_Vents_tx" runat="server" class="form-control" placeholder="Insertar N° de Venta" style="width: 350px"></asp:TextBox>    </div>
    <div class="col-md-4"> <!-- Columna para los botones -->
         <asp:Button ID="Buscar_Vent_btn" CssClass="btn btn-primary" runat="server"  Text="Buscar" OnClick="Buscar_Vent_btn_Click"  />
         <asp:Button ID="Crear_Vent_btn" CssClass="btn btn-default" runat="server" Text="Crear Nueva Venta" PostBackUrl="~/Ventas_Crear_Nueva.aspx"  />
        <%--<asp:Button ID="Abrir_Filt_btn" CssClass="btn btn-primary"  runat="server" Text="Agregar Filtros" />--%>
        <button id="Abrir_Filt_btn" class="btn btn-tertiary" type="button">Cambiar Filtros</button>
    </div>
</div><p>    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
    <div id="menu" style="display: none;">
        <table class="nav-justified">
            <tr>
                <td>
                    Cliente:
                    <asp:TextBox ID="Cliente_Filt_tx" runat="server" Width="100px" ReadOnly="True"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Popup_Client_bt" runat="server" CssClass="btn btn-primary" OnClick="Popup_Client_bt_Click" Text="Seleccionar" />
                </td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Fecha Minima:
                    <asp:TextBox ID="Fecha_min_tx" runat="server" TextMode="Date" Width="100px"></asp:TextBox>
                </td>
                <td>Fecha Maxima:
                    <asp:TextBox ID="Fecha_Max_tx" runat="server" TextMode="Date" Width="100px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="Filtrar_btn" runat="server" OnClick="Buscar_Vent_btn_Click" Text="Filtrar" />
                </td>
            </tr>
            <tr>
                <td>
                    Precio Minimo:
                    <asp:TextBox ID="Precio_min_tx" runat="server" TextMode="Number" Width="100px"></asp:TextBox>
                </td>
                <td>
                    Precio Maximo:
                    <asp:TextBox ID="Precio_Max_tx" runat="server" TextMode="Number" Width="100px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Lipiar_Filt_btn" runat="server" OnClick="Lipiar_Filt_btn_Click" Text="Limpiar" />
                </td>
            </tr>
        </table>
    </div>
            </ContentTemplate>
    </asp:UpdatePanel></p>
    <p>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
            <asp:GridView ID="Lista_facturas" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="1235px">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="NombreCompleto" HeaderText="Cliente" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Fecha" HeaderText="Fecha Emision" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MetodoPago" HeaderText="Metodo de Pago" >
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
    </p>
    <%-- Inicia el popup --%>
    <div id="ModalArt" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Articulos de la Venta N°<asp:Label ID="ID_Vemta" runat="server" Visible="true"></asp:Label>:</h4></center>
      </div>
      <div class="modal-body">
        <p></p>
          <%--aasasdasasadsads--%>
          <asp:UpdatePanel ID="UpdatePanel3" runat="server">
              <ContentTemplate>
        <center>
            <asp:GridView ID="Lista_Detalle" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
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
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PrecioUnid" HeaderText="Precio Unitario" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Total">
            <ItemTemplate>
                <asp:Label ID="lblTotal" runat="server" Text='<%# (Convert.ToDecimal(Eval("PrecioUnid")) * Convert.ToInt32(Eval("Cantidad"))).ToString("0.00") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
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
    <div id="ModalProv" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Seleccionar Cliente<asp:Label ID="label55" runat="server" Text="Label" Visible="False"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>
          <asp:UpdatePanel ID="UpdatePanel4" runat="server">
              <ContentTemplate>
                        <asp:TextBox ID="Buscador_cliente" runat="server" Width="257px" style="font-size: 15pt" Height="27px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Buscar_client_btn" CssClass="btn btn-primary" runat="server"  Text="Buscar" OnClick="Buscar_client_btn_Click" />
        <center>
            <asp:GridView ID="Lista_Clientes" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="NombreCompleto" HeaderText="Nombre" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="DNI" HeaderText="Documento" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Telefono" HeaderText="Telefono" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Correo" HeaderText="Correo" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Selecc_Cliente_btn" runat="server" OnClick="Selecc_Cliente_btn_Click" Text="Seleccionar" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
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
        function openModalProv() {
            $('#ModalProv').modal('show');
        }
        function closeModalProv() {
            $('#ModalProv').modal('hide');
        }
    </script>
</asp:Content>
