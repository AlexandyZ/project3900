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
        <!-- sidemenu -->
        <aside class="menu">
            <ul>
                <li><a href="game_list.aspx">Game List</a></li>
                <li><a href="game_return.aspx">Game Return</a></li>
                <li><a href="game_report.aspx">Game Report</a></li>
                <li><a href="game_manage.aspx">Game Management</a></li>
            </ul>
        </aside>
        <!-- /sidemenu -->
        <!-- primary -->
        <div class="primary">
            <div class="main">
                <h1>
                    <asp:Label ID="gamename" runat="server" Text="game name"></asp:Label>
                </h1>
                <table class="game_table">
                    <tr>
                        <td>
                            <label class="info">Student ID</label>
                        </td>
                        <td>
                            <asp:TextBox ID="stdidText" placeholder="A00123456" CssClass="infoBox" runat="server"></asp:TextBox><span class="required"> *</span>
                        </td>
                        <td>
                        <asp:RegularExpressionValidator runat="server"
                                CssClass="required"
                                ErrorMessage="this is in wrong format"
                                    ControlToValidate="stdidText"     
                                    ValidationGroup="fieldrequired"
                                    ValidationExpression="^[aA'.\s]{1}(\d{8})$"  Display="Dynamic" />
                            <asp:RequiredFieldValidator ControlToValidate="stdidText" ValidationGroup="fieldrequired" CssClass="required" runat="server" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:Label ID="validateStdID" CssClass="required" runat="server" Text=""></asp:Label>
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
                            <asp:RegularExpressionValidator runat="server"
                                CssClass="required"
                                ErrorMessage="This cannot be a negative or zero number"
                                    ControlToValidate="amountNum"     
                                    ValidationGroup="fieldrequired"
                                    ValidationExpression="^\d?[1-9]\d{0,2}$"  Display="Dynamic" />
                            <asp:RequiredFieldValidator ControlToValidate="amountNum" ValidationGroup="fieldrequired" CssClass="required" runat="server" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="submit" class="submit" runat="server" OnClick="Submit_Click" Text="Submit" ValidationGroup="fieldrequired" onClientClick="if(Page_ClientValidate('fieldrequired')){this.disabled=true; this.value='Please wait..';}" UseSubmitBehavior="false" />
            </div>
        </div>
        <!-- /primary -->
    </section>
    <!-- /content -->
</asp:Content>
