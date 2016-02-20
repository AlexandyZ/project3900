<%@ Page Language="C#" AutoEventWireup="true" CodeFile="package_report.aspx.cs" Inherits="package_report" %>

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
            <p>logout</p>
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
        <h1>PACKAGE REPORT</h1>
    </div>
    <!-- /banner -->

    <!-- content -->   
    <section id="content">
        <!-- #sidemenu -->
        <aside id="menu">
            <ul>
                <li><a href="package_pickage.aspx">Package Pickup</a></li>
                <li><a href="package_get.aspx">Package Tracking</a></li>
                <li><a href="package_report.aspx">Package Report</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div id="primary">
            <div id="main" style ="height:500px; overflow:scroll">
               <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourcePackage" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                        <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
                        <asp:BoundField DataField="house" HeaderText="house" SortExpression="house" />
                        <asp:BoundField DataField="room" HeaderText="room" SortExpression="room" />
                        <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                        <asp:BoundField DataField="delivery_date" DataFormatString="{0:d}" HeaderText="delivery_date" SortExpression="delivery_date" />
                        <asp:BoundField DataField="pickup_date" DataFormatString="{0:d}" HeaderText="pickup_date" SortExpression="pickup_date" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourcePackage" runat="server" ConnectionString="<%$ ConnectionStrings:RMSConnection %>" SelectCommand="select s.student_fname as firstname, s.student_lname as lastname, h.house_name as house, r.room_name as room, p.description, p.delivery_date, p.pickup_date from student s inner join house h on s.house_id = h.house_id inner join room r on s.room_id = r.room_id inner join package p on s.std_id = p.std_id"></asp:SqlDataSource>
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
