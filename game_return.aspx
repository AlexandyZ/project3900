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
                    <li>
                        <asp:Label ID="display_username" runat="server" Text="username"></asp:Label></li>
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
            <h1>RETURN GAMES</h1>
        </div>
        <!-- /banner -->

        <!-- content -->
        <section id="content">
            <!-- #sidemenu -->
            <aside id="menu">
                <ul>
                    <li><a href="game_overview.aspx">Game Overview</a></li>
                    <li><a href="game_return.aspx">Game Return</a></li>
                    <li><a href="game_manage.aspx">Game Add & Delete</a></li>
                    <li><a href="game_report.aspx">Game Report</a></li>
                </ul>
            </aside>
            <!-- /#sidemenu -->
            <!-- #primary -->
            <div id="primary">
                <div id="main">
                    <div id="searchbar">
                        <asp:TextBox ID="searchText" runat="server" ToolTip="Enter game name"></asp:TextBox>
                        <asp:Button ID="searchButton" runat="server" OnServerClick="searchButton_Click" Text="Search" />
                    </div>
                    <asp:GridView ID="GameSearch" runat="server" AutoGenerateColumns="False" AllowSorting="True" OnSelectedIndexChanged="GameSearch_SelectedIndexChanged" DataSourceID="SqlGameReturn" OnRowDataBound="GameGridView_RowDataBound" OnRowCommand="Signout_RowCommand" DataKeyNames="game_id">
                        <Columns>
                            <asp:BoundField DataField="Column1" HeaderText="Student ID" ReadOnly="True" SortExpression="Column1" />
                            <asp:BoundField DataField="Column2" HeaderText="Student Name" ReadOnly="True" SortExpression="Column2" />
                            <asp:BoundField DataField="Column3" HeaderText="Game Name" SortExpression="Column3" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="lend_qty" HeaderText="Lend QTY" SortExpression="lend_qty" />
                            <asp:BoundField DataField="glend_date" HeaderText="Sign Out Date" SortExpression="glend_date" DataFormatString="{0:d}" />
                            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Return" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlGameReturn" runat="server" ConnectionString="<%$ ConnectionStrings:RMSConnection %>" SelectCommand="select (select student_id from student s where s.std_id = lg.std_id), (select student_fname + ' ' + student_lname from student s where s.std_id = lg.std_id), (select game_name from game g where g.game_id = lg.game_id), lend_qty, glend_date from lend_game lg"></asp:SqlDataSource>
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
