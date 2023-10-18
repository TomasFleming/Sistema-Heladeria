<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pre_Facts.aspx.cs" Inherits="Sistema_Heladeria.Pre_Facts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header class="jumbotron text-center">
     <h5></h5>
    </header>
    <center>
        <div class="row">
        <div class="col-md-4"> 
         <center style="width: 200px">
        <a href="Facturas_Ver.aspx" runat="server">
        <div class="image-button-container" style="width: 200px">
            <img src="imagenes 2-0/registrar.jpg"  width="200" height="200" alt="Imagen">
        </div>
            <asp:Label ID="Label1" runat="server" Text="Facturas Registradas" CssClass="btn btn-primary" width="200"></asp:Label>
        </a>
    </center>
    </div>
    <div class="col-md-4" style="display:none">
        <center style="width: 200px">
                        <a href="Tipos_.aspx" runat="server">
                    <div class="image-button-container" style="width: 200px">
                        <img src="Imagenes/realizar_movimiento.png"  width="200" height="200" />
                    </div>
                        <asp:Label ID="lb" runat="server" Text="Emitir Factura" CssClass="btn btn-primary" width="200"></asp:Label>
                        </a>
                    </center>
    </div>
    <div class="col-md-4"> 
        <center style="width: 200px">
                        <a runat="server" href="Facturas_Pagar.aspx">
                        <div class="image-button-container" style="width: 200px">
                            <img alt="Imagen" src="imagenes 2-0/pagar.jpg"  width="200" height="200"/>
                        </div>
                        <asp:Label ID="Label4" runat="server" CssClass="btn btn-primary" width="200" Text="Pagar Facturas"></asp:Label>
                        </a>
                    </center>
    </div>
        <div class="col-md-4"> 
        <center style="width: 200px">
                        <a runat="server" href="Facturas_Pagos_Ver.aspx">
                        <div class="image-button-container" style="width: 207px">
                            <img alt="Imagen" src="imagenes 2-0/historial.jpg"  width="200" height="200" />
                        </div>
                        <asp:Label ID="Label2" runat="server" CssClass="btn btn-primary" width="200" Text="Historial de Pagos"></asp:Label>
                        </a>
                    </center>
    </div>
            </div><p></p>
        <div class="row">
            <div class="col-md-4"> 
         <center style="width: 200px">
        <a href="Ventas_Ver.aspx" runat="server">
        <div class="image-button-container" style="width: 200px">
            <img src="imagenes 2-0/registrar.jpg"  width="200" height="200" alt="Imagen">
        </div>
            <asp:Label ID="Label3" runat="server" Text="Registro Ventas" CssClass="btn btn-primary" width="200"></asp:Label>
        </a>
    </center>
    </div>
        </div>
    </center>
</asp:Content>
