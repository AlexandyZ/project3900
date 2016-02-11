<%@ Page Language="C#" AutoEventWireup="true" CodeFile="key_signout.aspx.cs" Inherits="key_lend" %>

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
                <li>Login</li>
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
        <h1>SIGN OUT KEYS</h1>
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
            <div id="form">


                <asp:Label ID="fn" runat="server" Text="First Name"></asp:Label>


                <asp:TextBox ID="fnfield" runat="server" Width="177px"></asp:TextBox>

                 <asp:Label ID="ln" runat="server" Text="Last Name"></asp:Label>


                <asp:TextBox ID="lnfield" runat="server" Width="177px"></asp:TextBox>

                <br />
                <br />
                <asp:Label ID="Company" runat="server" Text="Company"></asp:Label>



                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="companyname" DataTextField="comp_name" DataValueField="comp_id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1">
                </asp:DropDownList>



                <asp:SqlDataSource ID="companyname" runat="server" ConnectionString="<%$ ConnectionStrings:RMSConnectionString %>" SelectCommand="SELECT [comp_name], [comp_id] FROM [company]"></asp:SqlDataSource>



                <br />
                <br />
                Phone
                <asp:TextBox ID="phonefield" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>



                <br />
                <br />
                Key Name
                <asp:TextBox ID="keyfield" runat="server"></asp:TextBox>



                <asp:Button ID="addkey" runat="server" OnClick="Button1_Click" Text="+" />
                <asp:Button ID="deletekey" runat="server" OnClick="Button1_Click" Text="-" />



                <br />
                <br />
                <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click" />
                <asp:Button ID="cancel" runat="server" Text="Cancel" />



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
