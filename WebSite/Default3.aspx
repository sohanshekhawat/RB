<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>
<%@ Register Src="~/Usercontrol/Banner.ascx" TagPrefix="bc" TagName="Banner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">

    <div class="container main-wrapper">
        <div class="main-content mag-content clearfix">
            <div class="row featured-wrapper">
                <bc:banner runat="server" />
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
                                        <div class="simple-thumb" style="width: 160px;">
                                            <asp:Label Text='<%# Eval("Post_id") %>' ID="lblidpost" ForeColor="#000" runat="server" Visible="false" />

                                            <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%# Eval("Image","~/siteimages/postImg/{0}") %>' Style="height: 115px; width: 170px" CommandArgument='<%# Eval("Post_id") %>' CommandName="postlist" />
                                        </div>
                                        <header>
                                            <p class="simple-share">
                                                By&nbsp;>>&nbsp;
                                           <asp:LinkButton Text='<%# Eval("bloggername") %>' ID="lblblogbm" ForeColor="#000" runat="server" CommandArgument='<%# Eval("Blogger_id") %>' CommandName="blogger" />
                                                <asp:LinkButton Text='<%# Eval("sub_cat_nm") %>' ID="LinkButton2" ForeColor="#000" runat="server" CommandArgument='<%# Eval("sub_cat_id") %>' CommandName="category" />

                                            </p>
                                            <h3>
                                                <asp:LinkButton Text='<%# Eval("PostTitle") %>' ID="Label2" ForeColor="#000" runat="server" CommandArgument='<%# Eval("Post_id") %>' CommandName="postlist" /></h3>

                                            <p class="excerpt" style="text-align: justify;">
                                                <asp:Label Text='<%# Eval("PostContent") %>' ID="Label3" ForeColor="#000" runat="server" /><asp:LinkButton Text='Read More' ID="LinkButton1" CssClass="ReadMore" runat="server" CommandArgument='<%# Eval("Post_id") %>' CommandName="postlist" />
                                            </p>
                                        </header>
                                    </article>
                                    </hr>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" data-stickycolumn>
                    <aside class="sidebar clearfix">

                        <div class="widget adwidget">
                            <a href="#">
                                <img src="img/ban300.jpg" alt="" /></a>
                        </div>

                        <div class="widget tabwidget">
                            <ul class="nav nav-tabs" role="tablist" id="widget-tab">
                                <li role="presentation" class="active"><a href="#tab-popular" aria-controls="tab-popular" role="tab" data-toggle="tab">Organization</a></li>
                                <li role="presentation"><a href="#tab-recent" aria-controls="tab-recent" role="tab" data-toggle="tab">Blogger</a></li>

                            </ul>

                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="tab-popular">
                                    <div id="postpop" runat="server">
                                    </div>
                                    <!-- Popular posts -->
                                </div>
                                <div role="tabpanel" class="tab-pane" id="tab-recent">
                                    <div id="bloggerpop" runat="server">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </aside>
                </div>
                <!-- End last column -->
            </div>
        </div>
        <!-- .main-content -->
    </div>
</asp:Content>
