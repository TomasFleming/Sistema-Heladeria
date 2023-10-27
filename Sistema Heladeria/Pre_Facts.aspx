<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pre_Facts.aspx.cs" Inherits="Sistema_Heladeria.Pre_Facts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--<header class="jumbotron text-center">
     <h3><strong>Menú - Facturas</strong></h3>
    </header>--%>
    <header class="jumbotron text-center">
        <div class="header-left">
            <h3><strong>Menú - Facturas</strong></h3>
        </div>
        <div class="header-right">
            <div class="date-time">
                <span id="currentDate"></span>
                <span id="currentTime"></span>
            </div>
        </div>
    </header>


    <center>

        <div class="row">

        <div class="col-md-4"> 
         <center style="width: 200px">
        <a href="Facturas_Ver.aspx" runat="server">
        <div class="image-button-container" style="width: 200px">
            <img src="imagenes 2-0/registrar.jpg"  width="200" height="200" alt="Imagen">
        </div>
             <center>
            <asp:Label ID="Label1" runat="server" Text="Facturas Registradas" CssClass="btn btn-primary" width="200"></asp:Label>
        </center>
        </a>
         </center>
       
    <p>
            &nbsp;</p>
    </div>

    <div class="col-md-4" style="display:none">
        <center style="width: 200px">
                        <a href="Tipos_.aspx" runat="server">
                    <div class="image-button-container" style="width: 200px">
                        <img src="Imagenes/realizar_movimiento.png"  width="200" height="200" />
                    </div>

                    </a>
                    </center>
                    <center>
                        <asp:Label ID="lb" runat="server" Text="Emitir Factura" CssClass="btn btn-primary" width="200"></asp:Label>
                    </center>

        <p>
            &nbsp;</p>
    </div>

 <div class="col-md-4"> 
         <center style="width: 200px">
        <a href="Ventas_Ver.aspx" runat="server">
        <div class="image-button-container" style="width: 200px">
            <img src="imagenes 2-0/registro.jpg"  width="200" height="200" alt="Imagen">
        </div>
            <asp:Label ID="Label3" runat="server" Text="Registro Ventas" CssClass="btn btn-primary" width="200"></asp:Label>
        </a>
    </center>
    </div>
       <div class="col-md-4"> 
        <center style="width: 200px">
                        <a runat="server" href="Facturas_Pagos_Ver.aspx">
                        <div class="image-button-container" style="width: 200px">
                            <img alt="Imagen" src="imagenes 2-0/historialPago.jpg"  width="200" height="200" />
                        </div>
                        <asp:Label ID="Label2" runat="server" CssClass="btn btn-primary" width="200" Text="Historial de Pagos"></asp:Label>
                        </a>
                    </center>
    </div>
            </div>
        <p>&nbsp;</p>

        <div class="row">
            <div class="col-md-4"> 
        <center style="width: 200px">
                        <a runat="server" href="Facturas_Crear_Nueva.aspx">
                        <div class="image-button-container" style="width: 200px">
                            <img alt="Imagen" src="imagenes 2-0/pagarFactura.jpg"  width="200" height="200"/>
                        </div>
                        <asp:Label ID="Label5" runat="server" CssClass="btn btn-primary" width="200" Text="Crear Factura"></asp:Label>
                        </a>
                    </center>
    </div>
            <div class="col-md-4"> 
        <center style="width: 200px">
                        <a runat="server" href="Ventas_Crear_Nueva.aspx">
                        <div class="image-button-container" style="width: 200px">
                            <img alt="Imagen" src="imagenes 2-0/ventaFact.jpg"  width="200" height="200"/>
                        </div>
                        <asp:Label ID="Label6" runat="server" CssClass="btn btn-primary" width="200" Text="Crear Venta"></asp:Label>
                        </a>
                    </center>
    </div>
           <div class="col-md-4"> 
        <center style="width: 200px">
                        <a runat="server" href="Facturas_Pagar.aspx">
                        <div class="image-button-container" style="width: 200px">
                            <img alt="Imagen" src="imagenes 2-0/pagarFact.jpg"  width="200" height="200"/>
                        </div>
                        <asp:Label ID="Label4" runat="server" CssClass="btn btn-primary" width="200" Text="Pagar Facturas"></asp:Label>
                        </a>
                    </center>
    </div>
        </div>
    </center>

    <script>
    function updateDateTime() {
        var now = new Date();
        var currentDate = now.toLocaleDateString();
        var currentTime = now.toLocaleTimeString();

        document.getElementById("currentDate").textContent = "Fecha: " + currentDate;
        document.getElementById("currentTime").textContent = " - Hora: " + currentTime;
    }

    // Actualiza la fecha y hora cada segundo
    setInterval(updateDateTime, 1000);

    // Ejecuta la función una vez para mostrar la fecha y hora de inmediato
    updateDateTime();
    </script>
</asp:Content>
