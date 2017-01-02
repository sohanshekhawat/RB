<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Blogger.aspx.cs" Inherits="index" %>
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
        <!-- Begin Main Wrapper -->
        <div class="container main-wrapper">
            <!-- End Main Banner -->
            <!--<div class="mag-content clearfix">
                <div class="row">
                    <div class="col-md-12">
                        <div class="ad728-wrapper">
                            <a href="#">
                                <img src="img/ban728.jpg" alt="" />
                            </a>
                        </div>
                    </div>
                </div>
            </div>-->
            <!-- End Main Banner -->
            <div class="main-content mag-content clearfix">
                
                <div class="row featured-wrapper">
                    <div class="col-md-12">
                        <div class="flexslider">
                            <div class="featured-slider">
                                <div class="slider-item">
                                    <div class="row">
                                        <div class="col-md-8 omega" style="width:100%">
                                            <div class="featured-big">
                                                <a href="#" class="featured-href">
                                                    <img src="img/slider.jpg" alt="">
                                                    <div class="featured-header">
                                                       
                                                        <h2>
                                                        Rajput</h2>
                                                     
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
                                        <div class="col-md-8 omega" style="width:100%">
                                            <div class="featured-big">
                                                <a href="#" class="featured-href">
                                                    <img src="img/slider1.jpg" alt="">
                                                    <div class="featured-header">
                                                       
                                                        <h2>
                                                        Rajput</h2>
                                                     
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
                                        <div class="col-md-8 omega" style="width:100%">
                                            <div class="featured-big">
                                                <a href="#" class="featured-href">
                                                    <img src="img/slider3.jpg" alt="">
                                                    <div class="featured-header">
                                                       
                                                        <h2>
                                                        Rajput</h2>
                                                     
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <!-- .row -->
                                </div>
                                <div class="slider-item">
                                    <div class="row">
                                        <div class="col-md-8 omega" style="width:100%">
                                            <div class="featured-big">
                                                <a href="#" class="featured-href">
                                                    <img src="img/slider4.jpg" alt="">
                                                    <div class="featured-header">
                                                       
                                                        <h2>
                                                        Rajput</h2>
                                                     
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
                        <!-- BEGIN BLOCK 2 -->
                        <!-- End Main Banner -->
                        <div class="row blog-content">
                            <div class="col-md-8" style="width: 100%;">
                                <h3 class="tag-title">
                                    Top 10 <span>Blogger</span></h3>
                                <div id="tppost" runat="server">
                                </div>
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
        <li role="presentation" class="active"><a href="#tab-popular" aria-controls="tab-popular" role="tab" data-toggle="tab">Top Recent Post</a></li>
     
     
      </ul>

      <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="tab-popular">
        <div id="postpop" runat="server">
         
        </div><!-- Popular posts -->
        </div>
        <!-- Recent Posts -->

        <div role="tabpanel" class="tab-pane" id="tab-comments">
          <div class="widget-post clearfix">  
            <div class="author-thumb">
              <a href="#">
                <img src="img/author1.jpg" alt="">
              </a>
            </div>
            <div>
              <h3>
                <a href="#">How to Buy the Right Headphones</a>
              </h3>
              <p class="simple-share">
                <span><i class="fa fa-clock-o"></i> 12 minutes ago</span>
              </p>
            </div>
          </div>

          <div class="widget-post clearfix">  
            <div class="author-thumb">
              <a href="#">
                <img src="img/author2.jpg" alt="">
              </a>
            </div>
            <div>
              <h3>
                <a href="#">6 Tips Before Traveling Internationally</a>
              </h3>
              <p class="simple-share">
                <span><i class="fa fa-clock-o"></i> 26 minutes ago</span>
              </p>
            </div>
          </div>

          <div class="widget-post clearfix">  
            <div class="author-thumb">
              <a href="#">
                <img src="img/author1.jpg" alt="">
              </a>
            </div>
            <div>
              <h3>
                <a href="#">The Partnership of Coffee and Tech</a>
              </h3>
              <p class="simple-share">
                <span><i class="fa fa-clock-o"></i> 34 minutes ago</span>
              </p>
            </div>
          </div>

          <div class="widget-post clearfix">  
            <div class="author-thumb">
              <a href="#">
                <img src="img/author3.jpg" alt="">
              </a>
            </div>
            <div>
              <h3>
                <a href="#">8 Ways to Know If Your Business Is Ready to Franchise</a>
              </h3>
              <p class="simple-share">
                <span><i class="fa fa-clock-o"></i> 40 minutes ago</span>
              </p>
            </div>
          </div>

          <div class="widget-post clearfix">  
            <div class="author-thumb">
              <a href="#">
                <img src="img/author-thumb.jpg" alt="">
              </a>
            </div>
            <div>
              <h3>
                <a href="#">Tickets and prices for Metro and public transport in Milan</a>
              </h3>
              <p class="simple-share">
                <span><i class="fa fa-clock-o"></i> 54 minutes ago</span>
              </p>
            </div>
          </div>
        </div><!-- Comments -->
      </div>
    </div>

    

    <!-- End review widget -->

    

  </aside>
                    </div>
                    <!-- End last column -->
                </div>
                <!-- .main-body -->
                <section class="admag-block">
  <%--<div class="main-content mag-content clearfix">
     <div class="row" data-stickyparent>
        <div class="col-md-8" style="width:100%;">

     <h3 class="block-title"><span>Top 5 Blogger</span></h3>
    <div id="blog" runat="server">
                                </div>

          

          

          

          <div class="load-more">
            <button type="button" class="btn btn-lg btn-block">Load more</button>
          </div>

        </div><!-- End Left big column -->
        
        <!-- End last column -->        
      </div><!-- .main-body -->
      
    </div>--%>
        </section>
                <!-- .admag-block -->
             
                <!-- .admag-block -->
            </div>
            <!-- .main-content -->
            <!-- End Main Banner -->
            <!-- End Main Banner -->
        </div>
        <!-- .main-wrapper -->
        <!-- Footer -->
        <footer class="footer source-org vcard copyright clearfix" id="footer" role="contentinfo">
  <div class="footer-main">
    <div class="fixed-main">
      <div class="container">
        <div class="mag-content">
          <div class="row">
            <div class="col-md-4">
              <div class="footer-block clearfix">
                <p class="clearfix">
                  <a class="logo" href="#"  rel="home">
                     <img alt="rajput" src="img/nest_logo.png" />
                  </a><!-- .logo -->
                </p>
              
                <ul class="social-list clearfix">
                  <li class="social-facebook">
                    <a href="#" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Facebook">
                      <i class="fa fa-facebook"></i>
                    </a>
                  </li>
                  <li class="social-twitter" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Twitter">
                    <a href="#">
                      <i class="fa fa-twitter"></i>
                    </a>
                  </li>
                  <li class="social-gplus">
                    <a href="#" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Google+">
                      <i class="fa fa-google-plus"></i>
                    </a>
                  </li>
                  <li class="social-youtube">
                    <a href="#" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Youtube">
                      <i class="fa fa-youtube"></i>
                    </a>
                  </li>
                  <li class="social-instagram">
                    <a href="#" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Instagram">
                      <i class="fa fa-instagram"></i>
                    </a>
                  </li>
                  <li class="social-pinterest">
                    <a href="#" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Pinterest">
                      <i class="fa fa-pinterest"></i>
                    </a>
                  </li>
                  <li class="social-rss">
                    <a href="#" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="RSS">
                      <i class="fa fa-rss"></i>
                    </a>
                  </li>
                </ul>
              </div><!-- Footer Block -->
            </div>
            <div class="col-md-2">
              <div class="footer-block clearfix">
                <h3 class="footer-title">Categories</h3>
                <ul class="footer-menu">
                  <li><a href="#">Tech</a></li>
                  <li><a href="#">Lifestyle</a></li>
                  <li><a href="#">Business</a></li>
                  <li><a href="#">Entertainment</a></li>
                  <li><a href="#">Social</a></li>
                  <li><a href="#">Politics</a></li>
                </ul>
              </div><!-- Footer Block -->
            </div>

            

            <div class="col-md-3">
              <div class="footer-block clearfix">
                <h3 class="footer-title">Newsletter</h3>
                <p>The more you tighten your grip, Tarkin, the more star systems will slip through your fingers.</p>
                <form>
                  <div class="form-group">
                    <input type="text" class="form-control" placeholder="Enter your email">
                  </div>
                  <div class="form-group">
                      <button class="btn btn-default" type="button">Subscribe</button>
                  </div>
                </form>
              </div><!-- Footer Block -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

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
    <!-- Mobile Menu -->
    <nav id="mobile-nav">
  <div>
    <ul>
      <li>
        <a href="#">Home</a>
        <ul>
          <li><a href="#">Home - All Block</a></li>
          <li>
            <a href="#">Home - Grid Style</a>
            <ul>
              <li><a href="#">With Sidebar</a></li>
              <li><a href="#">No Sidebar</a></li>
            </ul>
          </li>
          <li>
            <a href="#">Home - Blog Style</a>
            <ul>
              <li><a href="#">Classic Blog</a></li>
              <li><a href="#">Modern Blog</a></li>
            </ul>
          </li>
          <li>
            <a href="#">Home - Minimal Style</a>
            <ul>
              <li><a href="#">2 Columns</a></li>
              <li><a href="#">2 Columns With Sidebar</a></li>
              <li><a href="#">3 Columns</a></li>
            </ul>
          </li>
          <li>
            <a href="#">Home - Fixed Sidebar</a>
            <ul>
              <li><a href="#">Fixed Left Sidebar</a></li>
              <li><a href="#">Fixed Right Sidebar</a></li>
            </ul>
          </li>
          <li>
            <a href="#">Home - 3 Different Columns</a>
            <ul>
              <li><a href="#">Left Big Column</a></li>
              <li><a href="#">Right Big Column</a></li>
            </ul>
          </li>
        </ul>
      </li>
      
      <li>
        <a href="#">Tech</a>
        <ul>
          <li><a href="#">Reviews</a></li>
          <li><a href="#">Apps</a></li>
          <li><a href="#">Design</a></li>
          <li><a href="#">Gadgets</a></li>
          <li><a href="#">Mobile</a></li>
        </ul>
      </li>

      <li>
        <a href="#">Lifestyle</a>
        <ul>
          <li><a href="#">Love</a></li>
          <li><a href="#">Advice</a></li>
          <li><a href="#">Food</a></li>
          <li><a href="#">Travel</a></li>
          <li><a href="#">Fashion</a></li>
        </ul>
      </li>

      <li><a href="#">Business</a></li>

      <li><a href="#">Entertainment</a></li>

      <li>
        <a href="#">Features</a>
        <ul>
          <li>
            <a href="#">Header Style</a>
            <ul>
              <li><a href="#">Header Style 1</a></li>
              <li><a href="#">Header Style 2</a></li>
              <li><a href="#">Header Style 3</a></li>
              <li><a href="#">Header Style 4</a></li>
            </ul>
          </li><!-- .dropdown-submenu -->
          <li>
            <a href="#">Footer Style</a>
            <ul>
              <li><a href="#">Footer Style 1</a></li>
              <li><a href="#">Footer Style 2</a></li>
            </ul>
          </li><!-- .dropdown-submenu -->

          <li>
            <a href="#">Pages</a>
            <ul>
              <li><a href="#">About Page</a></li>
              <li><a href="#">Contact Page</a></li>
              <li><a href="#">Author page</a></li>
              <li><a href="#">Tags page</a></li>
              <li><a href="#">Search page</a></li>
              <li><a href="#">404 page</a></li>
            </ul>
          </li><!-- .dropdown-submenu -->

          <li>
            <a href="#">Posts</a>
            <ul>
              <li><a href="#">Simple Post</a></li>
              <li><a href="#">Review Post</a></li>
              <li><a href="#">Parallax post</a></li>
              <li><a href="#">Full Width Post</a></li>
              <li><a href="#">Fixed Sidebar Post</a></li>
              <li><a href="#">Gallery Post</a></li>
              <li><a href="#>Video Post</a></li>
            </ul>
          </li><!-- .dropdown-submenu -->

          <li>
            <a href="#">Category Layouts</a>
            <ul>
              <li><a href="#">Classic blog</a></li>
              <li><a href="#">Modern blog</a></li>
              <li><a href="#">Grid blog</a></li>
              <li><a href="#">Minimal blog</a></li>
              <li><a href="#">Fixed sidebar blog</a></li>
              <li><a href="#">Left big column blog</a></li>
            </ul>
          </li><!-- .dropdown-submenu -->

          <li><a href="#">Typography</a></li>
          <li><a href="#">Shortcodes</a></li>
        </ul><!-- dropdown-menu -->
      </li>
    </ul>
  </div>
</nav>
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
    <!-- Google map api -->
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
    <!-- Theme js -->
    <script src="js/script.min.js"></script>
    </form>
</body>
</html>
