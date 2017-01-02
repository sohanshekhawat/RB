<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="index" %>

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
    <link href="css/new_login.css" rel="stylesheet" type="text/css" />
    <!-- Theme CSS -->
    <link rel="stylesheet" href="css/style.min.css">
    <style type="text/css">
        .container1
        {
            position: absolute;
            top: 10%;
            left: 10%;
            right: 0;
            bottom: 0;
        }
        .action
        {
            width: 400px;
            height: 30px;
            margin: 10px 0;
        }
        .cropped > img
        {
            margin-right: 10px;
            border-radius: 60%;
            height: 100%;
        }
        .btnpropic
        {
            background: #4e9caf none repeat scroll 0 0;
            border-radius: 5px;
            color: white;
            display: block;
            font-weight: bold;
            height: 25px;
            margin-right: 5px;
            padding: 5px;
        }
        
        .watermark
        {
            height: 20px;
            width: 100px;
            padding: 2px 0 0 2px;
            border: 1px solid #BEBEBE;
            background-color: #F0F8FF;
            color: gray;
        }
        .cpbtn
        {
            background: #4e9caf none repeat scroll 0 0;
            border-radius: 5px;
            color: white;
            display: block;
            font-weight: bold;
            height: 30px;
            margin-right: 5px;
            padding: 5px;
            text-align: center;
        }
        .modal-box
        {
            display: none;
            position: fixed;
            z-index: 1000;
            width: 50%;
            background: white;
            border-bottom: 1px solid #aaa;
            border-radius: 4px;
            box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
            border: 1px solid rgba(0, 0, 0, 0.1);
            background-clip: padding-box;
        }
        .modal-box header, .modal-box .modal-header
        {
            padding: 1.25em 1.5em;
            border-bottom: 1px solid #ddd;
        }
        .modal-box header h3, .modal-box header h4, .modal-box .modal-header h3, .modal-box .modal-header h4
        {
            margin: 0;
        }
        .modal-box .modal-body
        {
            padding: 2em 1.5em;
        }
        .modal-box footer, .modal-box .modal-footer
        {
            padding: 1em;
            border-top: 1px solid #ddd;
            background: rgba(0, 0, 0, 0.02);
            text-align: right;
        }
        .modal-overlay
        {
            opacity: 1.00;
            filter: alpha(opacity=0);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 900;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.3) !important;
        }
        a.close
        {
            float: right;
            font-size: 21px;
            padding-top: 3px;
            padding-right: 3px;
        }
        a.backimg
        {
            background-image: url("img/upimage.png");
            border-radius: 100% 100% 100% 100%;
            -moz-border-radius: 100% 100% 100% 100%;
            -webkit-border-radius: 100% 100% 100% 100%;
            background-repeat: no-repeat;
            background-position: center;
        }
        a.close:hover
        {
            color: #222;
            -webkit-transition: color 1s ease;
            -moz-transition: color 1s ease;
            transition: color 1s ease;
        }
    </style>
    <link href="css/CropBoxStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #overlay
        {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #000;
            filter: alpha(opacity=70);
            -moz-opacity: 0.7;
            -khtml-opacity: 0.7;
            opacity: 0.7;
            z-index: 100;
            display: none;
        }
        
        .popup1
        {
            width: auto;
            height: auto;
            display: none;
            position: fixed;
            z-index: 101;
            margin-top: -105%;
        }
        
        .content1
        {
            min-width: auto;
            margin-top: -42%;
            width: 680px;
            min-height: 150px;
            background: #f3f3f3;
            position: relative;
            z-index: 103;
            border-radius: 5px;
            box-shadow: 0 2px 5px #000;
            margin-left: 10%;
        }
        
        .content1 p
        {
            clear: both;
            color: #555555;
            text-align: justify;
        }
        .content1 p a
        {
            color: #d91900;
            font-weight: bold;
        }
        .content1 .x
        {
            float: right;
            height: 35px;
            left: 22px;
            position: relative;
            top: -25px;
            width: 34px;
        }
        .content1 .btnclose
        {
            float: right;
            height: 35px;
            left: 22px;
            position: relative;
            top: -25px;
            width: 34px;
        }
        
        .content1 .x:hover
        {
            cursor: pointer;
        }
    </style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type='text/javascript'>
        $(function () {

            var appendthis = ("<div class='modal-overlay js-modal-close'></div>");

            $('a[data-modal-id]').click(function (e) {
                e.preventDefault();
                $("body").append(appendthis);
                $(".modal-overlay").fadeTo(500, 0.7);
                //$(".js-modalbox").fadeIn(500);
                var modalBox = $(this).attr('data-modal-id');
                $('#' + modalBox).fadeIn($(this).data());

            });


            $(".js-modal-close, .modal-overlay").click(function () {
                $(".modal-box, .modal-overlay").fadeOut(500, function () {
                    $(".modal-overlay").remove();
                });
            });

            $(window).resize(function () {
                $(".modal-box").css({
                    top: ($(window).height() - $(".modal-box").outerHeight()) / 2,
                    left: ($(window).width() - $(".modal-box").outerWidth()) / 2
                });
            });

            $(window).resize();

        });
        function showdialog(id, type) {
            document.getElementById('txtreasonid').value = id;
            document.getElementById('txttype').value = type;
            var appendthis = ("<div class='modal-overlay js-modal-close'></div>");

            $('a[data-modal-id]').click(function (e) {
                e.preventDefault();
                $("body").append(appendthis);
                $(".modal-overlay").fadeTo(500, 0.7);
                //$(".js-modalbox").fadeIn(500);
                var modalBox = $(this).attr('data-modal-id');
                $('#' + modalBox).fadeIn($(this).data());

            });
        }

      

    </script>
    <script type='text/javascript'>
        $(function () {
            var overlay = $('<div id="overlay"></div>');
            $('.close').click(function () {
                $('.popup1').hide();
                overlay.appendTo(document.body).remove();
                return false;
            });

            $('.x').click(function () {
                $('.popup1').hide();
                overlay.appendTo(document.body).remove();
                return false;
            });

            $('.click').click(function () {
                overlay.show();
                overlay.appendTo(document.body);
                $('.popup1').show();
                return false;
            });
        });
      

       
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label runat="server" Visible="false" ID="lblstats">0</asp:Label>
    <asp:Label runat="server" Visible="false" ID="lblstats2">0</asp:Label>
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
               <a href="Signup.aspx" style="color:#D3D3D3 !important">SignUp</a>
              </div>
              <div class="header-right">
                <div class="social-icons">
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
                </div><!-- .social-icons -->
              </div><!-- .header-right -->

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
    </div><!-- .header -->
    
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
            <div class="login_signup_bg clearfix">
                <div class="login-warrper signup_section">
                    <div class="login_bg">
                        &nbsp;<h1>
                            Create your free account</h1>
                        <a style="height: 250px; width: 250px;" class="js-open-modal " data-modal-id="popup1">
                            <asp:Label ID="lbloldprofilepict" runat="server" Text="" Visible="false"></asp:Label>
                            <div class="cropped" style="height: 200px; width: 200px; border-radius: 100% 100% 100% 100%;
                                margin-left: 25%; background-image: url('img/upimage.png'); background-repeat: no-repeat;
                                background-position: center; -moz-border-radius: 100% 100% 100% 100%; -webkit-border-radius: 100% 100% 100% 100%;
                                cursor: pointer" id="_profilepic" runat="server">
                            </div>
                        </a>
                        <div class="heading_bottom">
                            Already have an account? <a href="#">Sign in</a></div>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:RadioButton runat="server" ID="rbO" GroupName="R" Text="Organization" Visible="true"
                                    Checked="true" AutoPostBack="True" OnCheckedChanged="rbO_CheckedChanged" />
                                <asp:RadioButton runat="server" Text="Blogger" ID="rbB" GroupName="R" AutoPostBack="True"
                                    OnCheckedChanged="rbB_CheckedChanged" />
                                <br />
                                <asp:DropDownList runat="server" ID="cmbOrganization" Visible="false" Width="95%">
                                </asp:DropDownList>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="cmbOrganization"
                                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" InitialValue="0" 
                                                    ValidationGroup="submint" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                        <asp:TextBox class="social_textbox" type="text" ID="txtOrgName" runat="server" placeholder="Organization Name"
                            Width="97%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="submint"
                            runat="server" ErrorMessage="*" ControlToValidate="txtOrgName" 
                            ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox class="social_textbox" ID="txtzipcode" MaxLength="6" type="text" runat="server"
                            placeholder="Enter Zip Code" Width="97%"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtzipcode"
                                                    ForeColor="Red" ValidationGroup="submint" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter valid Zipcode"
                                                    ControlToValidate="txtzipcode" ValidationExpression="\d{6}-?(\d{4})?$" ForeColor="Red"
                                                    ValidationGroup="submint" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="True"
                            InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz`~!@#$%^&amp;*()_+=-'&quot;;:]}[{\|/?.&gt;,&lt;"
                            TargetControlID="txtphone" ValidChars="0123456789">
                        </asp:FilteredTextBoxExtender>
                        <asp:TextBox ID="txtStreetAddress" class="social_textbox" Width="97%" runat="server"
                            placeholder="Enter Street Address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="submint"
                            ErrorMessage="*" ControlToValidate="txtStreetAddress" ForeColor="Red" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox autocomplete="off" Width="47%" ID="txtcity" class="social_textbox" runat="server"
                            placeholder="Enter City Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="submint"
                            ErrorMessage="*" ControlToValidate="txtcity" ForeColor="Red" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox class="social_textbox" Width="47%" ID="txtstate" runat="server" placeholder="Enter State Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="submint"
                            runat="server" ErrorMessage="*" ControlToValidate="txtstate" 
                            ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <script type="text/javascript">
                            $(document).ready(function () {
                                var countries = new Array("Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso", "Burma", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Central African Republic", "Chad", "Chile", "China", "Colombia", "Comoros", "Congo, Democratic Republic", "Congo, Republic of the", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Greenland", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, North", "Korea, South", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Mongolia", "Morocco", "Monaco", "Mozambique", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Norway", "Oman", "Pakistan", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Romania", "Russia", "Rwanda", "Samoa", "San Marino", " Sao Tome", "Saudi Arabia", "Senegal", "Serbia and Montenegro", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "Spain", "Sri Lanka", "Sudan", "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe");
                                $("#input").jqxInput({ placeHolder: "Enter a Country", minLength: 1, source: countries, });
                            });
                        </script>
                        <asp:TextBox type="text" class="social_textbox" ID="txtcontry" runat="server" placeholder="Enter Country Name"
                            Width="97%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="submint"
                            ErrorMessage="*" ControlToValidate="txtcontry" ForeColor="Red" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox class="social_textbox" ID="txtphone" MaxLength="10" runat="server" placeholder="Enter Phone Number"
                            Width="97%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtphone"
                            ForeColor="Red" ValidationGroup="submint" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Should be 0 to 9 Digits"
                            ControlToValidate="txtphone" ValidationExpression="^[0-9]*$" ForeColor="Red"
                            ValidationGroup="submint" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                        <asp:FilteredTextBoxExtender ID="txtphone_FilteredTextBoxExtender" runat="server"
                            Enabled="True" InvalidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz`~!@#$%^&amp;*()_+=-'&quot;;:]}[{\|/?.&gt;,&lt;"
                            TargetControlID="txtphone" ValidChars="0123456789">
                        </asp:FilteredTextBoxExtender>
                        <asp:TextBox class="social_textbox" MaxLength="200" type="email" ID="txtemail" runat="server"
                            placeholder="Email Address" Width="97%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="submint"
                            ErrorMessage="*" ControlToValidate="txtemail" ForeColor="Red" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator4_ValidatorCalloutExtender"
                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4" HighlightCssClass="highlight">
                        </asp:ValidatorCalloutExtender>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="submint"
                            ErrorMessage="Invalid Email" ControlToValidate="txtemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ForeColor="Red" SetFocusOnError="True"></asp:RegularExpressionValidator>
                        <asp:TextBox autocomplete="off" TextMode="Password" ID="txtpassword" class="social_textbox"
                            placeholder="Password" type="password" runat="server" Width="97%"></asp:TextBox>
                        <%-- <asp:Label ID="lblPassword" runat="server" Text="Password" Visible="False"></asp:Label>--%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="submint"
                            ErrorMessage="*" ControlToValidate="txtpassword" ForeColor="Red"></asp:RequiredFieldValidator>
                        <%--   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="submint" ErrorMessage="*"
                            ControlToValidate="txtpassword"></asp:RegularExpressionValidator>--%>
                        <asp:Button runat="server" ID="btnsubmit" Text="Submit" class="green_btn" ValidationGroup="submint"
                            OnClick="btnsubmit_Click" />
                        <textarea id="imgCropped" type="text" runat="server" style="display: none">
                            </textarea>
                    </div>
                </div>
            </div>
            <div id="popup1" class="modal-box" style="">
                <a class="js-modal-close close">
                    <img src="img/close.png" /></a>
                <div class="widget-title" style="padding-left: 5px; padding-top: 5px; text-align: center">
                    Profile Details
                </div>
                <div class="widget-body form">
                    <table cellpadding="10" style="width: 100%; color: Black; margin: 5px">
                        <tr>
                            <td width="50%">
                                <script src="js/CropBox.js" type="text/javascript"></script>
                                <div class="imageBox" runat="server" id="uploadedimg">
                                    <div class="thumbBox">
                                    </div>
                                    <div class="spinner" style="display: none">
                                        Loading...</div>
                                </div>
                                <div class="action">
                                    <asp:FileUpload runat="server" ID="file" Style="float: left; width: 250px" />
                                    <span style="cursor: pointer"><a id="btnpropic" class="close cpbtn js-modal-close"
                                        style="float: right">Ok</a></span> <span style="cursor: pointer"><a id="btnCrop"
                                            style="float: right" class="cpbtn">Crop</a> </span><span style="cursor: pointer"><a
                                                id="btnZoomIn" style="float: right" class="cpbtn">+</a> </span><span style="cursor: pointer">
                                                    <a id="btnZoomOut" style="float: right" class="cpbtn">-</a></span>
                                </div>
                            </td>
                            <td>
                                <div class="cropped_">
                                </div>
                                <script type="text/javascript">
                                    window.onload = function () {
                                        var options =
        {
            thumbBox: '.thumbBox',
            imageBox: '.imageBox',
            spinner: '.spinner',
            imgSrc: 'avatar.png'
        }
                                        var cropper;
                                        document.querySelector('#file').addEventListener('change', function () {
                                            var reader = new FileReader();
                                            reader.onload = function (e) {
                                                options.imgSrc = e.target.result;
                                                cropper = new cropbox(options);
                                            }
                                            reader.readAsDataURL(this.files[0]);
                                            this.files = [];
                                        })
                                        document.querySelector('#btnCrop').addEventListener('click', function () {
                                            var img = cropper.getDataURL()
                                            document.querySelector('.cropped').innerHTML += '<img runat="server" id="test_img_my" src="' + img + '">';
                                            document.querySelector('.cropped_').innerHTML += '<img runat="server" id="test_img_my1" src="' + img + '">';

                                            sessionStorage.setItem("curimg", img);
                                            var crrimg = sessionStorage.getItem("curimg");
                                            document.getElementById("imgCropped").value = crrimg;

                                            //PageMethods.GetCurrentTime(img);

                                        })

                                        document.querySelector('#btnZoomIn').addEventListener('click', function () {
                                            cropper.zoomIn();
                                        })
                                        document.querySelector('#btnZoomOut').addEventListener('click', function () {
                                            cropper.zoomOut();
                                        })
                                    };

                                    function Currentimg() {
                                        var crrimg = sessionStorage.getItem("curimg");
                                        document.getElementById("imgCropped").value = crrimg;


                                    }
                                      

                                </script>
                            </td>
                        </tr>
                    </table>
                </div>
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
