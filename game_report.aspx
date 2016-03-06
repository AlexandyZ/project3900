<%@ Page Language="C#" AutoEventWireup="true" CodeFile="game_report.aspx.cs" Inherits="game_report" %>

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
            <p>SIGNOUT</p>
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
        <h1>GAME REPORT</h1>
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
                    <div id="view_game">
                        <asp:GridView ID="GameGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceGame" >
                            <Columns>
                                <asp:BoundField DataField="game_record" HeaderText="game_record" SortExpression="game_record" InsertVisible="False" ReadOnly="True" />
                                <asp:BoundField DataField="std_id" HeaderText="std_id" SortExpression="std_id" />
                                <asp:BoundField DataField="game_id" HeaderText="game_id" SortExpression="game_id" />
                                <asp:BoundField DataField="glend_date" HeaderText="glend_date" SortExpression="glend_date" />
                                <asp:BoundField DataField="greturn_date" HeaderText="greturn_date" SortExpression="greturn_date" />
                                <asp:BoundField DataField="game_qty" HeaderText="game_qty" SortExpression="game_qty" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceGame" runat="server" ConnectionString="<%$ ConnectionStrings:RMSConnection %>" SelectCommand="SELECT * FROM [lend_game]"></asp:SqlDataSource>
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
