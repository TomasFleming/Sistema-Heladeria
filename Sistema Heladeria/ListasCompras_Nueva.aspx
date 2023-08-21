<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListasCompras_Nueva.aspx.cs" Inherits="Sistema_Heladeria.ListasCompras_Nueva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>

    </p>
    <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
        Numero de Orden a Crear:&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Nro_ord_lb" runat="server" Text="Label"></asp:Label>
    </p>
    <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
        Fecha de Creacion :&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Fecha_Creacion_lb" runat="server" Text="Label"></asp:Label>
    </p>
    <table class="nav-justified" border="0" style="border: 3px solid #CCCCCC; padding: 0px; clip: rect(0px, 0px, 0px, 0px);">
        <tr>
            <td class="modal-lg" style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; width: 586px; height: 36px;">Detalles del Proveedor :&nbsp;&nbsp;&nbsp;<asp:Button ID="PopUp_Prov_bt" runat="server" Text="Seleccionar Proveedor" CssClass="btn btn-default"/>
            </td>
            <td style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; height: 36px;">Detalles de Entrega:</td>
        </tr>
        <tr>
            <td class="modal-lg" style="width: 586px; font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Numero Proveedor:
                <asp:Label ID="Prov_ID_lb" runat="server" style="font-size: 20px" Text="ID"></asp:Label>
                <br />
                Nombre :&nbsp;&nbsp; <asp:Label ID="Prov_nom_lb" runat="server" style="font-size: 20px" Text="Nombre :"></asp:Label>
            </td>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Seleccione un deposito para recibir la entrega <asp:Button ID="PopUp_Depos_bt" runat="server" Text="Seleccionar Deposito" CssClass="btn btn-default"/>
            </td>
        </tr>
        <tr>
            <td class="modal-lg" style="width: 586px; font-family: Arial; font-size: 16px; font-style: inherit; color: #000000; height: 28px;">Telefono:&nbsp;&nbsp;<asp:Label ID="Telf_lb" runat="server" style="font-size: 20px" Text="Telefono :"></asp:Label>
            </td>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Numero de Deposito:
                <asp:Label ID="Deposit_ID_lb" runat="server" style="font-size: 20px" Text="ID"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="modal-lg" style="width: 586px; font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Direccion:&nbsp;&nbsp;<asp:Label ID="Direc_lb" runat="server" style="font-size: 20px" Text="Direccion :"></asp:Label>
            </td>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Nombre:<asp:Label ID="Deposit_nom_lb" runat="server" style="font-size: 20px" Text="Nombre "></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="modal-lg" style="width: 586px; font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Correo:&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="Correo_lb" runat="server" style="font-size: 20px" Text="Correo :"></asp:Label>
            </td>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Ubicacion:<asp:Label ID="Deposit_Ubic_lb" runat="server" style="font-size: 20px" Text="Ubic"></asp:Label>
            </td>
        </tr>
    </table>
    <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
        Articulos solicitados:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Pop_Art_bt" runat="server" Text="Agregar Articulo" CssClass="btn btn-default" />
        <center>
            <asp:GridView ID="Lista_Articulos" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="1235px">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Nombre_Categoria" HeaderText="Categoria" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Precio" HeaderText="Precio" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Quitar_art" runat="server" OnClick="Quitar_art_Click" Text="Quitar" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
        </center>
    &nbsp;</p>
    
</asp:Content>
