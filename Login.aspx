<%@ Page Language="C#" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BCIT HRS</title>
    <link rel="stylesheet" href="/Styles/main.css" />
    <link rel="stylesheet" href="/Styles/login.css" />
</head>

<body>
    <form id="form1" runat="server">

        <!-- header -->
        <header>
            <!-- #shortcut -->
            <div class="show_username">
            </div>
            <!-- /#shortcut -->
            <!-- #bcitlogo -->
            <div class="bcitlogo">
                <img class="toplogo" src="/Images/BCITlogo.svg" alt="BCIT logo" />
                <div class="sysname">
                    <h1 class="sysfont">HOUSING RESOURCE SYSTEM</h1>
                </div>
            </div>
            <!-- /#bcitlogo -->
            <!-- #navbar -->
            <nav class="rshift_navbar">
            </nav>
            <!-- /#navbar -->
        </header>
        <!-- /header -->

        <!-- banner -->
        <div id="banner">
            <h1>SIGN IN</h1>
        </div>
        <!-- /banner -->

        <!-- content -->
        <section id="content">
                <div id="main">
                    <table id="table">
                        <tr>
                            <td>
                                <label class="info">Username</label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxUsername" runat="server"
                                    CssClass="infoBox"
                                    OnTextChanged="Username_onTextChanged"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="validUsername" CssClass="required" runat="server" Text="" Display="Dynamic"></asp:Label>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="Please enter username" CssClass="required" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="info">Password</label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxPassword" runat="server" 
                                    TextMode="Password"
                                    CssClass="infoBox"></asp:TextBox>
                            </td>
                            <td>   
                                <asp:Label ID="validPassword" CssClass="required" runat="server" Text="" Display="Dynamic"></asp:Label>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Please enter password" CssClass="required" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="Button_login" runat="server" OnClick="Button_login_Click" Text="Login" />
                </div>
        </section>
        <!-- /content -->
    </form>
    <!-- footer -->
    <footer>
        <div class="copyright">
            <p>&copy;2016    BCIT Housing</p>
        </div>
    </footer>
    <!-- /footer -->
</body>
</html>
