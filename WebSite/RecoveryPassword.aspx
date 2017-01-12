<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecoveryPassword.aspx.cs" Inherits="RecoveryPassword" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>Rajputbooks</title>
    <meta name="keywords" content="HTML5 Template">
    <meta name="description" content="ADMAG — Responsive Blog & Magazine HTML Template">
    <meta name="author" content="digitaltheme.co">
    <meta class="viewport" name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
    <link href="css/new_login.css" rel="stylesheet" type="text/css" />
    <!-- Theme CSS -->
    <link rel="stylesheet" href="css/style.min.css">


    <link href="css/CropBoxStyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>

    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }

        input[type=text], input[type=password] {
            width: 200px;
        }

        table {
            border: 1px solid #ccc;
        }

            table th {
                background-color: #F7F7F7;
                color: #333;
                font-weight: bold;
            }

            table th, table td {
                padding: 5px;
                border-color: #ccc;
            }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server">
        </asp:ScriptManager>
        <div id="main" class="header-style1">
            <header class="header-wrapper clearfix">

    <div class="header" id="header">
      <div class="container">
        <div class="mag-content">
          <div class="row">
            <div class="col-md-12">
                          <!-- Mobile Menu Button -->
            <a class="navbar-toggle collapsed" id="nav-button" href="#mobile-nav">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </a><!-- .navbar-toggle -->

            <!-- Main Nav Wrapper -->
            <nav class="navbar mega-menu">
              <a class="logo" href="#" title="Admag - Responsive magazine HTML Template" rel="home">
                <img src="img/nest_logo.png" alt="RajputBooks" />
              </a><!-- .logo -->
              
              <!-- Navigation Menu -->
               <div class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li class="dropdown menu-color1">
                  <a href="Default.aspx"  data-toggle="dropdown" role="button" aria-expanded="false">Home</a>
                  <!-- .dropdown-menu -->
                </li><!-- .dropdown .menu-color1 -->

                <!-- Fullwith Mega Menu -->
                <li class="dropdown mega-full menu-color2">
                  <a href="Organization.aspx"  data-toggle="dropdown" role="button" aria-expanded="false">Organization</a>
                  <!-- .dropdown-menu .fullwidth -->
                </li><!-- .dropdown .mega-full .menu-color2 -->
                <!-- End Mega Menu -->

                <li class="dropdown mega-full menu-color3">
                  <a href="Blogger.aspx"  data-toggle="dropdown" role="button" aria-expanded="false">Blogger</a>
                  <!-- .dropdown-menu .fullwidth -->
                </li><!-- .dropdown .mega-full .menu-color3 -->
                <!-- / Mega Menu -->

                <!-- List Menu -->
                <li class="dropdown mega-full menu-color4">
                  <a href="Post.aspx"  data-toggle="dropdown" role="button" aria-expanded="false">Post</a>
                  <!-- .dropdown-menu .fullwidth -->
                </li><!-- .dropdown .mega-full .menu-color4 -->

                <!-- Mega Menu -->
             
                <!-- Dropdown List Menu -->
               
                
              </ul><!-- .nav .navbar-nav -->
            </div><!-- .navbar-collapse -->              <!-- End Navigation Menu -->
            
           
            
               
               <div   style="padding-top:15px;padding-right:12%;float:right;">
               <a href="Signup.aspx" style="color:#D3D3D3 !important">Register</a>
              </div>
              
            </nav><!-- .navbar -->
            </div>
          </div>
        </div><!-- .mag-content -->
      </div><!-- .container -->
    </div><!-- .header -->
    
  </header>
            <!-- .header-wrapper -->
            <!-- Begin Main Wrapper -->
            <div class="container main-wrapper">

                <div class="login_signup_bg clearfix">
                    <div class="login-warrper signup_section">
                        <div class="login_bg">

                            <asp:PasswordRecovery runat="server" ID="Login1" OnVerifyingUser="Login1_VerifyingUser" SuccessPageUrl="~/Login.aspx" UserNameFailureText="Please try again with registerd email address." >
                                <UserNameTemplate>
                                    <label> Your Password?</label>
                                    <label>Enter your email address to receive your password</label>
                                    
                                    <asp:TextBox ID="UserName" runat="server" class="social_textbox" placeholder="Enter email" Width="300px"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="ctl02">*</asp:RequiredFieldValidator>
                                     <br />

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="ctl02"
                                        ErrorMessage="Invalid Email" ControlToValidate="UserName" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ForeColor="Red" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                    <br />
                                    

                                    <asp:Label ID="FailureText" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
   
                                    <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" Text="Submit" ValidationGroup="ctl02" />
                                            

                                </UserNameTemplate>
                            </asp:PasswordRecovery>
                            <br />

                        </div>
                    </div>
                </div>

            </div>
            <footer class="footer source-org vcard copyright clearfix" id="footer" role="contentinfo">

                  <div class="footer-bottom clearfix">
    <div class="fixed-main">
      <div class="container">
        <div class="mag-content">
          <div class="row">
            <div class="col-md-6">
              <p>Copyright Rajputbooks © 2015. All Rights Reserved</p>
            </div>

            <div class="col-md-6">
              <div class="social-icons pull-right">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-rss"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
            </footer>

        </div>
        <!-- End Main -->
        <!-- Mobile Menu -->
        <nav id="mobile-nav"></nav>
        <!-- / Mobile Menu -->
        <div id="go-top-button" class="fa fa-angle-up" title="Scroll To Top">
        </div>
        <div class="mobile-overlay" id="mobile-overlay">
        </div>
        <!-- Style Customizer -->
        <!-- Jquery js -->
        <script src="js/jquery-1.11.2.min.js"></script>
        <!-- Modernizr -->
        <script src="js/modernizr.min.js"></script>
        <!-- Bootstrap js -->
        <script src="plugins/bootstrap/js/bootstrap.js"></script>
        <!-- Theme js -->
        <script src="js/script.min.js"></script>
    </form>
</body>
</html>
