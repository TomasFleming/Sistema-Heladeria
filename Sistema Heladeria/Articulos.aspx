<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Articulos.aspx.cs" Inherits="Sistema_Heladeria.Insertar_y_mostrar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
            <asp:TextBox ID="Buscador_art" runat="server" Width="187px" style="font-size: 15pt" Height="27px"></asp:TextBox>
        <asp:Button ID="Buscar_art_btn" CssClass="btn btn-primary" runat="server" OnClick="Buscar_art_btn_Click" Text="Buscar" />
        <asp:Button ID="Agregar_Art_btn" CssClass="btn btn-default" runat="server" Text="Agregar Articulo" OnClick="Agregar_Art_btn_Click" />
        
    </p>
    <p>
            <table id="Tabla_cat1">
                <tr>
                    <td>
                        <asp:Label ID="Art_nom_lb" runat="server" style="font-size: 20px" Text="Nombre"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Art_nom" runat="server" style="font-size: 15pt"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Art_Pre_lb" runat="server" style="font-size: 20px" Text="Precio"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Art_stock" runat="server" style="font-size: 15pt" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
    </p>
    <p>
        
        <asp:GridView ID="Articulos_Colum" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="1235px">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD" />
                <asp:TemplateField HeaderText="Imagen" ValidateRequestMode="Enabled">
                            <ItemTemplate>
                                <asp:Image Id="ImagenHelado" runat="server"  Height="150px" Width="150px" ImageUrl='<%#"data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Imagen")) %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                <asp:BoundField DataField="Sabor" HeaderText="Nombre" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                <asp:BoundField DataField="Precio" HeaderText="Precio" />
            </Columns>
        </asp:GridView>
    </p>
</asp:Content>
