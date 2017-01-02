<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminSidebar.ascx.cs"
    Inherits="UControl_AdminSidebar" %>
<div id="sidebar" class="nav-collapse collapse">
    <ul>
        <li>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Organization/Default.aspx"><i class="icon-user"></i>Dashbord</asp:HyperLink></li>
            
         <li>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Organization/MyProfile.aspx"><i class="icon-user"></i>My Profile</asp:HyperLink></li>
       
        <li>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Organization/BloggerList.aspx"><i class="icon-user"></i>Bloger list</asp:HyperLink></li>
       
            <li>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Organization/PostList.aspx"><i class="icon-user"></i>Post List</asp:HyperLink></li>
            
       <%-- <li>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Admin/OrganizationsList.aspx"><i class="icon-user">Organizations List</i></asp:HyperLink></li>--%>
       
      
    </ul>
    <!-- END SIDEBAR MENU -->
</div>
