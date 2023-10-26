<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pre_Deposit_Movs.aspx.cs" Inherits="Sistema_Heladeria.Pre_Deposit_Movs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%--<header class="jumbotron text-center">
     <h3><strong>Menú - Depositos</strong></h3>
    </header>--%>
     <header class="jumbotron text-center">
        <div class="header-left">
            <h3><strong>Menú - Depositos</strong></h3>
        </div>
        <div class="header-right">
            <div class="date-time">
                <span id="currentDate"></span>
                <span id="currentTime"></span>
            </div>
        </div>
    </header>
    <center>
    <p>&nbsp;</p>
        <div class="col-md-4"> 
         <center style="width: 200px">
        <a href="Depositos.aspx" runat="server">
        <div class="image-button-container" style="width: 200px">
            &nbsp;&nbsp;
            <img src="imagenes 2-0/depositos.jpg" width="200" height="200" alt="Imagen">
        </div>
          
         <asp:Label ID="Label1" runat="server" Text="Depósitos" CssClass="btn btn-primary" width="200"></asp:Label>
          </a>
    </center> 

    </div>
    <div class="col-md-4">
        <center style="width: 200px">
                        <a href="Tipos_de_Movimientos.aspx" runat="server">
                    <div class="image-button-container" style="width: 200px">
                        &nbsp;&nbsp;
                        <img src="imagenes 2-0/depositoMovimiento.jpg" width="200" height="200" />
                    </div>
                        <asp:Label ID="lb" runat="server" Text="Movimientos" CssClass="btn btn-primary" width="200"></asp:Label>
                        </a>
                    </center>
    </div>

    <div class="col-md-4"> 
        <center style="width: 200px">
                        <a runat="server" href="Historial_Movs.aspx">
                        <div class="image-button-container" style="width: 200px">
                            &nbsp;&nbsp;
                            <img alt="Imagen" src="imagenes 2-0/depositoHistorial.jpg" width="200" height="200"/>
                        </div>
                        <asp:Label ID="Label4" runat="server" CssClass="btn btn-primary" width="200" Text="Historial"></asp:Label>
                        </a>
                    </center>
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

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</asp:Content>
