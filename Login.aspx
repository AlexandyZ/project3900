<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form ID="form1" runat="server">
    <div class="header">
 
        <asp:Image ID="logo" runat="server" Height="151px" />
        <h1 class="">resource</h1>

    </div>
        <asp:Login ID="login" runat="server" OnAuthenticate="Login1_Authenticate">
        </asp:Login>
    </form>
</body>
</html>
