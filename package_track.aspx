<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="package_track.aspx.cs" Inherits="package_track" %>

<asp:Content ContentPlaceHolderID="banner" runat="server">
    <link rel="stylesheet" href="/Styles/game.css" />
    <!-- banner -->
    <div class="banner">
        <h1>PACKAGE TRACKING</h1>
    </div>
    <!-- /banner -->
</asp:Content>

<asp:Content ContentPlaceHolderID="content" runat="server">

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
                <table class="game_table">
                    <tr>
                        <td>
                            <asp:Label ID="First" runat="server" Text="First name "></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="firstname" runat="server" CssClass="infoBox"></asp:TextBox>
                            <span class="required">*</span>
                        </td>
                        <td colspan="2">
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="firstname" 
                                ValidationGroup="fieldrequired"
                                ErrorMessage="Firstname is required." 
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" 
                                ErrorMessage="Name must be characters and not more than 20" 
                                ControlToValidate="firstname"
                                ValidationGroup="fieldrequired" 
                                ValidationExpression="^[a-zA-Z'.\s]{1,20}$" CssClass="required" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Last" runat="server" Text="Last name "></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="lastname" runat="server" CssClass="infoBox"></asp:TextBox>
                            <span class="required">*</span>
                        </td>
                        <td colspan="2">
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="lastname" ValidationGroup="fieldrequired"
                                ErrorMessage="Lastname is required." 
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" 
                                ErrorMessage="Name must be characters and not more than 20" 
                                ControlToValidate="lastname"
                                ValidationGroup="fieldrequired" 
                                ValidationExpression="^[a-zA-Z'.\s]{1,20}$" CssClass="required" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="HouseL" runat="server" Text="House "></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="HouseID" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourcehouse" DataTextField="house_name"
                                DataValueField="house_id" AppendDataBoundItems="True">
                                <asp:ListItem Text="" Value="0">--Choose house--</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="RoomL" runat="server" Text="Room "></asp:Label>

                        </td>
                        <td>
                            <asp:DropDownList ID="RoomID" runat="server" 
                                AutoPostBack="True" 
                                DataSourceID="SqlDataSourceroom" 
                                DataTextField="room_name"
                                DataValueField="room_id" 
                                AppendDataBoundItems="True" 
                                OnSelectedIndexChanged="RoomID_SelectedIndexChanged">
                                <asp:ListItem Text="" Value="0">--Choose room--</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSourcehouse" runat="server" ConnectionString="<%$ ConnectionStrings:RMSConnection %>" SelectCommand="SELECT [house_name], [house_id] FROM [house]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceroom" runat="server" ConnectionString="<%$ ConnectionStrings:RMSConnection %>" SelectCommand="SELECT [room_name], [room_id] FROM [room] WHERE ([house_id] = @house_id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="HouseID" Name="house_id" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="PhoneL" runat="server" Text="Phone "></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="Phone" runat="server" CssClass="infoBox"></asp:TextBox>
                        </td>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="EmailL" runat="server" Text="Email "></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="Email" runat="server" CssClass="infoBox"></asp:TextBox>
                        </td>
                        <td colspan="2"></td>
                    </tr>
                     </table>
                            <asp:Label ID="DataL" runat="server" Text="Delivery Date" CssClass="infoBox"></asp:Label><asp:TextBox ID="DelDate" runat="server" CssClass="auto-style1" Width="136px"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="..." />
                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest"
                                Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="Calendar1_SelectionChanged"
                                OnDayRender="Calendar1_DayRender">
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                <NextPrevStyle VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="#808080" />
                                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                <SelectorStyle BackColor="#CCCCCC" />
                                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <WeekendDayStyle BackColor="#FFFFCC" />
                            </asp:Calendar>
                            <br/>
                            <br/>
                            <asp:Label ID="DesL" runat="server" Text="Description "></asp:Label><br/>
                            <asp:TextBox ID="Des" runat="server" Font-Strikeout="False" TextMode="MultiLine" Height="223px" Width="324px"></asp:TextBox>
                            <br/>
                <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" ValidationGroup="fieldrequired" UseSubmitBehavior="false" OnClientClick="if(Page_ClientValidate('fieldrequired')){this.disabled=true; this.value='Please wait..';}" />
                <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" />
            </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content -->
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            margin: 5px 0;
        }
    </style>
</asp:Content>

