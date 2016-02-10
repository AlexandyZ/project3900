<%@ Page Language="C#" AutoEventWireup="true" CodeFile="game_overview.aspx.cs" Inherits="game_overview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HRM system</title>
    <script src="jquery-1.8.2.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/Styles/main.css" />
    <script type="text/javascript">
        $(document).ready(function () {
            var searchText = $("#<%=searchText.ClientID%>");

            $("#searchText").focus(function () {
                if (searchText.val() == this.title) {
                    searchText.val("");

                    this.className = "text-focus";
                }
            });

            $("#searchText").blur(function () {

                if (searchText.val() == "") {
                    searchText.val(this.title);
                    this.className = "text";
                }
            });
            searchText.blur();
        });

    </script>
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
            <div id="main">
                <div id="searchbar">
                    &nbsp;
                    <asp:TextBox ID="searchText" runat="server" OnTextChanged="searchText_TextChanged" ToolTip="Enter game name"></asp:TextBox>
                    <asp:Button ID="searchButton" runat="server" OnClick="searchButton_Click" Text="Search" />
                </div>
                <div id="overview_game">
                    <asp:GridView ID="GameGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="game_overview" OnSelectedIndexChanged="GameGridView_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="game_name" HeaderText="Games" SortExpression="game_name" />
                            <asp:BoundField DataField="game_amount" HeaderText="Inventory" SortExpression="game_amount" />
                            <asp:TemplateField ShowHeader="false">
                                <Itemtemplate>
                                    <asp:Button ID="game_lend" runat="server" Text="Lend" />
                                </Itemtemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="game_overview" runat="server" ConnectionString="<%$ ConnectionStrings:RMSConnection %>" SelectCommand="SELECT [game_name], [game_amount] FROM [game]"></asp:SqlDataSource>
                </div>
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
