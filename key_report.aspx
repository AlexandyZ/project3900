<%@ Page EnableEventValidation="false" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="key_report.aspx.cs" Inherits="key_report" %>

<asp:Content ContentPlaceHolderId="banner" runat="server">
    <!-- banner -->
    <div class="banner">
        <h1>KEY REPORT</h1>
    </div>
    <!-- /banner -->
</asp:Content>

<asp:Content ContentPlaceHolderId="content" runat="server">

    <!-- content -->
    <section class="content">
        <!-- #sidemenu -->
        <aside class="menu">
            <ul>
                <li><a href="key_overview.aspx">Key Overview</a></li>
                <li><a href="key_signout.aspx">Key Sign Out</a></li>
                <li class="active"><a href="key_report.aspx">Key Report</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div class="primary">
            <div class="main">
                <div class="searchbar">
                    <input type="text" runat="server" class="searchbox" id="searchbar" placeholder="search by key number" />
                    <input type="submit" runat="server" class="searchbtn" id="searchbtn" value="Search" onserverclick="SearchBtn_Click" />
                </div>
                <div class="result">
                    <asp:GridView ID="SearchResult" 
                        CssClass="mGrid" 
                        AlternatingRowStyle-CssClass="alt"
                        AutoGenerateColumns="False" runat="server">
                        <Columns>
                            <asp:BoundField DataField="KeyNumber" HeaderText="Key Number" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                            <asp:BoundField DataField="Time_Out" HeaderText="Time Out" />
                            <asp:BoundField DataField="Time_in" HeaderText="Time In" />
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
