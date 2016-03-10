<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="main_page.aspx.cs" Inherits="main_page" %>

<asp:Content ContentPlaceHolderId="ContentPlaceHolder2" runat="server">
    <!-- banner -->
    <div id="banner">
        <h1></h1>
    </div>
    <!-- /banner -->
</asp:Content>

<asp:Content ContentPlaceHolderId="ContentPlaceHolder1" runat="server">
        <!-- content -->
    <section id="content">
        <!-- #sidemenu -->
        <aside id="menu">
            <ul>
                <li><a href="key_overview.aspx">Key Management</a></li>
                <li><a href="game_overview.aspx">Game Management</a></li>
                <li><a href="package_pickup.aspx">Package Management</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div id="primary">
            <div id="main">

                <table class="auto-style1">
                    <tr>
                        <td class="auto-style6"></td>
                        <td class="auto-style3"></td>
                        <td class="auto-style4"></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Key</td>
                        <td class="auto-style2">Game</td>
                        <td class="auto-style2">Package</td>
                    </tr>
                </table>

            </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content -->

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 232px;
            text-align: center;
        }
        .auto-style3 {
            width: 233px;
            height: 19px;
        }
        .auto-style4 {
            width: 232px;
            height: 19px;
        }
        .auto-style6 {
            width: 232px;
            text-align: center;
            height: 19px;
        }
    </style>
</asp:Content>

