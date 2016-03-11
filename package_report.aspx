<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="package_report.aspx.cs" Inherits="package_report" %>

<asp:Content ContentPlaceHolderId="ContentPlaceHolder2" runat="server">
    <!-- banner -->
    <div id="banner">
        <h1>PACKAGE REPORT</h1>
    </div>
    <!-- /banner -->
</asp:Content>

<asp:Content ContentPlaceHolderId="ContentPlaceHolder1" runat="server">

    <!-- content -->   
    <section id="content">
        <!-- #sidemenu -->
        <aside id="menu">
            <ul>
                <li><a href="package_pickup.aspx">Package Pickup</a></li>
                <li><a href="package_track.aspx">Package Tracking</a></li>
                <li><a href="package_report.aspx">Package Report</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div id="primary">
        <div id="search_bar">
                <br />

                <input type="text" runat="server" id="searchbar" placeholder="search by student name" />
                <input type="submit" runat="server" id="searchbtn" value="Search" onserverclick="SearchBtn_Click" /><br />

            </div>
            <div id="main" style ="height:500px; overflow:scroll">
               <asp:GridView ID="SearchResult" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"  ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                        <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
                        <asp:BoundField DataField="house" HeaderText="house" SortExpression="house" />
                        <asp:BoundField DataField="room" HeaderText="room" SortExpression="room" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="descript" />
                        <asp:BoundField DataField="delivery_date" HeaderText="delivery_date" SortExpression="delivery_date" DataFormatString="{0:MM-dd-yyyy}" />
                        <asp:BoundField DataField="pickup_date" HeaderText="pickup_date" SortExpression="pickup_date" DataFormatString="{0:MM-dd-yyyy}" />
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
                
            </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content --> 
</asp:Content>
