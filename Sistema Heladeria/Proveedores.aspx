<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="Sistema_Heladeria.Proveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header class="jumbotron text-center">
     <h2><strong>Proveedores</strong></h2>
        <div class="header-right">
            <div class="date-time">
                <span id="currentDate"></span>
                <span id="currentTime"></span>
            </div>
        </div>
    </header>
<%--    <center><p style="font-size: 40px; font-weight: bold; color:#0094ff;font-family: Arial, sans-serif;">Proveedores Afiliados</p></center>--%>
    <div class="row">
    <div class="col-md-4"> <!-- Columna para el textbox -->
        <asp:TextBox ID="Buscador_prov" runat="server" class="form-control" placeholder="Ingrese nombre o número de proveedor" style="width: 400px"></asp:TextBox>
    </div>
    <div class="col-md-4"> <!-- Columna para los botones -->
        <asp:Button ID="Buscar_prov_btn" CssClass="btn btn-primary" runat="server"  Text="Buscar" OnClick="Buscar_prov_btn_Click" /> &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Agregar_prov_btn" CssClass="btn btn-default" runat="server" Text="Agregar Proveedor" OnClick="Agregar_prov_btn_Click"  />
    </div>
</div>

    <p>
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        &nbsp;&nbsp;&nbsp;
        
    </p>
    <p>
        <center>
            <asp:GridView ID="Lista_Proveedores" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="1235px">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="NombreCompleto" HeaderText="Nombre" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Telefono" HeaderText="Telefono" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Correo" HeaderText="Correo" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Direccion" HeaderText="Direccion" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Edit_prov_btn" runat="server" OnClick="Edit_prov_btn_Click" Text="Editar" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
        </center>
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
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Agregar Nuevo Proveedor<asp:Label ID="label55" runat="server" Text="Label" Visible="False"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>
          <%-- aca deberia empesar el asp:UpdatePanel y el contentemplate, pero solo los nesesitaria para aquellos que nesesito para editar --%>
          <asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate>
                  <center>
                          <table id="Tabla_cat1" style="width: 36%; height: 207px;">
        <tr>
            <td style="height: 20px; width: 228px">
                <asp:Label ID="Art_nom_lb" runat="server" Text="Nombre:" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 20px; width: 646px">
                <asp:TextBox ID="Nomb_tx" runat="server" style="font-size: 15pt" Width="300px"></asp:TextBox>
                <asp:Label ID="Alert_lb" runat="server" Text="Ya existe un Proveedor con ese nombre" Visible="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Telf_lb" runat="server" Text="Teléfono:" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Telefono_tx" runat="server" TextMode="Number" style="font-size: 15pt" Width="302px"></asp:TextBox>

            </td>
        </tr>
            <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Direc_lb" runat="server" Text="Dirección:" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Direcc_tx" runat="server" style="font-size: 15pt" Width="302px"></asp:TextBox>

            </td>
            </tr>
            <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Correo_lb" runat="server" Text="Correo:" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Correo_tx" runat="server" style="font-size: 15pt" Width="302px"></asp:TextBox>
                <asp:Label ID="Alert_correo_lb" runat="server" Text="Ya existe un Proveedor con ese Correo" Visible="False" ForeColor="Red"></asp:Label>

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
                <center><asp:Button ID="Prov_guard_btn" CssClass="btn btn-primary" runat="server" Text="Guardar Cambios" OnClick="Prov_guard_btn_Click" />
            &nbsp;<asp:Button ID="Cancelar" CssClass="btn btn-danger" runat="server" Text="Cancelar" OnClick="Prov_elin_byn_Click"  /></center>
                <p>
                    <asp:Label ID="Completos_lb" runat="server" Text="Por favor ingrese todos los campos" Visible="false" ForeColor="Red"></asp:Label>
</p>
            </td>
        </tr>
    </table>
                      </center></ContentTemplate></asp:UpdatePanel>
                  
                          
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
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Editar Proveedor N° <asp:Label ID="ID_Prov_edit" runat="server" Visible="True"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>

          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
                  <center>
            <table id="Tabla_prov2" style="width: 36%; height: 207px;">
        <tr>
            <td style="height: 20px; width: 228px">
                <asp:Label ID="Label2" runat="server" Text="Nombre" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 20px; width: 646px">
                <asp:TextBox ID="Nomb_Edit_tx" runat="server" style="font-size: 15pt" Width="300px"></asp:TextBox>
                <asp:Label ID="Alert_Edit_lb" runat="server" Text="Ya existe un Proveedor con ese nombre" Visible="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Label4" runat="server" Text="Telefono" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Telf_Edit_tx" runat="server" TextMode="Number" style="font-size: 15pt" Width="300px"></asp:TextBox>

            </td>
        </tr>
            <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Label5" runat="server" Text="Direccion" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Direcc_Edit_tx" runat="server" style="font-size: 15pt" Width="300px"></asp:TextBox>

            </td>
            </tr>
            <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Label6" runat="server" Text="Correo" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Correo_Edit_tx" runat="server" style="font-size: 15pt" Width="300px"></asp:TextBox>
                <asp:Label ID="Alert_Correo_Edit_lb" runat="server" Text="Ya existe un Proveedor con ese Correo" Visible="False" ForeColor="Red"></asp:Label>

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
                <center><asp:Button ID="Guardar_Edit_btn" CssClass="btn btn-primary" runat="server" Text="Guardar Cambios" OnClick="Guardar_Edit_btn_Click" />
            &nbsp;<asp:Button ID="Eliminar_Prov_btn" CssClass="btn btn-danger" runat="server" Text="Borrar Proveedor" OnClick="Eliminar_Prov_btn_Click"  /></center>
                <p>
                    <asp:Label ID="Completos_Edit_lb" runat="server" Text="Por favor ingrese todos los campos" Visible="false" ForeColor="Red"></asp:Label>
</p>
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
