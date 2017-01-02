<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="Usercontrol_Header" %>
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
               <a href="Signup.aspx" style="color:#D3D3D3 !important">SignUp</a>
              </div>

              <%-- <div class="header-right">
            
                <%--<div class="social-icons">
                  <a href="#" data-toggle="tooltip" data-placement="bottom" title="Facebook"><i class="fa fa-facebook fa-lg"></i></a>
                  <a href="#" data-toggle="tooltip" data-placement="bottom" title="Twitter"><i class="fa fa-twitter fa-lg"></i></a>
                  <a href="#" data-toggle="tooltip" data-placement="bottom" title="Google+"><i class="fa fa-google-plus fa-lg"></i></a>
                  <!-- Only for Fixed Sidebar Layout -->
                  <a href="#" class="fixed-button navbar-toggle" id="fixed-button">
                    <i></i>
                    <i></i>
                    <i></i>
                    <i></i>
                  </a><!-- .fixed-button -->
                </div>--%><!-- .social-icons -->
              <%--</div>--%><!-- .header-right -->

            </nav><!-- .navbar -->

            <div id="sb-search" class="sb-search">
              <form>
                <input class="sb-search-input" placeholder="Enter your search text..." type="text" value="" name="search" id="search">
                <input class="sb-search-submit" type="submit" value="">
                <span class="sb-icon-search fa fa-search" data-toggle="tooltip" data-placement="bottom" title="Search"></span>
              </form>
            </div><!-- .sb-search -->            </div>
          </div>
        </div><!-- .mag-content -->
      </div><!-- .container -->
    </div>