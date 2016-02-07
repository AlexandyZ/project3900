<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HRM system</title>
    <link rel="stylesheet" href="/Styles/main.css" />
</head>

<body>
    <form id="form2" runat="server">

    <!-- header -->
    <header>
        <!-- #shortcut -->
        <div id="username"> 
            <ul>
                <li><asp:Label ID="display_username" runat="server" Text="username"></asp:Label></li>
                <li>Logout</li>
           </ul>
        </div>
        <!-- /#shortcut -->

        <!-- #bcitlogo -->
        <div id="bcitlogo">
            <img src="/Images/BCITlogo.svg" alt="BCIT logo" />
            <h1 id="sys_name">BCIT HRM DATABASE SYSTEM</h1>
        </div>
        <!-- /#bcitlogo -->

    </header>
    <!-- /header -->

    <!-- banner -->
    <div id="banner">
        <h1>LOGIN</h1>
    </div>
    <!-- /banner -->

    <!-- content -->   
    <section id="content">
        <div id="login">
            <span>abc</span>
        </div>
    </section>
    <!-- /content --> 
        
    </form>
    <!-- footer -->
    <footer>
        <div id="copyright">
            <p>Copyright&copy;2016    BCIT Housing</p>
        </div>
    </footer>
    <!-- /footer -->
</body>
</html>