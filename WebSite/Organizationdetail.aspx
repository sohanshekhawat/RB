<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Organizationdetail.aspx.cs" Inherits="Organizationdetail" MasterPageFile="~/MasterPage.master" %>

<asp:Content ContentPlaceHolderID="MainContentPlaceHolder" ID="Content1" runat="server">

    <!-- .header-wrapper -->
    <div class="container main-wrapper">
        <!-- End Main Banner -->
        <!-- End Main Banner -->
        <div class="main-content mag-content clearfix">
            <div class="row blog-content" data-stickyparent>
                <div class="col-md-8" data-stickycolumn id="orgDetail" runat="server">
                </div>
                <!-- End Left big column -->
                <div class="col-md-4" data-stickycolumn>
                    <aside class="sidebar clearfix">
                                <div class="widget author-widget">
                                        <div id="orgblogger" runat="server">       
                                </div>
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

</asp:Content>
