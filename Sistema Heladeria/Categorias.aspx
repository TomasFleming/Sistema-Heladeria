<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categorias.aspx.cs" Inherits="Sistema_Heladeria.Categorias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p></p>
    <div class="row">
    <div class="col-md-4"> <!-- Columna para el textbox -->
        <asp:TextBox ID="Buscador_cat" runat="server" class="form-control" placeholder="Buscador" style="width: 350px"></asp:TextBox>
    </div>
    <div class="col-md-4"> <!-- Columna para los botones -->
        <asp:Button ID="Buscar_cat_btn" CssClass="btn btn-primary" runat="server" OnClick="Buscar_cat_btn_Click" Text="Buscar" />
        <asp:Button ID="Agregar_Cat_btn" CssClass="btn btn-default" runat="server" Text="Agregar Categoria" OnClick="Agregar_Cat_btn_Click" />
    </div>
</div>
    <p>
            
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        &nbsp;&nbsp;&nbsp;
        
    </p>
    <center>
        <asp:GridView ID="Lista_Categorias" runat="server" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="ID" PagerStyle-CssClass="pgr" Width="1235px">
            <AlternatingRowStyle CssClass="alt" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD">
                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="Nombre_Categoria" HeaderText="Nombre">
                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion">
                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Editar_cat" runat="server" OnClick="Editar_cat_Click" Text="Editar" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="pgr" />
        </asp:GridView>
    </center>
    <p>
        <center>
            
        </center>
        
            &nbsp;</p>
    <%-- termina  --%>
    <div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title"style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Agregar nueva Categoria<asp:Label ID="label55" runat="server" Text="Label" Visible="False"></asp:Label></h4></center>
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
                <center><asp:Button ID="Cat_guardar_btn" CssClass="btn btn-primary" runat="server" Text="Guardar Categoria" OnClick="Art_camb_btn_Click"/></center>
            &nbsp;<center><asp:Button ID="Cancelar_btn" CssClass="btn btn-danger" runat="server" Text="Cancelar" OnClick="Cancelar_btn_Click" /></center>
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
    <%-- Inicia el popup --%>
    <div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title"style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Editar Categoria N°<asp:Label ID="ID_cat_edit" runat="server" Visible="True"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
                  <center>
                      <table id="Tabla_cat2" style="width: 36%; height: 207px;">
        <tr>
            <td style="height: 20px; width: 228px">
                <asp:Label ID="Label2" runat="server" Text="Nombre" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 20px; width: 646px">
                <asp:TextBox ID="Nomb_Edit_tx" runat="server" style="font-size: 15pt" Width="300px"></asp:TextBox>
                <br />
                <asp:Label ID="Label3" runat="server" Text="Ya existe una categoria con ese nombre" Visible="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Label4" runat="server" Text="Descripcion" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Descrip_Edit_tx" runat="server" TextMode="MultiLine" Height="65px" style="margin-left: 0" Width="292px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <center><asp:Button ID="Guardar_Editado_bt" CssClass="btn btn-primary" runat="server" Text="Guardar Cambios" OnClick="Guardar_Editado_bt_Click"/></center>
            &nbsp;<center><asp:Button ID="Borrar_cat_btn" CssClass="btn btn-danger" runat="server" Text="Borrar Categoria" OnClick="Borrar_cat_btn_Click" /></center>
            </td>
        </tr>
    </table>
                  </center>
              </ContentTemplate>
          </asp:UpdatePanel>
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
      function openModal2() {
          $('#myModal2').modal('show');
      }
      function closeModal2() {
          $('#myModal2').modal('hide');
      }
  </script>
    <%-- termina  --%>
</asp:Content>
