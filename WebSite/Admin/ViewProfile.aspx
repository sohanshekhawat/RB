<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewProfile.aspx.cs" Inherits="Admin_BlogCategory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Src="~/Admin/UserControl/AdminScript.ascx" TagPrefix="uc" TagName="AdminScript" %>
<%@ Register Src="~/Admin/UserControl/Admin_source.ascx" TagPrefix="uc" TagName="Admin_source" %>
<%@ Register Src="~/Admin/UserControl/AdminSidebar.ascx" TagPrefix="uc" TagName="AdminSidebar" %>
<%@ Register Src="~/Admin/UserControl/AdminHeader.ascx" TagPrefix="uc" TagName="AdminHeader" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Blog Post Panel | Admin Panel </title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <link href="css/grid.css" rel="stylesheet" type="text/css" />
    <uc:Admin_source runat="server" ID="ucAdmin_source" />
    <style type="text/css">
        .style1
        {
            height: 50px;
        }
    </style>
</head>
<body class="fixed-top">
<asp:Label runat="server" ID="lblstats" Visible="false">0</asp:Label>
<asp:Label runat="server" ID="lblremove" Visible="false"></asp:Label>
    <form id="Form1" runat="server">
    <uc:AdminHeader runat="server" ID="ucAdminHeader" />
    <div id="container" class="row-fluid">
        <uc:AdminSidebar runat="server" ID="ucAdminSidebar" />
        <div id="body">
            <div class="container-fluid">
                <div class="row-fluid">
                    <div class="span12">
                      <ul class="breadcrumb">
                                <li><i class="icon-home"></i><a href="Default.aspx">Home</a> <span class="divider">/</span> </li>
                                <li>View Profile</li>
                                 <li style="float:right;font-size:16px;font-weight:bold;color:Black"></i><a href="Default.aspx"> << Back</a> <span class="divider"></span> </li>
                            </ul>
                            <div class="widget">
                               
                <div class="widget-body form">
                    <table cellpadding="10" style="width:50%; color:Black;font-weight: 700; margin: 5px 5px 5px 260px;border:solid 1px #e2e2e2;" >
                <tr>
                    <td width="50%" style="padding: 5px; text-align:center;background-color:White" colspan="2">
                       
                            <img src="~/Admin/img/no-image.jpg" runat="server" id="profileimage" style="border-radius: 100% 100%  100%  100%;
                                -moz-border-radius: 100%  100%  100%  100%; -webkit-border-radius: 100%  100%  100%  100%;
                                border: 1px solid #df8642;height:200px !important; width:200px"  />
                        
                    </td>
                </tr>
                <tr>
                    <td width="50%" 
                        style="padding: 5px;text-align:center;font-size:26px;font-weight:bold" 
                        colspan="2">
                      
                        <asp:Label ID="lblnm" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="50%" style="padding: 5px;background-color:White;border:solid 2px #f8f8f8">
                    Name:
                    </td>
                    <td height="30px" style="padding: 5px;background-color:#e2e2e2;border:solid 2px #fff">
                        <asp:Label ID="lblonm" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="50%" style="padding: 5px;background-color:White;border:solid 2px #f8f8f8">
                        Email:</td>
                    <td height="30px" style="padding: 5px;background-color:#e2e2e2;border:solid 2px #fff">
                        <asp:Label ID="lblemail" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="50%" style="padding: 5px;background-color:White;border:solid 2px #f8f8f8">
                        Phone:
                    </td>
                    <td height="30px" style="padding: 5px;background-color:#e2e2e2;border:solid 2px #fff">
                        <asp:Label ID="lblpnno" runat="server"></asp:Label>
                      
                    </td>
                </tr>
                <tr>
                    <td width="50%" style="padding: 5px;background-color:White;border:solid 2px #f8f8f8">
                Country:
                    </td>
                    <td height="30px" style="padding: 5px;background-color:#e2e2e2;border:solid 2px #fff">
                        <asp:Label ID="lblcntry" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="50%" style="padding: 5px;background-color:White;border:solid 2px #f8f8f8">
                  State:
                    </td>
                    <td height="30px" style="padding: 5px;background-color:#e2e2e2;border:solid 2px #fff">
                        <asp:Label ID="lblstate" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="50%" style="padding: 5px;background-color:White;border:solid 2px #f8f8f8">
                   City:
                    </td>
                    <td height="30px" style="padding: 5px;background-color:#e2e2e2;border:solid 2px #fff">
                        <asp:Label ID="lblcity" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="50%" style="padding: 5px;background-color:White;border:solid 2px #f8f8f8">
                    Street:
                    </td>
                    <td height="30px" style="padding: 5px;background-color:#e2e2e2;border:solid 2px #fff">
                        <asp:Label ID="lblstreet" runat="server"></asp:Label>
                    </td>
                </tr>
                  
                  
                  <tr>
                    <td width="50%" style="padding: 5px;background-color:White;border:solid 2px #f8f8f8">
                 Zipcode
                    </td>
                    <td height="30px" style="padding: 5px;background-color:#e2e2e2;border:solid 2px #fff">
                        <asp:Label ID="lblzip" runat="server"></asp:Label>
                    </td>
                </tr>
                  
              
            </table>
                </div>
                            </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
    <uc:AdminScript runat="server" ID="ucAdminScript" />
</body>
</html>
