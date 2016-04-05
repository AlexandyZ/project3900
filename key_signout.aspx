<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="key_signout.aspx.cs" Inherits="key_lend" %>

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
                <li class="active"><a href="key_signout.aspx">Key Sign Out</a></li>
                <li><a href="key_report.aspx">Key Report</a></li>
            </ul>
        </aside>
        <!-- /#sidemenu -->
        <!-- #primary -->
       <div class="primary">
            <div class="main">
                <table class="table">
                    <tr>
                        <td>
                    <br />
                    <asp:Label class="info" ID="fname" runat="server" Text="First name: "></asp:Label>
                     </td>
                        <td>
                    <asp:TextBox CssClass="infoBox" type="text" runat="server" ID="txtFname" placeholder="John"></asp:TextBox><span class="required"> *</span>
                       </td>
                        <td>
                    <asp:RequiredFieldValidator ControlToValidate="txtFname" ValidationGroup="fieldrequired" CssClass="required" runat="server" ErrorMessage="Required" Display="Dynamic" Visible="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator  runat="server"     
                                    ErrorMessage="Name doesnt include a number" 
                                    ControlToValidate="txtFname"    
                                    ValidationGroup="fieldrequired" 
                                    ValidationExpression="^[a-zA-Z'.\s]{1,20}$" ForeColor="Red"/>
                      </td>
                    </tr>
                    <tr>
                        <td>
                    <asp:Label class="info" ID="lname" runat="server" Text="Last name: "></asp:Label>
                    </td>
                        <td>
                    <asp:TextBox CssClass="infoBox" type="text" runat="server" ID="txtLname"  placeholder="Smith" pattern="[A-Za-z]{1,32}"></asp:TextBox><span class="required"> *</span>
                     </td>
                        <td>
                     <asp:RequiredFieldValidator ControlToValidate="txtLname" ValidationGroup="fieldrequired" CssClass="required" runat="server" ErrorMessage="Required" Display="Dynamic" Visible="True"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator  runat="server"     
                                    ErrorMessage="Name doesnt include a number" 
                                    ControlToValidate="txtLname"     
                                    ValidationGroup="fieldrequired"
                                    ValidationExpression="^[a-zA-Z'.\s]{1,20}$" ForeColor="Red"/>

                     </td>
                    </tr>
                    <tr>
                        <td>
                    <asp:Label class="info" ID="phone" runat="server" Text="Phone: "></asp:Label>
                    </td>
                        <td>
                    <asp:TextBox CssClass="infoBox" type="text" runat="server" ID="txtPhone" placeholder="999-999-9999" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"></asp:TextBox>
                    
                    </td>
                        <td>
                         <asp:RegularExpressionValidator  runat="server"     
                                    ErrorMessage="Phone is incorrect format"
                                    ControlToValidate="txtPhone"     
                                    ValidationGroup="fieldrequired"
                                    ValidationExpression="\d{3}(-\d{3})(-\d{4})" ForeColor="Red"/>
                                    
                     </td>
                    </tr>
                    <tr>
                        <td>
                    <asp:Label class="info" ID="company" runat="server" Text="Company Name: "></asp:Label>
                    </td>
                        <td>
                    <asp:TextBox CssClass="infoBox" type="text" runat="server" ID="txtCompany" placeholder="BCIT"></asp:TextBox><span class="required"> *</span>
                    </td>
                        <td>
                     <asp:RequiredFieldValidator ControlToValidate="txtCompany" ValidationGroup="fieldrequired" CssClass="required" runat="server" ErrorMessage="Required" Display="Dynamic" Visible="True"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                    <tr>
                        <td>
                    <asp:Label class="info" ID="kname" runat="server" Text="Key Name: "></asp:Label>
                    </td>
                        <td>
                    <asp:TextBox CssClass="infoBox" type="text" runat="server" ID="txtKeyName" placeholder="a109"></asp:TextBox><span class="required"> *</span>
                    </td>
                        <td>
                    <asp:RequiredFieldValidator ControlToValidate="txtKeyName" ValidationGroup="fieldrequired" CssClass="required" runat="server" ErrorMessage="Required" Display="Dynamic" Visible="True"></asp:RequiredFieldValidator>
                </td>
                    </tr>
                </table>
                    <asp:Button type="submit" runat="server" id="btnSUbmit" text="Submit" OnClick="btnSubmit_Click" ValidationGroup="fieldrequired" onClientClick="if(Page_ClientValidate('fieldrequired')){this.disabled=true; this.value='Please wait..';}" UseSubmitBehavior="false"></asp:Button>
                </div>
            </div>
      
        <!-- /#primary -->
    </section>
    <!-- /content -->
</asp:Content>
