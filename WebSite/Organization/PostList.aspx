<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PostList.aspx.cs" Inherits="Admin_PostList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Organization/UserControl/AdminScript.ascx" TagPrefix="uc" TagName="AdminScript" %>
<%@ Register Src="~/Organization/UserControl/Admin_source.ascx" TagPrefix="uc" TagName="Admin_source" %>
<%@ Register Src="~/Organization/UserControl/AdminSidebar.ascx" TagPrefix="uc" TagName="AdminSidebar" %>
<%@ Register Src="~/Organization/UserControl/AdminHeader.ascx" TagPrefix="uc" TagName="AdminHeader" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title>Blog Post Panel | Admin Panel </title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <link href="css/grid.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .container1
        {
            position: absolute;
            top: 10%;
            left: 10%;
            right: 0;
            bottom: 0;
        }
        .action
        {
            width: 400px;
            height: 30px;
            margin: 10px 0;
        }
        .cropped > img
        {
            margin-right: 10px;
            border-radius: 60%;
            height: 100%;
        }
        .btnpropic
        {
            background: #4e9caf none repeat scroll 0 0;
            border-radius: 5px;
            color: white;
            display: block;
            font-weight: bold;
            height: 25px;
            margin-right: 5px;
            padding: 5px;
        }
        
        .watermark
        {
            height: 20px;
            width: 100px;
            padding: 2px 0 0 2px;
            border: 1px solid #BEBEBE;
            background-color: #F0F8FF;
            color: gray;
        }
        .cpbtn
        {
            background: #4e9caf none repeat scroll 0 0;
            border-radius: 5px;
            color: white;
            display: block;
            font-weight: bold;
            height: 30px;
            margin-right: 5px;
            padding: 5px;
            text-align: center;
        }
        .modal-box
        {
            display: none;
            position: fixed;
            z-index: 1000;
            width: 50%;
            background: white;
            border-bottom: 1px solid #aaa;
            border-radius: 4px;
            box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
            border: 1px solid rgba(0, 0, 0, 0.1);
            background-clip: padding-box;
            margin-top: -140px;
        }
        .modal-box header, .modal-box .modal-header
        {
            padding: 1.25em 1.5em;
            border-bottom: 1px solid #ddd;
        }
        .modal-box header h3, .modal-box header h4, .modal-box .modal-header h3, .modal-box .modal-header h4
        {
            margin: 0;
        }
        .modal-box .modal-body
        {
            padding: 2em 1.5em;
        }
        .modal-box footer, .modal-box .modal-footer
        {
            padding: 1em;
            border-top: 1px solid #ddd;
            background: rgba(0, 0, 0, 0.02);
            text-align: right;
        }
        .modal-overlay
        {
            opacity: 1.00;
            filter: alpha(opacity=0);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 900;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.3) !important;
        }
        a.close
        {
            color: #000;
            float: right;
            font-size: 21px;
            padding-top: 3px;
            padding-right: 3px;
        }
        a.backimg
        {
            background-image: url("img/upimage.png");
            border-radius: 100% 100% 100% 100%;
            -moz-border-radius: 100% 100% 100% 100%;
            -webkit-border-radius: 100% 100% 100% 100%;
            background-repeat: no-repeat;
            background-position: center;
        }
        a.close:hover
        {
            color: #222;
            -webkit-transition: color 1s ease;
            -moz-transition: color 1s ease;
            transition: color 1s ease;
        }
    </style>
    <link href="css/CropBoxStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #overlay
        {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #000;
            filter: alpha(opacity=70);
            -moz-opacity: 0.7;
            -khtml-opacity: 0.7;
            opacity: 0.7;
            z-index: 100;
            display: none;
        }
        
        .popup1
        {
            width: auto;
            height: auto;
            display: none;
            position: fixed;
            z-index: 101;
            margin-top: -105%;
        }
        
        .content1
        {
            min-width: auto;
            margin-top: -42%;
            width: 680px;
            min-height: 150px;
            background: #f3f3f3;
            position: relative;
            z-index: 103;
            border-radius: 5px;
            box-shadow: 0 2px 5px #000;
            margin-left: 10%;
        }
        
        .content1 p
        {
            clear: both;
            color: #555555;
            text-align: justify;
        }
        .content1 p a
        {
            color: #d91900;
            font-weight: bold;
        }
        .content1 .x
        {
            float: right;
            height: 35px;
            left: 22px;
            position: relative;
            top: -25px;
            width: 34px;
        }
        .content1 .btnclose
        {
            float: right;
            height: 35px;
            left: 22px;
            position: relative;
            top: -25px;
            width: 34px;
        }
        
        .content1 .x:hover
        {
            cursor: pointer;
        }
         .btnclose
        {
            float: right;
            height: 35px;
            left: 22px;
            position: relative;
            top: -25px;
            width: 34px;
        }
    </style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type='text/javascript'>
        $(function () {

            var appendthis = ("<div class='modal-overlay js-modal-close'></div>");

            $('a[data-modal-id]').click(function (e) {
                e.preventDefault();
                $("body").append(appendthis);
                $(".modal-overlay").fadeTo(500, 0.7);
                //$(".js-modalbox").fadeIn(500);
                var modalBox = $(this).attr('data-modal-id');
                $('#' + modalBox).fadeIn($(this).data());

            });


            $(".js-modal-close, .modal-overlay").click(function () {
                $(".modal-box, .modal-overlay").fadeOut(500, function () {
                    $(".modal-overlay").remove();
                });
            });

            $(window).resize(function () {
                $(".modal-box").css({
                    top: ($(window).height() - $(".modal-box").outerHeight()) / 2,
                    left: ($(window).width() - $(".modal-box").outerWidth()) / 2
                });
            });

            $(window).resize();

        });
        function showdialog(id, type) {
            document.getElementById('txtreasonid').value = id;
            document.getElementById('txttype').value = type;
            var appendthis = ("<div class='modal-overlay js-modal-close'></div>");

            $('a[data-modal-id]').click(function (e) {
                e.preventDefault();
                $("body").append(appendthis);
                $(".modal-overlay").fadeTo(500, 0.7);
                //$(".js-modalbox").fadeIn(500);
                var modalBox = $(this).attr('data-modal-id');
                $('#' + modalBox).fadeIn($(this).data());

            });
        }

      

    </script>
    <script type='text/javascript'>
        $(function () {
            var overlay = $('<div id="overlay"></div>');
            $('.close').click(function () {
                $('.popup1').hide();
                overlay.appendTo(document.body).remove();
                return false;
            });

            $('.x').click(function () {
                $('.popup1').hide();
                overlay.appendTo(document.body).remove();
                return false;
            });

            $('.click').click(function () {
                overlay.show();
                overlay.appendTo(document.body);
                $('.popup1').show();
                return false;
            });
        });
      

       
    </script>
    <uc:Admin_source runat="server" ID="ucAdmin_source" />
</head>
<body class="fixed-top">
    <asp:Label runat="server" ID="lblstats" Visible="false">0</asp:Label>
    <asp:Label runat="server" ID="lblremove" Visible="false"></asp:Label>
    <form id="Form1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePageMethods="true"></asp:ToolkitScriptManager>
 
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
                            <li>PostList</li>
                        </ul>
                        <div class="widget" id="viewtable" visible="false" runat="server">
                            <div class="widget-title">
                                <h4>
                                    PostList</h4>
                                <asp:Label ID="lblid" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lblfilename" Visible="false" runat="server"></asp:Label>
                                &nbsp;<span style="color: Gray; font-size: 12px">(* fields are mandatory)</span>
                                <div style="padding-right: 20px; width: 15px; float: right;">
                                    <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="~/Admin/img/close.png" OnClick="btnCancel_Click"
                                        CausesValidation="False" />
                                </div>
                            </div>
                            <div class="widget-body form">
                                <div class="control-group">
                                    <table cellpadding="10" align="center" style="font-weight: 500">
                                        <tr>
                                          
                                            <td colspan="2">
                                                 <a style="height: 200px; width: 200px; margin-left: 25%;" class="js-open-modal "
                                                    data-modal-id="popup1">
                                                    <asp:Label ID="lbloldprofilepict" runat="server" Text="" Visible="false"></asp:Label>
                                                    <div class="cropped" style="height: 200px; width: 200px; border-radius: 100% 100% 100% 100%;
                                                        background-image: url('img/upimage.png'); background-repeat: no-repeat; background-position: center;
                                                        -moz-border-radius: 100% 100% 100% 100%; -webkit-border-radius: 100% 100% 100% 100%;
                                                        cursor: pointer" id="_profilepic" runat="server" >
                                                    </div>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Select Category
                                            </td>
                                            <td>
                                            <asp:UpdatePanel ID="up1" runat="server">
                                            <ContentTemplate>
                                              <asp:DropDownList ID="dpcate" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dpcate_SelectedIndexChanged"
                                                    ValidationGroup="pv">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dpcate"
                                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" InitialValue="0" 
                                                    ValidationGroup="pv" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </ContentTemplate>
                                            </asp:UpdatePanel>
                                              
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Select SubCategory
                                            </td>
                                            <td>
                                             <asp:UpdatePanel  ID="up2" runat="server">
                                            <ContentTemplate>
                                                <asp:DropDownList ID="dpsubcat" runat="server" AutoPostBack="True" ValidationGroup="pv">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dpsubcat"
                                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" InitialValue="0" ValidationGroup="pv" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                           </ContentTemplate>
                                           </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                   
                                        <tr>
                                            <td>
                                                Select Blogger</td>
                                            <td>
                                               <asp:UpdatePanel  ID="up4" runat="server">
                                            <ContentTemplate>
                                                <asp:DropDownList ID="dpblogger" runat="server" AutoPostBack="True" ValidationGroup="pv">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="dpblogger"
                                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" InitialValue="0" ValidationGroup="pv" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </ContentTemplate>
                                            </asp:UpdatePanel></td>
                                        </tr>
                                   
                                        <tr>
                                            <td>
                                                Post Title
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtpost" runat="server" Width="90%"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtpost"
                                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="pv" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Description
                                            </td>
                                            <td>
                                                <div id="transliterate">
                                                    <p>
                                                        <script type="text/javascript" src="../HindiDemo_files/wp-emoji-release.js"></script>
                                                        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
                                                        <script type="text/javascript" src="../HindiDemo_files/Google-IME.js">
                                                        </script>
                                                        <script type="text/javascript" src="../HindiDemo_files/a">
                                                        </script>
                                                        <link rel="stylesheet" type="text/css" href="../HindiDemo_files/transliteration.css">
                                                        </link>
                                                        <script type="text/javascript" src="../HindiDemo_files/transliteration.js">
                                                        </script>
                                                    </p>
                                                    <div id="translcontrol">
                                                        <input checked="checked" id="checkboxId" onclick="javascript:checkboxClickHandler()"
                                                            type="checkbox">
                                                        Type in<br>
                                                        <select id="languageDropDown" onchange="javascript:languageChangeHandler()">
                                                            <option value="hi">HINDI</option>
                                                            <option selected="selected" value="hi">HINDI</option>
                                                        </select></div>
                                                    <p>
                                                        <input id="transl1" style="display: none !important;" type="textbox"><br>
                                                        भाषाओं और अंग्रेजी भाषा के मध्य चुनाव के लिए CTRL+g का प्रयोग करें<br>
                                                        Press Ctrl+g to toggle between English and Other Languages<br>
                                                        <textarea id="transl2" style="background: rgb(238, 238, 238) none repeat scroll 0% 0%;
                                                            border: 1px dotted rgb(221, 221, 221); height: 250px; width: 95%; line-height: 1.5em;
                                                            font-family: Arial,Helvetica,sans-serif; font-size: 14px;" runat="server" onclick="return transl2_onclick()"></textarea></p>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Date
                                            </td>
                                            <td width="50%">
                                                <asp:TextBox ID="txtdate" runat="server"></asp:TextBox>
                                                <asp:CalendarExtender ID="txtdate_CalendarExtender" runat="server" 
                                                    TargetControlID="txtdate"    Format="dd/MM/yyyy" >
                                                </asp:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Active
                                            </td>
                                            <td style="padding-top: 5px; padding-bottom: 5px;">
                                                <div class="danger-toggle-button">
                                                    <input type="checkbox" class="toggle" checked="checked" id="cmbactive" runat="server" /></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center" width="50%">
                                                <asp:Button ID="btadd" runat="server" Text="Add" class="btn btn-info" Width="100px"
                                                    OnClick="btadd_Click" ValidationGroup="pv" />
                                                <%--<button type="button" class="btn btn-info">Add</button>--%>
                                                 <textarea id="imgCropped" type="text" runat="server" style="display: none">
                            </textarea>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="widget">
                            <div class="widget-title">
                                <h4>
                                    Post List</h4>
                                <div style="float: right; padding-right: 30px; margin-top: 5px;">
                                    <asp:Button ID="btnadd" runat="server" CssClass="btn btn-success" Text="Add Post"
                                        Width="150px" OnClick="btnadd_Click" />
                                </div>
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
                                                        AllowSorting="True" Width="100%" OnPageIndexChanging="gridbod_PageIndexChanging"
                                                        OnRowCommand="gridbod_RowCommand" OnSelectedIndexChanged="gridbod_SelectedIndexChanged">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <table style="width: 100%; table-layout: fixed; text-align: center;">
                                                                        <tr>
                                                                            <td style="width: 15px;">
                                                                                <asp:CheckBox ID="chkbody" runat="server" />
                                                                                <asp:Label ID="lbluid" runat="server" Text='<%# Eval("Post_id") %>' Visible="False"></asp:Label>
                                                                            </td>
                                                                            <td style="width: 100px">
                                                                             <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image","~/siteimages/postImg/{0}") %>'
                                                                                    Height="75" Width="75"  style=" border-radius: 75px;" />
                                                                            </td>
                                                                            <td style="width: 100px">
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("PostTitle") %>'></asp:Label>
                                                                            </td>
                                                                            <td style="width: 200px">
                                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("PostContent") %>'></asp:Label>
                                                                            </td>
                                                                            <td style="padding-top: 5px; padding-bottom: 5px; width: 100px">
                                                                                <asp:Label ID="lblstatuspending" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                                                                <br />
                                                                                <a id="btnsend" class="btn btn-gray" style="width: 50px;" onclick="showdialog(<%# Eval("Post_id") %>,'P');"
                                                                                    onclick="showdialog(<%# Eval("Blogger_id") %>,'B');" class="js-open-modal" data-modal-id="popup">
                                                                                    &nbsp;Change Status&nbsp; </a>
                                                                            </td>
                                                                            <td style="padding-top: 5px; padding-bottom: 5px;width: 50px">
                                                                                <asp:LinkButton ID="btnedit" CssClass="btn btn-primary" runat="server" CausesValidation="False"
                                                                                    CommandName="btnedit" CommandArgument='<%# Eval("Post_id") %>'>
                                                                            <span class="glyphicon glyphicon-pencil"></span>&nbsp;Edit</asp:LinkButton>
                                                                            </td>
                                                                            <td style="padding-top: 5px; padding-bottom: 5px;width: 50px">
                                                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="btndelete" CausesValidation="False"
                                                                                    CssClass="btn btn-danger" CommandArgument='<%# Eval("Post_id") %>'>
                                                                           <span class="glyphicon glyphicon-trash"></span>&nbsp; Delete</asp:LinkButton>
                                                                            </td>
                                                                            <td style="padding-top: 5px; padding-bottom: 5px;width: 30px">
                                                                                <asp:UpdatePanel ID="up1" runat="server">
                                                                                    <ContentTemplate>
                                                                                   
                                                                                      <asp:CheckBox ID="cbactive" runat="server" AutoPostBack="False" Checked='<%#Convert.ToBoolean(Eval("Active"))%>' />
                                                                           
                                                                                    </ContentTemplate>
                                                                                </asp:UpdatePanel>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <HeaderTemplate>
                                                                    <table style="width: 100%; table-layout: fixed; text-align: center; height: 30px;">
                                                                        <tr>
                                                                            <td style="width: 15px;">
                                                                                ID
                                                                            </td>
                                                                            <td style="width: 100px">
                                                                                Image
                                                                            </td>
                                                                            <td style="width: 100px">
                                                                                Post Title
                                                                            </td>
                                                                            <td style="width: 200px">
                                                                                Post Content
                                                                            </td>
                                                                            <td style="width: 100px">
                                                                                Status
                                                                            </td>
                                                                            <td style="width: 50px">
                                                                                Edit
                                                                            </td>
                                                                            <td style="width: 50px">
                                                                                Delete
                                                                            </td>
                                                                            <td style="width: 30px">
                                                                                Active
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </HeaderTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <FooterStyle BackColor="#CCCC99" />
                                                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="#4E5154" Font-Bold="True" ForeColor="White" />
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
                                                    <asp:LinkButton ID="lblupdateall" CausesValidation="false" runat="server" class="btn btn-success"
                                                        OnClick="lblupdateall_Click"><span class="glyphicon glyphicon-trash"></span> Update</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div id="popup" class="modal-box">
                                      <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Organization/img/close.png" CausesValidation="False" class="js-modal-close btnclose"/>
                                    <div class="widget-title" style="padding-left: 5px; padding-top: 5px; text-align: center">
                                        Reject/Approve Post</div>
                                    <div class="widget-body form">
                                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                            <ContentTemplate>
                                                <table cellpadding="10" style="width: 100%; color: Black; margin: 5px">
                                                    <tr>
                                                        <td width="50%" style="text-align: center">
                                                            <asp:RadioButton ID="rbtnpending" runat="server" ValidationGroup="rbstus"
                                                                    AutoPostBack="True" Checked="True" GroupName="rbstus" />
                                                                     Pending
                                                             
                                                           
                                                            <asp:RadioButton ID="rbtnapprv" runat="server" AutoPostBack="True" 
                                                                GroupName="rbstus" OnCheckedChanged="rbtnapprv_CheckedChanged" />
                                                            Approve
                                                            <asp:RadioButton ID="rbthnreject" runat="server" AutoPostBack="True" GroupName="rbstus"
                                                                OnCheckedChanged="rbthnreject_CheckedChanged" />
                                                            Reject
                                                        </td>
                                                        <td style="display: none">
                                                            <asp:TextBox runat="server" ID="txtreasonid" Width="75%"></asp:TextBox>
                                                            <asp:TextBox runat="server" ID="txttype" Width="75%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" id="fullresn" runat="server" visible="false">
                                                            Reason:
                                                            <asp:TextBox runat="server" ID="txtresn" TextMode="MultiLine" Width="75%"></asp:TextBox>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center;" colspan="2">
                                                            <asp:Button ID="Button1" runat="server" Text="Ok" OnClick="btnok_Click" class="js-modal-close" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                                <div id="popup1" class="modal-box">
                                    <a class="js-modal-close close">
                                        <img src="img/close.png" /></a>
                                    <div class="widget-title" style="padding-left: 5px; padding-top: 5px; text-align: center">
                                        Profile Details
                                    </div>
                                    <div class="widget-body form">
                                        <table cellpadding="10" style="width: 100%; color: Black; margin: 5px">
                                            <tr>
                                                <td width="50%">
                                                    <script src="js/CropBox.js" type="text/javascript"></script>
                                                    <div class="imageBox" runat="server" id="uploadedimg">
                                                        <div class="thumbBox">
                                                        </div>
                                                        <div class="spinner" style="display: none">
                                                            Loading...</div>
                                                    </div>
                                                    <div class="action">
                                                        <asp:FileUpload runat="server" ID="file" Style="float: left; width: 250px" />
                                                        <span style="cursor: pointer"><a id="btnCrop" style="float: right" class="cpbtn">Crop</a>
                                                        </span><span style="cursor: pointer"><a id="btnZoomIn" style="float: right" class="cpbtn">
                                                            +</a> </span><span style="cursor: pointer"><a id="btnZoomOut" style="float: right"
                                                                class="cpbtn">-</a></span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="cropped_">
                                                    </div>
                                                    <a class="js-modal-close btnpropic">Set As Profile Picture</a>
                                                    <%-- <asp:Button runat="server" ID="btnpropic" CssClass="close btnpropic" Text="Set As Profile Picture" />--%>
                                                    <script type="text/javascript">
                                                        window.onload = function () {
                                                            var options =
        {
            thumbBox: '.thumbBox',
            imageBox: '.imageBox',
            spinner: '.spinner',
            imgSrc: 'avatar.png'
        }
                                                            var cropper;
                                                            document.querySelector('#file').addEventListener('change', function () {
                                                                var reader = new FileReader();
                                                                reader.onload = function (e) {
                                                                    options.imgSrc = e.target.result;
                                                                    cropper = new cropbox(options);
                                                                }
                                                                reader.readAsDataURL(this.files[0]);
                                                                this.files = [];
                                                            })
                                                            document.querySelector('#btnCrop').addEventListener('click', function () {
                                                                var img = cropper.getDataURL()
                                                                document.querySelector('.cropped').innerHTML += '<img runat="server" id="test_img_my" src="' + img + '">';
                                                                document.querySelector('.cropped_').innerHTML += '<img runat="server" id="test_img_my1" src="' + img + '">';

                                                                sessionStorage.setItem("curimg", img);
                                                                var crrimg = sessionStorage.getItem("curimg");
                                                                document.getElementById("imgCropped").value = crrimg;

                                                                //PageMethods.GetCurrentTime(img);

                                                            })
                                                            document.querySelector('#btnZoomIn').addEventListener('click', function () {
                                                                cropper.zoomIn();
                                                            })
                                                            document.querySelector('#btnZoomOut').addEventListener('click', function () {
                                                                cropper.zoomOut();
                                                            })
                                                        };

                                                        function Currentimg() {
                                                            var crrimg = sessionStorage.getItem("curimg");
                                                            document.getElementById("imgCropped").value = crrimg;


                                                        }
                                      

                                                        </script>
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
