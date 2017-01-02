<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="index" EnableEventValidation="false" %>

<%@ Register Src="~/Usercontrol/Header.ascx" TagPrefix="uc" TagName="Header" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>Rajputbooks</title>
    <meta name="keywords" content="RajputBooks">
    <meta name="description" content="RajputBooks">
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
                <uc:Header ID="head" runat="server" />
            </header>

            <!-- Begin Main Wrapper -->
            <div class="container main-wrapper">
                <div class="main-content mag-content clearfix">
                    <div class="row featured-wrapper">
                        <div class="col-md-12">
                            <div class="flexslider">
                                <div class="featured-slider">
                                    <div class="slider-item">
                                        <div class="row">
                                            <div class="col-md-8 omega" style="width: 100%">
                                                <div class="featured-big">
                                                    <a href="#" class="featured-href">
                                                        <img src="img/slider.jpg" alt="">
                                                        <div class="featured-header">
                                                            <h2>Rajput</h2>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- .row -->
                                    </div>
                                    <!-- .slider-item -->
                                    <div class="slider-item">
                                        <div class="row">
                                            <div class="col-md-8 omega" style="width: 100%">
                                                <div class="featured-big">
                                                    <a href="#" class="featured-href">
                                                        <img src="img/slider1.jpg" alt="">
                                                        <div class="featured-header">
                                                            <h2>Rajput</h2>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- .row -->
                                    </div>
                                    <!-- .slider-item -->
                                    <div class="slider-item">
                                        <div class="row">
                                            <div class="col-md-8 omega" style="width: 100%">
                                                <div class="featured-big">
                                                    <a href="#" class="featured-href">
                                                        <img src="img/slider3.jpg" alt="">
                                                        <div class="featured-header">
                                                            <h2>Rajput</h2>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- .row -->
                                    </div>
                                    <div class="slider-item">
                                        <div class="row">
                                            <div class="col-md-8 omega" style="width: 100%">
                                                <div class="featured-big">
                                                    <a href="#" class="featured-href">
                                                        <img src="img/slider4.jpg" alt="">
                                                        <div class="featured-header">
                                                            <h2>Rajput</h2>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- .row -->
                                    </div>
                                </div>
                                <!-- .featured-slider -->
                            </div>
                            <!-- .flexslider -->
                        </div>
                    </div>
                    
                    <!-- .featured-wrapper -->
                    <div class="row main-body" data-stickyparent>
                        <div class="col-md-8">
                            
                            <!-- End Main Banner -->
                            <div class="row blog-content">
                                <div class="col-md-8" style="width: 100%;">
                                    <h3 class="tag-title">Top 10 <span>Post</span></h3>
                                    <asp:DataList ID="allpostlist" runat="server" OnItemCommand="allpostlist_ItemCommand">
                                        <ItemTemplate>
                                            <article class="simple-post simple-big clearfix">
                                  <div class="simple-thumb" style="width:160px;">
                                  <asp:Label Text='<%# Eval("Post_id") %>' ID="lblidpost" ForeColor="#000" runat="server" Visible="false" />
                                
                                   <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%# Eval("Image","~/siteimages/postImg/{0}") %>' style="height:115px;width:170px" CommandArgument='<%# Eval("Post_id") %>' CommandName="postlist"/>  </div>
                                   <header><p class="simple-share"> By&nbsp;>>&nbsp;<asp:Label Text='<%# Eval("bloggername") %>' ID="lblblogbm" ForeColor="#000" runat="server"  CommandArgument='<%# Eval("Post_id") %>' CommandName="postlist"></asp:Label> <span>&nbsp;|&nbsp;<asp:Label Text='<%# Eval("EntryDate") %>' ID="lbltime" ForeColor="#000" runat="server" /></span></p>
                                 <h3><asp:LinkButton Text='<%# Eval("PostTitle") %>' ID="Label2" ForeColor="#000" runat="server" CommandArgument='<%# Eval("Post_id") %>' CommandName="postlist"/></h3>
                                
                                <p class="excerpt" style="text-align: justify;"><asp:Label Text='<%# Eval("PostContent") %>' ID="Label3" ForeColor="#000" runat="server" /><asp:LinkButton Text='Read More' ID="LinkButton1" CssClass="ReadMore" runat="server" CommandArgument='<%# Eval("Post_id") %>' CommandName="postlist"/></p></header></article>
                                            </hr>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4" data-stickycolumn>
                            <aside class="sidebar clearfix">

                                 <div class="widget adwidget">
      <a href="#"><img src="img/ban300.jpg" alt=""/></a>
    </div>

                                 <div class="widget searchwidget">
      <form class="searchwidget-form">
        <div class="input-group">
          <input type="text" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
            <button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
          </span>
        </div>
      </form>
    </div>

                                 <div class="widget tabwidget">
      <ul class="nav nav-tabs" role="tablist" id="widget-tab">
        <li role="presentation" class="active"><a href="#tab-popular" aria-controls="tab-popular" role="tab" data-toggle="tab">Organization</a></li>
        <li role="presentation"><a href="#tab-recent" aria-controls="tab-recent" role="tab" data-toggle="tab">Blogger</a></li>
     
      </ul>

      <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="tab-popular">
        <div id="postpop" runat="server">
         
        </div><!-- Popular posts -->
        </div>
        <div role="tabpanel" class="tab-pane" id="tab-recent">
        <div id="bloggerpop" runat="server">
          
          </div>
        </div>      </div>
    </div>

                            </aside>
                        </div>
                        <!-- End last column -->
                    </div>
                </div>
                <!-- .main-content -->
                
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
