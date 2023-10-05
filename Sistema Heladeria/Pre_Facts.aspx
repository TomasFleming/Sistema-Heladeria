<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pre_Facts.aspx.cs" Inherits="Sistema_Heladeria.Pre_Facts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <div class="col-md-4"> 
         <center style="width: 200px">
        <a href="Facturas_Ver.aspx" runat="server">
        <div class="image-button-container" style="width: 175px">
            <img src="Imagenes/deposito1.png" width="136" height="136" alt="Imagen">
        </div>
            <asp:Label ID="Label1" runat="server" Text="Registrar Facturas" CssClass="BtsImg"></asp:Label>
        </a>
    </center>
    </div>
    <div class="col-md-4" style="display:none">
        <center style="width: 200px">
                        <a href="Tipos_.aspx" runat="server">
                    <div class="image-button-container" style="width: 191px">
                        <img src="Imagenes/realizar_movimiento.png" width="136" height="136" />
                    </div>
                        <asp:Label ID="lb" runat="server" Text="Emitir Factura" CssClass="BtsImg"></asp:Label>
                        </a>
                    </center>
    </div>
    <div class="col-md-4"> 
        <center style="width: 200px">
                        <a runat="server" href="Facturas_Pagar.aspx">
                        <div class="image-button-container" style="width: 207px">
                            <img alt="Imagen" src="Imagenes/historial_movimiento.png" />
                        </div>
                        <asp:Label ID="Label4" runat="server" CssClass="BtsImg" Text="Pago Facturas"></asp:Label>
                        </a>
                    </center>
    </div>
        <div class="col-md-4"> 
        <center style="width: 200px">
                        <a runat="server" href="Facturas_Pagos_Ver.aspx">
                        <div class="image-button-container" style="width: 207px">
                            <img alt="Imagen" src="Imagenes/historial_movimiento.png" />
                        </div>
                        <asp:Label ID="Label2" runat="server" CssClass="BtsImg" Text="Registro Facturas"></asp:Label>
                        </a>
                    </center>
    </div>
    </center>
</asp:Content>
