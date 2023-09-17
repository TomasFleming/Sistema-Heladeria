<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Sistema_Heladeria.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container text-center">
        <h1 style="font-size: 45pt">Heladeria Fili</h1>
        <div class="row">
            <div class="col-md-4">
                <div style="width: 200px; margin: 0 auto;">
                    <a href="Depositos.aspx" runat="server">
                        <div class="image-button-container" style="width: 175px">
                            <img src="Imagenes/deposito1.png" alt="Imagen" style="font-size: 122px; font-weight: normal; width: 122px; height: 122px;">
                        </div>
                        <asp:Label ID="Label1" runat="server" Text="Depósitos" CssClass="BtsImg"></asp:Label>
                    </a>
                </div>
            </div>
            <div class="col-md-4">
                <div style="width: 200px; margin: 0 auto;">
                    <a href="Categorias.aspx" runat="server">
                        <div class="image-button-container" style="width: 191px">
                            <img src="Imagenes/categoria1.png" width="122" height="122" />
                        </div>
                        <asp:Label ID="lb" runat="server" Text="Categorias" CssClass="BtsImg"></asp:Label>
                    </a>
                </div>
            </div>
            <div class="col-md-4">
                <div style="width: 200px; margin: 0 auto;">
                    <a runat="server" href="Articulos.aspx">
                        <div class="image-button-container" style="width: 207px">
                            <img alt="Imagen" src="Imagenes/stock.jpg" />
                        </div>
                        <asp:Label ID="Label4" runat="server" CssClass="BtsImg" Text="Articulos"></asp:Label>
                    </a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div style="width: 200px; margin: 0 auto;">
                    <a runat="server" href="Proveedores.aspx">
                        <div class="image-button-container" style="width: 195px">
                            <img alt="Imagen" src="Imagenes/proveedor1.png" width="122" height="122"/>
                        </div>
                        <asp:Label ID="Label2" runat="server" CssClass="BtsImg" Text="Proveedores"></asp:Label>
                    </a>
                </div>
            </div>
            <div class="col-md-4">
                <div style="width: 200px; margin: 0 auto;">
                    <a runat="server" href="ListasCompras_Ver.aspx">
                        <div class="image-button-container" style="width: 203px">
                            <img alt="Imagen" src="Imagenes/OrdenesCompra.png" width="122" height="122" />
                        </div>
                        <asp:Label ID="Label3" runat="server" CssClass="BtsImg" Text="Ordenes de Compra"></asp:Label>
                    </a>
                </div>
            </div>
            <div class="col-md-4">
                <div style="width: 200px; margin: 0 auto;">
                    <a runat="server" href="Facturas_ver.aspx">
                        <div class="image-button-container" style="width: 203px">
                            <img alt="Imagen" src="Imagenes/factura.png" width="122" height="122" />
                        </div>
                        <asp:Label ID="Label5" runat="server" CssClass="BtsImg" Text="Facturas"></asp:Label>
                    </a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

