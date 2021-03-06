﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="eBookweb.UserHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>成功登入</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/Custom-Cs.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body style="background-image:url('Images/Home.jpg');background-size:cover;">
    <form id="form1" runat="server">
        <div>
            <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="Default.aspx">新北市消防局 e-Book</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="DefaultUser.aspx">書櫃首頁</a></li>
                            <li><a href="https://www.fire.ntpc.gov.tw/">關於我們</a></li>
                            <li><a href="https://www.fire.ntpc.gov.tw/">連絡我們</a></li>
                            <li>
                                <asp:Button ID="btUserHomeSignOut" runat="server" class="btn btn-default navbar-btn" Text="登出" OnClick="btUserHomeSignOut_Click" />
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <asp:Label ID="lbUserHomesuccess" runat="server" CssClass="text-success"></asp:Label>
    <h3>使用者您好, 歡迎光臨新北市消防局e-book</h3>
    <h3>請至書櫃首頁來觀看圖書</h3>
    <!---  Footer  -->
    <footer class="footer-pos">
        <div class="container">
            <p class="pull-right"><a href="#form1">Back to top</a></p>
            <p>&copy; 2018 github/LeoChang84.com &middot;</p>
        </div>
    </footer>
    <!---  Footer  -->

    </form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
