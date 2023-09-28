<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Facturas_Pagar.aspx.cs" Inherits="Sistema_Heladeria.Facturas_Pagar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <table class="nav-justified">
        <tr>
    <td rowspan="2" style="width: 603px; font-size: 50px; color: #FF6666;">
                <center>
                    Pagar Facturas<br />
&nbsp;</center>
            </td>
            <td style="height: 38px">
    <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; margin-left: 0px;">
        &nbsp;</p>
                <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; margin-left: 0px;">
        Numero de Pago:&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Nro_Fact_lb" runat="server"></asp:Label>
    </p>
            </td>
        </tr>
        <tr>
            <td style="height: 47px">
                <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; margin-left: 0px;" __designer:mapid="26c">
                    Numero Cuenta Corriente:
                    <asp:TextBox ID="Cod_Prov_tx" runat="server" TextMode="Number" Width="140px"></asp:TextBox>
    </p>
                <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; margin-left: 0px;" __designer:mapid="26c">
                    <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="La factura a registrar debe tener un codigo de identificacion que pertenece al Proveedor" ControlToValidate="Cod_Prov_tx" Operator="GreaterThan" ValueToCompare="0" ForeColor="Red"></asp:CompareValidator>
    </p>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
        <ContentTemplate>
    <table class="tableDist" border="0" style="border-style: solid; border-width: 0px 3px 0px 3px; border-color: #CCCCCC; padding: 0px; clip: rect(0px, 0px, 0px, 0px); font-family: Arial; font-size: 20px;">
        <tr>
            <td class="modal-lg" style="border-left: 3px solid #C0C0C0; border-right: 3px solid #C0C0C0; border-top: 3px solid #C0C0C0; width: 525px; border-bottom-color: #C0C0C0; border-bottom-width: 3px;">Detalles del Proveedor :&nbsp;&nbsp;&nbsp;<asp:Button ID="PopUp_Prov_bt" runat="server" Text="Seleccionar Proveedor" CssClass="btn btn-default" OnClick="PopUp_Prov_bt_Click"/>
            </td>
            <td class="modal-lg" style="border-style: inherit; border-color: #FFFFFF; border-width: 0px; width: 70px; background-color: #FFFFFF; border-collapse: separate; table-layout: inherit; border-spacing: inherit; empty-cells: hide;">&nbsp;</td>
            <td style="border-width: 3px; border-color: #C0C0C0; border-right-style: solid; border-left-style: solid; border-top-style: solid;">Observaciones de la Factura:&nbsp;&nbsp;&nbsp;</td>
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
                    Tipo de Factura :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;&nbsp;&nbsp; </strong>
                    <asp:DropDownList ID="Tipo_Fact" runat="server">
                        <asp:ListItem>A</asp:ListItem>
                        <asp:ListItem>B</asp:ListItem>
                        <asp:ListItem>C</asp:ListItem>
                    </asp:DropDownList>
                </p>
            </td>
        </tr>
        <tr>
            <td class="modal-lg" style="border-left: 3px solid #C0C0C0; border-right: 3px solid #C0C0C0; width: 525px; border-top-color: #C0C0C0; border-top-width: 3px; border-bottom-color: #C0C0C0; border-bottom-width: 3px;">Telefono:&nbsp;&nbsp;<asp:Label ID="Telf_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td class="modal-lg" style="border-style: inherit; border-color: #FFFFFF; border-width: 0px; width: 70px; background-color: #FFFFFF; border-collapse: separate; table-layout: inherit; border-spacing: inherit; empty-cells: hide;">&nbsp;</td>
            <td style="border-width: 3px; border-color: #C0C0C0; border-right-style: solid; border-left-style: solid;">
                <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                    Fecha de Emision :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>
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
                    Fecha de Vencimiento :&nbsp;<strong><asp:TextBox ID="Fecha_Venc_tx" runat="server" style="font-size: 13pt; font-weight: bold" TextMode="Date" Width="190px"></asp:TextBox>
<%--                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Fecha_Venc_tx" />--%>
                    </strong>
                </p>
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
        <asp:Button ID="Pop_Art_bt" runat="server" Text="Agregar Factura" CssClass="btn btn-default" OnClick="Pop_Art_bt_Click" />
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
</asp:Content>
