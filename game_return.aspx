<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="game_return.aspx.cs" Inherits="game_return" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Styles/game.css" />
</asp:Content>

<asp:Content ContentPlaceHolderID="banner" runat="server">
    <!-- banner -->
    <div class="banner">
        <h1>GAME RETURN</h1>
    </div>
    <!-- /banner -->
</asp:Content>

<asp:Content ContentPlaceHolderID="content" runat="server">

    <!-- content -->
    <section class="content">
        <!-- #sidemenu -->
        <aside class="menu">
            <ul>
                <li><a href="game_list.aspx">Game List</a></li>
                <li class="active" ><a href="game_return.aspx">Game Return</a></li>
                <li><a href="game_report.aspx">Game Report</a></li>
                <li><a href="game_manage.aspx">Game Management</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div class="primary">
            <div class="main">
                <!-- #search bar -->
                <div class="searchbar">
                    <input type="text" runat="server" class="searchbox" id="searchText" placeholder="Search by Game Name or Student Name" />
                    <input type="submit" runat="server" class="searchbtn" id="searchBtn" value="Search" onserverclick="SearchBtn_Click" />
                </div>
                <!-- /#search bar -->
                <div class="result">
                    <asp:GridView ID="GameReturn" runat="server"
                        AutoGenerateColumns="False"
                        AllowSorting="True"
                        OnSelectedIndexChanged="GameReturn_SelectedIndexChanged"
                        OnRowDataBound="GameReturn_RowDataBound"
                        OnRowCommand="Return_RowCommand"
                        DataKeyNames="game_id">
                        <Columns>
                            <asp:BoundField DataField="student_id" HeaderText="Student ID" ReadOnly="True" SortExpression="student_id" />
                            <asp:BoundField DataField="std_name" HeaderText="Student Name" SortExpression="std_name" ReadOnly="True" />
                            <asp:BoundField DataField="game_name" HeaderText="Game Name" SortExpression="game_name" ReadOnly="True" />
                            <asp:BoundField DataField="game_qty" HeaderText="QTY" SortExpression="game_qty" />
                            <asp:BoundField DataField="glend_date" HeaderText="SignOut Date" SortExpression="glend_date" ReadOnly="True" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:ButtonField ButtonType="Button" Text="Return" CommandName="Select" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content -->
</asp:Content>
