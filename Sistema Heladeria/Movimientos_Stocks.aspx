﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Movimientos_Stocks.aspx.cs" Inherits="Sistema_Heladeria.Movimientos_Stocks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header class="jumbotron text-center">
     <h2><strong>Registro de Movimientos de Stock</strong></h2>
        <div class="header-right">
            <div class="date-time">
                <span id="currentDate"></span>
                <span id="currentTime"></span>
            </div>
        </div>
    </header>
<%--    <center><p style="font-size: 40px; color: #CC3300">Registro de Movimientos de Stock</p></center>--%>
    <p style="font-size: 22px">
        <asp:UpdatePanel ID="UpdatePanel5" runat="server"><ContentTemplate>
        Tipo de Movimiento a realizar :

        <asp:DropDownList ID="Lista_Mov" runat="server" Height="25px" Width="244px" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="ID" OnSelectedIndexChanged="Lista_Mov_SelectedIndexChanged">
        </asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Heladeria Sistemas 3ConnectionString %>" SelectCommand="SELECT [ID], [Nombre] FROM [Actividades] where Estado !='Desactivado'"></asp:SqlDataSource>
            </ContentTemplate></asp:UpdatePanel>
    </p>
    <p style="font-size: 22px">
        
        Depósito en el que se realizaran los Movimientos: <asp:Button ID="PopUp_Depos_bt" runat="server" CssClass="btn btn-default" OnClick="PopUp_Depos_bt_Click" Text="Seleccionar Depósito" />

        </p>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
    <table class="nav-justified" border="0" style="border-color: #CCCCCC; padding: 0px; clip: rect(0px, 0px, 0px, 0px); width: 29%;">
        <tr>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000; height: 28px;">Número de Depósito:
                <asp:Label ID="Deposit_ID_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Nombre:&nbsp; <asp:Label ID="Deposit_nom_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Ubicación:&nbsp; <asp:Label ID="Deposit_Ubic_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
        </tr>
    </table>
                    </ContentTemplate>
    </asp:UpdatePanel>
    <p style="font-size: 22px">
        Movimiento a realizar: 
        <asp:Button ID="Pop_Art_bt" runat="server" Text="Agregar Artículo" CssClass="btn btn-default" OnClick="Pop_Art_bt_Click" />
        
    </p>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
        <center>
            <asp:GridView ID="Lista_Art_MOV" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDataBound="Lista_Movs_RowDataBound"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="1235px">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Categoria" HeaderText="Categoría" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <%--<asp:BoundField DataField="Movimiento" HeaderText="Movimiento" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>--%>
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Quitar_Mov" runat="server" OnClick="Quitar_Mov_Click" Text="Quitar" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
        </center>
                            </ContentTemplate>
        </asp:UpdatePanel>
    <p>
        <center>
            <asp:Button ID="Guardar_Ops_btn" CssClass="btn btn-success" runat="server" Text="Realizar Operaciones" OnClick="Guardar_Ops_btn_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Cancelar_Ops_btn" runat="server" CssClass="btn btn-danger" OnClick="Cancelar_Ops_btn_Click" Text="Cancelar Operaciones" />
        </center>
    </p>

    <div id="ModalDep" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Seleccionar Deposito<asp:Label ID="label1" runat="server" Text="Label" Visible="False"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p><%-- Inicia el popup Agregar el Deposito--%>          <%--ass--%>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
          <asp:TextBox ID="Buscador_dep" runat="server" Width="257px" style="font-size: 15pt" Height="27px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Buscar_dep_btn" CssClass="btn btn-primary" runat="server"  Text="Buscar" OnClick="Buscar_dep_btn_Click" />

                     <center>
                         <asp:GridView ID="Lista_Depositos" runat="server" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="ID" PagerStyle-CssClass="pgr">
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
                                  <asp:Button ID="Select_Dept_btn" runat="server" CssClass="btn btn-primary" OnClick="Select_Dept_btn_Click" Text="Seleccionar" />
                    </center>
                </ItemTemplate>
            </asp:TemplateField>
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
   
    <%--ass--%><%-- Inicia el popup Agregar el Articulo--%>
    <div id="ModalSelectArt" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
        <asp:UpdatePanel ID="UpdatePanel7" runat="server">
            <ContentTemplate>


      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Articulo N°<asp:Label ID="ID_Art_sel_lb" runat="server" Visible="True"></asp:Label> :</h4></center>
      </div></ContentTemplate>
        </asp:UpdatePanel>
      <div class="modal-body">
        <p></p>
          
          <asp:UpdatePanel ID="UpdatePanel6" runat="server">
              <ContentTemplate>
                  <center>
        

    <table id="Tabla_cat1" style="width: 27%; height: 212px;">
        <tr>
            <td style="width: 116px; height: 36px; font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                ID:</td>
            <td style="height: 36px; width: 646px">
                   <asp:TextBox ID="ID_art_tx" runat="server" ReadOnly="false"></asp:TextBox>
                   <asp:Button ID="Cargar_Art_btn" runat="server" OnClick="Cargar_Art_btn_Click" CssClass="btn btn-default" Text="Cargar" />
                <asp:Button ID="Buscar_btn" runat="server" CssClass="btn btn-primary" OnClick="Buscar_btn_Click" Text="Buscar" />
            </td>
        </tr>
        <tr>
            <td style="width: 116px; height: 36px; font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                Nombre:</td>
            <td style="height: 36px; width: 646px">
                   <asp:TextBox ID="Nomb_art_lb" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 36px; width: 116px; font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                Categoria:</td>
            <td style="height: 28px; width: 646px">
                <asp:TextBox ID="Cat_art_lb" runat="server"  ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        
        <tr>
            <td style="width: 116px; height: 36px; font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                Descripcion:</td>
            <td style="height: 28px; width: 646px">
                <asp:TextBox ID="Desc_art_lb" runat="server"  ReadOnly="True" TextMode="MultiLine"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td style="width: 116px; height: 36px; font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                Movimiento:</td>
            <td style="height: 28px; width: 646px">
                <%--<asp:DropDownList ID="Lista_Mov" runat="server" Height="19px" Width="130px">
            <asp:ListItem>Agregar</asp:ListItem>
            <asp:ListItem>Retirar</asp:ListItem>
        </asp:DropDownList>--%>

        </tr>
        <tr>
            <td style="width: 116px; height: 36px; font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
                Cantidad Movida:</td>
            <td style="height: 66px; width: 646px">
                <asp:TextBox ID="Cantidad_tx" runat="server" Height="22px" style="font-size: 15pt" TextMode="Number" Width="78px"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Debe ser un valor superior a 0" ControlToValidate="Cantidad_tx" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
                <asp:Label runat="server" ID="Cant_alert_lb" Visible="false" Text="La cantidad es mayor que el stock disponible" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <center><asp:Button ID="Art_Agregar_btn" CssClass="btn btn-primary" runat="server" Text="Guardar Operacion" OnClick="Art_Agregar_btn_Click"/>
            &nbsp;<asp:Button ID="Art_Cancelar_byn" CssClass="btn btn-danger" Visible="True" runat="server" Text="Cancelar" OnClick="Art_Cancelar_byn_Click" /></center>
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

     <%-- Inicia el popup Articulos--%>
    <div id="ModalArt" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Seleccionar Articulo<asp:Label ID="label2" runat="server" Text="Label" Visible="False"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>
          <%-- aca deberia empesar el asp:UpdatePanel y el contentemplate, pero solo los nesesitaria para aquellos que nesesito para editar --%>
          <asp:UpdatePanel ID="UpdatePanel4" runat="server">
              <ContentTemplate>
                  <center><div class="row">
                      <div class="col-md-3"> <!-- Columna para que quede bien centrado -->
                      </div>
    <div class="col-md-4"> <!-- Columna para el textbox -->
         <asp:TextBox ID="Buscador_art" runat="server" class="form-control" placeholder="Buscador" style="width: 250px"></asp:TextBox>
    </div>
    <div class="col-md-4"> <!-- Columna para los botones -->
        <asp:Button ID="Buscar_art_btn" CssClass="btn btn-primary" runat="server" OnClick="Buscar_art_btn_Click" Text="Buscar" />
    </div>
</div></center><p></p>
         <%-- <asp:TextBox ID="Buscador_art" runat="server" Width="257px" style="font-size: 15pt" Height="27px"></asp:TextBox>--%>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <%--<asp:Button ID="Buscar_art_btn" CssClass="btn btn-primary" runat="server" OnClick="Buscar_art_btn_Click" Text="Buscar" />--%>
        <center>
            <asp:GridView ID="Lista_Articulos" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
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
      function openModalDep() {
          $('#ModalDep').modal('show');
      }
      function closeModalDep() {
          $('#ModalDep').modal('hide');
      } function openModalArt() {
          $('#ModalArt').modal('show');
      }
      function closeModalSelArt() {
          $('#ModalSelectArt').modal('hide');
      }
      function openModalSelArt() {
          $('#ModalSelectArt').modal('show');
      }
      function closeModalArt() {
          $('#ModalArt').modal('hide');
      }

  </script>
  
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
