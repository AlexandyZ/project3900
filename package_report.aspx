﻿<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="package_report.aspx.cs" Inherits="package_report" %>

<asp:Content ContentPlaceHolderID="banner" runat="server">
    <!-- banner -->
    <div class="banner">
        <h1>PACKAGE REPORT</h1>
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
                <li class="active"><a href="package_report.aspx">Package Report</a></li>
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
                <div class="result" >
                    <asp:GridView ID="SearchResult" 
                        CssClass="mGrid" 
                        AlternatingRowStyle-CssClass="alt"
                        AutoGenerateColumns="False" runat="server">
                        <Columns>
                            <asp:BoundField DataField="firstname" HeaderText="Firstname" SortExpression="firstname" />
                            <asp:BoundField DataField="lastname" HeaderText="Lastname" SortExpression="lastname" />
                            <asp:BoundField DataField="house" HeaderText="House" SortExpression="house" />
                            <asp:BoundField DataField="room" HeaderText="Room" SortExpression="room" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="descript" ItemStyle-Width="40%"/>
                            <asp:BoundField DataField="delivery_date" HeaderText="Delivery Date" SortExpression="delivery_date" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="pickup_date" HeaderText="Pickup Date" SortExpression="pickup_date" DataFormatString="{0:yyyy-MM-dd}" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content -->
</asp:Content>
