<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="key_signout.aspx.cs" Inherits="key_lend" %>

<asp:Content ContentPlaceHolderId="ContentPlaceHolder2" runat="server">
    <!-- banner -->
    <div id="banner">
        <h1>KEY SIGNOUT</h1>
    </div>
    <!-- /banner -->
</asp:Content>

<asp:Content ContentPlaceHolderId="ContentPlaceHolder1" runat="server">

        <!-- content -->
        <section id="content">
            <!-- #sidemenu -->
            <aside id="menu">
                <ul>
                    <li><a href="key_overview.aspx">Key Overview</a></li>
                    <li><a href="key_signout.aspx">Key Sign Out</a></li>
                    <li><a href="key_report.aspx">Key Report</a></li>
                </ul>
            </aside>
            <!-- /#sidemenu -->
            <!-- #primary -->
            <div id="primary">
                <div id="main">
                    <div id="form">
                        <br>
                        <label for="fname">Fisrt Name:</label>
                        <input type="text" runat="server" id="txtFname" /><br />
                        <br>
                        <label for="lname">Last Name:</label>
                        <input type="text" runat="server" id="txtLname" /><br />
                        <br>
                        <label for="phone">Phone:</label>
                        <input type="text" runat="server" id="txtPhone" /><br />
                        <br>
                        <label for="company">Company Name:</label>
                        <input type="text" runat="server" id="txtCompany" />
                        <%--            <option value="1">A</option>
            <option value="2">B</option>--%>
                        <br />
                        <br>
                        <label for="kname">Key Name:</label>
                        <input type="text" runat="server" id="txtKeyName" /><br />
                        <br>
                        <%--    <input type="datetime" runat="server" id="txtTimeOut" />--%>

                        <input type="submit" runat="server" id="btnSUbmit" value="Submit" onserverclick="btnSubmit_Click" />


                    </div>
                </div>
            </div>
            <!-- /#primary -->
        </section>
        <!-- /content -->
</asp:Content>