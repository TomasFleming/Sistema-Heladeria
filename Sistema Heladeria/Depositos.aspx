<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Depositos.aspx.cs" Inherits="Sistema_Heladeria.Depositos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--<center><p style="font-size: 40px; font-weight: bold; color:#0094ff;font-family: Arial, sans-serif;">Depositos Registrados</p></center>--%>
    
    <header class="jumbotron text-center">
     <h2>L<strong>ista De Depósitos</strong></h2>
    </header>
  

    <div class="col-md-4"> <!-- Columna para el textbox -->
     <table class="nav-justified">
         <tr>
             <td>
     <asp:TextBox ID="Buscador_dep" runat="server" class="form-control" placeholder="Ingrese nombre o número del depósito" style="width: 400px"></asp:TextBox>
             </td>
             <td></td>
             <td>
     <asp:Button ID="Buscar_dep_btn" CssClass="btn btn-primary" runat="server"  Text="Buscar" OnClick="Buscar_dep_btn_Click"  />
             </td>
             <td>&nbsp;&nbsp; &nbsp; &nbsp;</td>
             <td>
     <asp:Button ID="Agregar_dep_btn" CssClass="btn btn-default" runat="server" Text="Agregar Depósito" OnClick="Agregar_dep_btn_Click"  />
             </td>
             <td>&nbsp;&nbsp; &nbsp;</td>
             <td>
     <asp:Button ID="Button1" runat="server" Text="Realizar Nuevo Movimiento" CssClass="btn btn-default" PostBackUrl="~/Movimientos_Stocks.aspx" />
             </td>
             <td>&nbsp;&nbsp; &nbsp;</td>
             <td>
     <asp:Button ID="Historial_Movs_btn" runat="server" Text="Historial De Movimientos" CssClass="btn btn-default" OnClick="Historial_Movs_btn_Click" Visible="False" />
             </td>
         </tr>
     </table>
 </div>

    <p>
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        &nbsp;&nbsp;&nbsp;
        
    </p>
    <%--ass--%>
    <asp:GridView ID="Lista_Depositos" runat="server" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="ID" PagerStyle-CssClass="pgr" Width="1235px">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="COD">
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Nombre" HeaderText="Nombre">
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion">
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <center>
                        <asp:Button ID="Ver_Articulos_btn" runat="server" CssClass="btn btn-primary" OnClick="Ver_Articulos_btn_Click" Text="Ver Articulos" />
                    </center>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
    

    <%-- Inicia el popup  ModalMin_Stock--%>
    <div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Agregar nuevo Deposito<asp:Label ID="label55" runat="server" Text="Label" Visible="False"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%><%--ass--%>
          <center>
                          <table id="Tabla_cat1" style="width: 36%; height: 207px;">
        <tr>
            <td style="height: 20px; width: 228px">
                <asp:Label ID="Art_nom_lb" runat="server" Text="Nombre" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 20px; width: 646px">
                <asp:TextBox ID="Nomb_tx" runat="server" style="font-size: 15pt" Width="300px"></asp:TextBox>
                <asp:Label ID="Alert_lb" runat="server" Text="Ya existe un proveedor con ese nombre" Visible="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 228px; height: 22px">
                <asp:Label ID="Direct_lb" runat="server" Text="Ubicacion" style="font-size: 20px"></asp:Label>
            </td>
            <td style="height: 22px; width: 646px">
                <asp:TextBox ID="Ubic_tx" runat="server" style="font-size: 15pt" Width="300px"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td colspan="2">
                <center><asp:Button ID="Deposit_guard_btn" CssClass="btn btn-primary" runat="server" Text="Guardar Depósito" OnClick="Dep_guard_btn_Click" />
            &nbsp;&nbsp;&nbsp;<asp:Button ID="Deposit_elin_byn" CssClass="btn btn-danger" runat="server" Text="Cancelar " OnClick="Dep_elin_byn_Click"  /></center>
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
        <%-- Inicia el popup2 --%>
    <div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Articulos del Deposito N° <asp:Label ID="Num_Dep" runat="server" Text="Label" Visible="True"></asp:Label> :</h4></center>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>
          <%-- aca deberia empesar el asp:UpdatePanel y el contentemplate, pero solo los nesesitaria para aquellos que nesesito para editar --%>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
          <center>
            <asp:GridView ID="Lista_Articulos" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDataBound="Lista_Articulos_RowDataBound"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">

<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Nombre" HeaderText="Articulo" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Nombre_Categoria" HeaderText="Categoria" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Stock" HeaderText="Stock" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Stock_Min" HeaderText="Stock Minimo" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <center>
                        <asp:Button ID="Stock_Min_btn" runat="server" CssClass="btn btn-primary" OnClick="Stock_Min_btn_Click" Text="Cambiar Stock Minimo" />
                    </center>
                </ItemTemplate>
            </asp:TemplateField>
                    
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
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

 <%-- Inicia el popup  ModalMin_Stock--%>
    <div id="ModalMin_Stock" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
          <asp:UpdatePanel ID="UpdatePanel3" runat="server"><ContentTemplate>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Stock Minimo Articulo N° <asp:Label ID="ID_Art_st_lb" runat="server" ></asp:Label>
            <p>Para el Deposito N° <asp:Label ID="ID_dep_lb2" runat="server"></asp:Label></p> </h4></center></ContentTemplate></asp:UpdatePanel>
      </div>
      <div class="modal-body">
        <p></p>
          <%--aasasdasasadsads--%>
          <asp:UpdatePanel ID="UpdatePanel2" runat="server">
              <ContentTemplate>
        <center>
            <table class="nav-justified">
        <tr>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000; height: 22px;">Stock Minimo Actual</td>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000; height: 22px;"><asp:TextBox ID="Stock_Min_Acct_tx" runat="server" Height="22px" style="font-size: 15pt"  Width="78px" ReadOnly="True"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Nuevo Stock Minimo</td>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;"><asp:TextBox ID="Stock_Min_Nuevo_tx" runat="server" Height="22px" style="font-size: 15pt" TextMode="Number" Width="78px"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2" style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;"> <center>
                <asp:Button ID="Guardar_MinStock_btn" runat="server" CssClass="btn btn-success" Text="Guardar Stock Minimo" OnClick="Guardar_MinStock_btn_Click" /></center><center>
                    <asp:Button ID="Cancelar_MinStk_btn" runat="server" CssClass="btn btn-danger" Text="Cancelar" OnClick="Cancelar_MinStk_btn_Click" /></center>&nbsp;</td>
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
    <%-- Inicia el popup --%>
    <div id="ModalHistorial" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Ultimos 10 movimientos de stock<asp:Label ID="label2" runat="server" Text="Label" Visible="False"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p>
          <%--aasasdasasadsads--%>
          <asp:UpdatePanel ID="UpdatePanel4" runat="server">
              <ContentTemplate>
        <center>
            <asp:GridView ID="Lista_Historial" runat="server" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="ID" PagerStyle-CssClass="pgr">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="N° Operacion">
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Nombre" HeaderText="Articulo">
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Deposito" HeaderText="Deposito">
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Actividad" HeaderText="Actividad">
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad">
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Fecha_Registro" HeaderText="Fecha Realizado">
            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
        </Columns>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
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
      function openModal3() {
          $('#ModalMin_Stock').modal('show');
      }
      function closeModal3() {
          $('#ModalMin_Stock').modal('hide');
      }
      function openModal4() {
          $('#ModalHistorial').modal('show');
      }
      function closeModal4() {
          $('#ModalHistorial').modal('hide');
      }
  </script>

</asp:Content>
