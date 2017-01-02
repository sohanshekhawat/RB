<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CMS_Page.aspx.cs" Inherits="Admin_CMS_Page" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Src="~/Admin/UserControl/AdminScript.ascx" TagPrefix="uc" TagName="AdminScript" %>
<%@ Register Src="~/Admin/UserControl/Admin_source.ascx" TagPrefix="uc" TagName="Admin_source" %>
<%@ Register Src="~/Admin/UserControl/AdminSidebar.ascx" TagPrefix="uc" TagName="AdminSidebar" %>
<%@ Register Src="~/Admin/UserControl/AdminHeader.ascx" TagPrefix="uc" TagName="AdminHeader" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>SpoonUp Panel | Admin Panel </title>
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
                                <li>CMS</li>
                            </ul>
                            <div class="widget">
                                <div class="widget-title">
                                    <h4>CMS </h4>
                                    <asp:Label ID="lblid" runat="server" Visible="False"></asp:Label>
                                &nbsp;<asp:Label ID="Label1" Visible="false" runat="server"></asp:Label>
                                </div>
                                <div class="widget-body form">
                                    <div class="control-group">
                                        <table cellpadding="10" align="center" style="font-weight: 500">
                                            <tr>
                                                <td>Page Title
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtpagetitle" runat="server"></asp:TextBox>
                                                    
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Meta Keyword
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtmeta" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Meta Descrition
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtmetadesc" runat="server" TextMode="MultiLine"></asp:TextBox>

                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Title 
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txttitle" runat="server"></asp:TextBox>
                                                   
                                                </td>
                                            </tr>

                                          

                                            <tr>
                                                <td>Description
                                                </td>
                                                <td>
                                                    <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server"></CKEditor:CKEditorControl>
                                                    <br />
                                                    
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Active
                                                </td>
                                                <td>
                                                    <div class="danger-toggle-button">
                                                        <input type="checkbox" class="toggle" checked="checked" id="cbactive" runat="server" />

                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td colspan="2" align="center">
                                                    <asp:Button ID="btsave" runat="server" Text="Save" class="btn btn-info" 
                                                        Width="100px" onclick="btsave_Click" 
                                                       />
                                                    <%--<button type="button" class="btn btn-info">Add</button>--%>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        <div class="widget">

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
