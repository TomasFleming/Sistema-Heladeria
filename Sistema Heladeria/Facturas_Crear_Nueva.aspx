<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Facturas_Crear_Nueva.aspx.cs" Inherits="Sistema_Heladeria.Facturas_Crear_Nueva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified">
        <tr>
    <td rowspan="2" style="width: 603px; font-size: 50px; color: #FF6666;">
                <center>
                    Registro Factura
                    Proveedor
                </center>
            </td>
            <td style="height: 38px">
    <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; margin-left: 0px;">
        Numero de Factura a Crear:&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Nro_Fact_lb" runat="server"></asp:Label>
    </p>
            </td>
        </tr>
        <tr>
            <td style="height: 47px">
                &nbsp;</td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
        <ContentTemplate>
    <table class="tableDist" border="0" style="border-style: solid; border-width: 0px 3px 0px 3px; border-color: #CCCCCC; padding: 0px; clip: rect(0px, 0px, 0px, 0px);">
        <tr>
            <td class="modal-lg" style="border-left: 3px solid #C0C0C0; border-right: 3px solid #C0C0C0; border-top: 3px solid #C0C0C0; width: 525px; border-bottom-color: #C0C0C0; border-bottom-width: 3px;">Detalles del Proveedor :&nbsp;&nbsp;&nbsp;<asp:Button ID="PopUp_Prov_bt" runat="server" Text="Seleccionar Proveedor" CssClass="btn btn-default" OnClick="PopUp_Prov_bt_Click"/>
            </td>
            <td class="modal-lg" style="border-style: inherit; border-color: #FFFFFF; border-width: 0px; width: 107px; background-color: #FFFFFF; border-collapse: separate; table-layout: inherit; border-spacing: inherit; empty-cells: hide;">&nbsp;</td>
            <td style="border-width: 3px; border-color: #C0C0C0; border-right-style: solid; border-left-style: solid; border-top-style: solid;">Detalles de la Fectura:&nbsp;&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-lg" style="border-left: 3px solid #C0C0C0; border-right: 3px solid #C0C0C0; width: 525px; border-top-color: #C0C0C0; border-top-width: 3px; border-bottom-color: #C0C0C0; border-bottom-width: 3px;">Numero Proveedor:
                <asp:Label ID="Prov_ID_lb" runat="server" style="font-size: 20px"></asp:Label>
                <br />
                Nombre :&nbsp;&nbsp; <asp:Label ID="Prov_nom_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td class="modal-sm" style="border-style: inherit; border-color: #FFFFFF; border-width: 0px; width: 107px; background-color: #FFFFFF; border-collapse: separate; table-layout: inherit; border-spacing: inherit; empty-cells: hide;">&nbsp;</td>
            <td style="border-width: 3px; border-color: #C0C0C0; border-right-style: solid; border-left-style: solid;">
                <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; margin-left: 0px;">
                    Codigo Factura del Proveedor:
                    <asp:TextBox ID="Cod_Prov_tx" runat="server" TextMode="Number" Width="140px"></asp:TextBox>
                </p>
            </td>
        </tr>
        <tr>
            <td class="modal-lg" style="border-left: 3px solid #C0C0C0; border-right: 3px solid #C0C0C0; width: 525px; border-top-color: #C0C0C0; border-top-width: 3px; border-bottom-color: #C0C0C0; border-bottom-width: 3px;">Telefono:&nbsp;&nbsp;<asp:Label ID="Telf_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td class="modal-lg" style="border-style: inherit; border-color: #FFFFFF; border-width: 0px; width: 107px; background-color: #FFFFFF; border-collapse: separate; table-layout: inherit; border-spacing: inherit; empty-cells: hide;">&nbsp;</td>
            <td style="border-width: 3px; border-color: #C0C0C0; border-right-style: solid; border-left-style: solid;">
                <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                    Fecha de Emision :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>
                    <asp:TextBox ID="Fecha_Creacion_tx" runat="server" style="font-size: 13pt; font-weight: bold" TextMode="DateTime" Width="190px"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="Fecha_Creacion_tx" />
                    </strong>
                </p>
            </td>
        </tr>
        <tr>
            <td class="modal-lg" style="border-left: 3px solid #C0C0C0; border-right: 3px solid #C0C0C0; width: 525px; border-top-color: #C0C0C0; border-top-width: 3px; border-bottom-color: #C0C0C0; border-bottom-width: 3px;">Direccion:&nbsp;&nbsp;<asp:Label ID="Direc_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td class="modal-sm" style="border-style: inherit; border-color: #FFFFFF; border-width: 0px; width: 107px; background-color: #FFFFFF; border-collapse: separate; table-layout: inherit; border-spacing: inherit; empty-cells: hide;">&nbsp;</td>
            <td style="border-width: 3px; border-color: #C0C0C0; border-right-style: solid; border-left-style: solid;">
                <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                    Fecha de Vencimiento :&nbsp;<strong><asp:TextBox ID="Fecha_Venc_tx" runat="server" style="font-size: 13pt; font-weight: bold" TextMode="DateTime" Width="190px"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Fecha_Venc_tx" />
                    </strong>
                </p>
            </td>
        </tr>
        <tr>
            <td class="modal-lg" style="border-left: 3px solid #C0C0C0; border-right: 3px solid #C0C0C0; border-bottom: 3px solid #C0C0C0; width: 525px; border-top-color: #C0C0C0; border-top-width: 3px;">Correo:&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="Correo_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td class="modal-sm" style="border-style: inherit; border-color: #FFFFFF; border-width: 0px; width: 107px; background-color: #FFFFFF; border-collapse: separate; table-layout: inherit; border-spacing: inherit; empty-cells: hide;">&nbsp;</td>
            <td style="border-width: 3px; border-color: #C0C0C0; border-right-style: solid; border-left-style: solid; border-bottom-style: solid;">&nbsp;</td>
        </tr>
    </table>
                    </ContentTemplate>
    </asp:UpdatePanel>
    <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
        Articulos solicitados:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Pop_Art_bt" runat="server" Text="Agregar Articulo" CssClass="btn btn-default" OnClick="Pop_Art_bt_Click" />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
        <center>
            <asp:GridView ID="Lista_Art_Fact" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="1235px">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Categoria" HeaderText="Categoria" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Precio" HeaderText="Precio c/u" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Total">
            <ItemTemplate>
                <asp:Label ID="lblTotal" runat="server" Text='<%# (Convert.ToDecimal(Eval("Precio")) * Convert.ToInt32(Eval("Cantidad"))).ToString("0.00") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Quitar_art" runat="server" OnClick="Quitar_art_Click" Text="Quitar" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
        </center>
                            </ContentTemplate>
        </asp:UpdatePanel>
    &nbsp;<asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
        <table class="nav-justified" style="border-bottom-style: solid; border-width: thin; font-family: Arial, Helvetica, sans-serif; font-size: 14px; border-top-style: solid;">
        <tr>
            <td style="border-bottom-style: solid; border-width: thin">SubTotal:<asp:Label ID="Sub_tot_lb" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Total:<asp:Label ID="Total_lb" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
    </table></ContentTemplate></asp:UpdatePanel>
    <p>
        <center>
            <asp:Button ID="Guardar_Fact_btn" CssClass="btn btn-success" runat="server" Text="Guardar Factura" OnClick="Guardar_Fact_btn_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Cancelar_Fact_btn" runat="server" CssClass="btn btn-danger" OnClick="Cancelar_Fact_btn_Click" Text="Cancelar Factura" />
        </center>
    </p>
    <p>    
        &nbsp;</p>

<%-- Inicia el popup Proveedores--%>
    <div id="ModalProv" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Seleccionar Proveedor<asp:Label ID="label55" runat="server" Text="Label" Visible="False"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>
          <asp:UpdatePanel ID="UpdatePanel3" runat="server">
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

<%-- Inicia el popup Agregar el Articulo--%>
    <div id="ModalSelectArt" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
        <asp:UpdatePanel ID="UpdatePanel7" runat="server">
            <ContentTemplate>

            
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Articulo N°<asp:Label ID="ID_Art_sel_lb" runat="server" Visible="True"></asp:Label> :</h4></center>
      </div></ContentTemplate>
        </asp:UpdatePanel>
      <div class="modal-body">
        <p></p>
          
          <asp:UpdatePanel ID="UpdatePanel6" runat="server">
              <ContentTemplate>
                  <center><div class="row">
                      <div class="col-md-3"> <!-- Columna para que quede bien centrado -->
                      </div>
    <div class="col-md-4"> <!-- Columna para el textbox -->
         <asp:TextBox ID="Buscador_art" runat="server" class="form-control" placeholder="Buscador" style="width: 250px"></asp:TextBox>
    </div>
    <div class="col-md-4"> <!-- Columna para los botones -->
        <asp:Button ID="Buscar_art_btn" CssClass="btn btn-primary" runat="server" OnClick="Buscar_art_btn_Click" Text="Buscar" />
    </div>
</div></center><p></p>
                  <center>
        
                      <table id="Tabla_cat1" style="width: 27%; height: 212px;">
        <tr>
            <td style="width: 116px; height: 36px; font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                ID:</td>
            <td style="height: 36px; width: 646px">
                   <asp:TextBox ID="ID_art_tx" runat="server" ReadOnly="false"></asp:TextBox>
                   <asp:Button ID="Cargar_Art_btn" runat="server" OnClick="Cargar_Art_btn_Click" CssClass="btn btn-default" Text="Cargar" />
            </td>
        </tr>
        <tr>
            <td style="width: 116px; height: 36px; font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                Nombre:</td>
            <td style="height: 36px; width: 646px">
                   <asp:TextBox ID="Nomb_art_lb" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 36px; width: 116px; font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                Categoria:</td>
            <td style="height: 28px; width: 646px">
                <asp:TextBox ID="Cat_art_lb" runat="server"  ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        
        <tr>
            <td style="width: 116px; height: 36px; font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                Descripcion:</td>
            <td style="height: 28px; width: 646px">
                <asp:TextBox ID="Desc_art_lb" runat="server"  ReadOnly="True" TextMode="MultiLine"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td style="width: 116px; height: 36px; font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                Cantidad Solicitada:</td>
            <td style="height: 66px; width: 646px">
                <asp:TextBox ID="Cantidad_tx" runat="server" Height="22px" style="font-size: 15pt" TextMode="Number" Width="78px"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Debe ser un valor superior a 0" ControlToValidate="Cantidad_tx" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td style="width: 116px; height: 36px; font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                Precio Unidad:</td>
            <td style="height: 66px; width: 646px">
                <asp:TextBox ID="Precio_tx" runat="server" Height="22px" style="font-size: 15pt" TextMode="Number" Width="78px"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Debe ser un valor superior a 0" ControlToValidate="Precio_tx" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <center><asp:Button ID="Art_Agregar_btn" CssClass="btn btn-primary" runat="server" Text="Guardar Cambios" OnClick="Art_Agregar_btn_Click"/></center>
            &nbsp;<center><asp:Button ID="Art_Cancelar_byn" CssClass="btn btn-danger" Visible="false" runat="server" Text="Cancelar" OnClick="Art_Cancelar_btn_Click" /></center>
            </td>
        </tr>
    </table>

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
         <%-- Inicia el popup Articulos--%>
    <div id="ModalArt" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Seleccionar Articulo<asp:Label ID="label2" runat="server" Text="Label" Visible="False"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>
          <asp:UpdatePanel ID="UpdatePanel4" runat="server">
              <ContentTemplate>
        <center>
            <asp:GridView ID="Lista_Articulos" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
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
      function openModalProv() {
          $('#ModalProv').modal('show');
      }
      function closeModalProv() {
          $('#ModalProv').modal('hide');
      }
      function openModalSelectArt() {
          $('#ModalSelectArt').modal('show');
      }
      function closeModalSelectArt() {
          $('#ModalSelectArt').modal('hide');
      }
      function openModalArt() {
          $('#ModalArt').modal('show');
      }
      function closeModalArt() {
          $('#ModalArt').modal('hide');
      }
    </script>
</asp:Content>
