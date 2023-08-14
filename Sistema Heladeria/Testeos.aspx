<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Testeos.aspx.cs" Inherits="Sistema_Heladeria.Testeos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <a href="~/Inicio" runat="server">
        <div class="image-button-container">
            <img src="Imagenes/deposito.png" alt="Imagen">
        </div>
            <asp:Label ID="Label1" runat="server" Text="Deposistos" CssClass="BtsImg"></asp:Label>
        </a>
    </center>
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

</asp:Content>
