<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="game_overview.aspx.cs" Inherits="game_overview" %>

<asp:Content ContentPlaceHolderId="head" runat="server">
    <link rel="stylesheet" href="/Styles/game.css" /> 
</asp:Content>

<asp:Content ContentPlaceHolderId="ContentPlaceHolder2" runat="server">
    <!-- banner -->
    <div id="banner">
        <h1>GAME OVERVIEW</h1>
    </div>
    <!-- /banner -->
</asp:Content>

<asp:Content ContentPlaceHolderId="ContentPlaceHolder1" runat="server">

    <!-- content -->
    <section id="content">
        <!-- #sidemenu -->
        <aside id="menu">
            <ul>
                <li><a href="game_overview.aspx">Game Overview</a></li>
                <li><a href="game_return.aspx">Game Return</a></li>
                <li><a href="game_manage.aspx">Game Management</a></li>
                <li><a href="game_report.aspx">Game Report</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div id="primary">
                <div id="main">
                    <!-- #search bar -->
                    <div id="searchbar">
                        <input type="text" runat="server" id="searchText" />
                        <input type="submit" runat="server" id="searchBtn" value="Search" onserverclick="SearchBtn_Click" />
                    </div>
                    <!-- /#search bar -->
                    <!-- #overview table -->
                    <div id="view_game">
                        <asp:GridView ID="GameView" runat="server"
                            AllowSorting="True"
                            AutoGenerateColumns="False"
                            OnRowDataBound="GameGridView_RowDataBound"
                            OnSelectedIndexChanged="GameGridView_SelectedIndexChanged"
                            OnRowCommand="Signout_RowCommand"
                            DataKeyNames="game_id">
                            <Columns>
                                <asp:BoundField DataField="game_name" HeaderText="Games" SortExpression="game_name" />
                                <asp:BoundField DataField="game_invent" HeaderText="Inventory" SortExpression="game_invent" />
                                <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Sign Out" />
                            </Columns>
                        </asp:GridView>
                        <!--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>-->
                    </div>
                    <!-- /#overview table -->
                </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content -->
</asp:Content>
