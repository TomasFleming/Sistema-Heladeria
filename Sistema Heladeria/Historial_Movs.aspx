﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Historial_Movs.aspx.cs" Inherits="Sistema_Heladeria.Historial_Movs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header class="jumbotron text-center">
     <h2><strong>Historial De Movimientos</strong></h2>
        <div class="header-right">
            <div class="date-time">
                <span id="currentDate"></span>
                <span id="currentTime"></span>
            </div>
        </div>
    </header>
    <p>    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
    <div id="menu" style="display: block;">
        <table class="nav-justified">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 409px"><span style="font-size: large">Fecha Inicio:</span>
                    <asp:TextBox ID="Fecha_min_tx" runat="server" TextMode="Date" Width="100px"></asp:TextBox>
                </td>
                <td style="width: 388px"><span style="font-size: large">Fecha Final:</span>
                    <asp:TextBox ID="Fecha_Max_tx" runat="server" TextMode="Date" Width="100px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Filtrar_btn" runat="server" CssClass="btn btn-primary" OnClick="Filtrar_btn_Click" Text="Filtrar" Width="90px" />
                </td>
            </tr>
            <tr>
                <td style="font-size: large; width: 409px">&nbsp;</td>
                <td style="font-size: large; width: 388px">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 409px">
                    <span style="font-size: large">Cantidad Mínima:</span>
                    <asp:TextBox ID="Precio_min_tx" runat="server" TextMode="Number" Width="100px"></asp:TextBox>
                </td>
                <td style="width: 388px">
                    <span style="font-size: large">Cantidad Máxima:</span>
                    <asp:TextBox ID="Precio_Max_tx" runat="server" TextMode="Number" Width="100px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Lipiar_Filt_btn" runat="server" OnClick="Lipiar_Filt_btn_Click" CssClass="btn btn-default" Text="Limpiar" Width="90px" />
                </td>
            </tr>
        </table>
    </div>
            </ContentTemplate>
    </asp:UpdatePanel></p>
    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
              <ContentTemplate>
        <center>
            <asp:GridView ID="Lista_Historial" runat="server" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="ID" PagerStyle-CssClass="pgr">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="N° Operación">
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Nombre" HeaderText="Artículo">
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Deposito" HeaderText="Depósito">
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Actividad" HeaderText="Actividad">
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad">
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Fecha_Registro" HeaderText="Fecha Realizado">
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
        </center>
                  </ContentTemplate>
          </asp:UpdatePanel>


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
