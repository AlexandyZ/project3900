<%@ Page Language="C#" AutoEventWireup="true" CodeFile="key_overview.aspx.cs" Inherits="key_overview" %>

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
        <div id="show_username"> 
            <ul>
                <li><asp:Label ID="display_username" runat="server" Text="username"></asp:Label></li>
                <li>signout</li>
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
        <h1>KEY OVERVIEW</h1>
    </div>
    <!-- /banner -->

    <!-- content -->   
    <section id="content">
        <!-- #sidemenu -->
        <aside id="menu">
            <ul>
                <li><a href="key_overview.aspx">Overview</a></li>
                <li><a href="key_signout.aspx">Sign Out</a></li>
                <li><a href="key_addnew.aspx">Add Company</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div id="primary">
            <div id="main">
            <div id="searchbar">
                <asp:TextBox ID="searchbar_key" runat="server" Width="281px"></asp:TextBox>
<asp:Button ID="searchbutton" runat="server" OnClick="Button1_Click" Text="Search" />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
                <br />
                <br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="overviewkey">
                    <Columns>
                        <asp:BoundField DataField="keys_name" HeaderText="keys_name" SortExpression="keys_name" />
                        <asp:BoundField DataField="worker_fname" HeaderText="worker_fname" SortExpression="worker_fname" />
                        <asp:BoundField DataField="worker_lname" HeaderText="worker_lname" SortExpression="worker_lname" />
                        <asp:BoundField DataField="comp_phone" HeaderText="comp_phone" SortExpression="comp_phone" />
                        <asp:BoundField DataField="keylend_date" HeaderText="keylend_date" SortExpression="keylend_date" />
                        <asp:BoundField DataField="keyreturn_date" HeaderText="keyreturn_date" SortExpression="keyreturn_date" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="overviewkey" runat="server" ConnectionString="<%$ ConnectionStrings:RMSConnectionString %>" SelectCommand="select k.keys_name, w.worker_fname ,w.worker_lname, c.comp_phone, lk.keylend_date, lk.keyreturn_date, k.keyoutstanding as Status FROM lend_key as lk INNER JOIN keys as k ON lk.keys_id = k.keys_id INNER JOIN worker as w ON w.worker_id = lk.worker_id INNER JOIN company as c ON c.comp_id = w.comp_id "></asp:SqlDataSource>
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
