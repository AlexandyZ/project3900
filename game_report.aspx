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
                                <asp:BoundField DataField="student_id" HeaderText="Student ID" SortExpression="student_id" />
                                <asp:BoundField DataField="std_name" HeaderText="Student Name" SortExpression="std_name" ReadOnly="True" />
                                <asp:BoundField DataField="game_name" HeaderText="Game Name" SortExpression="game_name" />
                                <asp:BoundField DataField="glend_date" HeaderText="SignOut Date" SortExpression="glend_date" DataFormatString="{0:MM-dd-yyyy}" />
                                <asp:BoundField DataField="greturn_date" HeaderText="Return Date" SortExpression="greturn_date" DataFormatString="{0:MM-dd-yyyy}" />
                                <asp:BoundField DataField="game_qty" HeaderText="QTY" SortExpression="game_qty" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceGame" runat="server" ConnectionString="<%$ ConnectionStrings:RMSConnection %>" SelectCommand="SELECT student_id, student_fname + ' ' + student_lname AS std_name, game_name, glend_date, greturn_date, game_qty
FROM lend_game lg INNER JOIN game g ON g.game_id = lg.game_id
INNER JOIN studenthistory sh ON sh.std_id = lg.std_id"></asp:SqlDataSource>
                    </div>
                </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content -->

</asp:Content>