﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="game_signout.aspx.cs" Inherits="game_signout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HRM system</title>
    <link rel="stylesheet" href="/Styles/main.css" />
    <link rel="stylesheet" href="/Styles/game.css" />
</head>

<body>
    
    <!-- header -->
    <header>
        <!-- #shortcut -->
        <div id="show_username"> 
            <ul>
                <li><asp:Label ID="display_username" runat="server" Text="username"></asp:Label></li>
                <li>SIGNOUT</li>
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
                <ul>
                    <li id="nav_key" class="r_nav">
                        <a href="key_overview.aspx">KEYS</a>
                    </li>
                    <li id="nav_game" class="r_nav">
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="game_overview.aspx">GAMES</asp:HyperLink>
                    </li>
                    <li id="nav_package" class="r_nav">
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="package_pickup.aspx">PACKAGES</asp:HyperLink>
                    </li>
                    <li id="nav_import" class="r_nav">
                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="import.aspx">IMPORT</asp:HyperLink>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- /#navbar -->
    </header>
    <!-- /header -->

    <!-- banner -->
    <div id="banner">
        <h1>SIGN OUT GAMES</h1>
    </div>
    <!-- /banner -->

    <!-- content -->   
    <section id="content">
        <!-- #sidemenu -->
        <aside id="menu">
            <ul>
                <li><a href="game_overview.aspx">Game Overview</a></li>
                <li><a href="game_return.aspx">Game Return</a></li>
                <li><a href="game_manage.aspx">Game Management</a></li>
                <li><a href="game_report.aspx">Game Report</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div id="primary">
            <form id="form1" runat="server">
            <div id="main">
                <h1><asp:Label ID="gamename" runat="server" Text="game name"></asp:Label></h1>
                <table id="gameout">
                    <tr>
                        <td>                
                            <asp:Label ID="fname" CLASS="info" runat="server" Text="First name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="fnameText" Class="infoBox" runat="server" AutoCompleteType="FirstName"></asp:TextBox>
                        </td>
                        <td> 
                            <asp:Label ID="lname" CLASS="info" runat="server" Text="Last name"></asp:Label>
                        </td>
                        <td>
                             <asp:TextBox ID="lnameText" Class="infoBox" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="stdid" CLASS="info" runat="server" Text="Student ID"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="stdidText" Class="infoBox" runat="server" ></asp:TextBox>
                             </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="amount" CLASS="info" runat="server" Text="QTY"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="amountNum" CLASS="infoBox" runat="server"></asp:TextBox>
                        </td>
                    </tr>            
                </table>
                <asp:Button ID="submit" class="submit" runat="server" OnClick="Submit_Click" Text="Submit" />
            </div>
            </form>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content --> 

    <!-- footer -->
    <footer>
        <div id="copyright">
            <p>&copy;2016    BCIT Housing</p>
        </div>
    </footer>
    <!-- /footer -->
</body>
</html>
