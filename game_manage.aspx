<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="game_manage.aspx.cs" Inherits="game_manage" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Styles/game.css" />
</asp:Content>

<asp:Content ContentPlaceHolderID="banner" runat="server">
    <!-- banner -->
    <div class="banner">
        <h1>GAME MANAGEMENT</h1>
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
                <li><a href="game_return.aspx">Game Return</a></li>
                <li><a href="game_report.aspx">Game Report</a></li>
                <li><a href="game_manage.aspx">Game Management</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div class="primary">
            <div class="main">
                <table class="game_table">
                    <tr>
                        <td>
                            <label class="info">Game Name</label>
                        </td>
                        <td>
                            <asp:textbox id="gameText" cssclass="infoBox" runat="server"></asp:textbox>
                            <span class="required">*</span>
                        </td>
                        <td>
                            <asp:requiredfieldvalidator controltovalidate="gameText" cssclass="required" runat="server" errormessage="Required" display="Dynamic"></asp:requiredfieldvalidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="info">Game QTY</label>
                        </td>
                        <td>
                            <asp:textbox type="number" id="qtyText" cssclass="infoBox" runat="server"></asp:textbox>
                            <span class="required">*</span>
                        </td>
                        <td>
                            <asp:Label ID="validateQTY" class="required" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:button id="addSubmit" class="submit" runat="server" text="Add New Game" onclick="addSubmit_Click" />
                <asp:button id="deleteSubmit" class="submit" runat="server" text="Delete Game" onclick="deleteSubmit_Click" />
            </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content -->
</asp:Content>
