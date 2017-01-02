<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubCategory.aspx.cs" Inherits="Admin_SubCategory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <uc:AdminHeader runat="server" ID="ucAdminHeader" />
    <div id="container" class="row-fluid">
        <uc:AdminSidebar runat="server" ID="ucAdminSidebar" />
        <div id="body">
            <div class="container-fluid">
                <div class="row-fluid">
                    <div class="span12">
                        <ul class="breadcrumb">
                            <li><i class="icon-home"></i><a href="Default.aspx">Home</a> <span class="divider">/</span>
                            </li>
                            <li>Sub Category</li>
                        </ul>
                        <div class="widget">
                            <div class="widget-title">
                                <h4>
                                    Sub Category</h4>
                                <asp:Label ID="lblid" runat="server" Visible="False">0</asp:Label>
                                &nbsp;<asp:Label ID="Label1" Visible="false" runat="server"></asp:Label>
                            </div>
                            <div class="widget-body form">
                                <div class="control-group">
                                    <table cellpadding="10" align="center" style="font-weight: 500">
                                        <tr>
                                            <td>
                                                Category Name
                                            </td>
                                            <td>
                                                <asp:DropDownList runat="server" ID="dropcategory">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="dropcategory"
                                                            ForeColor="Red" ValidationGroup="B" InitialValue="0" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Sub Category Name
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtsubcate"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                                ControlToValidate="txtsubcate"
                                                                ForeColor="Red" ValidationGroup="B">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center">
                                                <asp:Button ID="btadd" runat="server" Text="Save" class="btn btn-info" Width="100px"
                                                    OnClick="btadd_Click" ValidationGroup="B" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="widget">
                            <div class="widget-title">
                                <h4>
                                    Sub Category List</h4>
                            </div>
                            <div class="widget-body form">
                                <div class="form-group">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                            </h4>
                                        </div>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Style="color: #00CC99"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:GridView ID="gridbod" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                                        AllowSorting="True" PageSize="8" Width="849px" OnPageIndexChanging="gridbod_PageIndexChanging"
                                                        OnRowCommand="gridbod_RowCommand">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <table style="width: 100%; table-layout: fixed; text-align: center;">
                                                                        <tr>
                                                                            <td style="width: 35px;">
                                                                                <asp:CheckBox ID="chkbody" runat="server" />
                                                                                <asp:Label ID="lbluid" runat="server" Text='<%# Eval("Sub_cat_id") %>' Visible="False"></asp:Label>
                                                                            </td>
                                                                          
                                                                            <td style="width: 100">
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("categoryname") %>'></asp:Label>
                                                                            </td>
                                                                            <td style="padding-top: 5px; padding-bottom: 5px;">
                                                                                <asp:LinkButton ID="btnedit" CssClass="btn btn-primary" runat="server" CausesValidation="False"
                                                                                    CommandName="btnedit" CommandArgument='<%# Eval("Sub_cat_id") %>'>
                                                                            <span class="glyphicon glyphicon-pencil"></span>&nbsp;Edit</asp:LinkButton>
                                                                            </td>
                                                                            <td style="padding-top: 5px; padding-bottom: 5px;">
                                                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="btndelete" CausesValidation="False"
                                                                                    CssClass="btn btn-danger">
                                                                           <span class="glyphicon glyphicon-trash"></span>&nbsp; Delete</asp:LinkButton>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <HeaderTemplate>
                                                                    <table style="width: 100%; table-layout: fixed; text-align: center; height: 30px;">
                                                                        <tr>
                                                                            <td style="width: 35px;">
                                                                                ID
                                                                            </td>
                                                                             <td style="width: 150">
                                                                                Category Name
                                                                            </td>
                                                                         
                                                                            <td style="width: 100">
                                                                                Edit
                                                                            </td>
                                                                            <td style="width: 100">
                                                                                Delete
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </HeaderTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <FooterStyle BackColor="#CCCC99" />
                                                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="#4E5154" Font-Bold="True" ForeColor="White"/>
                                                        <AlternatingRowStyle BackColor="White" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="lbdelete" CausesValidation="false" runat="server" 
                                                        class="btn btn-danger" onclick="lbdelete_Click"><span class="glyphicon glyphicon-trash"></span> Delete</asp:LinkButton>
                                                </td>
                                                <td align="right">
                                                    &nbsp;
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
        </div>
    </div>
    </form>
    <uc:AdminScript runat="server" ID="ucAdminScript" />
</body>
</html>
