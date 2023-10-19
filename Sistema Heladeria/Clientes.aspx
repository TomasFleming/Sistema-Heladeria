<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="Sistema_Heladeria.Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header class="jumbotron text-center">
     <h2><strong>Clientes Registrados</strong></h2>
    </header>

<%--    <center><p style="font-size: 40px;font-weight: bold; color:#0094ff;font-family: Arial, sans-serif;">Articulos Registrados</p></center>--%>
    
    <div class="row">
    <div class="col-md-4"> <!-- Columna para el textbox -->
        <asp:TextBox ID="Buscador_client" runat="server" class="form-control" placeholder="Ingresar Cliente" style="width: 350px"></asp:TextBox>
    </div>
    <div class="col-md-4"> <!-- Columna para los botones -->
        <asp:Button ID="Buscar_client_btn" CssClass="btn btn-primary" runat="server" OnClick="Buscar_client_btn_Click" Text="Buscar" />
        <asp:Button ID="Agregar_Client_btn" CssClass="btn btn-default" runat="server" Text="Agregar Cliente" OnClick="Agregar_Client_btn_Click" />
    </div>
</div>
    <p>
            
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        &nbsp;&nbsp;&nbsp;
        
    </p>
    <p>
        
        <center>
            <asp:GridView ID="Lista_Clientes" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="1235px">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="NombreCompleto" HeaderText="Nombre" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="DNI" HeaderText="Documento" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Telefono" HeaderText="Telefono" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Correo" HeaderText="Correo" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Editar_client" runat="server" OnClick="Editar_client_Click" Text="Editar" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
        </center>
    </p>
    <p><%-- termina  --%>
        <center>
              
        </center>
    </p>
    
    <%-- Inicia el popup --%>
    <div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Agregar nuevo articulo<asp:Label ID="label55" runat="server" Text="Label" Visible="False"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>
          <%-- aca deberia empesar el asp:UpdatePanel y el contentemplate, pero solo los nesesitaria para aquellos que nesesito para editar --%>
          
                <center>
                          <table id="Tabla_cat1" style="width: 36%; height: 207px;">
        <tr>
            <td style="height: 66px; width: 228px">
                <asp:Label ID="Client_nom_lb" runat="server" Text="Nombre :" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 66px; width: 646px">
                <asp:TextBox ID="Nombre_tx" runat="server" style="font-size: 15pt" Width="300px"></asp:TextBox>
                <asp:Label ID="Alert_lb" runat="server" Text="Ya existe un articulo con ese nombre" Visible="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td style="height: 40px; width: 228px">
                <asp:Label ID="Doc_lb" runat="server" Text="Documento :" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 40px; width: 646px">
                <asp:TextBox ID="Doc_tx" runat="server" style="font-size: 15pt" Width="300px"></asp:TextBox>
            </td>
        </tr>
        
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Art_Pre_lb" runat="server" Text="Telefono :" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Telefono_tx" runat="server" TextMode="Number" style="font-size: 15pt" Width="302px"></asp:TextBox>

                <%--<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Debe ser un valor superior a 0" ControlToValidate="Precio_tx" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>--%>

            </td>
        </tr>
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Art_desc_lb" runat="server" Text="Correo :" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Mail_tx" runat="server" Height="34px" style="margin-left: 0" Width="302px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <center><asp:Button ID="Cliente_guard_btn" CssClass="btn btn-primary" runat="server" Text="Guardar Cliente" OnClick="Cliente_guard_btn_Click"/>
            &nbsp;<asp:Button ID="Cancelar_client_btn" CssClass="btn btn-danger" runat="server" Text="Cancelar" OnClick="Cancelar_client_btn_Click" /></center>
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
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Editar Articulo N° <asp:Label ID="ID_Art_edit_lb" runat="server"  Visible="True"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
                  <center>

                      <table id="Tabla_categ" style="width: 36%; height: 207px;">
        <tr>
            <td style="height: 66px; width: 228px">
                <asp:Label ID="Label1" runat="server" Text="Nombre :" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 66px; width: 646px">
                <asp:TextBox ID="Nomb_Edit_tx" runat="server" style="font-size: 15pt" Width="300px"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" Text="Ya existe un articulo con ese nombre" Visible="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td style="height: 40px; width: 228px">
                <asp:Label ID="Label3" runat="server" Text="Documento :" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 40px; width: 646px">
                <asp:TextBox ID="Doc_Edit_tx" runat="server" style="font-size: 15pt" Width="300px"></asp:TextBox>
            </td>
        </tr>
        
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Label4" runat="server" Text="Telefono :" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Telf_Edit_tx" runat="server" TextMode="Number" style="font-size: 15pt" Width="302px"></asp:TextBox>

                <%--<asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Debe ser un valor superior a 0" ControlToValidate="Precio_tx" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>--%>

            </td>
        </tr>
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Label5" runat="server" Text="Correo :" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Correo_Edit_tx" runat="server" Height="34px" style="margin-left: 0" Width="302px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <center><asp:Button ID="Guardar_Camb_bt" CssClass="btn btn-primary" OnClick="Guardar_Camb_bt_Click" runat="server" Text="Guardar Cambios"/>
            &nbsp;<asp:Button ID="Eliminar_Client_btn" CssClass="btn btn-danger" runat="server" Text="Borrar Articulo" OnClick="Eliminar_Client_btn_Click" /></center>
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
