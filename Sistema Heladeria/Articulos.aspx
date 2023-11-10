<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Articulos.aspx.cs" Inherits="Sistema_Heladeria.Insertar_y_mostrar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <header class="jumbotron text-center">
     <h2><strong>Lista De Artículos</strong></h2>
         <div class="header-right">
            <div class="date-time">
                <span id="currentDate"></span>
                <span id="currentTime"></span>
            </div>
        </div>
    </header>

<%--    <center><p style="font-size: 40px;font-weight: bold; color:#0094ff;font-family: Arial, sans-serif;">Articulos Registrados</p></center>--%>
    
    <div class="row">
    <div class="col-md-4"> <!-- Columna para el textbox -->
        <asp:TextBox ID="Buscador_art" runat="server" class="form-control" placeholder="Ingresar Articulo" style="width: 400px"></asp:TextBox>
    </div>
    <div class="col-md-4"> <!-- Columna para los botones -->
        <asp:Button ID="Buscar_art_btn" CssClass="btn btn-primary" runat="server" OnClick="Buscar_art_btn_Click" Text="Buscar" />
        <asp:Button ID="Agregar_Art_btn" CssClass="btn btn-default" runat="server" Text="Agregar Artículo" OnClick="Agregar_Art_btn_Click" />
    </div>
</div>
    <p>
            
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        &nbsp;&nbsp;&nbsp;
        
    </p>
    <p>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server"><ContentTemplate>
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
                <asp:BoundField DataField="Nombre_Categoria" HeaderText="Categoría" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Precio" HeaderText="Precio" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Editar_art" runat="server" OnClick="Editar_art_Click" Text="Editar" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
        </center></ContentTemplate></asp:UpdatePanel>
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
          <asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate>
                <center>
                          <table id="Tabla_cat1" style="width: 36%; height: 207px;">
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Art_cat_lb" runat="server" Text="Categoria" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                   <asp:DropDownList ID="Categorias_list" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre_Categoria" DataValueField="ID">
        </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Heladeria Sistemas 3ConnectionString %>" SelectCommand="SELECT * FROM [Categorias] where Estado not like 'Desactivado'"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="height: 66px; width: 228px">
                <asp:Label ID="Art_nom_lb" runat="server" Text="Nombre" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 66px; width: 646px">
                <asp:TextBox ID="Nomb_tx" runat="server" style="font-size: 15pt" Width="300px" MaxLength="30"></asp:TextBox>
                <asp:Label ID="Alert_lb" runat="server" Text="Ya existe un articulo con ese nombre" Visible="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Art_desc_lb" runat="server" Text="Descripcion" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Descrip_tx" runat="server" TextMode="MultiLine" Height="65px" style="margin-left: 0" Width="300px"></asp:TextBox>
                <br />

            </td>
        </tr>
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Art_Final_lb" runat="server" Text="Destino" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <center><asp:RadioButton ID="Mat_Prima_bt" runat="server" Text="Materia Prima" OnCheckedChanged="Mat_Prima_bt_CheckedChanged" AutoPostBack="True" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="Vendible_btn" runat="server" Text="Venta" OnCheckedChanged="Vendible_btn_CheckedChanged" AutoPostBack="True" /></center>
            </td>
        </tr>
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Art_Pre_lb" runat="server" Text="Precio" style="font-size: 20px" Visible="false"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Precio_tx" runat="server" TextMode="Number" style="font-size: 15pt" Width="302px" Visible="false"></asp:TextBox>

                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Debe ser un valor superior a 0" ControlToValidate="Precio_tx" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>

            </td>
        </tr>
        <tr>
            <td colspan="2">
                <center><asp:Button ID="Art_camb_btn" CssClass="btn btn-primary" runat="server" Text="Guardar Articulo" OnClick="Art_camb_btn_Click"/>
            &nbsp;<asp:Button ID="Cancelar_art_btn" CssClass="btn btn-danger" runat="server" Text="Cancelar" OnClick="Cancelar_art_btn_Click" /></center>
                <p>
                    <asp:Label ID="Completos_lb" runat="server" Text="Por favor ingrese todos los campos" Visible="false" ForeColor="Red"></asp:Label></p>
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
          <asp:UpdatePanel ID="UpdatePanel4" runat="server"><ContentTemplate>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Editar Articulo N° <asp:Label ID="ID_Art_edit_lb" runat="server"  Visible="True"></asp:Label></h4></center></ContentTemplate></asp:UpdatePanel>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
                  <center>

                      <table id="Tabla_categ" style="width: 36%; height: 207px;">
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Label2" runat="server" Text="Categoria" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                   <asp:DropDownList ID="Categoria_Edit_tx" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre_Categoria" DataValueField="ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Heladeria Sistemas 3ConnectionString %>" SelectCommand="SELECT * FROM [Categorias] where Estado not like 'Desactivado'"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="height: 66px; width: 228px">
                <asp:Label ID="Label3" runat="server" Text="Nombre" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 66px; width: 646px">
                <asp:TextBox ID="Nomb_Edit_tx" runat="server" style="font-size: 15pt" Width="300px"></asp:TextBox>
                <asp:Label ID="Alert_Edit_lb" runat="server" Text="Ya existe un articulo con ese nombre" Visible="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Label5" runat="server" Text="Precio" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Precio_Edit_tx" runat="server" TextMode="Number" style="font-size: 15pt" Width="300px"></asp:TextBox>

                <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Debe ser un valor superior a 0" ControlToValidate="Precio_tx" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>

            </td>
        </tr>
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Label6" runat="server" Text="Descripcion" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Descript_Edit_tx" runat="server" TextMode="MultiLine" Height="65px" style="margin-left: 0" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <center><asp:Button ID="Guardar_Camb_bt" CssClass="btn btn-primary" runat="server" Text="Guardar Cambios" OnClick="Guardar_Camb_bt_Click"/>
            &nbsp;<asp:Button ID="Eliminar_Art_btn" CssClass="btn btn-danger" runat="server" Text="Borrar Articulo" OnClick="Eliminar_Art_btn_Click" /></center>
                <p>
                    <asp:Label ID="Completos_Edit_lb" runat="server" Text="Por favor ingrese todos los campos" Visible="false" ForeColor="Red"></asp:Label></p>
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
