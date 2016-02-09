﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HRM system</title>
    <link rel="stylesheet" href="/Styles/main.css" />
</head>

<body>
    <form id="form1" runat="server">

    <!-- header -->
    <header>
        <!-- #shortcut -->
        <div id="username"> 
            <ul>
                <li><asp:Label ID="display_username" runat="server" Text="username"></asp:Label></li>
                <li>Login</li>
           </ul>
        </div>
        <!-- /#shortcut -->

        <!-- #bcitlogo -->
        <div id="bcitlogo">
            <img src="/Images/BCITlogo.svg" alt="BCIT logo" />
            <h1 id="sys_name">BCIT HRM DATABASE SYSTEM</h1>
        </div>
        <!-- /#bcitlogo -->

        <!-- #navbar -->
        <nav id="rshift_navbar">            
            <div id="navbar">
                
            </div>
        </nav>
        <!-- /#navbar -->
    </header>
    <!-- /header -->

    <!-- banner -->
    <div id="banner">
        <h1>SYSTEM LOGIN</h1>
    </div>
    <!-- /banner -->
 
        <asp:Image ID="logo" runat="server" Height="151px" />
        <h1 class="">resource</h1>

    <!-- content -->   
    <section id="content">
        <div id="login">
            <span>abc</span>
    </div>
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

