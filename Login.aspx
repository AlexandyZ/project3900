<%@ Page Language="C#" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HRM system</title>
    <link rel="stylesheet" href="/Styles/main.css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 329px;
        }

        .auto-style3 {
            width: 329px;
            height: 19px;
        }

        .auto-style4 {
            height: 19px;
        }

        .auto-style5 {
            width: 329px;
            text-align: right;
        }

        .auto-style6 {
            width: 405px;
        }

        .auto-style7 {
            height: 19px;
            width: 405px;
        }
    </style>
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
                    <h1 class="sysfont">BCIT HRS DATABASE SYSTEM</h1>
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
        <div class="banner">
            <h1>SIGN IN</h1>
        </div>
        <!-- /banner -->

        <!-- content -->
        <section class="content">
            <div id="login">
                <div id="group_form">

                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style5">Username</td>
                            <td class="auto-style6">
                                <asp:TextBox ID="TextBoxUsername" runat="server" Width="180px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="Please enter user name" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Password</td>
                            <td class="auto-style6">
                                <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Please enter password" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style6">
                                <asp:Button ID="Button_login" runat="server" OnClick="Button_login_Click" Text="Login" Width="150px" />
                                <div id="login0">
                                    <div id="group_form0">
                                    </div>
                                </div>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3"></td>
                            <td class="auto-style7">
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style4"></td>
                        </tr>
                    </table>

                </div>
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
