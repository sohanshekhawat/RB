<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminHeader.ascx.cs" Inherits="UControl_AdminHeader" %>
<div id="header" class="navbar navbar-inverse navbar-fixed-top">
    <!-- BEGIN TOP NAVIGATION BAR -->
    <div class="navbar-inner">
        <div class="container-fluid">
            <!-- BEGIN LOGO -->
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="brand" NavigateUrl="~/Admin/Default.aspx">
           
               <%-- <img src="img/logo.png" style=" width:70px"/>--%>
           </asp:HyperLink>
            <!-- END LOGO -->
            <!-- BEGIN RESPONSIVE MENU TOGGLER -->
            <a class="btn btn-navbar collapsed" id="main_menu_trigger" data-toggle="collapse"
                data-target=".nav-collapse"><span class="icon-bar"></span><span class="icon-bar">
                </span><span class="icon-bar"></span><span class="arrow"></span></a>
            <!-- END RESPONSIVE MENU TOGGLER -->
            <div class="top-nav">
                <!-- BEGIN TOP NAVIGATION MENU -->
                <ul class="nav pull-right" id="top_menu">
                 <li>
                     <span runat="server" id="welcomeadmin" style="color:White"></span>&nbsp;&nbsp;
                   </li>
                    <!-- BEGIN USER LOGIN DROPDOWN -->
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                        class="icon-user"></i><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            
                            <li>
                                <asp:LinkButton ID="logout" runat="server" OnClick="logout_Click"><i class="icon-key"></i> Logut</asp:LinkButton>
                            </li>
                        </ul>
                    </li>
                    <!-- END USER LOGIN DROPDOWN -->
                </ul>
                <!-- END TOP NAVIGATION MENU -->
            </div>
        </div>
    </div>
    <!-- END TOP NAVIGATION BAR -->
</div>
