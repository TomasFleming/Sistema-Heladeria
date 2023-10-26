<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Graficos.aspx.cs" Inherits="Sistema_Heladeria.Graficos" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header class="jumbotron text-center">
     <h2><strong>Resumen de Ingresos y Egresos</strong></h2>
    </header>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
    <div id="menu" style="display: block;">
        <table class="nav-justified">
            <tr>
                <td>
                    <span style="font-size: large">Movimiento:</span> 
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Flitrar_Ganancias" runat="server" OnClick="Flitrar_Ganancias_Click" Text="Filtrar" style="width: 80px;"/>
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
                    <asp:Button ID="Lipiar_Ganancias_btn" runat="server" OnClick="Lipiar_Ganancias_btn_Click" Text="Limpiar" style="width: 80px;"/>
                </td>
            </tr>
        </table>
    </div>
            </ContentTemplate>
    </asp:UpdatePanel>
    <p>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Chart ID="GraficoGanancias" runat="server" Width="1100px" BorderlineColor="Maroon" BorderlineDashStyle="Solid" Palette="Berry" PaletteCustomColors="Lime" TextAntiAliasingQuality="Normal">
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
                <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Heladeria Sistemas 3ConnectionString %>" SelectCommand="-- Calcular las ganancias de cada mes del año 2023
WITH Meses AS (
    SELECT
        1 AS MesNumero, 'Enero' AS NombreMes
    UNION SELECT 2, 'Febrero'
    UNION SELECT 3, 'Marzo'
    UNION SELECT 4, 'Abril'
    UNION SELECT 5, 'Mayo'
    UNION SELECT 6, 'Junio'
    UNION SELECT 7, 'Julio'
    UNION SELECT 8, 'Agosto'
    UNION SELECT 9, 'Septiembre'
    UNION SELECT 10, 'Octubre'
    UNION SELECT 11, 'Noviembre'
    UNION SELECT 12, 'Diciembre'
)
, VentasGanancias AS (
    SELECT
        DATEPART(MONTH, Fecha) AS MesNumero,
        SUM(Total) AS Ingresos
    FROM Ventas
    WHERE YEAR(Fecha) = 2023
    GROUP BY DATEPART(MONTH, Fecha)
),
PagosGanancias AS (
    SELECT
        DATEPART(MONTH, Fecha_Pago) AS MesNumero,
        SUM(Total) AS Salidas
    FROM Registro_Pagos
    WHERE YEAR(Fecha_Pago) = 2023
    GROUP BY DATEPART(MONTH, Fecha_Pago)
)
-- Unir las ganancias mensuales de ingresos y salidas
SELECT
    Meses.NombreMes,
    ISNULL(Ingresos, 0) - ISNULL(Salidas, 0) AS Ganancias
FROM Meses
LEFT JOIN VentasGanancias ON Meses.MesNumero = VentasGanancias.MesNumero
LEFT JOIN PagosGanancias ON Meses.MesNumero = PagosGanancias.MesNumero
ORDER BY Meses.MesNumero;
"></asp:SqlDataSource>--%>
            </ContentTemplate>
        </asp:UpdatePanel>
    </p>
</asp:Content>
