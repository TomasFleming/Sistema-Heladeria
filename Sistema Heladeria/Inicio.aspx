<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Sistema_Heladeria.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--    <center>
        <img src="Imagenes/fondo.jpg" class="full-width-image" />
    </center>--%>
     <%--   <center>
        <Titulos style="font-size: 45pt">Heladeria Fili</Titulos>
    </center>--%>

    <header class="jumbotron text-center">
     <h1>Bienvenidos a Heladería Fili</h1>
        <p style="font-size: large">Los mejores helados artesanales en la ciudad</p>
    </header>

    <center>

    <div class="row">

    <div class="col-md-3"> 
         <center style="width: 200px">
        <a href="Pre_Deposit_Movs.aspx" runat="server">
        <div class="image-button-container" style="width: 200px">
            <img src="imagenes 2-0/deposito.jpg" width="200" height="200" alt="Imagen">
        </div>
        </a>

        </center>
        <center>
            <asp:Label ID="Label1" runat="server" Text="Depósitos" CssClass="btn btn-primary" width="200"></asp:Label>
        </center>
    
        <p>
            &nbsp;</p>
    </div>

    <div class="col-md-3"> 
        <center style="width: 200px">
                      <a runat="server" href="Articulos.aspx">
                        <div class="image-button-container" style="width: 200px">
                            <img alt="Imagen" src="imagenes 2-0/articulos.jpg" width="200" height="200" />
                        </div>
                      </a>
        </center>
        <center>
              <asp:Label ID="Label4" runat="server" CssClass="btn btn-primary" Text="Artículos" width="200"></asp:Label>
        </center>       
    </div>


    <div class="col-md-3">
        <center style="width: 200px">
                        <a href="Categorias.aspx" runat="server">
                    <div class="image-button-container" style="width: 200px">
                        <img src="imagenes 2-0/categoria.jpg" width="200" height="200" />
                    </div>
                        </a>
        </center>
        <center>
                 <asp:Label ID="lb" runat="server" Text="Categorías" CssClass="btn btn-primary" width="200"></asp:Label>
        </center>     
    </div>

    <div class="col-md-3"> 
        <center style="width: 200px">
                            <a runat="server" href="Graficos.aspx">
                            <div class="image-button-container" style="width: 200px">
                                <img alt="Imagen" src="imagenes 2-0/balance.jpg" width="200" height="200"/>
                            </div>
                                </a>
        </center>
        <center>
                <asp:Label ID="Label7" runat="server" CssClass="btn btn-primary" Text="Balance" width="200"></asp:Label>
        </center>       
    </div>
    



</div>

<p>&nbsp;</p>

  <div class="row">
    <div class="col-md-3"> 
        <center style="width: 200px">
                            <a runat="server" href="Proveedores.aspx">
                            <div class="image-button-container" style="width: 200px">
                                <img alt="Imagen" src="imagenes 2-0/distribuidores.jpg" width="200" height="200"/>
                            </div>
                                </a>
                        </center>
        <center>
                            <asp:Label ID="Label2" runat="server" CssClass="btn btn-primary" Text="Proveedores" width="200"></asp:Label>
                     </center>       
    </div>

    <div class="col-md-3"> 
        <center style="width: 200px">
                            <a runat="server" href="Clientes.aspx">
                            <div class="image-button-container" style="width: 200px">
                                <img alt="Imagen" src="imagenes 2-0/clientes.jpg" width="200" height="200"/>
                            </div>
                                </a>
        </center>
        <center>
                <asp:Label ID="Label6" runat="server" CssClass="btn btn-primary" Text="Clientes" width="200"></asp:Label>
        </center>       
    </div>


    <div class="col-md-3"> 
        <center style="width: 200px">
                        <a runat="server" href="ListasCompras_Ver.aspx">
                        <div class="image-button-container" style="width: 200px">
                            <img alt="Imagen" src="imagenes 2-0/orden de compra.jpg" width="200" height="200" />
                        </div>
                            </a>
                    </center>
        <center>
                        <asp:Label ID="Label3" runat="server" CssClass="btn btn-primary" Text="Ordenes de Compra" width="200"></asp:Label>
                    </center>
    </div>

    <div class="col-md-3"> 
        <center style="width: 200px">
            <a runat="server" href="Pre_Facts.aspx">
                        <div class="image-button-container" style="width: 200px">
                            <img alt="Imagen" src="imagenes 2-0/facturacion.jpg" width="200" height="200" />
                        </div>
                     </a>
                    </center>
        <center>
                        <asp:Label ID="Label5" runat="server" CssClass="btn btn-primary" Text="Facturación" width="200"></asp:Label>
                   </center>
    </div>
</div>
        <p></p>


        <%--<div class="row">--%>
    

    
       <%-- </div>--%>

    </center>
    <center>
        

    </center>
</asp:Content>
