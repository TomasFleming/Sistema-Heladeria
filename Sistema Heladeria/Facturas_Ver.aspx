<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Facturas_Ver.aspx.cs" Inherits="Sistema_Heladeria.Facturas_Ver" %>
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
</div><p>    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <div id="menu" style="display: none;">
        <table class="nav-justified">
            <tr>
                <td>
                    Proveedor:
                    <asp:TextBox ID="Prov_Filt_tx" runat="server" Width="100px" ReadOnly="True"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Popup_Prov_bt" runat="server" CssClass="btn btn-primary" OnClick="Popup_Prov_bt_Click" Text="Seleccionar" />
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
                    <asp:Button ID="Filtrar_btn" runat="server" OnClick="Buscar_fact_btn_Click" Visible="false" Text="Filtrar" />
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
                    <asp:Button ID="Lipiar_Filt_btn" runat="server" Text="Limpiar"  CssClass="btn btn-default" OnClick="Lipiar_Filt_btn_Click" />
                </td>
            </tr>
        </table>
    </div>
            </ContentTemplate>
    </asp:UpdatePanel></p>
    <p>
        <center>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate>
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
                         <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
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
     

        <div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
          <asp:UpdatePanel ID="UpdatePanel4" runat="server"><ContentTemplate>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Articulos de la Factura N°<asp:Label ID="ID_Ord_lb" runat="server" Visible="True"></asp:Label></h4></center></ContentTemplate></asp:UpdatePanel>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>
          <%-- aca deberia empesar el asp:UpdatePanel y el contentemplate, pero solo los nesesitaria para aquellos que nesesito para editar --%>
          <asp:UpdatePanel ID="UpdatePanel3" runat="server"><ContentTemplate>

              <table class="nav-justified" style="width: 60%; font-family: Arial; font-size: 18px; white-space:nowrap; height: 79px;">
        <tr>
            <td style="height: 28px; width: 144px">Proveedor :<br />
            </td>
            <td style="height: 28px; width: 244px"> <asp:Label ID="Prov_nom_lb" runat="server" style="font-size: 17px"></asp:Label>
            &nbsp;
                <br />
            </td>
            <td style="height: 28px; width: 155px;">Estado  :</td>
            <td style="height: 28px"> <asp:Label ID="Estado_Fact_lb" runat="server" style="font-size: 17px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 144px">Fecha de Emision :<br />
            </td>
            <td style="width: 244px" class="modal-sm"> <asp:Label ID="Fecha_Emision_lb" runat="server" style="font-size: 17px"></asp:Label>
                <br />
            </td>
            <td style="width: 155px">Fecha Registro :</td>
            <td> <asp:Label ID="Fecha_Reg_lb" runat="server" style="font-size: 17px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 144px">Tipo Factura :<br />
            </td>
            <td style="width: 244px" class="modal-sm"> <asp:Label ID="Tipo_lb" runat="server" style="font-size: 17px"></asp:Label>
                <br />
            </td>
            <td style="width: 155px">Importe Total :</td>
            <td> <asp:Label ID="Total_lb" runat="server" style="font-size: 17px"></asp:Label>
            </td>
        </tr>
    </table>

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
                <asp:BoundField DataField="Cant_fact" HeaderText="Cantidad" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Precio_Unit" HeaderText="Precio Unitario" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Total">
                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
            <ItemTemplate>
                <asp:Label ID="lblTotal" runat="server" Text='<%# (Convert.ToDecimal(Eval("Precio_Unit")) * Convert.ToInt32(Eval("Cant_fact"))).ToString("N2") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
                      </center> </ContentTemplate></asp:UpdatePanel> 
                  
                          
          <%--ass--%>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>    </div>
            <div id="ModalProv" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Seleccionar Proveedor<asp:Label ID="label55" runat="server" Text="Label" Visible="False"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p><%--ass--%>
          <asp:UpdatePanel ID="UpdatePanel7" runat="server">
              <ContentTemplate>
                        <asp:TextBox ID="Buscador_prov" runat="server" Width="257px" style="font-size: 15pt" Height="27px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Buscar_prov_btn" CssClass="btn btn-primary" runat="server"  Text="Buscar" OnClick="Buscar_prov_btn_Click" />
        <center>
            <asp:GridView ID="Lista_Proveedores" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" >
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="NombreCompleto" HeaderText="Nombre" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Telefono" HeaderText="Telefono" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Correo" HeaderText="Correo" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Direccion" HeaderText="Direccion" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Selecc_Prov_btn" runat="server" OnClick="Selecc_Prov_btn_Click" Text="Seleccionar" CssClass="btn btn-primary" />
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
        function openModal() {
            $('#myModal1').modal('show');
        }
        function closeModal() {
            $('#myModal1').modal('hide');
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
