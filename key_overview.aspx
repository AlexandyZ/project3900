<%@ Page EnableEventValidation="false" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="key_overview.aspx.cs" Inherits="key_overview" %>

<asp:Content ContentPlaceHolderId="ContentPlaceHolder2" runat="server">
    <!-- banner -->
    <div id="banner">
        <h1>KEY OVERVIEW</h1>
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
                    <asp:TextBox type="text" runat="server" id="searchbar" placeholder="search by key number" /></asp:TextBox>
                    <input type="submit" runat="server" id="searchbtn" value="Search" onserverclick="SearchBtn_Click" />
                </div>
                <div id="result" style="height: 600px; overflow: auto;">
                    <br/>
                    <asp:GridView ID="SearchResult" AutoGenerateColumns="FALSE" runat="server" AllowSorting="True" OnRowCommand="Button_click_event" DataKeyNames="KeyID">
                        <Columns>
                            <asp:BoundField DataField="KeyNumber" HeaderText="KeyNumber" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" />
                            <asp:BoundField DataField="Time_Out" HeaderText="Time_Out" />
                            <asp:ButtonField ButtonType="Button" HeaderText="Status" Text="Return" CommandName="ReturnKey" />
                        </Columns>
                         <EditRowStyle BackColor="#2461BF" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </div>
            </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content -->
</asp:Content>
