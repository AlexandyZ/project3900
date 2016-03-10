<%@ Page EnableEventValidation="false" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="key_report.aspx.cs" Inherits="key_report" %>

<asp:Content ContentPlaceHolderId="ContentPlaceHolder2" runat="server">
    <!-- banner -->
    <div id="banner">
        <h1>KEY REPORT</h1>
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
                <div id="search_bar">
                    <br />
                    <br>
                    <input type="text" runat="server" id="searchbar" />
                    <input type="submit" runat="server" id="searchbtn" value="Search" onserverclick="SearchBtn_Click" /><br />
                    <br>
                </div>
                <div id="result">
                    <asp:GridView ID="SearchResult"
                        AutoGenerateColumns="FALSE"
                        runat="server">
                        <Columns>
                            <%--allowpaging ="TRUE"--%>

                            <asp:BoundField DataField="KeyNumber" HeaderText="KeyNumber" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" />
                            <asp:BoundField DataField="Time_Out" HeaderText="Time_Out" />
                            <asp:BoundField DataField="Time_in" HeaderText="Time_In" />
                            <asp:BoundField DataField="Keyoutstanding" HeaderText="Status" />
                        </Columns>
                    </asp:GridView>
                    <%--<asp:SqlDataSource ID="overviewkey" runat="server" ConnectionString="<%$ ConnectionStrings:RMSConnection %>" SelectCommand="select k.keys_name, w.worker_fname ,w.worker_lname, c.comp_phone, lk.keylend_date, lk.keyreturn_date, k.keyoutstanding as Status FROM lend_key as lk INNER JOIN keys as k ON lk.keys_id = k.keys_id INNER JOIN worker as w ON w.worker_id = lk.worker_id INNER JOIN company as c ON c.comp_id = w.comp_id "></asp:SqlDataSource>--%>
                </div>
            </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content -->
</asp:Content>
