<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tipos_de_Movimientos.aspx.cs" Inherits="Sistema_Heladeria.Tipos_de_Movimientos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <header class="jumbotron text-center">
     <h2><strong>Tipo de Movimiento</strong></h2>
    </header>
    <center>
<%--    <center><p style="font-size: 40px;font-weight: bold; color:#0094ff;font-family: Arial, sans-serif;">Tipos de Movimientos</p></center>--%>
   
    <div class="row">
    <div class="col-md-4"> <!-- Columna para el textbox -->
        <asp:TextBox ID="Buscador_mov" runat="server" class="form-control" placeholder="Ingrese tipo de movimiento" style="width: 400px"></asp:TextBox>
    </div>
    <div class="col-md-4"> <!-- Columna para los botones -->
        <asp:Button ID="Buscar_mov_btn" CssClass="btn btn-primary" runat="server" OnClick="Buscar_mov_btn_Click" Text="Buscar"/>&nbsp;
        <asp:Button ID="Agregar_mov_btn" CssClass="btn btn-default" runat="server" Text="Agregar Nueva Categoría de Movimiento" OnClick="Agregar_mov_btn_Click" />
    </div>
</div>
    <p></p>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate>
    <center>
            <asp:GridView ID="Lista_Movimientos" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="1200px">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Nombre" HeaderText="Actividad" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" ItemStyle-Width="350" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Detalle" HeaderText="Detalles" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Editar_mov" runat="server" OnClick="Editar_mov_Click" Text="Editar" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
        </center></ContentTemplate></asp:UpdatePanel>
    <p>
        
        
        
    </p>
    <%-- Inicia el popup --%>
    <div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Agregar Nuevo Movimiento<asp:Label ID="label55" runat="server" Text="Label" Visible="False"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>
          <%-- aca deberia empesar el asp:UpdatePanel y el contentemplate, pero solo los nesesitaria para aquellos que nesesito para editar --%>
          <asp:UpdatePanel ID="UpdatePanel3" runat="server"><ContentTemplate>
                <center>
                          <table id="Tabla_cat1" style="width: 36%; height: 300px;">
        <tr>
            <td style="height: 66px; width: 228px">
                <asp:Label ID="Art_nom_lb" runat="server" Text="Nombre:" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 66px; width: 300px">
                <asp:TextBox ID="Nombre_mov_tx" runat="server" Width="300px"></asp:TextBox>
                <asp:Label ID="Alert_lb" runat="server" Text="Ya existe un movimiento con ese nombre" Visible="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Art_Pre_lb" runat="server" Text="Descripción:" style="font-size: 20px" ></asp:Label>
            </td>
            <td style="height: 22px; width: 300px">

               <asp:TextBox ID="Descp_tx" runat="server" Height="65px" style="margin-left: 0" TextMode="MultiLine" Width="300px"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Art_desc_lb" runat="server" Text="Detalle:" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 300px">
                <asp:DropDownList ID="Detalle_list" runat="server">
                    <asp:ListItem>Ingreso</asp:ListItem>
                    <asp:ListItem>Retiro</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <center><asp:Button ID="Mov_guard_btn" CssClass="btn btn-primary" runat="server" Text="Guardar Movimiento" OnClick="Guardar_Mov_bt_Click"/>
            &nbsp;<asp:Button ID="Cancelar_mov_btn" CssClass="btn btn-danger" runat="server" Text="Cancelar" OnClick="Cancelar_mov_btn_Click" /></center>
            </td>
        </tr>
    </table>
                      </center>  
                  
                          </ContentTemplate></asp:UpdatePanel>
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
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Editar Movimiento <asp:Label ID="ID_Art_edit_lb" runat="server"  Visible="True"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
                  <center>

                      <table id="Tabla_categ" style="width: 36%; height: 207px;">
            <tr>
                <td style="height: 66px; width: 228px">
                    <asp:Label ID="Label3" runat="server" style="font-size: 20px" Text="Nombre:"></asp:Label>
                </td>
                <td style="height: 66px; width: 646px">
                    <asp:TextBox ID="Nomb_Edit_tx" runat="server" style="font-size: 15pt" Width="300px"></asp:TextBox>
                    <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="Ya existe un movimiento con ese nombre" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 228px; height: 22px">
                    <asp:Label ID="Label5" runat="server" style="font-size: 20px" Text="Descripción:"></asp:Label>
                </td>
                <td style="height: 22px; width: 646px">
                    <asp:TextBox ID="Descript_Edit_tx" runat="server" Height="65px" style="margin-left: 0" TextMode="MultiLine" Width="300px"></asp:TextBox>
                    <%--<asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="Precio_tx" ErrorMessage="Debe ser un valor superior a 0" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>--%>
                </td>
            </tr>
            <tr>
                <td style="width: 228px; height: 22px">
                    <asp:Label ID="Label6" runat="server" style="font-size: 20px" Text="Detalle:"></asp:Label>
                </td>
                <td style="height: 22px; width: 646px">
                    <asp:TextBox ID="Desc_Edit_tx" runat="server" ReadOnly="true" style="font-size: 15pt" Width="300px"></asp:TextBox>
                    </td>
            </tr>
            <%--<tr>
                <td colspan="2">
                    <center>
                        <asp:Button ID="Cambiar_Mov_bt" runat="server" CssClass="btn btn-primary" OnClick="Guardar_Mov_bt_Click" Text="Guardar Cambios" />
                    </center>
                    &nbsp;<center>
                        <asp:Button ID="Eliminar_Mov_btn" runat="server" CssClass="btn btn-danger" OnClick="Eliminar_Mov_btn_Click" Text="Cancelar" />
                    </center>
                </td>
            </tr>--%>
         
        <tr>
            <td colspan="2">
                <center><asp:Button ID="ButtonGuardarCambios" CssClass="btn btn-primary" runat="server" Text="Guardar Cambios" OnClick="Mov_guard_btn_Click"/>
            &nbsp;<asp:Button ID="ButtonCancelar" CssClass="btn btn-danger" runat="server" Text="Cancelar" OnClick="Cancelar_mov_btn_Click" /></center>
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
</asp:Content>
