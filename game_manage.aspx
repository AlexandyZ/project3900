<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="game_manage.aspx.cs" Inherits="game_manage" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Styles/game.css" />
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- banner -->
    <div id="banner">
        <h1>GAME MANAGEMENT</h1>
    </div>
    <!-- /banner -->
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                <table id="addform">
                    <tr>
                        <td>
                            <asp:Label ID="game" class="info" runat="server" Text="Game Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="gameText" class="infoBox" placeholder="Chess" runat="server"></asp:TextBox><span class="required"> *</span>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="gameText" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="game_qty" class="info" runat="server" Text="Amount"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox type="number" ID="qtyText" placeholder="0" class="infoBox" runat="server"></asp:TextBox><span class="required"> *</span>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="qtyText" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="addSubmit" class="submit" runat="server" Text="Add New Game" OnClick="addSubmit_Click" />
            </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content -->
</asp:Content>
