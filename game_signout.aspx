<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="game_signout.aspx.cs" Inherits="game_signout" %>

<asp:Content ContentPlaceHolderId="head" runat="server">
    <link rel="stylesheet" href="/Styles/game.css" /> 
</asp:Content>

<asp:Content ContentPlaceHolderId="ContentPlaceHolder2" runat="server">
    <!-- banner -->
    <div id="banner">
        <h1>GAME SIGNOUT</h1>
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
                    <h1>
                        <asp:Label ID="gamename" runat="server" Text="game name"></asp:Label></h1>
                    <table id="gameout">
                        <tr>
                            <td>
                                <asp:Label ID="fname" CLASS="info" runat="server" Text="First name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="fnameText" Class="infoBox" runat="server" AutoCompleteType="FirstName"></asp:TextBox><span class="required"> *</span>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ControlToValidate="fnameText" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:Label ID="lname" CLASS="info" runat="server" Text="Last name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="lnameText" Class="infoBox" runat="server" AutoCompleteType="LastName"></asp:TextBox><span class="required"> *</span>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ControlToValidate="lnameText" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="stdid" CLASS="info" runat="server" Text="Student ID"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="stdidText" Class="infoBox" runat="server"></asp:TextBox><span class="required"> *</span>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ControlToValidate="stdidText" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="amount" CLASS="info" runat="server" Text="QTY"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox type="number" ID="amountNum" CLASS="infoBox" runat="server"></asp:TextBox><span class="required"> *</span>
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
