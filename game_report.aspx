<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="game_report.aspx.cs" Inherits="game_report" %>

<asp:Content ContentPlaceHolderId="head" runat="server">
    <link rel="stylesheet" href="/Styles/game.css" /> 
</asp:Content>

<asp:Content ContentPlaceHolderId="ContentPlaceHolder2" runat="server">
    <!-- banner -->
    <div id="banner">
        <h1>GAME REPORT</h1>
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
                    <div id="view_game">
                        <asp:GridView ID="GameGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceGame">
                            <Columns>
                                <asp:BoundField DataField="game_record" HeaderText="game_record" SortExpression="game_record" InsertVisible="False" ReadOnly="True" />
                                <asp:BoundField DataField="std_id" HeaderText="std_id" SortExpression="std_id" />
                                <asp:BoundField DataField="game_id" HeaderText="game_id" SortExpression="game_id" />
                                <asp:BoundField DataField="glend_date" HeaderText="glend_date" SortExpression="glend_date" />
                                <asp:BoundField DataField="greturn_date" HeaderText="greturn_date" SortExpression="greturn_date" />
                                <asp:BoundField DataField="game_qty" HeaderText="game_qty" SortExpression="game_qty" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceGame" runat="server" ConnectionString="<%$ ConnectionStrings:RMSConnection %>" SelectCommand="SELECT * FROM [lend_game]"></asp:SqlDataSource>
                    </div>
                </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content -->

</asp:Content>