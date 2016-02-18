<%@ Page Language="C#" AutoEventWireup="true" CodeFile="game_overview.aspx.cs" Inherits="game_overview" %>

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
        <h1>GAME OVERVIEW</h1>
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
            <form id="form1" runat="server">
            <div id="main">
                <div id="overview_game">
                    <asp:GridView ID="GameGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceGame" OnRowDataBound="GameGridView_RowDataBound" OnSelectedIndexChanged="GameGridView_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="game_name" HeaderText="Games" SortExpression="game_name" />
                            <asp:BoundField DataField="game_amount" HeaderText="Inventory" SortExpression="game_amount" />
                            <asp:ButtonField ButtonType="Button" CommandName="Click" Text="Sign-out" />
                        </Columns>
                        <HeaderStyle Font-Size="Large" />
                        <SortedDescendingCellStyle Font-Size="Medium" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceGame" runat="server" ConnectionString="<%$ ConnectionStrings:RMSConnection %>" SelectCommand="SELECT [game_name], [game_amount] FROM [game] ORDER BY [game_name]"></asp:SqlDataSource>
                </div>
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
