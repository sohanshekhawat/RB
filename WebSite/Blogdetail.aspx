<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Blogdetail.aspx.cs" Inherits="Blogdetail" %>

<%@ Register Src="~/Usercontrol/Header.ascx" TagPrefix="uc" TagName="Header" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>Rajputbooks</title>
    <meta name="keywords" content="HTML5 Template">
    <meta name="description" content="ADMAG — Responsive Blog & Magazine HTML Template">
    <meta name="author" content="digitaltheme.co">
    <meta class="viewport" name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <!-- Google Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Roboto:100,300,300italic,400,400italic,500,700,700italic,900"
        rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700,700italic"
        rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Raleway:900" rel="stylesheet"
        type="text/css">
    <!-- Icon Font -->
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
    <!-- Theme CSS -->
    <link rel="stylesheet" href="css/style.min.css">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <div id="main" class="header-style1">
            <header class="header-wrapper clearfix">
                 <uc:Header ID="head" runat="server" /><!-- .header -->
             </header>
            <!-- .header-wrapper -->
            <div class="container main-wrapper">
                <!-- End Main Banner -->


                <!-- End Main Banner -->
                <div class="main-content mag-content clearfix" data-stickyparent>
                    <div class="row blog-content">
                        <div class="col-md-8">
                            <h3 class="block-title">
                                <span>Blogger Detail</span></h3>
                             <div id="blogerdetail" runat="server"/>
                            
                        </div>
                        <!-- End Left big column -->
                        <div class="col-md-4" data-stickycolumn>
                            <aside class="sidebar clearfix">
                                <div class="widget author-widget">
                                        <div id="postall" runat="server">       
                                </div>
                                <div class="widget adwidget">
                                  <a href="#"><img src="img/ban300.jpg" alt=""/></a>
                                </div>
                            </aside>
                        </div>
                        <!-- End last column -->
                    </div>
                    <!-- .main-body -->
                </div>
                <!-- .main-content -->
                <!-- End Main Banner -->

                <!-- End Main Banner -->
            </div>
            <!-- .main-wrapper -->
            <!-- Footer -->
            <footer class="footer source-org vcard copyright clearfix" id="footer" role="contentinfo">


  <div class="footer-bottom clearfix">
    <div class="fixed-main">
      <div class="container">
        <div class="mag-content">
          <div class="row">
            <div class="col-md-6">
              <p>Copyright Admag © 2015. All Rights Reserved</p>
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
            <!-- End Footer -->
        </div>
        <!-- End Main -->

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
        <!-- Google map api -->
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
        <!-- Theme js -->
        <script src="js/script.min.js"></script>
    </form>
</body>
</html>
