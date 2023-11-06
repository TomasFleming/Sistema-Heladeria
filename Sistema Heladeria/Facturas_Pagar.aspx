    <%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Facturas_Pagar.aspx.cs" Inherits="Sistema_Heladeria.Facturas_Pagar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header class="jumbotron text-center">
     <h2><strong>Pago de Factura</strong></h2>
    </header>
        <table class="nav-justified">
        <tr>
    <td style="width: 603px; font-size: 50px; color: #FF6666; height: 38px;">
                <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; margin-left: 0px;" class="text-left">
        Numero de Pago:&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Nro_Pago_lb" runat="server"></asp:Label>
    </p>
                <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; margin-left: 0px;" class="text-left">
                    &nbsp;</p>
            </td>
            <td style="height: 38px">
                <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; margin-left: 0px;">
                    &nbsp;</p>
                </td>
        </tr>
        </table>
    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
        <ContentTemplate>
    <table class="tableDist" border="0" style="border-style: solid; border-width: 0px 3px 0px 3px; border-color: #CCCCCC; padding: 0px; clip: rect(0px, 0px, 0px, 0px); font-family: Arial; font-size: 20px;">
        <tr>
            <td class="modal-lg" style="border-left: 3px solid #C0C0C0; border-right: 3px solid #C0C0C0; border-top: 3px solid #C0C0C0; width: 525px; border-bottom-color: #C0C0C0; border-bottom-width: 3px; background-color: #6495ED;">Detalles del Proveedor :&nbsp;&nbsp;&nbsp;<asp:Button ID="PopUp_Prov_bt" runat="server" Text="Seleccionar Proveedor" CssClass="btn btn-default" OnClick="PopUp_Prov_bt_Click"/>
            </td>
            <td class="modal-lg" style="border-style: inherit; border-color: #FFFFFF; border-width: 0px; width: 70px; background-color: #FFFFFF; border-collapse: separate; table-layout: inherit; border-spacing: inherit; empty-cells: hide;">&nbsp;</td>
            <td style="border-width: 3px; border-color: #C0C0C0; border-right-style: solid; border-left-style: solid; border-top-style: solid; background-color: #6495ED;">Detalles del Pago:&nbsp;&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-lg" style="border-left: 3px solid #C0C0C0; border-right: 3px solid #C0C0C0; width: 525px; border-top-color: #C0C0C0; border-top-width: 3px; border-bottom-color: #C0C0C0; border-bottom-width: 3px; height: 56px;">Numero Proveedor:
                <asp:Label ID="Prov_ID_lb" runat="server" style="font-size: 20px"></asp:Label>
                <br />
                Nombre :&nbsp;&nbsp; <asp:Label ID="Prov_nom_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td class="modal-sm" style="border-style: inherit; border-color: #FFFFFF; border-width: 0px; width: 70px; background-color: #FFFFFF; border-collapse: separate; table-layout: inherit; border-spacing: inherit; empty-cells: hide; height: 56px;"></td>
            <td style="border-left: 3px solid #C0C0C0; border-right: 3px solid #C0C0C0; height: 56px; border-top-color: #C0C0C0; border-top-width: 3px; border-bottom-color: #C0C0C0; border-bottom-width: 3px;">
                <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                    Forma de Pago :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;&nbsp;&nbsp; </strong>
                    <asp:DropDownList ID="Forma_Pago_tx" runat="server">
                        <%--<asp:ListItem>Efectivo</asp:ListItem>--%>
                        <asp:ListItem>Transferencia</asp:ListItem>
                        <asp:ListItem>Depósito</asp:ListItem>
                    </asp:DropDownList>
                </p>
            </td>
        </tr>
        <tr>
            <td class="modal-lg" style="border-left: 3px solid #C0C0C0; border-right: 3px solid #C0C0C0; width: 525px; border-top-color: #C0C0C0; border-top-width: 3px; border-bottom-color: #C0C0C0; border-bottom-width: 3px; height: 47px;">Telefono:&nbsp;&nbsp;<asp:Label ID="Telf_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td class="modal-lg" style="border-style: inherit; border-color: #FFFFFF; border-width: 0px; width: 70px; background-color: #FFFFFF; border-collapse: separate; table-layout: inherit; border-spacing: inherit; empty-cells: hide; height: 47px;"></td>
            <td style="border-left: 3px solid #C0C0C0; border-right: 3px solid #C0C0C0; height: 47px; border-top-color: #C0C0C0; border-top-width: 3px; border-bottom-color: #C0C0C0; border-bottom-width: 3px;">
                <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                    Fecha de Pago :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>
                    <asp:TextBox ID="Fecha_Pago_tx" runat="server" style="font-size: 13pt; font-weight: bold" TextMode="Date" Width="190px"></asp:TextBox>
                    </strong>
                    <asp:Label ID="Corregir_Fecha_lb" runat="server" ForeColor="#FF3300" Text="Debe ser antes del vencimieto y despues del registro" Visible="False"></asp:Label>
                </p>
            </td>
        </tr>
        <tr>
            <td class="modal-lg" style="border-left: 3px solid #C0C0C0; border-right: 3px solid #C0C0C0; width: 525px; border-top-color: #C0C0C0; border-top-width: 3px; border-bottom-color: #C0C0C0; border-bottom-width: 3px;">Direccion:&nbsp;&nbsp;<asp:Label ID="Direc_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td class="modal-sm" style="border-style: inherit; border-color: #FFFFFF; border-width: 0px; width: 70px; background-color: #FFFFFF; border-collapse: separate; table-layout: inherit; border-spacing: inherit; empty-cells: hide;">&nbsp;</td>
            <td style="border-width: 3px; border-color: #C0C0C0; border-right-style: solid; border-left-style: solid;">
                <div id="Transferencias" style="display:block;font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                    Numero Cuenta :
                    <asp:TextBox ID="Num_Cuenta_tx" runat="server" TextMode="Number" Width="140px"></asp:TextBox>
                    
                </div>
            </td>
        </tr>
        <tr>
            <td class="modal-lg" style="border-left: 3px solid #C0C0C0; border-right: 3px solid #C0C0C0; border-bottom: 3px solid #C0C0C0; width: 525px; border-top-color: #C0C0C0; border-top-width: 3px;">Correo:&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="Correo_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td class="modal-sm" style="border-style: inherit; border-color: #FFFFFF; border-width: 0px; width: 70px; background-color: #FFFFFF; border-collapse: separate; table-layout: inherit; border-spacing: inherit; empty-cells: hide;">&nbsp;</td>
            <td style="border-width: 3px; border-color: #C0C0C0; border-right-style: solid; border-left-style: solid; border-bottom-style: solid;"><asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="Num_Cuenta_tx" ErrorMessage="Debe incluir un Numero de cuenta en el registro" ForeColor="Red" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>&nbsp;</td>
        </tr>
    </table>
                    </ContentTemplate>
    </asp:UpdatePanel>
    <p style="font-family: Arial; font-size: 20px;">
        Facturas a Pagar:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Pop_Facts_bt" runat="server" Text="Agregar Factura" CssClass="btn btn-default" OnClick="Pop_Facts_bt_Click"  />
        </p><p>
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
                <asp:BoundField DataField="Cod_Prov" HeaderText="Numero Factura Proveedor" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Estado" HeaderText="Estado" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Fecha_Emision" HeaderText="Fecha Emision" >
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
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Quitar_btn" runat="server" Text="Quitar" CssClass="btn btn-primary" OnClick="Quitar_btn_Click" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
                </ContentTemplate></asp:UpdatePanel>
        </center></p>
        <p>
<asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
        <table class="nav-justified" style="border-bottom-style: solid; border-width: thin; font-family: Arial, Helvetica, sans-serif; font-size: 20px; border-top-style: solid;">
        <tr>
            <td style="height: 28px; width: 1048px;" class="text-right">Total:</td>
            <td class="text-right" style="height: 28px">
                <asp:Label ID="Total_lb" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
    </table></ContentTemplate></asp:UpdatePanel>
        </p>
        <p>
            <center>
            <asp:Button ID="Guardar_Pagos_btn" CssClass="btn btn-success" runat="server" Text="Realizar Pagos" OnClick="Guardar_Pagos_btn_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Cancelar_Pago_btn" runat="server" CssClass="btn btn-danger" Text="Cancelar Pago" OnClick="Cancelar_Pago_btn_Click" />
        </center>
        </p>


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
          <%-- aca deberia empesar el asp:UpdatePanel y el contentemplate, pero solo los nesesitaria para aquellos que nesesito para editar --%>
          
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
      
  </div>
</div>

    
    <%--ass--%>
    <div id="ModalFact" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Seleccionar Facturas sin pagar de <asp:Label ID="label2" runat="server" Visible="true"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p>
          <%--aasasdasasadsads--%>
          <asp:UpdatePanel ID="UpdatePanel6" runat="server">
              <ContentTemplate>
        <center>
            <asp:GridView ID="Facts_Seleccionar_list" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                    <%--<asp:TemplateField HeaderText="">
                    <HeaderTemplate>
                        <input type="checkbox" id="chkSelectAll" onclick="SelectAllCheckboxes(this);" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <input type="checkbox" class="chkSingle" />
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:BoundField DataField="ID" HeaderText="N°" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <%--<asp:BoundField DataField="NombreCompleto" HeaderText="Proveedor" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>--%>
                <asp:BoundField DataField="Cod_Prov" HeaderText="Numero Factura Proveedor" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Estado" HeaderText="Estado" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <%--<asp:BoundField DataField="Fecha_Emision" HeaderText="Fecha Emision" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>--%>
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
                        <asp:Button ID="Ver_Detalle_btn2" runat="server" OnClick="Ver_Detalle_btn2_Click" Text="Ver Detalle" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                       <asp:Button ID="Seleccionar" runat="server" OnClick="Seleccionar_Click" Text="Seleccionar" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
        </center>
                  </ContentTemplate>
          </asp:UpdatePanel>
          <%--<center>
              <asp:Button ID="Seleccionar_Facts_btn" OnClick="Seleccionar_Facts_btn_Click" runat="server" Text="Button" />
          </center>--%>
          <%--ass--%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
    <div id="DetalleModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center>
            <asp:UpdatePanel ID="UpdatePanel7" runat="server"><ContentTemplate>
            <h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Articulos de la Factura N°<asp:Label ID="ID_Fact_lb" runat="server" Visible="True"></asp:Label></h4></ContentTemplate></asp:UpdatePanel></center>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>
          <%-- aca deberia empesar el asp:UpdatePanel y el contentemplate, pero solo los nesesitaria para aquellos que nesesito para editar --%>
          <asp:UpdatePanel ID="UpdatePanel4" runat="server"><ContentTemplate>
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
            <ItemTemplate>
                <asp:Label ID="lblTotal" runat="server" Text='<%# (Convert.ToDecimal(Eval("Precio_Unit")) * Convert.ToInt32(Eval("Cant_fact"))).ToString("0.00") %>'></asp:Label>
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
  </div>
    </div>
        <script type="text/javascript">
            function openModalProv() {
                $('#ModalProv').modal('show');
            }
            function closeModalProv() {
                $('#ModalProv').modal('hide');
            }
            function openModalDetalle() {
                $('#DetalleModal').modal('show');
            }
            function closeModalDetalle() {
                $('#DetalleModal').modal('hide');
            }
            function openModalFacts() {
                $('#ModalFact').modal('show');
            }
            function closeModalFacts() {
                $('#ModalFact').modal('hide');
            }
            function SelectAllCheckboxes(checkbox) {
                var checkboxes = document.getElementsByClassName('chkSingle');
                for (var i = 0; i < checkboxes.length; i++) {
                    checkboxes[i].checked = checkbox.checked;
                }
            }
            <%--function mostrarOcultarContenido() {
                var formaPago = document.getElementById('<%= Forma_Pago_tx.ClientID %>');
                var transferenciasDiv = document.getElementById('Transferencias');

                if (formaPago.value === 'Efectivo') {
                    transferenciasDiv.style.display = 'none';
                } else {
                    transferenciasDiv.style.display = 'block'; // o 'inline' según tu preferencia
                }
            }      // Llama a la función inicialmente para configurar la visibilidad inicial.
            mostrarOcultarContenido();--%>

        </script>
    </asp:Content>
