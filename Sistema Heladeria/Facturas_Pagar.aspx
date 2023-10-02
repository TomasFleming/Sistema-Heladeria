    <%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Facturas_Pagar.aspx.cs" Inherits="Sistema_Heladeria.Facturas_Pagar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <table class="nav-justified">
        <tr>
    <td rowspan="2" style="width: 603px; font-size: 50px; color: #FF6666;">
                <center>
                    <asp:Label ID="Label1" runat="server" ForeColor="Black" Text="Pago Factura"></asp:Label>
                    <br />
                </center>
            </td>
            <td style="height: 38px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 47px">
                <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; margin-left: 0px;">
        Numero de Pago:&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Nro_Fact_lb" runat="server"></asp:Label>
    </p>
                <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; margin-left: 0px;" __designer:mapid="26c">
                    Numero Cuenta Corriente:
                    <asp:TextBox ID="Cod_Prov_tx" runat="server" TextMode="Number" Width="140px"></asp:TextBox>
    </p>
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
                    <asp:DropDownList ID="Tipo_Fact" runat="server">
                        <asp:ListItem>Efectivo</asp:ListItem>
                        <asp:ListItem>Targeta Credito</asp:ListItem>
                        <asp:ListItem>Targeta Devito</asp:ListItem>
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
                    <asp:TextBox ID="Fecha_Creacion_tx" runat="server" style="font-size: 13pt; font-weight: bold" TextMode="Date" Width="190px"></asp:TextBox>
<%--                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="Fecha_Creacion_tx" />--%>
                    </strong>
                </p>
            </td>
        </tr>
        <tr>
            <td class="modal-lg" style="border-left: 3px solid #C0C0C0; border-right: 3px solid #C0C0C0; width: 525px; border-top-color: #C0C0C0; border-top-width: 3px; border-bottom-color: #C0C0C0; border-bottom-width: 3px;">Direccion:&nbsp;&nbsp;<asp:Label ID="Direc_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td class="modal-sm" style="border-style: inherit; border-color: #FFFFFF; border-width: 0px; width: 70px; background-color: #FFFFFF; border-collapse: separate; table-layout: inherit; border-spacing: inherit; empty-cells: hide;">&nbsp;</td>
            <td style="border-width: 3px; border-color: #C0C0C0; border-right-style: solid; border-left-style: solid;">
                <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                    &nbsp;</p>
            </td>
        </tr>
        <tr>
            <td class="modal-lg" style="border-left: 3px solid #C0C0C0; border-right: 3px solid #C0C0C0; border-bottom: 3px solid #C0C0C0; width: 525px; border-top-color: #C0C0C0; border-top-width: 3px;">Correo:&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="Correo_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td class="modal-sm" style="border-style: inherit; border-color: #FFFFFF; border-width: 0px; width: 70px; background-color: #FFFFFF; border-collapse: separate; table-layout: inherit; border-spacing: inherit; empty-cells: hide;">&nbsp;</td>
            <td style="border-width: 3px; border-color: #C0C0C0; border-right-style: solid; border-left-style: solid; border-bottom-style: solid;">&nbsp;</td>
        </tr>
    </table>
                    </ContentTemplate>
    </asp:UpdatePanel>
    <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
        Facturas a Pagar:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Pop_Facts_bt" runat="server" Text="Agregar Factura" CssClass="btn btn-default" OnClick="Pop_Facts_bt_Click"  />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
        <center>
            <asp:GridView ID="Lista_facturas" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="1235px">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                <asp:TemplateField HeaderText="">
                    <HeaderTemplate>
                        <input type="checkbox" id="chkSelectAll" onclick="SelectAllCheckboxes(this);" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <input type="checkbox" class="chkSingle" />
                    </ItemTemplate>
                </asp:TemplateField>
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
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                         <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Ver_Detalle_btn" runat="server" Text="Ver Detalle" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Quitar_btn" runat="server" Text="Quitar" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
        </center>
                            </ContentTemplate>
        </asp:UpdatePanel>
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
            <asp:Button ID="Guardar_Fact_btn" CssClass="btn btn-success" runat="server" Text="Realizar Pagos" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Cancelar_Fact_btn" runat="server" CssClass="btn btn-danger" Text="Cancelar Factura" />
        </center>
        </p>
        <script type="text/javascript">
    function SelectAllCheckboxes(checkbox) {
        var checkboxes = document.getElementsByClassName('chkSingle');
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = checkbox.checked;
        }
    }
        </script>
    </asp:Content>
