<%@ Page Language="C#" AutoEventWireup="true" CodeFile="game_signout.aspx.cs" Inherits="game_signout" %>

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
        <h1>SIGN OUT GAMES</h1>
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
                <h1><asp:Label ID="gamename" runat="server" Text="game name"></asp:Label></h1>
                <asp:Label ID="fname" CLASS="info" runat="server" Text="First name"></asp:Label>
                <asp:TextBox ID="fnameText" Class="infoBox" runat="server"></asp:TextBox>
                <asp:Label ID="lname" CLASS="info" runat="server" Text="Last name"></asp:Label>
                <asp:TextBox ID="lnameText" Class="infoBox" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="stdid" CLASS="info" runat="server" Text="Student ID"></asp:Label>
                <asp:TextBox ID="stdidText" Class="infoBox" runat="server" OnTextChanged="stdidText_TextChanged"></asp:TextBox>
                <br />
                <asp:Label ID="house" CLASS="info" runat="server" Text="House"></asp:Label>
                <asp:DropDownList ID="houseDropdown" runat="server" DataSourceID="SqlDataSource" DataTextField="house_name" DataValueField="house_id" AutoPostBack="True"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RMSConnection %>" SelectCommand="SELECT [house_id], [house_name] FROM [house]" OnSelecting="SqlDataSource_Selecting"></asp:SqlDataSource>
                <asp:Label ID="room" CLASS="info" runat="server" Text="Room"></asp:Label>
                <asp:DropDownList ID="roomDropdown" runat="server"></asp:DropDownList>
                <br />
                <asp:Label ID="phone" CLASS="info" runat="server" Text="Phone"></asp:Label>
                <asp:TextBox ID="phoneText" Class="infoBox" runat="server"></asp:TextBox>
                <asp:Label ID="amount" CLASS="info" runat="server" Text="Amount"></asp:Label>
                <asp:TextBox ID="amountNum" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="submit" runat="server" OnClick="Submit_Click" Text="Submit" />
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
