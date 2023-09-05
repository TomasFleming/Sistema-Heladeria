<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListasCompras_Ver.aspx.cs" Inherits="Sistema_Heladeria.ListasCompras_Ver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center><p style="font-size: 40px; font-weight: bold; color:#0094ff;font-family: Arial, sans-serif;">Listas De Ordenes de Compra</p></center>
    <div class="row">
    <div class="col-md-4"> <!-- Columna para el textbox -->
        <asp:TextBox ID="Buscador_Ord" runat="server" class="form-control" placeholder="Insertar COD lista" style="width: 350px"></asp:TextBox>
    </div>
    <div class="col-md-4"> <!-- Columna para los botones -->
         <asp:Button ID="Buscar_Ord_btn" CssClass="btn btn-primary" runat="server" OnClick="Buscar_Ord_btn_Click" Text="Buscar" />
         <asp:Button ID="Agregar_Ord_btn" CssClass="btn btn-default" runat="server" Text="Crear Orden de Compra" OnClick="Agregar_Ord_btn_Click" PostBackUrl="~/ListasCompras_Nueva.aspx" />
    </div>
</div>

    <p>
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       
        &nbsp;&nbsp;&nbsp;
       
    </p>
    <p>
        <center>
            <asp:GridView ID="Lista_Ordenes_Compra" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="1235px">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                <Columns>
                <asp:BoundField DataField="ID" HeaderText="COD" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="NombreCompleto" HeaderText="Proveedor" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="ID_Deposito" HeaderText="Deposito" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Estado" HeaderText="Estado" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                <asp:BoundField DataField="Fecha_Creacion" HeaderText="Fecha Creado" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Fecha_Entrega" HeaderText="Fecha Entrega" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Ver_Detalle_btn" runat="server" OnClick="Ver_Detalle_btn_Click" Text="Ver Detalle" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <center>
                        <asp:Button ID="Aprobar_Popup_btn" runat="server" OnClick="Aprobar_Popup_btn_Click" Text="Aprobar Orden" CssClass="btn btn-primary" />
                    </center>
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
        </center>
        
    </p>
    <p>
        <%-- para el popup --%>


        <table class="nav-justified" border="0" style="border-width: 0px; border-color: #CCCCCC; padding: 0px; clip: rect(0px, 0px, 0px, 0px);">
        <tr>
            <td class="modal-lg" style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; width: 586px; height: 36px;">Detalles del Proveedor :&nbsp;&nbsp;&nbsp;</td>
            <td style="font-family: Arial; font-size: 20px; font-style: inherit; color: #000000; height: 36px;">Detalles de Entrega:&nbsp;&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-lg" style="width: 586px; font-family: Arial; font-size: 16px; font-style: inherit; color: #000000;">Numero Proveedor:
                <asp:Label ID="Prov_ID_lb" runat="server" style="font-size: 20px"></asp:Label>
                <br />
                Nombre :&nbsp;&nbsp; <asp:Label ID="Prov_nom_lb" runat="server" style="font-size: 20px"></asp:Label>
            </td>
            <td style="font-family: Arial; font-size: 16px; font-style: inherit; color: #000000; ">Fecha de Entrega:<strong><asp:TextBox ID="Fechar_ord_tx" runat="server" style="font-size: 13pt; font-weight: bold" TextMode="DateTime" Width="190px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="Fechar_ord_tx_CalendarExtender" runat="server" TargetControlID="Fechar_ord_tx" />
                </strong></td>
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
        
            <center style="width: 563px">
            <asp:Button ID="Aprobar_ord_btn" CssClass="btn btn-success" runat="server" Text="Aprobar Orden" OnClick="Aprobar_ord_btn_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Cancelar_btn" runat="server" CssClass="btn btn-danger" OnClick="Cancelar_btn_Click" Text="Cancelar" PostBackUrl="~/Depositos.aspx" />
        </center>
        <%-- para el popup --%>
    </p>
    

        <%-- Inicia el popup --%>
    <div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <center><h4 class="modal-title" style="font-family: 'Arial Black'; font-size: 24px; font-weight: bold; font-style: normal; font-variant: normal">Articulos de la Orden N°<asp:Label ID="ID_Ord_lb" runat="server" Visible="True"></asp:Label></h4></center>
      </div>
      <div class="modal-body">
        <p></p><%--aasasdasasadsads--%>
          <%-- aca deberia empesar el asp:UpdatePanel y el contentemplate, pero solo los nesesitaria para aquellos que nesesito para editar --%>
          
                <center>
                          <asp:GridView ID="Lista_Detalle" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
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
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" >
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
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
    
</asp:Content>
