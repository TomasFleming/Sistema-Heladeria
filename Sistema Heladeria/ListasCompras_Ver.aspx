<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListasCompras_Ver.aspx.cs" Inherits="Sistema_Heladeria.ListasCompras_Ver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:TextBox ID="Buscador_Ord" runat="server" Width="257px" style="font-size: 15pt" Height="27px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Buscar_Ord_btn" CssClass="btn btn-primary" runat="server" OnClick="Buscar_Ord_btn_Click" Text="Buscar" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Agregar_Ord_btn" CssClass="btn btn-default" runat="server" Text="Crear Orden de Compra" OnClick="Agregar_Ord_btn_Click" PostBackUrl="~/ListasCompras_Nueva.aspx" />
    </p>
</asp:Content>
