<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="game_list.aspx.cs" Inherits="game_list" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Styles/game.css" />
</asp:Content>

<asp:Content ContentPlaceHolderID="banner" runat="server">
    <!-- banner -->
    <div class="banner">
        <h1>GAME OVERVIEW</h1>
    </div>
    <!-- /banner -->
</asp:Content>

<asp:Content ContentPlaceHolderID="content" runat="server">

    <!-- content -->
    <section class="content">
        <!-- #sidemenu -->
        <aside class="menu">
            <ul>
                <li class="active"><a href="game_list.aspx" >Game List</a></li>
                <li><a href="game_return.aspx" >Game Return</a></li>
                <li><a href="game_report.aspx" >Game Report</a></li>
                <li><a href="game_manage.aspx" >Game Management</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div class="primary">
            <div class="main">
                <!-- #search bar -->
                <div class="searchbar">
                    <input type="text" runat="server" class="searchbox" id="searchText" placeholder="Search by Game Name" />
                    <input type="submit" runat="server" class="searchbtn" id="searchBtn" value="Search" onserverclick="SearchBtn_Click" />
                </div>
                <!-- /#search bar -->
                <!-- #overview table -->
                <div class="result">
                    <asp:GridView ID="GameListView" runat="server"
                        CssClass="mGrid"
                        AlternatingRowStyle-CssClass="alt"
                        AutoGenerateColumns="False"
                        OnRowDataBound="GameGridView_RowDataBound"
                        OnSelectedIndexChanged="GameGridView_SelectedIndexChanged"
                        OnRowCommand="Signout_RowCommand"
                        DataKeyNames="game_id">
                        <Columns>
                            <asp:BoundField DataField="game_name" HeaderText="Games" SortExpression="game_name"  ItemStyle-Width="50%" />
                            <asp:BoundField DataField="game_invent" HeaderText="Inventory" SortExpression="game_invent" />
                            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Sign Out" ItemStyle-Width="65px" />
                        </Columns>
                    </asp:GridView>
                </div>
                <!-- /#overview table -->
            </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content -->
</asp:Content>
