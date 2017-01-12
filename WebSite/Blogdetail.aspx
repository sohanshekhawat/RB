<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Blogdetail.aspx.cs" Inherits="Blogdetail" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">

    <!-- .header-wrapper -->
    <div class="container main-wrapper">
        <div class="main-content mag-content clearfix" data-stickyparent>
            <div class="row blog-content">
                <div class="col-md-8">
                    <h3 class="block-title">
                        <span>Blogger Detail</span></h3>
                    <div id="blogerdetail" runat="server" />

                </div>
                <!-- End Left big column -->
                <div class="col-md-4" data-stickycolumn>
                    <aside class="sidebar clearfix">
                        <div class="widget author-widget">
                            <div id="bloggerposts" runat="server">
                            </div>
                            <div class="widget adwidget">
                                <a href="#">
                                    <img src="img/ban300.jpg" alt="" /></a>
                            </div>
                    </aside>
                </div>
                <!-- End last column -->
            </div>
            <!-- .main-body -->
        </div>
        <!-- .main-content -->
        <!-- End Main Banner -->

        <!-- End Main Banner -->
    </div>
</asp:Content>
