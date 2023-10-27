<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Graficos.aspx.cs" Inherits="Sistema_Heladeria.Graficos" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header class="jumbotron text-center">
     <h2><strong>Resumen de Ingresos y Egresos</strong></h2>
        <div class="header-right">
            <div class="date-time">
                <span id="currentDate"></span>
                <span id="currentTime"></span>
            </div>
            <p><asp:Button ID="CargaTotal_btn" runat="server" CssClass="btn btn-primary" OnClick="CargaTotal_btn_Click" Text="Filtrar Todo" style="width: 80px;"/></p>
        </div>
    </header>
    <div>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
    <div id="menu" style="display: block;">
        <table class="nav-justified">
            <tr>
                <td class="text-center" colspan="2" style="font-size: x-large">
                    <strong>Ganancias Finales</strong></td>
                <td>
                    <asp:Button ID="Flitrar_Ganancias" runat="server" CssClass="btn btn-primary" OnClick="Flitrar_Ganancias_Click" Text="Filtrar" style="width: 80px;"/>
                </td>
            </tr>
            <tr>
                <td style="height: 26px"><span style="font-size: large">Fecha Mínima: </span>
                    <asp:DropDownList ID="Fecha_min_tx" runat="server" Width="150px" style="font-size: medium">
                        <asp:ListItem Value="1">Enero</asp:ListItem>
                        <asp:ListItem Value="2">Febrero</asp:ListItem>
                        <asp:ListItem Value="3">Marzo</asp:ListItem>
                        <asp:ListItem Value="4">Abril</asp:ListItem>
                        <asp:ListItem Value="5">Mayo</asp:ListItem>
                        <asp:ListItem Value="6">Junio</asp:ListItem>
                        <asp:ListItem Value="7">Julio</asp:ListItem>
                        <asp:ListItem Value="8">Agosto</asp:ListItem>
                        <asp:ListItem Value="9">Septiembre</asp:ListItem>
                        <asp:ListItem Value="10">Octubre</asp:ListItem>
                        <asp:ListItem Value="11">Noviembre</asp:ListItem>
                        <asp:ListItem Value="12">Diciembre</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="height: 26px"><span style="font-size: large">Fecha Máxima:</span>
                    <asp:DropDownList ID="Fecha_Max_tx" runat="server" Width="150px" style="font-size: medium">
                        <asp:ListItem Value="1">Enero</asp:ListItem>
                        <asp:ListItem Value="2">Febrero</asp:ListItem>
                        <asp:ListItem Value="3">Marzo</asp:ListItem>
                        <asp:ListItem Value="4">Abril</asp:ListItem>
                        <asp:ListItem Value="5">Mayo</asp:ListItem>
                        <asp:ListItem Value="6">Junio</asp:ListItem>
                        <asp:ListItem Value="7">Julio</asp:ListItem>
                        <asp:ListItem Value="8">Agosto</asp:ListItem>
                        <asp:ListItem Value="9">Septiembre</asp:ListItem>
                        <asp:ListItem Value="10">Octubre</asp:ListItem>
                        <asp:ListItem Value="11">Noviembre</asp:ListItem>
                        <asp:ListItem Value="12">Diciembre</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="height: 26px">
                    <asp:Button ID="Lipiar_Ganancias_btn" runat="server" CssClass="btn btn-default" OnClick="Lipiar_Ganancias_btn_Click" Text="Anual" style="width: 80px;"/>
                </td>
            </tr>
        </table>
    </div>
            </ContentTemplate>
    </asp:UpdatePanel>
    <p>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Chart ID="GraficoGanancias" runat="server" Width="1100px" BorderlineColor="Maroon" BorderlineDashStyle="Solid" Palette="Berry" PaletteCustomColors="Lime" TextAntiAliasingQuality="Normal" EnableTheming="True">
                    <Titles>
                        <asp:Title Text="Ganancias" TextStyle="Emboss" BorderWidth="6"></asp:Title>
                    </Titles>
                    <Series>
                        <asp:Series Name="Series1" ChartType="Line" XValueMember="NombreMes" YValueMembers="Ganancias" IsValueShownAsLabel="True" Font="Microsoft Sans Serif, 10.2pt, style=Bold"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Title="Meses"></AxisX>
                            <AxisY Title="Capital"></AxisY>
                            <%--<Area3DStyle Enable3D="true" />--%>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </ContentTemplate>
        </asp:UpdatePanel>
    </p></div>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
    <div id="menu2" style="display: block;">
        <table class="nav-justified">
            <tr>
                <td class="text-center" colspan="2" style="font-size: x-large">
                    <strong>&nbsp;Ingresos</strong></td>
                <td>
                    <asp:Button ID="Filtro_Ingresos" runat="server" CssClass="btn btn-primary" OnClick="Filtro_Ingresos_Click" Text="Filtrar" style="width: 80px;"/>
                </td>
            </tr>
            <tr>
                <td style="height: 26px"><span style="font-size: large">Fecha Mínima: </span>
                    <asp:DropDownList ID="Fecha_Min_Ingreso" runat="server" Width="150px" style="font-size: medium">
                        <asp:ListItem Value="1">Enero</asp:ListItem>
                        <asp:ListItem Value="2">Febrero</asp:ListItem>
                        <asp:ListItem Value="3">Marzo</asp:ListItem>
                        <asp:ListItem Value="4">Abril</asp:ListItem>
                        <asp:ListItem Value="5">Mayo</asp:ListItem>
                        <asp:ListItem Value="6">Junio</asp:ListItem>
                        <asp:ListItem Value="7">Julio</asp:ListItem>
                        <asp:ListItem Value="8">Agosto</asp:ListItem>
                        <asp:ListItem Value="9">Septiembre</asp:ListItem>
                        <asp:ListItem Value="10">Octubre</asp:ListItem>
                        <asp:ListItem Value="11">Noviembre</asp:ListItem>
                        <asp:ListItem Value="12">Diciembre</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="height: 26px"><span style="font-size: large">Fecha Máxima:</span>
                    <asp:DropDownList ID="Fecha_Max_Ingreso" runat="server" Width="150px" style="font-size: medium">
                        <asp:ListItem Value="1">Enero</asp:ListItem>
                        <asp:ListItem Value="2">Febrero</asp:ListItem>
                        <asp:ListItem Value="3">Marzo</asp:ListItem>
                        <asp:ListItem Value="4">Abril</asp:ListItem>
                        <asp:ListItem Value="5">Mayo</asp:ListItem>
                        <asp:ListItem Value="6">Junio</asp:ListItem>
                        <asp:ListItem Value="7">Julio</asp:ListItem>
                        <asp:ListItem Value="8">Agosto</asp:ListItem>
                        <asp:ListItem Value="9">Septiembre</asp:ListItem>
                        <asp:ListItem Value="10">Octubre</asp:ListItem>
                        <asp:ListItem Value="11">Noviembre</asp:ListItem>
                        <asp:ListItem Value="12">Diciembre</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="height: 26px">
                    <asp:Button ID="Limpiar_Ingresos" runat="server" CssClass="btn btn-default" OnClick="Limpiar_Ingresos_Click" Text="Anual" style="width: 80px;"/>
                </td>
            </tr>
        </table>
    </div>
            </ContentTemplate>
    </asp:UpdatePanel>
    <p>
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <asp:Chart ID="GraficoIngresos" runat="server" Width="1100px" BorderlineColor="Maroon" BorderlineDashStyle="Solid" Palette="None" PaletteCustomColors="SpringGreen" TextAntiAliasingQuality="Normal">
                    <Titles>
                        <asp:Title Text="Ingresos" TextStyle="Emboss" BorderWidth="6"></asp:Title>
                    </Titles>
                    <Series>
                        <asp:Series Name="Series1" ChartType="Line" XValueMember="NombreMes" YValueMembers="Ganancias" IsValueShownAsLabel="True" Font="Microsoft Sans Serif, 10.2pt, style=Bold"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Title="Meses"></AxisX>
                            <AxisY Title="Capital"></AxisY>
                            <%--<Area3DStyle Enable3D="true" />--%>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </ContentTemplate>
        </asp:UpdatePanel>
    </p>
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
        <ContentTemplate>
    <div id="menu3" style="display: block;">
        <table class="nav-justified">
            <tr>
                <td class="text-center" colspan="2" style="font-size: x-large">
                    <strong>Salidas</strong></td>
                <td>
                    <asp:Button ID="Filtro_Retiro" runat="server" CssClass="btn btn-primary" OnClick="Filtro_Retiro_Click" Text="Filtrar" style="width: 80px;"/>
                </td>
            </tr>
            <tr>
                <td style="height: 26px"><span style="font-size: large">Fecha Mínima: </span>
                    <asp:DropDownList ID="Fecha_min_Retiro" runat="server" Width="150px" style="font-size: medium">
                        <asp:ListItem Value="1">Enero</asp:ListItem>
                        <asp:ListItem Value="2">Febrero</asp:ListItem>
                        <asp:ListItem Value="3">Marzo</asp:ListItem>
                        <asp:ListItem Value="4">Abril</asp:ListItem>
                        <asp:ListItem Value="5">Mayo</asp:ListItem>
                        <asp:ListItem Value="6">Junio</asp:ListItem>
                        <asp:ListItem Value="7">Julio</asp:ListItem>
                        <asp:ListItem Value="8">Agosto</asp:ListItem>
                        <asp:ListItem Value="9">Septiembre</asp:ListItem>
                        <asp:ListItem Value="10">Octubre</asp:ListItem>
                        <asp:ListItem Value="11">Noviembre</asp:ListItem>
                        <asp:ListItem Value="12">Diciembre</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="height: 26px"><span style="font-size: large">Fecha Máxima:</span>
                    <asp:DropDownList ID="Fecha_Max_Retiro" runat="server" Width="150px" style="font-size: medium">
                        <asp:ListItem Value="1">Enero</asp:ListItem>
                        <asp:ListItem Value="2">Febrero</asp:ListItem>
                        <asp:ListItem Value="3">Marzo</asp:ListItem>
                        <asp:ListItem Value="4">Abril</asp:ListItem>
                        <asp:ListItem Value="5">Mayo</asp:ListItem>
                        <asp:ListItem Value="6">Junio</asp:ListItem>
                        <asp:ListItem Value="7">Julio</asp:ListItem>
                        <asp:ListItem Value="8">Agosto</asp:ListItem>
                        <asp:ListItem Value="9">Septiembre</asp:ListItem>
                        <asp:ListItem Value="10">Octubre</asp:ListItem>
                        <asp:ListItem Value="11">Noviembre</asp:ListItem>
                        <asp:ListItem Value="12">Diciembre</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="height: 26px">
                    <asp:Button ID="Limpiar_Retiro" runat="server" CssClass="btn btn-default" OnClick="Limpiar_Retiro_Click" Text="Anual" style="width: 80px;"/>
                </td>
            </tr>
        </table>
    </div>
            </ContentTemplate>
    </asp:UpdatePanel>
    <p>
        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
            <ContentTemplate>
                <asp:Chart ID="GraficoSalidas" runat="server" Width="1100px" BorderlineColor="Maroon" BorderlineDashStyle="Solid" Palette="None" PaletteCustomColors="Red" TextAntiAliasingQuality="Normal">
                    <Titles>
                        <asp:Title Text="Salidas" TextStyle="Emboss" BorderWidth="6"></asp:Title>
                    </Titles>
                    <Series>
                        <asp:Series Name="Series1" XValueMember="NombreMes" YValueMembers="Ganancias" IsValueShownAsLabel="True" Font="Microsoft Sans Serif, 10.2pt, style=Bold" ChartType="Line"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Title="Meses"></AxisX>
                            <AxisY Title="Capital"></AxisY>
                            <%--<Area3DStyle Enable3D="true" />--%>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </ContentTemplate>
        </asp:UpdatePanel>
    </p>
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
