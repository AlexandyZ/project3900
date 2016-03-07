<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HRM system</title>
    <link rel="stylesheet" href="/Styles/main.css" />
</head>

<body>
    <form id="form1" runat="server">

        <!-- header -->
        <header>
            <!-- #shortcut -->
            <div id="show_username">
            </div>
            <!-- /#shortcut -->

            <!-- #bcitlogo -->
            <div id="bcitlogo">
                <img src="/Images/BCITlogo.svg" alt="BCIT logo" />
                <h1 id="sys_name">BCIT HRM DATABASE SYSTEM</h1>
            </div>
            <!-- /#bcitlogo -->

            <!-- #navbar -->
            <nav id="rshift_navbar">
                <div id="navbar">
                </div>
            </nav>
            <!-- /#navbar -->
        </header>
        <!-- /header -->

        <!-- banner -->
        <div id="banner">
            <h1>SYSTEM LOGIN</h1>
        </div>
        <!-- /banner -->

        <!-- content -->
        <section id="content">
            <div id="login">
                <div id="group_form">
                    <label for="username">Username</label>
                    <input class="control" name="username" id="usename" title="Username" type="username" required="requried" />
                    <label for="password">Password</label>
                    <input class="control" name="password" id="password" title="Password" type="password" required="required" />
                </div>
                <input class="submit" value="LOG IN" type="submit" />
            </div>
            <p><a href="forgetpw.aspx">Forget your password?</a></p>
        </section>
        <!-- /content -->
    </form>
    <!-- footer -->
    <footer>
        <div id="copyright">
            <p>&copy;2016    BCIT Housing</p>
        </div>
    </footer>
    <!-- /footer -->
</body>
</html>
