﻿<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="import.aspx.cs" Inherits="import" %>

<asp:Content ContentPlaceHolderId="banner" runat="server">
    <!-- banner -->
    <div class="banner">
        <h1>IMPORT</h1>
    </div>
    <!-- /banner -->
</asp:Content>

<asp:Content ContentPlaceHolderId="content" runat="server">

        <!-- content -->
        <section class="content">
            <!-- #sidemenu -->
            <aside class="menu">
                <ul>
                    <li><a href="import.aspx">Import File</a></li>
                </ul>
            </aside>
            <!-- /#sidemenu -->
            <!-- #primary -->
            <div class="primary">
                <div class="main">
                    <asp:FileUpload ID="FileUploadControl" runat="server" />
                    <asp:Button ID="UploadButton" runat="server" OnClick="Button1_Click" Text="Upload" />
                    <br />
                    <asp:Label ID="StatusLabel" runat="server" Text="Upload status:"></asp:Label>
                </div>
            </div>
            <!-- /#primary -->
        </section>
        <!-- /content -->
</asp:Content>
