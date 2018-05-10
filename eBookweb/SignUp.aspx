<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="eBookweb.SignUp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/Custom-Cs.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <!---  Middle Content  -->
    <form id="form1" runat="server">
    <div>
        <div class="navbar navbar-default navbar-fixed-top" role ="navigation">
            <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button><span>
                        <a class="navbar-brand" href="Default.aspx">新北市政府消防局 E-BOOK</a>
                        </span>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Default.aspx">Home</a></li>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Contact</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Top</a></li>
                                    <li><a href="#">Leggings</a></li>
                                    <li><a href="#">Denims</a></li>
                                </ul>
                            </li>
                            <li class="active"><a href="SignUp.aspx">Sign Up</li>
                        </ul>
                    </div>
                </div>
        </div>
    </div>
    <!---  Middle Content  -->

    <!---  Sign Up  -->
    <div class="center-page">

        <label class="col-xs-11">帳號</label>
        <div class="col-xs-11">
        <asp:TextBox ID="tbUname" runat="server" class="form-control" placeholder="輸入帳號"></asp:TextBox>
        </div>

        <label class="col-xs-11">信箱</label>
        <div class="col-xs-11">
        <asp:TextBox ID="tbEmail" runat="server" class="form-control" placeholder="輸入信箱"></asp:TextBox>
        </div>

        <label class="col-xs-11">密碼</label>
        <div class="col-xs-11">
        <asp:TextBox ID="tbPwd" runat="server" class="form-control" placeholder="輸入密碼"></asp:TextBox>
        </div>

        <label class="col-xs-11">確認密碼</label>
        <div class="col-xs-11">
        <asp:TextBox ID="tbConPwd" runat="server" class="form-control" placeholder="請確認密碼"></asp:TextBox>
        </div>
        <div class="col-xs-11 space-vert">
        <asp:Button ID="btSignUp" runat="server" class="btn btn-success" Text="註冊" OnClick="btSignUp_Click" />
        </div>
        

    </div>
    


    <!---  Sign Up  -->

    <!---  Footer  -->
    <footer class="footer-pos">
        <div class="container">
            <p class="pull-right"><a href="#">Back to top</a></p>
            <p>&copy; 2018 github/LeoChang84.com &middot; <a href="Default.aspx">Home</a> &middot; <a href="#">About</a> &middot; <a href="#">Contact</a></a></p>
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
