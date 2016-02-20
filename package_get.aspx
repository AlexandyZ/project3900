<%@ Page Language="C#" AutoEventWireup="true" CodeFile="package_get.aspx.cs" Inherits="key_addnew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HRM system</title>
    <link rel="stylesheet" href="/Styles/main.css" />
</head>

<body>

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
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="game_overview.aspx" >GAMES</asp:HyperLink>
                    </li>
                    <li id="nav_package" class="r_nav">
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="package_overview.aspx" >PACKAGES</asp:HyperLink>
                    </li>
                    <li id="nav_import" class="r_nav">
                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="import.aspx" >IMPORT</asp:HyperLink>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- /#navbar -->
    </header>
    <!-- /header -->

    <!-- banner -->
    <div id="banner">
        <h1>PACKAGES TRACKING</h1>
    </div>
    <!-- /banner -->

    <!-- content -->   
    <section id="content">
        <!-- #sidemenu -->
        <aside id="menu">
            <ul>
                <li><a href="package_get.aspx">Package Tracking</a></li>
                <li><a href="package_pickup.aspx">Package Pickup</a></li>
                <li><a href="package_report.aspx">Package Report</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div id="primary">
            <div id="main">
                <form id="form1" runat="server" method="post">
                <br />
                <br />
                <asp:Label ID="First" runat="server" Text="First name "></asp:Label><asp:TextBox ID="firstname" runat="server"></asp:TextBox>
                <asp:Label ID="Last" runat="server" Text="Last name "></asp:Label><asp:TextBox ID="lastname" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="HouseL" runat="server" Text="House "></asp:Label><asp:DropDownList ID="HouseD" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourcehouse" DataTextField="house_name" DataValueField="house_id" AppendDataBoundItems="True"><asp:ListItem Text="" Value="" /></asp:DropDownList>
                <asp:Label ID="RoomL" runat="server" Text="Room No. "></asp:Label><asp:DropDownList ID="RoomID" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceroom" DataTextField="room_name" DataValueField="room_id" OnSelectedIndexChanged="RoomID_SelectedIndexChanged"><asp:ListItem Text="" Value="" /></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourcehouse" runat="server" ConnectionString="<%$ ConnectionStrings:RMSConnection %>" SelectCommand="SELECT [house_name], [house_id] FROM [house]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceroom" runat="server" ConnectionString="<%$ ConnectionStrings:RMSConnection %>" SelectCommand="SELECT [room_name], [room_id] FROM [room] WHERE ([house_id] = @house_id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="HouseD" Name="house_id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <asp:Label ID="PhoneL" runat="server" Text="Phone "></asp:Label><asp:TextBox ID="Phone" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="EmailL" runat="server" Text="Email "></asp:Label><asp:TextBox ID="Email" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="DataL" runat="server" Text="Delivery Date "></asp:Label><asp:TextBox ID="DelDate" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="..." />
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="Calendar1_SelectionChanged">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
                <br />
                <br />
                <asp:Label ID="DesL" runat="server" Text="Description "></asp:Label>
                <br />
                <asp:TextBox ID="Des" runat="server" Font-Strikeout="False" TextMode="MultiLine" Height="223px" Width="324px"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" /><asp:Button ID="Cancel" runat="server" Text="Cancel" />
              </form>
             </div>
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
