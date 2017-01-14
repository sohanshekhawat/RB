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
              <a class="logo" href="default.aspx" title="RajputGatha - Connecting Rajputs" rel="home">
                <img src="img/nest_logo.png" alt="RajputGatha - Connecting Rajputs" />
              </a>
              
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

              </ul>


            </div>

              <div style="float:right;" id="logindiv" runat="server">
                    <ul class="nav navbar-nav">
              
                        <li class="dropdown menu-color1">
                            <a href="Signup.aspx" data-toggle="dropdown" role="button" aria-expanded="false">Registration</a>
                        </li><!-- .dropdown .menu-color1 -->

                        <li class="dropdown menu-color1">
                            <a href="Login.aspx" data-toggle="dropdown" role="button" aria-expanded="false">Login</a>
                        </li><!-- .dropdown .menu-color1 -->

                    </ul>
              </div>

              <div style="float:right;" id="logoffdiv" runat="server">
                    <ul class="nav navbar-nav">
              
                        <li class="dropdown menu-color1">
                            <a href="ViewProfile.aspx" data-toggle="dropdown" role="button" aria-expanded="false">Profile</a>
                        </li><!-- .dropdown .menu-color1 -->

                        <li class="dropdown menu-color1">
                            <a href="#" data-toggle="dropdown" role="button" aria-expanded="false">Change password</a>
                        </li><!-- .dropdown .menu-color1 -->
                         <li class="dropdown menu-color1">
                            <a href="#" data-toggle="dropdown" role="button" aria-expanded="false">Loggof</a>
                        </li>

                    </ul>
              </div>

            </nav>

            </div>
          </div>
        </div><!-- .mag-content -->
      </div><!-- .container -->
    </div>