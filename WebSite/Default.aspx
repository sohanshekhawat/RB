<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="index" EnableEventValidation="false" %>

<%@ Register Src="~/Usercontrol/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Usercontrol/Footer.ascx" TagPrefix="fc" TagName="Footer" %>
<%@ Register Src="~/Usercontrol/Banner.ascx" TagPrefix="bc" TagName="Banner" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 
      <meta charset="utf-8">
    <title>RajputGatha - Connecting Rajputs</title>
    <meta name="keywords" content="RajputBooks">
    <meta name="description" content="RajputBooks">
    <meta name="author" content="digitaltheme.co">
    <meta class="viewport" name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
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

            <div class="container main-wrapper">
                <div class="main-content mag-content clearfix">
                    <div class="row featured-wrapper">
                        
                        <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:Timer ID="Timer1" Interval="1000" runat="server" />
        <asp:UpdatePanel ID="up1" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
            <ContentTemplate>
                        <bc:Banner runat="server" />          
            </ContentTemplate>
        </asp:UpdatePanel>
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
                                   <header>
                                       <p class="simple-share"> By&nbsp;>>&nbsp;
                                           <asp:LinkButton Text='<%# Eval("bloggername") %>' ID="lblblogbm" ForeColor="#000" runat="server"  CommandArgument='<%# Eval("Blogger_id") %>' CommandName="blogger" /> 
                                           <asp:LinkButton Text='<%# Eval("sub_cat_nm") %>' ID="LinkButton2" ForeColor="#000" runat="server"  CommandArgument='<%# Eval("sub_cat_id") %>' CommandName="category" />
                                       
                                       </p>
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
            

            <footer class="footer source-org vcard copyright clearfix" id="footer" role="contentinfo">
                 <fc:Footer runat="server" />            
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
<%--        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>--%>
        <!-- Theme js -->
        <script src="js/script.min.js"></script>
    </form>
</body>
</html>
