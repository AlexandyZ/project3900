<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="package_pickup.aspx.cs" Inherits="package_pickup" %>

<asp:Content ContentPlaceHolderID="banner" runat="server">
    <!-- banner -->
    <div class="banner">
        <h1>PACKAGE PICKUP</h1>
    </div>
    <!-- /banner -->
</asp:Content>

<asp:Content ContentPlaceHolderID="content" runat="server">

    <!-- content -->
    <section class="content">
        <!-- #sidemenu -->
        <aside class="menu">
            <ul>
                <li class="active"><a href="package_pickup.aspx">Package Pickup</a></li>
                <li><a href="package_track.aspx">Package Tracking</a></li>
                <li><a href="package_report.aspx">Package Report</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div class="primary">
            <div class="main">
                <div class="searchbar">
                    <input type="text" runat="server" class="searchbox" id="searchbar" placeholder="search by student name" />
                    <input type="submit" runat="server" class="searchbtn" id="searchbtn" value="Search" onserverclick="SearchBtn_Click" />
                </div>
                <div class="result">
                    <asp:GridView ID="SearchResult"
                        AutoGenerateColumns="FALSE" 
                        OnRowCommand="GridView1_RowCommand"
                        CssClass="mGrid" 
                        AlternatingRowStyle-CssClass="alt"
                        runat="server" DataKeyNames="package_id">
                        <Columns>
                            <asp:BoundField DataField="firstname" HeaderText="Firstname" SortExpression="firstname" />
                            <asp:BoundField DataField="lastname" HeaderText="Lastname" SortExpression="lastname" />
                            <asp:BoundField DataField="house" HeaderText="House" SortExpression="house" />
                            <asp:BoundField DataField="room" HeaderText="Room" SortExpression="room" />
                            <asp:BoundField DataField="descript" HeaderText="Description" SortExpression="descript" />
                            <asp:BoundField DataField="delivery_date" HeaderText="Delivery_Date" SortExpression="delivery_date" DataFormatString="{0:MM-dd-yyyy}" />
                            <asp:ButtonField ButtonType="Button" CommandName="select" ShowHeader="True" Text="Pick Up" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content -->
</asp:Content>
