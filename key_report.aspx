<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeFile="key_report.aspx.cs" Inherits="key_report" %>

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
        <h1>KEY REPORT</h1>
    </div>
    <!-- /banner -->

    <!-- content -->   
    <section id="content">
        <!-- #sidemenu -->
        <aside id="menu">
              <ul>
                <li><a href="key_overview.aspx">Key Overview</a></li>
                <li><a href="key_signout.aspx">Key Sign Out</a></li>
                <li><a href="key_report.aspx">Key Report</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div id="primary">
            <div id="main">
            <div id="search_bar">
            <br />
                <br>
               <input type="text" runat="server" id="searchbar" />
        <input type="submit" runat="server" id="searchbtn" value="Search" onserverclick="SearchBtn_Click"/><br />
                <br>
        
        </div>
        <div id="result">
               <asp:gridview ID ="SearchResult"
        autogeneratecolumns ="FALSE"
        runat="server" >
        <Columns>
         <%--allowpaging ="TRUE"--%>
           
            <asp:BoundField DataField="KeyNumber" HeaderText="KeyNumber" />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" />
            <asp:BoundField DataField="Time_Out" HeaderText="Time_Out" />
            <asp:BoundField DataField="Time_in" HeaderText="Time_In" />
             <asp:BoundField DataField="Keyoutstanding" HeaderText="Status" />
        </Columns>
      </asp:gridview>
                <%--<asp:SqlDataSource ID="overviewkey" runat="server" ConnectionString="<%$ ConnectionStrings:RMSConnection %>" SelectCommand="select k.keys_name, w.worker_fname ,w.worker_lname, c.comp_phone, lk.keylend_date, lk.keyreturn_date, k.keyoutstanding as Status FROM lend_key as lk INNER JOIN keys as k ON lk.keys_id = k.keys_id INNER JOIN worker as w ON w.worker_id = lk.worker_id INNER JOIN company as c ON c.comp_id = w.comp_id "></asp:SqlDataSource>--%>
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
