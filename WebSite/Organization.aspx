<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Organization.aspx.cs" Inherits="index" MasterPageFile="~/MasterPage.master" %>

<%@ Register Src="~/Usercontrol/Banner.ascx" TagPrefix="bc" TagName="Banner" %>
<asp:Content ContentPlaceHolderID="MainContentPlaceHolder" ID="Content1" runat="server">
    <!-- Begin Main Wrapper -->
    <div class="container main-wrapper">
        <div class="main-content mag-content clearfix">

            <div class="row featured-wrapper">
                <bc:Banner runat="server" />
            </div>

            <div class="row main-body" data-stickyparent>
                <div class="col-md-8">
                    <!-- BEGIN BLOCK 2 -->
                    <!-- End Main Banner -->
                    <div class="row blog-content">
                        <div class="col-md-8" style="width: 100%;">
                            <h3 class="tag-title">Top 10 <span>Organization</span></h3>
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
                            <div id="postpop" runat="server">      </div>
                        </div>
                     </div>
                    </div>
                </aside>

                    <!-- End last column -->
                </div>
        </div>
    </div>
</asp:Content>
