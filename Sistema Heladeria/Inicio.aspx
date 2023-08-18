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
        <a href="Depositos.aspx" runat="server">
        <div class="image-button-container" style="width: 175px">
            <img src="Imagenes/deposito.png" alt="Imagen">
        </div>
            <asp:Label ID="Label1" runat="server" Text="Deposistos" CssClass="BtsImg"></asp:Label>
        </a>
    </center>
                </td>
                <td style="height: 247px; width: 434px;">
                    <center>
                        <a href="Categorias.aspx" runat="server">
                    <div class="image-button-container" style="width: 272px">
                        <img src="Imagenes/categorias.png" width="136" height="136" />
                    </div>
                        <asp:Label ID="lb" runat="server" Text="Categorias" CssClass="BtsImg"></asp:Label>
                        </a>
                    </center>
                </td>
                <td style="height: 247px">
                    <center style="width: 267px">
                        <a runat="server" href="Articulos.aspx">
                        <div class="image-button-container" style="width: 207px">
                            <img alt="Imagen" src="Imagenes/stock.jpg" />
                        </div>
                        <asp:Label ID="Label4" runat="server" CssClass="BtsImg" Text="Articulos"></asp:Label>
                        </a>
                    </center>
                </td>
            </tr>
            <tr>
                <td style="height: 247px; width: 403px;">
                        <center>
                            <a runat="server" href="Proveedores.aspx">
                            <div class="image-button-container" style="width: 195px">
                                <img alt="Imagen" src="Imagenes/Proveedor.png" width="136" height="136"/>
                            </div>
                            <asp:Label ID="Label2" runat="server" CssClass="BtsImg" Text="Proveedores"></asp:Label>
                            </a>
                        </center>
                </td>
                <td style="height: 247px; width: 434px;">
                    <center>
                        <a runat="server" href="ListasCompras_Ver.aspx">
                        <div class="image-button-container" style="width: 244px">
                            <img alt="Imagen" src="Imagenes/OrdenesCompra.png" width="136" height="136" />
                        </div>
                        <asp:Label ID="Label3" runat="server" CssClass="BtsImg" Text="Ordenes de Compra"></asp:Label>
                        </a>
                    </center>
                </td>
                <td style="height: 247px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 403px">&nbsp;</td>
                <td style="width: 434px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

    </center>
</asp:Content>
