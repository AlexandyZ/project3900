<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="package_track.aspx.cs" Inherits="key_addnew" %>

<asp:Content ContentPlaceHolderId="banner" runat="server">
    <!-- banner -->
    <div class="banner">
        <h1>PACKAGE TRACKING</h1>
    </div>
    <!-- /banner -->
</asp:Content>

<asp:Content ContentPlaceHolderId="content" runat="server">

    <!-- content -->   
    <section class="content">
        <!-- #sidemenu -->
        <aside class="menu">
            <ul>
                <li><a href="package_pickup.aspx">Package Pickup</a></li>
                <li><a href="package_track.aspx">Package Tracking</a></li>
                <li><a href="package_report.aspx">Package Report</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div class="primary">
            <div class="main">
                <br />
                <br />
                <asp:Label ID="First" runat="server" Text="First name "></asp:Label><asp:TextBox ID="firstname" runat="server" Width="100px"></asp:TextBox>
                <asp:Label ID="Last" runat="server" Text="Last name "></asp:Label><asp:TextBox ID="lastname" runat="server" Width="100px"></asp:TextBox>
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
                <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" /><asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" />
             </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content --> 
</asp:Content>
