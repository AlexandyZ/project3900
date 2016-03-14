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
                <table class="result">
                    <tr>
                        <td>
                            <asp:Label ID="fname" CssClass="info" runat="server" Text="First name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="fnameText" CssClass="infoBox" runat="server" AutoCompleteType="FirstName"></asp:TextBox><span class="required"> *</span>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="fnameText" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Label ID="lname" CssClass="info" runat="server" Text="Last name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="lnameText" CssClass="infoBox" runat="server" AutoCompleteType="LastName"></asp:TextBox><span class="required"> *</span>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="lnameText" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="stdid" CssClass="info" runat="server" Text="Student ID"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="stdidText" CssClass="infoBox" runat="server"></asp:TextBox><span class="required"> *</span>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="stdidText" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="amount" CssClass="info" runat="server" Text="QTY"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox type="number" ID="amountNum" CssClass="infoBox" runat="server"></asp:TextBox><span class="required"> *</span>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="amountNum" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
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
