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
            <h1>GAME RETURN</h1>
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
                <div id="main">
                    <!-- #search bar -->
                    <div id="searchbar">
                        <input type="text" runat="server" id="searchText" />
                        <input type="submit" runat="server" id="searchBtn" value="Search" onserverclick="SearchBtn_Click" />
                    </div>
                    <!-- /#search bar -->

                    <asp:GridView ID="GameReturn" runat="server"
                        AutoGenerateColumns="False"
                        AllowSorting="True"
                        OnSelectedIndexChanged="GameReturn_SelectedIndexChanged"
                        OnRowDataBound="GameReturn_RowDataBound"
                        OnRowCommand="Return_RowCommand"
                        DataKeyNames="game_id">
                        <Columns>
                            <asp:BoundField DataField="student_id" HeaderText="Student ID" ReadOnly="True" SortExpression="student_id" />
                            <asp:BoundField DataField="std_name" HeaderText="Student Name" SortExpression="std_name" ReadOnly="True" />
                            <asp:BoundField DataField="game_name" HeaderText="Game Name" SortExpression="game_name" ReadOnly="True" />
                            <asp:BoundField DataField="game_qty" HeaderText="QTY" SortExpression="game_qty" />
                            <asp:BoundField DataField="glend_date" HeaderText="SignOut Date" SortExpression="glend_date" ReadOnly="True" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:ButtonField ButtonType="Button" Text="Return" CommandName="Select" />
                        </Columns>
                    </asp:GridView>
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
