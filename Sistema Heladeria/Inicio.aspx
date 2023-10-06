<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Sistema_Heladeria.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--    <center>
        <img src="Imagenes/fondo.jpg" class="full-width-image" />
    </center>--%>
     <%--   <center>
        <Titulos style="font-size: 45pt">Heladeria Fili</Titulos>
    </center>--%>
    <center>
                <div class="row">
    <div class="col-md-4"> 
         <center style="width: 200px">
        <a href="Pre_Deposit_Movs.aspx" runat="server">
        <div class="image-button-container" style="width: 175px">
            <img src="imagenes 2-0/deposito.jpg" width="150" height="150" alt="Imagen">
        </div>
        </a>

        </center>
        <center>
            <asp:Label ID="Label1" runat="server" Text="Depositos" CssClass="btn btn-primary" width="150"></asp:Label>
        </center>
    
        <p>
            &nbsp;</p>
    </div>
    <div class="col-md-4">
        <center style="width: 200px">
                        <a href="Categorias.aspx" runat="server">
                    <div class="image-button-container" style="width: 191px">
                        <img src="imagenes 2-0/categoria.jpg" width="150" height="150" />
                    </div>
                             </a>
                    </center>
        <center>
                        <asp:Label ID="lb" runat="server" Text="Categorias" CssClass="btn btn-primary" width="150"></asp:Label>
                  </center>     
    </div>
    <div class="col-md-4"> 
        <center style="width: 200px">
                        <a runat="server" href="Articulos.aspx">
                        <div class="image-button-container" style="width: 207px">
                            <img alt="Imagen" src="imagenes 2-0/articulos.jpg" width="150" height="150" />
                        </div>
                            </a>
                    </center>
        <center>
                        &nbsp;
                        <asp:Label ID="Label4" runat="server" CssClass="btn btn-primary" Text="Articulos" width="150"></asp:Label>
                 </center>       
    </div>
</div>
                <div class="row">
    <div class="col-md-4"> 
        <center style="width: 200px">
                            <a runat="server" href="Proveedores.aspx">
                            <div class="image-button-container" style="width: 195px">
                                <img alt="Imagen" src="imagenes 2-0/distribuidores.jpg" width="150" height="150"/>
                            </div>
                                </a>
                        </center>
        <center>
                            <asp:Label ID="Label2" runat="server" CssClass="btn btn-primary" Text="Proveedores" width="150"></asp:Label>
                     </center>       
    </div>
    <div class="col-md-4"> 
        <center style="width: 200px">
                        <a runat="server" href="ListasCompras_Ver.aspx">
                        <div class="image-button-container" style="width: 203px">
                            <img alt="Imagen" src="imagenes 2-0/orden de compra.jpg" width="150" height="150" />
                        </div>
                            </a>
                    </center>
        <center>
                        &nbsp;<asp:Label ID="Label3" runat="server" CssClass="btn btn-primary" Text="Ordenes de Compra" width="150"></asp:Label>
                    </center>    
    </div>
    <div class="col-md-4"> 
        <center style="width: 200px">
            <a runat="server" href="Pre_Facts.aspx">
                        <div class="image-button-container" style="width: 203px">
                            <img alt="Imagen" src="imagenes 2-0/facturacion.jpg" width="150" height="150" />
                        </div>
                     </a>
                    </center>
        <center>
                        &nbsp;<asp:Label ID="Label5" runat="server" CssClass="btn btn-primary" Text="Facturacion" width="150"></asp:Label>
                   </center>
    </div>
</div>
    </center>
    <center>
        

    </center>
</asp:Content>
