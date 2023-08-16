<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categorias.aspx.cs" Inherits="Sistema_Heladeria.Categorias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
            <asp:TextBox ID="Buscador_art" runat="server" Width="257px" style="font-size: 15pt" Height="27px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Buscar_cat_btn" CssClass="btn btn-primary" runat="server" OnClick="Buscar_cat_btn_Click" Text="Buscar" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Agregar_Cat_btn" CssClass="btn btn-default" runat="server" Text="Agregar Categoria" OnClick="Agregar_Cat_btn_Click" />
    </p>
    <center>
        <asp:GridView ID="Lista_Articulos" runat="server" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="ID" PagerStyle-CssClass="pgr" Width="1235px">
            <AlternatingRowStyle CssClass="alt" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD">
                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre">
                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion">
                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
            </Columns>
            <PagerStyle CssClass="pgr" />
        </asp:GridView>
    </center>
    <p>
        
            &nbsp;</p>
            <%-- Inicia el popup --%>
    <div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Agregar nueva Categoria<asp:Label ID="label55" runat="server" Text="Label" Visible="False"></asp:Label></h4>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>
          <%-- aca deberia empesar el asp:UpdatePanel y el contentemplate, pero solo los nesesitaria para aquellos que nesesito para editar --%>
                  <center>
                      <table id="Tabla_cat1" style="width: 36%; height: 207px;">
        <tr>
            <td style="height: 20px; width: 228px">
                <asp:Label ID="Art_nom_lb" runat="server" Text="Nombre" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 20px; width: 646px">
                <asp:TextBox ID="Nomb_tx" runat="server" style="font-size: 15pt" Width="300px"></asp:TextBox>
                <br />
                <asp:Label ID="Alert_lb" runat="server" Text="Ya existe una categoria con ese nombre" Visible="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Art_desc_lb" runat="server" Text="Descripcion" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Descrip_tx" runat="server" TextMode="MultiLine" Height="65px" style="margin-left: 0" Width="292px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <center><asp:Button ID="Cat_guardar_btn" CssClass="btn btn-primary" runat="server" Text="Guardar Cambios" OnClick="Art_camb_btn_Click"/></center>
            &nbsp;<center><asp:Button ID="Cat_borrar_btn" CssClass="btn btn-danger" runat="server" Text="Borrar Articulo" OnClick="Art_elin_byn_Click" /></center>
            </td>
        </tr>
    </table>
                  </center>
          <%--ass--%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
  <script type="text/javascript">
      function openModal() {
          $('#myModal1').modal('show');
      }
      function closeModal() {
          $('#myModal1').modal('hide');
      }
  </script>
    <%-- termina  --%>
</asp:Content>
