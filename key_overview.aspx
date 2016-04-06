<%@ Page EnableEventValidation="false" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="key_overview.aspx.cs" Inherits="key_overview" %>

<asp:Content ContentPlaceHolderId="banner" runat="server">
    <!-- banner -->
    <div class="banner">
        <h1>KEY OVERVIEW</h1>
    </div>
    <!-- /banner -->
</asp:Content>

<asp:Content ContentPlaceHolderId="content" runat="server">

    <!-- content -->
    <section class="content">
        <!-- #sidemenu -->
        <aside class="menu">
            <ul>
                <li class="active"><a href="key_overview.aspx">Key Overview</a></li>
                <li><a href="key_signout.aspx">Key Sign Out</a></li>
                <li><a href="key_report.aspx">Key Report</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
        <div class="primary">
            <div class="main">
                <div class="searchbar">
                    <input type="text" runat="server" id="searchbar" class="searchbox" placeholder="search by key number" />
                    <input type="submit" runat="server" class="searchbtn" id="searchbtn" value="Search" onserverclick="SearchBtn_Click" />
                </div>
                <div class="result" style="height:400px; overflow:auto" >
                    <asp:GridView ID="SearchResult" 
                        CssClass="mGrid" 
                        AlternatingRowStyle-CssClass="alt"
                        AutoGenerateColumns="FALSE" runat="server" 
                        OnRowCommand="Button_click_event" 
                        DataKeyNames="KEYID">
                        <Columns>
                            <%--<asp:BoundField DataField="LKID" HeaderText="ID" visible="false"/>--%>
                            <asp:BoundField DataField="KeyNumber" HeaderText="Key Number" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                            <asp:BoundField DataField="Time_Out" HeaderText="Time Out" DataFormatString="{0:yyyy-MM-dd hh:mm tt}"/>
                            <asp:ButtonField ButtonType="Button" HeaderText="" Text="Return" CommandName="ReturnKey" ItemStyle-Width="55px" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <!-- /#primary -->
    </section>
    <!-- /content -->
</asp:Content>
