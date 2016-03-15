﻿<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="key_signout.aspx.cs" Inherits="key_lend" %>

<asp:Content ContentPlaceHolderID="banner" runat="server">
    <!-- banner -->
    <div class="banner">
        <h1>KEY SIGNOUT</h1>
    </div>
    <!-- /banner -->
</asp:Content>

<asp:Content ContentPlaceHolderID="content" runat="server">

    <!-- content -->
    <section class="content">
        <!-- #sidemenu -->
        <aside class="menu">
            <ul>
                <li><a href="key_overview.aspx">Key Overview</a></li>
                <li><a href="key_signout.aspx">Key Sign Out</a></li>
                <li><a href="key_report.aspx">Key Report</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div class="primary">
            <div class="main">
                <div class="form">
                    <br />
                    <asp:Label ID="fname" runat="server" Text="First name: "></asp:Label>
                    <asp:TextBox type="text" runat="server" ID="txtFname" placeholder="John" pattern="[A-Za-z]{1,32}"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="txtFname" CssClass="required" runat="server" ErrorMessage="Required" Display="Dynamic" Visible="True"></asp:RequiredFieldValidator><br />
                    <br />
                    <asp:Label ID="lname" runat="server" Text="Last name: "></asp:Label>
                    <asp:TextBox type="text" runat="server" ID="txtLname"  placeholder="Smith" pattern="[A-Za-z]{1,32}"></asp:TextBox>
                     <asp:RequiredFieldValidator ControlToValidate="txtLname" CssClass="required" runat="server" ErrorMessage="Required" Display="Dynamic" Visible="True"></asp:RequiredFieldValidator><br />
                    <br />
                    <asp:Label ID="phone" runat="server" Text="Phone: "></asp:Label>
                    <asp:TextBox type="text" runat="server" ID="txtPhone" placeholder="999-999-9999" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"></asp:TextBox>
                     <asp:RequiredFieldValidator ControlToValidate="txtPhone" CssClass="required" runat="server" ErrorMessage="Required" Display="Dynamic" Visible="True"></asp:RequiredFieldValidator><br />
                    <br />
                    <asp:Label ID="company" runat="server" Text="Company Name: "></asp:Label>
                    <asp:TextBox type="text" runat="server" ID="txtCompany" placeholder="BCIT" pattern="[A-Za-z]{1,32}"></asp:TextBox>
                     <asp:RequiredFieldValidator ControlToValidate="txtCompany" CssClass="required" runat="server" ErrorMessage="Required" Display="Dynamic" Visible="True"></asp:RequiredFieldValidator><br />
                    <br />
                    <asp:Label ID="kname" runat="server" Text="Key Name: "></asp:Label>
                    <asp:TextBox type="text" runat="server" ID="txtKeyName" placeholder="a109"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="txtKeyName" CssClass="required" runat="server" ErrorMessage="Required" Display="Dynamic" Visible="True"></asp:RequiredFieldValidator><br />
                    <br />
                    <input type="submit" runat="server" id="btnSUbmit" value="Submit" onserverclick="btnSubmit_Click" />
                </div>
            </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content -->
</asp:Content>
