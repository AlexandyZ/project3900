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
            <br/>
            
             <asp:Label id="fname" runat="server" Text="First name: "></asp:Label>
        <asp:TextBox type="text" runat="server" id="txtFname" required="true" placeholder="John" pattern="[A-Za-z]{1,32}"></asp:TextBox><br/>
        
                <br/>
                <asp:Label id="lname" runat="server" Text="Last name: "></asp:Label>
      
        <asp:TextBox type="text" runat="server" id="txtLname" required="true" placeholder="Smith" pattern="[A-Za-z]{1,32}" ></asp:TextBox><br />
         
                <br/>
                  <asp:Label id="phone" runat="server" Text="Phone: "></asp:Label>
      
        <asp:TextBox type="text" runat="server" id="txtPhone" required="true" placeholder="999-999-9999" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"></asp:TextBox><br />
       
                <br/>
                <asp:Label id="company" runat="server" Text="Company Name: "></asp:Label>
      
        <asp:TextBox type="text" runat="server" id="txtCompany" required="true" placeholder="BCIT" pattern="[A-Za-z]{1,32}" ></asp:TextBox>

       <br />
                <br/>
                <asp:Label id="kname" runat="server" Text="Key Name: "></asp:Label>
      
        <asp:TextBox type="text" runat="server" id="txtKeyName" required="true" placeholder="a109"></asp:TextBox><br />
       
                <br/>
  

        <input type="submit" runat="server" id="btnSUbmit" value="Submit" onserverclick="btnSubmit_Click"/>


            </div>
            </div>
        </div>
            <!-- /#primary -->
        </section>
        <!-- /content -->
</asp:Content>