<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="eBookweb.SignIn" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>登入頁面</title>

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
<body>
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
                            <li><a href="Default.aspx">書櫃首頁</a></li>
                            <li><a href="https://www.fire.ntpc.gov.tw/">關於本局</a></li>
                            <li><a href="SignUp.aspx">註冊</a></li>
                            <li class="active"><a href="SignIn.aspx">登入</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--- Sign In  -->
        <div class="container">
            <div class="form-horizontal">
                <h4>Login</h4>
                <hr />
                <div class="form-group">
                    <asp:Label ID="lbSignInUserName" runat="server" CssClass="col-md-2 control-label" Text="帳號"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID = "tbSignInUserName" CssClass="form-contorl" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVSignInUserName" CssClass="text-danger" runat="server" ErrorMessage="請填入帳號" ControlToValidate="tbSignInUserName"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="lbSignInPws" runat="server" CssClass="col-md-2 control-label" Text="密碼"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID = "tbSignInPwd" CssClass="form-contorl" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVSignInPwd" CssClass="text-danger" runat="server" ErrorMessage="請填入密碼" ControlToValidate="tbSignInPwd"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:CheckBox ID = "cbSignInRmb" runat="server"></asp:CheckBox>
                        <asp:Label ID="lbSignInRmb" runat="server" CssClass="control-label" Text="記住我"></asp:Label>
                    </div>
                </div> 
                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btSignUplogin" runat="server" Text="登入" CssClass="btn btn-default" OnClick="btSignUplogin_Click" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Label ID="lberror" runat="server"></asp:Label>
                    </div>
                </div> 
            </div>
        </div>
        <!--- Sign In  -->


    </form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
