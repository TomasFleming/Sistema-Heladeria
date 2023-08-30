<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Testeos.aspx.cs" Inherits="Sistema_Heladeria.Testeos" EnableSessionState="True" EnableEventValidation="False" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--                  <center>
                  </center>--%>    <%--ass--%>
    <p>

        <table class="auto-style6">
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Nomb_lb" runat="server" Text="Sabor de Helado Nuevo:"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="Sabor_tx" runat="server" CssClass="auto-style5" Width="225px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style9" style="height: 30px">
                    <asp:Label ID="Precio_lb" runat="server" Text="Precio:"></asp:Label>
                </td>
                <td class="auto-style10" style="height: 30px">
                    <asp:TextBox ID="Precio_txt" runat="server" CssClass="auto-style5" TextMode="Number" Width="225px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Descripcion_lb" runat="server" Text="Descripcion:"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="Descrip_tx" runat="server" CssClass="auto-style5" Height="95px" Width="225px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Imag_lbl" runat="server" Text="Imagen"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:FileUpload ID="Imagen_Helado_direc" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="prueba_lb" runat="server" Text="no" Visible="False"></asp:Label>
                </td>
                <td class="auto-style12">
                    <center>
                    <asp:Button ID="Guardar_Helado_btn" runat="server" OnClick="Guardar_Nuevo_Click" Text="Guardar" />
                    </center>
                </td>
            </tr>
        </table>

    </p>

        <div class="row">
    <div class="col-md-4"> <!-- Columna para el textbox -->

    </div>
    <div class="col-md-4"> <!-- Columna para los botones -->

    </div>
</div>

    <p>
        <input id="Text1" type="text" class="form-control" placeholder="Buscador" style="width: 350px" />
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
    <p>

    </p>
    <p>
        <%--      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>--%><%--  <script type="text/javascript">
      function openModal() {
          $('#myModal1').modal('show');
      }
      function closeModal() {
          $('#myModal1').modal('hide');
      }
  </script>--%>

    <!-- Modal content-->
        <%-- termina  --%>        <%-- Inicia el popup Articulos--%><%--aasasdasasadsads--%>          <%-- aca deberia empesar el asp:UpdatePanel y el contentemplate, pero solo los nesesitaria para aquellos que nesesito para editar --%><%--ass--%>              
                          
          <%--        </div>--%>
<%--      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>--%>
<%--  <script type="text/javascript">
      function openModal() {
          $('#myModal1').modal('show');
      }
      function closeModal() {
          $('#myModal1').modal('hide');
      }
  </script>--%>
    <%-- termina  --%>
        <asp:Button ID="Pop_Art_bt" runat="server" Text="Agregar Articulo" CssClass="btn btn-default" OnClick="Pop_Art_bt_Click" />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="pop2" runat="server" Text="Agregar Articulo" CssClass="btn btn-default" OnClick="pop2_Click" />
        </p>
    <p>
        <ajaxToolkit:CalendarExtender ID="Fechar_ord_tx_CalendarExtender" runat="server" TargetControlID="TextBox1" />
        </p>
    
    <%-- Inicia el popup --%>
    <div id="ModalArt" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Seleccionar Articulo<asp:Label ID="label2" runat="server" Text="Label" Visible="False"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p>
          <%--aasasdasasadsads--%>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
        <center>
            
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
      function openModalArt() {
          $('#ModalArt').modal('show');
      }
      function closeModalArt() {
          $('#ModalArt').modal('hide');
      }
  </script>
                <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Popup de Búsqueda</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Contenido del Popup</p>
                            <input type="text" id="txtBusqueda" placeholder="Ingrese su búsqueda" class="form-control" />
                            <asp:TextBox ID="TextBox2" runat="server" Width="257px" style="font-size: 15pt" Height="27px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="buscar2btn" CssClass="btn btn-primary" runat="server" OnClick="buscar2btn_Click" Text="Buscar" />
        <center>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
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
                        <asp:Button ID="Selecc_Art_bt" runat="server" OnClick="Selecc_Art_bt_Click" Text="Seleccionar" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
        </center>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            <button type="button" class="btn btn-primary" onclick="realizarBusqueda()">Buscar</button>
                        </div>
                    </div>
                    
                </div>
            </div>
<%--        </div>--%>

        <script type="text/javascript">
            function realizarBusqueda() {
                // Agrega aquí la lógica de búsqueda o llamada AJAX
                var busqueda = document.getElementById('txtBusqueda').value;
                alert('Realizando búsqueda: ' + busqueda);
            }
            function openModal() {
                $('#myModal').modal('show');
            }
        </script>

</asp:Content>
