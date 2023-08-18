<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="Sistema_Heladeria.Proveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:TextBox ID="Buscador_prov" runat="server" Width="257px" style="font-size: 15pt" Height="27px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Buscar_prov_btn" CssClass="btn btn-primary" runat="server"  Text="Buscar" OnClick="Buscar_prov_btn_Click" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Agregar_prov_btn" CssClass="btn btn-default" runat="server" Text="Agregar Articulo" OnClick="Agregar_prov_btn_Click"  />
    </p>
    <p>
        
    </p>
    <%-- Inicia el popup --%>
    <div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Agregar nuevo Proveedor<asp:Label ID="label55" runat="server" Text="Label" Visible="False"></asp:Label></h4>
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
                <asp:TextBox ID="Nomb_tx" runat="server" style="font-size: 15pt" Width="311px"></asp:TextBox>
                <asp:Label ID="Alert_lb" runat="server" Text="Ya existe un proveedor con ese nombre" Visible="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Telf_lb" runat="server" Text="Telefono" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Telefono_tx" runat="server" TextMode="Number" style="font-size: 15pt" Width="302px"></asp:TextBox>

            </td>
        </tr>
            <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Direc_lb" runat="server" Text="Direccion" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Direcc_tx" runat="server" TextMode="Number" style="font-size: 15pt" Width="302px"></asp:TextBox>

            </td>
            </tr>
            <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Correo_lb" runat="server" Text="Correo" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Correo_tx" runat="server" TextMode="Number" style="font-size: 15pt" Width="302px"></asp:TextBox>

            </td>
            </tr>
            <tr>
            <td style="width: 228px; height: 22px">
                &nbsp;</td>
            <td style="height: 22px; width: 646px">
                &nbsp;</td>
            </tr>
        <tr>
            <td colspan="2">
                <center><asp:Button ID="Prov_guard_btn" CssClass="btn btn-primary" runat="server" Text="Guardar Cambios" OnClick="Prov_guard_btn_Click" /></center>
            &nbsp;<center><asp:Button ID="Prov_elin_byn" CssClass="btn btn-danger" runat="server" Text="Borrar Articulo" OnClick="Prov_elin_byn_Click"  /></center>
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
