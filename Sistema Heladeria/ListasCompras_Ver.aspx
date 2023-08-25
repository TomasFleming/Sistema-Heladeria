<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListasCompras_Ver.aspx.cs" Inherits="Sistema_Heladeria.ListasCompras_Ver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:TextBox ID="Buscador_Ord" runat="server" Width="257px" style="font-size: 15pt" Height="27px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Buscar_Ord_btn" CssClass="btn btn-primary" runat="server" OnClick="Buscar_Ord_btn_Click" Text="Buscar" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Agregar_Ord_btn" CssClass="btn btn-default" runat="server" Text="Crear Orden de Compra" OnClick="Agregar_Ord_btn_Click" PostBackUrl="~/ListasCompras_Nueva.aspx" />
    </p>
    <p>
        <center>
            <asp:GridView ID="Lista_Ordenes_Compra" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="1235px">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="NombreCompleto" HeaderText="Proveedor" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="ID_Deposito" HeaderText="Deposito" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Estado" HeaderText="Estado" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Fecha_Creacion" HeaderText="Fecha Creado" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Fecha_Entrega" HeaderText="Fecha Entrega" >
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
        </center>
        
    </p>
    
</asp:Content>
