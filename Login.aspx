<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HRM system</title>
    <link rel="stylesheet" href="/Styles/main.css" />
</head>

<body>
    <form ID="form1" runat="server">
    <div class="header">
 
        <asp:Image ID="logo" runat="server" Height="151px" />
        <h1 class="">resource</h1>

    <!-- content -->   
    <section id="content">
        <div id="login">
            <span>abc</span>
    </div>
        <asp:Login ID="login" runat="server" OnAuthenticate="Login1_Authenticate">
        </asp:Login>
    </form>
    <!-- footer -->
    <footer>
        <div id="copyright">
            <p>Copyright&copy;2016    BCIT Housing</p>
        </div>
    </footer>
    <!-- /footer -->
</body>
</html>

