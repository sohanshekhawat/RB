
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="index" EnableEventValidation="false" %>

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
        .container1 {
            position: absolute;
            top: 10%;
            left: 10%;
            right: 0;
            bottom: 0;
        }

        .action {
            width: 400px;
            height: 30px;
            margin: 10px 0;
        }

        .cropped > img {
            margin-right: 10px;
            border-radius: 60%;
            height: 100%;
        }

        .btnpropic {
            background: #4e9caf none repeat scroll 0 0;
            border-radius: 5px;
            color: white;
            display: block;
            font-weight: bold;
            height: 25px;
            margin-right: 5px;
            padding: 5px;
        }

        .watermark {
            height: 20px;
            width: 100px;
            padding: 2px 0 0 2px;
            border: 1px solid #BEBEBE;
            background-color: #F0F8FF;
            color: gray;
        }

        .cpbtn {
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

        .modal-box {
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

            .modal-box header, .modal-box .modal-header {
                padding: 1.25em 1.5em;
                border-bottom: 1px solid #ddd;
            }

                .modal-box header h3, .modal-box header h4, .modal-box .modal-header h3, .modal-box .modal-header h4 {
                    margin: 0;
                }

            .modal-box .modal-body {
                padding: 2em 1.5em;
            }

            .modal-box footer, .modal-box .modal-footer {
                padding: 1em;
                border-top: 1px solid #ddd;
                background: rgba(0, 0, 0, 0.02);
                text-align: right;
            }

        .modal-overlay {
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

        a.close {
            float: right;
            font-size: 21px;
            padding-top: 3px;
            padding-right: 3px;
        }

        a.backimg {
            background-image: url("img/upimage.png");
            border-radius: 100% 100% 100% 100%;
            -moz-border-radius: 100% 100% 100% 100%;
            -webkit-border-radius: 100% 100% 100% 100%;
            background-repeat: no-repeat;
            background-position: center;
        }

        a.close:hover {
            color: #222;
            -webkit-transition: color 1s ease;
            -moz-transition: color 1s ease;
            transition: color 1s ease;
        }
    </style>
    <link href="css/CropBoxStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #overlay {
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

        .popup1 {
            width: auto;
            height: auto;
            display: none;
            position: fixed;
            z-index: 101;
            margin-top: -105%;
        }

        .content1 {
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

            .content1 p {
                clear: both;
                color: #555555;
                text-align: justify;
            }

                .content1 p a {
                    color: #d91900;
                    font-weight: bold;
                }

            .content1 .x {
                float: right;
                height: 35px;
                left: 22px;
                position: relative;
                top: -25px;
                width: 34px;
            }

            .content1 .btnclose {
                float: right;
                height: 35px;
                left: 22px;
                position: relative;
                top: -25px;
                width: 34px;
            }

            .content1 .x:hover {
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
               <a href="login.aspx" style="color:#D3D3D3 !important">Login</a>
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
                            &nbsp;<h1>Registration Form</h1>
                            <br />

                            <a style="height: 250px; width: 250px;" class="js-open-modal " data-modal-id="popup1">
                                <asp:Label ID="lbloldprofilepict" runat="server" Text="" Visible="false"></asp:Label>
                                <div class="cropped" style="height: 200px; width: 200px; border-radius: 100% 100% 100% 100%; margin-left: 25%; background-image: url('img/upimage.png'); background-repeat: no-repeat; background-position: center; -moz-border-radius: 100% 100% 100% 100%; -webkit-border-radius: 100% 100% 100% 100%; cursor: pointer"
                                    id="_profilepic" runat="server">
                                </div>
                            </a>
                            <br />

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>

                                    <label>[Please register as Individual or Organisation User.]</label>
                                    <br />
                                    <asp:RadioButton class="social_checkbox" runat="server" Text="Individual" ID="rbB" GroupName="R" AutoPostBack="True"
                                        OnCheckedChanged="rbB_CheckedChanged" Checked="true" Visible="true" ToolTip="आप लोग ब्लॉग या अर्टिकल लिख सकते हैं  !" />
                                    &nbsp &nbsp
                                     <asp:RadioButton class="social_checkbox" runat="server" ID="rbO" GroupName="R" Text="Organization"
                                         AutoPostBack="True" OnCheckedChanged="rbO_CheckedChanged" ToolTip="समाज की सेवा क़े  लिए संगठन !" />

                                    <br />

                                    <asp:DropDownList class="social_Drop" runat="server" ID="cmbOrganization" Visible="true" Width="95%" CssClass="social_Drop"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="cmbOrganization"
                                        Display="Dynamic" ErrorMessage="*" ForeColor="Red" InitialValue="0"
                                        ValidationGroup="submint" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <br />



                            <asp:TextBox class="social_textbox" type="text" ID="txtName" runat="server" placeholder="Name"
                                Width="97%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="submint"
                                runat="server" ErrorMessage="*" ControlToValidate="txtName"
                                ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                            <asp:TextBox class="social_textbox" ID="txtphone" MaxLength="10" runat="server" placeholder="Mobile Number"
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="submint"
                                ErrorMessage="*" ControlToValidate="txtpassword" ForeColor="Red"></asp:RequiredFieldValidator>

                            <asp:TextBox autocomplete="off" TextMode="Password" ID="txtConfirm" class="social_textbox"
                                placeholder="Confirm Password" type="password" runat="server" Width="97%"></asp:TextBox>

                            <asp:CompareValidator ID="comparePasswords" runat="server" ControlToCompare="txtpassword" ValidationGroup="submint"
                                ControlToValidate="txtConfirm" ErrorMessage="Your password and confirm password do not match." Display="Dynamic" ForeColor="Red" />

                            <asp:TextBox autocomplete="off" Width="97%" ID="txtcity" class="social_textbox" runat="server"
                                placeholder="Enter City Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="submint"
                                ErrorMessage="*" ControlToValidate="txtcity" ForeColor="Red"
                                SetFocusOnError="True"></asp:RequiredFieldValidator>

                            <asp:TextBox ID="txtStreetAddress" class="social_textbox" Width="97%" runat="server"
                                placeholder="Enter District Name"></asp:TextBox>

                            <asp:TextBox class="social_textbox" Width="47%" ID="txtstate" runat="server" placeholder="Enter State Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="submint"
                                runat="server" ErrorMessage="*" ControlToValidate="txtstate"
                                ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                            <asp:TextBox class="social_textbox" ID="txtzipcode" MaxLength="6" type="text" runat="server"
                                placeholder="Enter Zip Code" Width="47%"></asp:TextBox>

                            <asp:TextBox type="text" class="social_textbox" ID="txtcontry" runat="server" placeholder="Enter Country Name"
                                Width="97%"></asp:TextBox>

                            <div id="transliterate">
                                <p>
                                    <script type="text/javascript" src="/HindiDemo_files/wp-emoji-release.js"></script>
                                    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
                                    <script type="text/javascript" src="/HindiDemo_files/Google-IME.js"></script>
                                    <script type="text/javascript" src="/HindiDemo_files/a"></script>
                                    <link rel="stylesheet" type="text/css" href="/HindiDemo_files/transliteration.css"></link>
                                    <script type="text/javascript" src="/HindiDemo_files/transliteration.js"></script>
                                </p>
                                <div id="translcontrol">
                                    <input checked="checked" id="checkboxId" onclick="javascript: checkboxClickHandler()"
                                        type="checkbox">Type in English and convert to Hindi: 
                                            <select id="languageDropDown" onchange="javascript:languageChangeHandler()">
                                                <option selected="selected" value="hi">HINDI</option>
                                            </select>
                                </div>

                                <p>
                                    <input id="transl1" style="display: none !important;" type="textbox"><br>
                                    भाषाओं और अंग्रेजी भाषा के मध्य चुनाव के लिए CTRL+g का प्रयोग करें<br>
                                    Uncheck this to stop conversion<br>
                                    <textarea id="transl2" style="border: solid 1px #ddd; padding: 15px; margin-bottom: 20px; color: #333; font-size: 18px; height: 250px; width: 95%; border-radius: 3px; -moz-border-radius: 3px; -webkit-border-radius: 3px; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box"
                                        runat="server"></textarea>
                                </p>
                            </div>

                            <asp:Button runat="server" ID="btnsubmit" Text="Submit" class="green_btn" ValidationGroup="submint"
                                OnClick="btnsubmit_Click" />
                            <textarea id="imgCropped" type="text" runat="server" style="display: none">                            </textarea>
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
                                            Loading...
                                        </div>
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
            </div>
            <footer class="footer source-org vcard copyright clearfix" id="footer" role="contentinfo">
  <div class="footer-main">
    <div class="fixed-main">
     
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
        <!-- Google map api -->
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
        <!-- Theme js -->
        <script src="js/script.min.js"></script>
    </form>
</body>
</html>