<%@ Page Language="C#" AutoEventWireup="true" CodeFile="key_newcomp.aspx.cs" Inherits="key_addnew" %>

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
        <h1>ADD NEW COMPANY</h1>
    </div>
    <!-- /banner -->

    <!-- content -->   
    <section id="content">
        <!-- #sidemenu -->
        <aside id="menu">
            <ul>
                <li><a href="key_overview.aspx">Overview</a></li>
                <li><a href="key_signout.aspx">Sign Out</a></li>
                <li><a href="key_newcomp.aspx">Add Company</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div id="primary">
           
            <div id="main">
            <div id="addcomp">

                <strong>New Company</strong><br />
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>

            &nbsp;<asp:TextBox ID="compname" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>

                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Phone"></asp:Label>

            &nbsp;<asp:TextBox ID="compphone" runat="server"></asp:TextBox>

                <br />
                <br />
                <asp:Button ID="Add_comp" runat="server" OnClick="Button1_Click" Text="Add" />
&nbsp;<asp:Button ID="Cancel_comp" runat="server" Text="Cancel" />

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