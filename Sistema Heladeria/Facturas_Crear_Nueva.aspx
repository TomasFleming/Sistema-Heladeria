<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Facturas_Crear_Nueva.aspx.cs" Inherits="Sistema_Heladeria.Facturas_Crear_Nueva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified">
        <tr>
    <td rowspan="2" style="width: 618px; font-size: 50px; color: #FF6666;">
                <center>
                    Registro Factura
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
            <td>
    <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
        Fecha de Creacion :&nbsp;&nbsp;&nbsp;<strong>
        <asp:TextBox ID="Fecha_Creacion_lb" runat="server" TextMode="DateTime" Width="190px" style="font-size: 13pt; font-weight: bold"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="Fecha_Creacion_lb" />
                                             </strong>
    </p>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
        <ContentTemplate>
    <table class="nav-justified" border="0" style="border: 3px solid #CCCCCC; padding: 0px; clip: rect(0px, 0px, 0px, 0px);">
        <tr>
            <td class="modal-lg" style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; width: 586px; height: 36px;">Detalles del Proveedor :&nbsp;&nbsp;&nbsp;<asp:Button ID="PopUp_Prov_bt" runat="server" Text="Seleccionar Proveedor" CssClass="btn btn-default" OnClick="PopUp_Prov_bt_Click"/>
            </td>
            <td style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; height: 36px;">
            </td>
        </tr>
        <tr>
            <td class="modal-lg" style="width: 586px; font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Numero Proveedor:
                <asp:Label ID="Prov_ID_lb" runat="server" style="font-size: 20px"></asp:Label>
                <br />
                Nombre :&nbsp;&nbsp; <asp:Label ID="Prov_nom_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000; ">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-lg" style="width: 586px; font-family: Arial; font-size: 16px; font-style: inherit; color: #000000; height: 28px;">Telefono:&nbsp;&nbsp;<asp:Label ID="Telf_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000; height: 28px;"></td>
        </tr>
        <tr>
            <td class="modal-lg" style="width: 586px; font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Direccion:&nbsp;&nbsp;<asp:Label ID="Direc_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-lg" style="width: 586px; font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Correo:&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="Correo_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">&nbsp;</td>
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
    &nbsp;</p>
    <p>
        <center>
            <asp:Button ID="Guardar_Fact_btn" CssClass="btn btn-success" runat="server" Text="Guardar Factura" OnClick="Guardar_Fact_btn_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Cancelar_Fact_btn" runat="server" CssClass="btn btn-danger" OnClick="Cancelar_Fact_btn_Click" Text="Cancelar Factura" />
        </center>
    </p>
</asp:Content>
