<%@ Page Language="C#" AutoEventWireup="true" CodeFile="key_overview.aspx.cs" Inherits="key_overview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RMS</title>
</head>

<body>
    <form id="form1" runat="server">

    <!-- header -->
    <header>
        <!-- #bcitlogo -->
        <h1 id="logo">
            <img src="../Images/BCITlogo.svg" alt="BCIT logo" style="height: 96px; width: 104px"/>
            BCIT housing
        </h1>
        <!-- /#bcitlogo -->

        <!-- #shortcut -->
        <div id="username"> 
            <ul>
                <li><asp:Label ID="display_username" runat="server" Text="username"></asp:Label></li>
                <li><asp:LoginStatus ID="LoginStatus" runat="server" OnLoggingOut="LoginStatus1_LoggingOut" /></li>
           </ul>
        </div>
        <!-- /#shortcut -->
        <!-- #navbar -->
        <nav class="rshift_navbar">            
            <div id="navbar">
                <ul>
                    <li class="nav_key">
                        <a href="key_overview.aspx">Key</a>
                    </li>
                    <li class="nav_game">
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="game_overview.aspx">Game</asp:HyperLink>
                    </li>
                    <li class="nav_package">
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="package_overview.aspx">Package</asp:HyperLink>
                    </li>
                    <li class="nav_import">
                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="import.aspx">Import</asp:HyperLink>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- /#navbar -->
    </header>
    <!-- /header -->

    <!-- banner -->
    <div id="banner">
        <h1>KEY</h1>
    </div>
    <!-- /banner -->

    <!-- content -->   
    <section id="content">
        <!-- #sidemenu -->
        <aside id="menu">
            <div id="sidemenu">
                <ul>
                    <li><a href="">item</a></li>
                    <li><a href="">item</a></li>
                    <li><a href="">item</a></li>
                </ul>
            </div>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div id="primary">
            <h1></h1>
            <div id="main">

            </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content --> 

    </form>
    <footer>
        <div>
            <small>Copyright&copy;2016    Maquinna Residenc</small>
        </div>
    </footer>
</body>
</html>
