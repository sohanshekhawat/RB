<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminSidebar.ascx.cs"
    Inherits="UControl_AdminSidebar" %>
<div id="sidebar" class="nav-collapse collapse">
    <ul>
        <li>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/Default.aspx"><i class="icon-user"></i>Dashbord</asp:HyperLink></li>
             <li>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Admin/BlogCategory.aspx"><i class="icon-user"></i>Blog Category</asp:HyperLink></li>
             <li>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Admin/SubCategory.aspx"><i class="icon-user"></i>Sub Cagegory</asp:HyperLink></li>
            <li>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Admin/OrganizationsList.aspx"><i class="icon-user"></i>Organizations List</asp:HyperLink></li>
        <li>
            <asp:HyperLink ID="HyperLink23" runat="server" NavigateUrl="~/Admin/BloggerList.aspx"><i class="icon-user"></i>Blogger List</asp:HyperLink></li>
       <%-- <li>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Admin/OrderDetail.aspx"><i class="icon-user"></i>Order Detail</asp:HyperLink></li>--%>
       
            
       <%-- <li>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Admin/OrganizationsList.aspx"><i class="icon-user">Organizations List</i></asp:HyperLink></li>--%>
        <li>
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Admin/PostList.aspx"><i class="icon-user"></i>Post List</asp:HyperLink></li>
         
         
      
    </ul>
    <!-- END SIDEBAR MENU -->
</div>
