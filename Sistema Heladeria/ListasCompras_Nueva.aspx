<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListasCompras_Nueva.aspx.cs" Inherits="Sistema_Heladeria.ListasCompras_Nueva" EnableSessionState="True" EnableEventValidation="False" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>

    </p>
    <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
        Numero de Orden a Crear:&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Nro_ord_lb" runat="server"></asp:Label>
    </p>
    <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
        Fecha de Creacion :&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Fecha_Creacion_lb" runat="server"></asp:Label>
    </p>
    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
        <ContentTemplate>
    <table class="nav-justified" border="0" style="border: 3px solid #CCCCCC; padding: 0px; clip: rect(0px, 0px, 0px, 0px);">
        <tr>
            <td class="modal-lg" style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; width: 586px; height: 36px;">Detalles del Proveedor :&nbsp;&nbsp;&nbsp;<asp:Button ID="PopUp_Prov_bt" runat="server" Text="Seleccionar Proveedor" CssClass="btn btn-default" OnClick="PopUp_Prov_bt_Click"/>
            </td>
            <td style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; height: 36px;">Detalles de Entrega:&nbsp;&nbsp;&nbsp;<asp:Button ID="PopUp_Depos_bt" runat="server" CssClass="btn btn-default" OnClick="PopUp_Depos_bt_Click" Text="Seleccionar Deposito" />
            </td>
        </tr>
        <tr>
            <td class="modal-lg" style="width: 586px; font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Numero Proveedor:
                <asp:Label ID="Prov_ID_lb" runat="server" style="font-size: 20px" Text="ID"></asp:Label>
                <br />
                Nombre :&nbsp;&nbsp; <asp:Label ID="Prov_nom_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000; height: 56px;">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-lg" style="width: 586px; font-family: Arial; font-size: 16px; font-style: inherit; color: #000000; height: 28px;">Telefono:&nbsp;&nbsp;<asp:Label ID="Telf_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Numero de Deposito:
                <asp:Label ID="Deposit_ID_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="modal-lg" style="width: 586px; font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Direccion:&nbsp;&nbsp;<asp:Label ID="Direc_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Nombre:&nbsp; <asp:Label ID="Deposit_nom_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="modal-lg" style="width: 586px; font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Correo:&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="Correo_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Ubicacion:&nbsp; <asp:Label ID="Deposit_Ubic_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
        </tr>
    </table>
                    </ContentTemplate>
    </asp:UpdatePanel>
    <p style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000;">
        Articulos solicitados:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Pop_Art_bt" runat="server" Text="Agregar Articulo" CssClass="btn btn-default" OnClick="Pop_Art_bt_Click" />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
        <center>
            <asp:GridView ID="Lista_Art_Ord" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="1235px">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Categoria" HeaderText="Categoria" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Quitar_art" runat="server" OnClick="Quitar_art_Click" Text="Quitar" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
        </center>
                            </ContentTemplate>
        </asp:UpdatePanel>
    &nbsp;</p>
    <p>
        <%--aasasdasasadsads--%>
                          
        <%-- aca deberia empesar el asp:UpdatePanel y el contentemplate, pero solo los nesesitaria para aquellos que nesesito para editar --%>    
    
    </p>
    
    <%--ass--%><%-- Inicia el popup Proveedores--%>
    <div id="ModalProv" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Seleccionar Proveedor<asp:Label ID="label55" runat="server" Text="Label" Visible="False"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%><%-- aca deberia empesar el asp:UpdatePanel y el contentemplate, pero solo los nesesitaria para aquellos que nesesito para editar --%>
          <asp:UpdatePanel ID="UpdatePanel3" runat="server">
              <ContentTemplate>
                        <asp:TextBox ID="Buscador_prov" runat="server" Width="257px" style="font-size: 15pt" Height="27px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Buscar_prov_btn" CssClass="btn btn-primary" runat="server"  Text="Buscar" OnClick="Buscar_prov_btn_Click" />
        <center>
            <asp:GridView ID="Lista_Proveedores" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" >
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
                        <asp:Button ID="Selecc_Prov_btn" runat="server" OnClick="Selecc_Prov_btn_Click" Text="Seleccionar" CssClass="btn btn-primary" />
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
    <%-- Inicia el popup Depositos--%>
    <div id="ModalDep" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Seleccionar Deposito<asp:Label ID="label1" runat="server" Text="Label" Visible="False"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>
          <%-- aca deberia empesar el asp:UpdatePanel y el contentemplate, pero solo los nesesitaria para aquellos que nesesito para editar --%>
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
          <asp:TextBox ID="Buscador_art" runat="server" Width="257px" style="font-size: 15pt" Height="27px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Buscar_art_btn" CssClass="btn btn-primary" runat="server" OnClick="Buscar_art_btn_Click" Text="Buscar" />
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
        <table id="Tabla_cat1" style="width: 23%; height: 212px;">
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
                Cantidad Solicitada:</td>
            <td style="height: 66px; width: 646px">
                <asp:TextBox ID="Cantidad_tx" runat="server" Height="22px" style="font-size: 15pt" TextMode="Number" Width="78px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <center><asp:Button ID="Art_Agregar_btn" CssClass="btn btn-primary" runat="server" Text="Guardar Cambios" OnClick="Art_Agregar_btn_Click"/></center>
            &nbsp;<center><asp:Button ID="Art_Cancelar_byn" CssClass="btn btn-danger" Visible="false" runat="server" Text="Cancelar" OnClick="Art_elin_byn_Click" /></center>
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
      function openModalProv() {
          $('#ModalProv').modal('show');
      }
      function closeModalProv() {
          $('#ModalProv').modal('hide');
      }
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
    
</asp:Content>
