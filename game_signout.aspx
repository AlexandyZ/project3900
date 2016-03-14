<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="game_signout.aspx.cs" Inherits="game_signout" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Styles/game.css" />
</asp:Content>

<asp:Content ContentPlaceHolderID="banner" runat="server">
    <!-- banner -->
    <div class="banner">
        <h1>GAME SIGNOUT</h1>
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
                <h1>
                    <asp:Label ID="gamename" runat="server" Text="game name"></asp:Label></h1>
                <table class="game_table">
                    <tr>
                        <td>
                            <label class="info">First Name</label>
                        </td>
                        <td>
                            <asp:TextBox ID="fnameText" CssClass="infoBox" runat="server" AutoCompleteType="FirstName"></asp:TextBox><span class="required"> *</span>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="fnameText" CssClass="required" runat="server" ErrorMessage="Required" Display="Dynamic" Visible="True"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <label class="info">Last Name</label>
                        </td>
                        <td>
                            <asp:TextBox ID="lnameText" CssClass="infoBox" runat="server" AutoCompleteType="LastName"></asp:TextBox><span class="required"> *</span>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="lnameText" CssClass="required" runat="server" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="info">Student ID</label>
                        </td>
                        <td>
                            <asp:TextBox ID="stdidText" CssClass="infoBox" runat="server"></asp:TextBox><span class="required"> *</span>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="stdidText" CssClass="required" runat="server" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="info">Game Qty</label>
                        </td>
                        <td>
                            <asp:TextBox Type="number" ID="amountNum" CssClass="infoBox" runat="server"></asp:TextBox><span class="required"> *</span>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="amountNum" CssClass="required" runat="server" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="submit" class="submit" runat="server" OnClick="Submit_Click" Text="Submit" />
            </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content -->
</asp:Content>
