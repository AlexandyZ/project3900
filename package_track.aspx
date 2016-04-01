<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="package_track.aspx.cs" Inherits="key_addnew" %>

<asp:Content ContentPlaceHolderId="banner" runat="server">
<link rel="stylesheet" href="/Styles/game.css" />
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
                <table class="game_table">
                    <tr>
                        <td>
                <asp:Label ID="First" runat="server" Text="First name "></asp:Label>
                </td>
                        <td>
                <asp:TextBox ID="firstname" runat="server" ></asp:TextBox>
                <span class="required">*</span>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="firstname" ValidationGroup="fieldrequired" ErrorMessage="Firstname is required." ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator  runat="server"     
                    ErrorMessage="Name must be between 1 and 20 characters." 
                    ControlToValidate="firstname"     
                    ValidationGroup="fieldrequired"
                    ValidationExpression="^[a-zA-Z'.\s]{1,20}$" ForeColor="Red" />    
                     
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:Label ID="Last" runat="server" Text="Last name "></asp:Label>
                </td>
                        <td>
                <asp:TextBox ID="lastname" runat="server" ></asp:TextBox>
                <span class="required">*</span>
               
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lastname" ValidationGroup="fieldrequired" ErrorMessage="Lastname is required." ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator  runat="server"     
                    ErrorMessage="Name must be between 1 and 20 characters." 
                    ControlToValidate="lastname"     
                    ValidationGroup="fieldrequired"
                    ValidationExpression="^[a-zA-Z'.\s]{1,20}$" ForeColor="Red" />
                    
                        </td>
                    </tr>
                    <tr>
                        <td>

                <asp:Label ID="HouseL" runat="server" Text="House "></asp:Label>
                 </td>
                        <td>
                <asp:DropDownList ID="HouseID" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourcehouse" DataTextField="house_name" DataValueField="house_id" AppendDataBoundItems="True"><asp:ListItem Text="" Value="0">--Choose house--</asp:ListItem></asp:DropDownList>
                
                   
                <asp:Label ID="RoomL" runat="server" Text="Room "></asp:Label>
                
                <asp:DropDownList ID="RoomID" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceroom" DataTextField="room_name" DataValueField="room_id" AppendDataBoundItems="True" OnSelectedIndexChanged="RoomID_SelectedIndexChanged"><asp:ListItem Text="" Value="0">--Choose room--</asp:ListItem></asp:DropDownList>
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
                <asp:Label ID="PhoneL" runat="server" Text="Phone " ></asp:Label>
                </td>
                        <td>
                        <asp:TextBox ID="Phone" runat="server" disabled =" true"></asp:TextBox>
                </td>
                    </tr>
                    <tr>
                        <td>
                <asp:Label ID="EmailL" runat="server" Text="Email "></asp:Label>
                </td>
                        <td>
                        <asp:TextBox ID="Email" runat="server" disabled =" true"></asp:TextBox>
                  </td>
                    </tr>
                    <tr>
                        <td>
                <asp:Label ID="DataL" runat="server" Text="Delivery Date "></asp:Label>
                 </td>
                        <td>
                        <asp:TextBox ID="DelDate" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="..." />
              
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="Calendar1_SelectionChanged" OnDayRender="Calendar1_DayRender">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
             </td>
                    </tr>
                    <tr>
                        <td>
                <asp:Label ID="DesL" runat="server" Text="Description "></asp:Label>
              </td>
                        <td>
                <asp:TextBox ID="Des" runat="server" Font-Strikeout="False" TextMode="MultiLine" Height="223px" Width="324px"></asp:TextBox>
                  </td>
                    </tr>
                </table>
                <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" ValidationGroup="fieldrequired" onClientClick="if(Page_ClientValidate('fieldrequired')){this.disabled=true; this.value='Please wait..';}" UseSubmitBehavior="false" />
                </td>
                        <td>
                <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" />
             </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content --> 
</asp:Content>
