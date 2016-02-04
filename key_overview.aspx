<%@ Page Language="C#" AutoEventWireup="true" CodeFile="key_overview.aspx.cs" Inherits="key_overview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RMS</title>
</head>

<body>
    <form id="form1" runat="server">

    <header>
    
        <asp:Image id="Image1" runat="server" Height="110px" Width="143px" />
        <div>
            <div> 
                <table id="username">
                <tr>
                    <td><p id="display">username</p></td>
                    <td><asp:LoginStatus ID="LoginStatus1" runat="server" OnLoggingOut="LoginStatus1_LoggingOut" /></td>
                </tr>
                </table>
            </div>
            <div>
                <h1>RMS KEY</h1>
            </div>
            <div id="navbar">
                <ul id="nav">
                    <li><a href="key_lend.aspx">Key</a></li>
                    <li><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="key_lend.aspx">Game</asp:HyperLink></li>
                    <li><asp:HyperLink ID="HyperLink3" runat="server">Package</asp:HyperLink></li>
                    <li><asp:HyperLink ID="HyperLink4" runat="server">Import</asp:HyperLink></li>
                </ul>
            </div>
        </div>
    </header>
   
    <div id="content">
        <div id="menuBar">
            <ul>
                <li><a href="">item</a></li>
                <li><a href="">item</a></li>
                <li><a href="">item</a></li>
            </ul>
        </div>

        <div id="main">
        </div>
    </div>
    
    </form>
    <footer>
        <div>
            <small>Copyright&copy;2016    Maquinna Residenc</small>
        </div>
    </footer>
</body>
</html>
