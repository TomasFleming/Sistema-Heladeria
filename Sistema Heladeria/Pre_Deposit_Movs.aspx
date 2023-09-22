<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pre_Deposit_Movs.aspx.cs" Inherits="Sistema_Heladeria.Pre_Deposit_Movs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <div class="col-md-4"> 
         <center style="width: 200px">
        <a href="Depositos.aspx" runat="server">
        <div class="image-button-container" style="width: 175px">
            <img src="Imagenes/deposito.png" alt="Imagen">
        </div>
            <asp:Label ID="Label1" runat="server" Text="Deposistos" CssClass="BtsImg"></asp:Label>
        </a>
    </center>
    </div>
    <div class="col-md-4">
        <center style="width: 200px">
                        <a href="Tipos_de_Movimientos.aspx" runat="server">
                    <div class="image-button-container" style="width: 191px">
                        <img src="Imagenes/categorias.png" width="136" height="136" />
                    </div>
                        <asp:Label ID="lb" runat="server" Text="Movimientos" CssClass="BtsImg"></asp:Label>
                        </a>
                    </center>
    </div>
    <div class="col-md-4"> 
        <center style="width: 200px">
                        <a runat="server" href="Articulos.aspx">
                        <div class="image-button-container" style="width: 207px">
                            <img alt="Imagen" src="Imagenes/historial_movimiento.png" />
                        </div>
                        <asp:Label ID="Label4" runat="server" CssClass="BtsImg" Text="Historial"></asp:Label>
                        </a>
                    </center>
    </div>
</div>
    </p>
</asp:Content>
