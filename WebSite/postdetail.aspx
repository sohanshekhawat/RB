<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/postdetail.aspx.cs" Inherits="postdetail" %>

<%@ Register Src="~/Usercontrol/Header.ascx" TagPrefix="uc" TagName="Header" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8">
	<title>Rajputbooks</title>
	<meta name="keywords" content="RajputBooks">
	<meta name="description" content="RajputBooks">
	<meta name="author" content="RajputBooks">
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
	<div id="fb-root">
	</div>
	<!-- USE 'Asynchronous Loading' version, for IE8 to work
	http://developers.facebook.com/docs/reference/javascript/FB.init/ -->
	<script type="text/javascript">
		window.fbAsyncInit = function () {
			FB.init({
				appId: '1016223435094859',
				status: true, // check login status
				cookie: true, // enable cookies to allow the server to access the session
				xfbml: true  // parse XFBML
			});
		};

		(function () {
			var e = document.createElement('script');
			e.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
			e.async = true;
			document.getElementById('fb-root').appendChild(e);
		}());
	</script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#share_button').click(function (e) {
				e.preventDefault();

				var ImageUrl = '<%= Session["ImageUrl"].ToString() %>';
				var caption = '<%= Session["caption"].ToString() %>';
				var description = '<%= Session["description"].ToString() %>';
				var link = '<%= Session["link"].ToString() %>';

				FB.ui(
	                {
		                method: 'feed',
		                name: 'Rajputbooks Blog',
		                link: link,
		                picture: ImageUrl,
		                caption: caption,
		                description: description,
		                message: ''
	                });
			});
		});
	</script>
	<form id="form1" runat="server">
	<div id="main" class="header-style1">
			<header class="header-wrapper clearfix">
            	 <uc:Header ID="head" runat="server" /><!-- .header -->
	       </header>
			<!-- .header-wrapper -->
			<div class="container main-wrapper">
				<!-- End Main Banner -->
				<!-- End Main Banner -->
				<div class="main-content mag-content clearfix">
					<div class="row blog-content" data-stickyparent>
						
                        <div class="col-md-8" data-stickycolumn id="postde" runat="server" />
						
						<!-- End Left big column -->
						<div class="col-md-4" data-stickycolumn>
							<aside class="sidebar clearfix">
	                            <div class="widget adwidget">
	                              <a href="#"><img src="img/ban300.jpg" alt=""/></a>
	                            </div>
                            </aside>
						</div>
						<!-- End last column -->
					</div>
					<!-- .blog-content -->
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
