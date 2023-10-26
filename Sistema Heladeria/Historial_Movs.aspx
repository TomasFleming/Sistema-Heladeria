﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Historial_Movs.aspx.cs" Inherits="Sistema_Heladeria.Historial_Movs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header class="jumbotron text-center">
     <h2><strong>Historial De Movimientos</strong></h2>
    </header>
    <p>    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
    <div id="menu" style="display: block;">
        <table class="nav-justified">
            <tr>
                <td style="width: 409px">
                    <span style="font-size: large">Período de movimientos:</span> 
                </td>
                <td style="width: 388px">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 409px"><span style="font-size: large">Fecha Mínima:</span>
                    <asp:TextBox ID="Fecha_min_tx" runat="server" TextMode="Date" Width="100px"></asp:TextBox>
                </td>
                <td style="width: 388px"><span style="font-size: large">Fecha Máxima:</span>
                    <asp:TextBox ID="Fecha_Max_tx" runat="server" TextMode="Date" Width="100px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="font-size: large; width: 409px">Artículo:</td>
                <td style="font-size: large; width: 388px">Depósito:</td>
                <td>
                    <asp:Button ID="Filtrar_btn" runat="server" OnClick="Filtrar_btn_Click" Text="Filtrar" />
                </td>
            </tr>
            <tr>
                <td style="width: 409px">
                    <span style="font-size: large">Cantidad Mínimo:</span>
                    <asp:TextBox ID="Precio_min_tx" runat="server" TextMode="Number" Width="100px"></asp:TextBox>
                </td>
                <td style="width: 388px">
                    <span style="font-size: large">Cantidad Máximo:</span>
                    <asp:TextBox ID="Precio_Max_tx" runat="server" TextMode="Number" Width="100px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Lipiar_Filt_btn" runat="server" OnClick="Lipiar_Filt_btn_Click" Text="Limpiar" />
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
            <asp:BoundField DataField="ID" HeaderText="N° Operacion">
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Nombre" HeaderText="Articulo">
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Deposito" HeaderText="Deposito">
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

</asp:Content>
