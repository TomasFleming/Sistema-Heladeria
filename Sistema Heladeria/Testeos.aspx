<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Testeos.aspx.cs" Inherits="Sistema_Heladeria.Testeos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--<center>
        <a href="~/Inicio" runat="server">
        <div class="image-button-container">
            <img src="Imagenes/deposito.png" alt="Imagen">
        </div>
            <asp:Label ID="Label1" runat="server" Text="Deposistos" CssClass="BtsImg"></asp:Label>
        </a>
    </center>--%>
    <%--        <head>
    <title>Mi Página Web</title>
    <link rel="stylesheet" href="probar.css">
    <script src="script.js" defer></script>
</head>
<body>
    <nav>
        <button id="toggleMenu">Menú</button>
        <ul id="menuItems">
            <li><a href="#">Inicio</a></li>
            <li><a href="#">Acerca de</a></li>
            <li><a href="#">Contacto</a></li>
        </ul>
    </nav>

    <!-- Resto del contenido de la página -->
</body>
    <script type="text/javascript">
        const toggleButton = document.getElementById('toggleMenu');
        const menuItems = document.getElementById('menuItems');

        toggleButton.addEventListener('click', (event) => {
            event.preventDefault(); // Evitar la recarga de la página

            menuItems.classList.toggle('show');
        });
    </script>--%>
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
</asp:Content>
