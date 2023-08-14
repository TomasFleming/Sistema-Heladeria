<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Sistema_Heladeria.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--    <center>
        <img src="Imagenes/fondo.jpg" class="full-width-image" />
    </center>--%>
        <center>
        <Titulos style="font-size: 45pt">Inicio</Titulos>
    </center>
    <center>

        <table class="nav-justified">
            <tr>
                <td style="height: 247px; width: 403px;">
                        <center>
        <a href="~/Inicio" runat="server">
        <div class="image-button-container">
            <img src="Imagenes/deposito.png" alt="Imagen">
        </div>
            <asp:Label ID="Label1" runat="server" Text="Deposistos" CssClass="BtsImg"></asp:Label>
        </a>
    </center>
                </td>
                <td style="height: 247px; width: 434px;">
                    <asp:ImageButton ID="ImageButton1" runat="server" />
                </td>
                <td style="height: 247px">
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Imagenes/factura.png" PostBackUrl="~/Articulos.aspx" />
                </td>
            </tr>
            <tr>
                <td style="width: 403px">&nbsp;</td>
                <td style="width: 434px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

    </center>
</asp:Content>
