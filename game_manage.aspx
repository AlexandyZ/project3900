<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="game_manage.aspx.cs" Inherits="game_manage" %>

<asp:Content ContentPlaceHolderId="head" runat="server">
    <link rel="stylesheet" href="/Styles/game.css" /> 
</asp:Content>

<asp:Content ContentPlaceHolderId="banner" runat="server">
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
                            <asp:Label ID="game" CssClass="info" runat="server" Text="Game Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="gameText" CssClass="infoBox" runat="server"></asp:TextBox><span class="required"> *</span>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="gameText" CssClass="required" runat="server" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="game_qty" CssClass="info" runat="server" Text="Game QTY"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox Type="number" ID="qtyText" CssClass="infoBox" runat="server"></asp:TextBox><span class="required"> *</span>
                        </td>
                        <td>
                            <asp:CompareValidator ControlToValidate="qtyText" runat="server" ErrorMessage="@errormsg" Display="Dynamic"></asp:CompareValidator>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="addSubmit" class="submit" runat="server" Text="Add New Game" OnClick="addSubmit_Click" />
                <asp:Button ID="deleteSubmit" class="submit" runat="server" Text="Delete Game" OnClick="deleteSubmit_Click" />
            </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content -->
</asp:Content>
