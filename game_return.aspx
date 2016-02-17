<%@ Page Language="C#" AutoEventWireup="true" CodeFile="game_return.aspx.cs" Inherits="game_return" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HRM system</title>
    <link rel="stylesheet" href="/Styles/main.css" />
    <link rel="stylesheet" href="/Styles/game.css" />
</head>

<body>
    <form id="form1" runat="server">

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
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="package_overview.aspx">PACKAGES</asp:HyperLink>
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
        <h1>RETURN GAMES</h1>
    </div>
    <!-- /banner -->

    <!-- content -->   
    <section id="content">
        <!-- #sidemenu -->
        <aside id="menu">
            <ul>
                <li><a href="game_overview.aspx">Overview</a></li>
                <li><a href="game_return.aspx">Return</a></li>
                <li><a href="game_signout.aspx">Sign Out</a></li>
                <li><a href="game_manage.aspx">Add & Delete</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div id="primary">
            <div id="main">
                <div id="searchbar">
                    <asp:TextBox ID="searchText" runat="server" ToolTip="Enter game name" ></asp:TextBox>
                    <asp:Button ID="searchButton" runat="server" OnServerClick="searchButton_Click" Text="Search" />
                </div>
                <asp:gridview ID ="GameSearch" runat="server" AutoGenerateColumns ="False" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="std_name" HeaderText="Student" ReadOnly="True" SortExpression="Column1" />
                        <asp:BoundField DataField="game_name" HeaderText="Game" ReadOnly="True" SortExpression="Column2" />
                        <asp:BoundField DataField="glend_date" HeaderText="Sign-out" SortExpression="glend_date" />
                        <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Return" ShowHeader="True" Text="Return" />
                    </Columns>
                </asp:gridview>
            </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content --> 

    </form>
    <!-- footer -->
    <footer>
        <div id="copyright">
            <p>&copy;2016    BCIT Housing</p>
        </div>
    </footer>
    <!-- /footer -->
</body>
</html>
