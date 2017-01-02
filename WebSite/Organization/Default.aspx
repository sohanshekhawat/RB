<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Src="~/Organization/UserControl/AdminScript.ascx" TagPrefix="uc" TagName="AdminScript" %>
<%@ Register Src="~/Organization/UserControl/Admin_source.ascx" TagPrefix="uc" TagName="Admin_source" %>
<%@ Register Src="~/Organization/UserControl/AdminSidebar.ascx" TagPrefix="uc" TagName="AdminSidebar" %>
<%@ Register Src="~/Organization/UserControl/AdminHeader.ascx" TagPrefix="uc" TagName="AdminHeader" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Blog Post|| Dashboard</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <uc:Admin_source runat="server" ID="ucAdmin_source" />
     <link href="css/grid.css" rel="stylesheet" type="text/css" />
    <link href="assets/jqvmap/jqvmap/jqvmap.css" media="screen" rel="stylesheet" type="text/css" />
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
            height: 40px;
            margin-right: 5px;
            padding: 5px;
        }
        .backimg
        {
            background-image: url("img/upimage.png");
            border-radius: 100% 100% 100% 100%;
            -moz-border-radius: 100% 100% 100% 100%;
            -webkit-border-radius: 100% 100% 100% 100%;
            background-repeat: no-repeat;
            background-position: center;
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
            width: 40%;
            background: white;
            border-bottom: 1px solid #aaa;
            border-radius: 4px;
            box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
            border: 1px solid rgba(0, 0, 0, 0.1);
            background-clip: padding-box;
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
            line-height: 1;
            font-size: 1.5em;
            top: 5%;
            right: 2%;
            text-decoration: none;
            color: #bbb;
            float: right;
            height: 35px;
            left: 22px;
            position: relative;
            top: -25px;
            width: 34px;
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
            margin-top: 20%;
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
</head>
<body class="fixed-top">
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager runat="server" ID="ToolscriptManager">
    </asp:ToolkitScriptManager>
    <uc:AdminHeader runat="server" ID="ucAdminHeader" />
    <div id="container" class="row-fluid">
        <uc:AdminSidebar runat="server" ID="ucAdminSidebar" />
        <div id="body">
            <div class="container-fluid">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="widget">
                            <div class="widget-title">
                                <h4>
                                    Welcome To Blog Post Admin Panel
                                </h4>
                                <asp:Label ID="lblid" runat="server" Visible="False"></asp:Label>
                            </div>
                            <div class="widget-body form">
                                <div class="control-group">
                                    <table class="style1" style="width:100%">
                                        <tr style="width:100%;">
                                           
                                            <td style="font-size: 20px; font-weight: bold;padding-left:13%;width:50%" height="30px;">
                                                Post
                                            </td>
                                            <td style="font-size: 20px; font-weight: bold;padding-left:15%;width:50%" height="30px">
                                                Blogger
                                            </td>
                                        </tr>
                                        <tr>
                                            
                                            <td width="50%" style="text-align: center;">
                                                <div style="border-radius: 100% 100% 100% 100%; -moz-border-radius: 100% 100% 100% 100%;
                                                    -webkit-border-radius: 100% 100% 100% 100%; border: 3px solid #00AEEF; height: 150px;
                                                    width: 150px; margin-left: 100px;">
                                                    <div style="background-color: White; padding: 43%; border-radius: 100% 100% 100% 100%;
                                                        -moz-border-radius: 100% 100% 100% 100%; -webkit-border-radius: 100% 100% 100% 100%;
                                                        font-size: 32px;">
                                                          <asp:Label ID="lblp" runat="server" Text="Label"></asp:Label>
                                                       </div>
                                                </div>
                                            </td>
                                            <td width="50%" style="text-align: center;">
                                                <div style="border-radius: 100% 100% 100% 100%; -moz-border-radius: 100% 100% 100% 100%;
                                                    -webkit-border-radius: 100% 100% 100% 100%; border: 3px solid #EC008C; height: 150px;
                                                    width: 150px; margin-left: 100px;">
                                                    <div style="background-color: White; padding: 43%; border-radius: 100% 100% 100% 100%;
                                                        -moz-border-radius: 100% 100% 100% 100%; -webkit-border-radius: 100% 100% 100% 100%;
                                                        font-size: 32px;">
                                                    <asp:Label ID="lblb" runat="server" Text="Label"></asp:Label>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <table class="style1" style="width:100%;">
                                        <tr>
                                            <td width="50%">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="50%" style="vertical-align: top;">
                                                <div class="widget" style="width: 90%;">
                                                    <div class="widget-title">
                                                        <h4 style="text-align: center; font-size: 20px; font-weight: bold">
                                                            List Of Pending Post</h4>
                                                        &nbsp;</div>
                                                    <div class="widget-body form">
                                                        <div class="control-group">
                                                            <table cellpadding="10" style="font-weight: 500; width: 100%">
                                                                <tr>
                                                                    <td>
                                                                        <asp:GridView ID="gridbod" runat="server" AutoGenerateColumns="False" 
                                                        AllowSorting="True" PageSize="15" Width="100%"
                                                        OnRowCommand="gridbod_RowCommand">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <table style="width: 100%; table-layout: fixed; text-align: center;">
                                                                        <tr>
                                                                            <td style="width: 35px;">
                                                                                <asp:CheckBox ID="chkbody" runat="server" />
                                                                                <asp:Label ID="lbluid" runat="server" Text='<%# Eval("Post_id") %>' Visible="False"></asp:Label>
                                                                            </td>
                                                                          
                                                                            <td style="width: 100">
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("PostTitle") %>'></asp:Label>

                                                                            </td>
                                                                         
                                                                            <td style="padding-top: 5px; padding-bottom: 5px; width: 100">
                                                                                <asp:Label ID="lblstatuspending" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                                                                <br />
                                                                                <a id="btnsend" class="btn btn-gray" style="width: 50px;" onclick="showdialog(<%# Eval("Post_id") %>,'P');"  onclick="showdialog(<%# Eval("Blogger_id") %>,'B');" class="js-open-modal" data-modal-id="popup">
                                                                                    &nbsp;Change Status&nbsp; </a>
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
                                                                                Post Title
                                                                            </td>
                                                                          
                                                                            <td style="width: 100">
                                                                                Status
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
                                                                </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td style="vertical-align: top;">
                                                <div class="widget" style="width: 90%;">
                                                    <div class="widget-title">
                                                        <h4 style="font-size: 20px; font-weight: bold">
                                                            List Of Pending Blogger</h4>
                                                        &nbsp;</div>
                                                    <div class="widget-body form">
                                                        <div class="control-group">
                                                            <table cellpadding="10" style="font-weight: 500; width: 100%">
                                                                <tr>
                                                                    <td>
                                                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                                                            AllowSorting="True" PageSize="15" Width="100%" OnRowCommand="GridView1_RowCommand">
                                                                            <Columns>
                                                                                <asp:TemplateField>
                                                                                    <ItemTemplate>
                                                                                        <table style="width: 100%; table-layout: fixed; text-align: center;">
                                                                                            <tr>
                                                                                                <td style="width: 35px;">
                                                                                                    <asp:CheckBox ID="chkbody" runat="server" />
                                                                                                    <asp:Label ID="lblcid" runat="server" Text='<%# Eval("Blogger_id") %>' Visible="False"></asp:Label>
                                                                                                </td>
                                                                                                <td style="width: 100">
                                                                                                    <asp:LinkButton ID="btnprofileblog" runat="server" CausesValidation="False" CommandName="btnprofileblog"
                                                                                                        Text='<%# Eval("Name") %>' CommandArgument='<%# Eval("Blogger_id") %>' OnClick="btnprofileblog_Click"></asp:LinkButton>
                                                                                                </td>
                                                                                                <td style="padding-top: 5px; padding-bottom: 5px; width: 100">
                                                                                                    <asp:Label ID="lblstatuspending" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                                                                                    <br />
                                                                                                    <a id="btnsend" class="btn btn-gray" style="width: 50px;"  onclick="showdialog(<%# Eval("Blogger_id") %>,'B');" class="js-open-modal" data-modal-id="popup">
                                                                                                        &nbsp;Change Status&nbsp; </a>
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
                                                                                                <td style="width: 100">
                                                                                                    Name
                                                                                                </td>
                                                                                                <td style="width: 100">
                                                                                                    Status
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
                                                               
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div id="popup" class="modal-box">
                                       <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="~/Organization/img/close.png" CausesValidation="False" class="js-modal-close btnclose"/>
                                      
                                        <div class="widget-title" style="padding-left: 5px; padding-top: 5px; text-align: center">
                                             Reject/Approve Post Or Blogger</div>
                                        <div class="widget-body form">
                                         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                         <ContentTemplate>
                                         
                                         
                                                    <table cellpadding="10" style="width: 100%; color: Black; margin: 5px">
                                                        <tr>
                                                         
                                                            <td width="50%" style="text-align: center">
                                                               
                                                                <asp:RadioButton ID="rbtnpending" runat="server" ValidationGroup="rbstus"
                                                                    AutoPostBack="True" Checked="True" GroupName="rbstus" />
                                                                     Pending
                                                             
                                                                <asp:RadioButton ID="rbtnapprv" runat="server" AutoPostBack="True" 
                                                                    GroupName="rbstus" OnCheckedChanged="rbtnapprv_CheckedChanged" />   Approve
                                                              
                                                                <asp:RadioButton ID="rbthnreject" runat="server" AutoPostBack="True" GroupName="rbstus"
                                                                    OnCheckedChanged="rbthnreject_CheckedChanged" />  Reject
                                                            </td>
                                                           
                                                            <td style="display: none">
                                                                <asp:TextBox runat="server" ID="txtreasonid" Width="75%"></asp:TextBox>
                                                                <asp:TextBox runat="server" ID="txttype" Width="75%"></asp:TextBox>
                                                                   <asp:TextBox runat="server" ID="txtstatus" Width="75%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" id="fullresn" runat="server" visible="false"> 
                                                                Reason:
                                                                <asp:TextBox runat="server" ID="txtresn" TextMode="MultiLine" Width="75%" ></asp:TextBox>
                                                                <br />
                                                                
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: center;" colspan="2">
                                                                <asp:Button ID="Button1" runat="server" Text="Ok" OnClick="btnok_Click"   />
                                                            </td>
                                                        </tr>
                                                    </table>
                                              </ContentTemplate>
                                         
                                         </asp:UpdatePanel>
                                        </div>
                                 
                                </div>
                                <div>
                                    <asp:Label ID="lblCurrentID" runat="server" Text="0" Visible="False"></asp:Label>
                                    <asp:Label ID="lblCurrentEmail" runat="server" Text="test@gmail.com" Visible="False"></asp:Label>
                                    <asp:Label ID="lblReasonStatus" runat="server" Text="Pending" Visible="False"></asp:Label>
                                    <asp:Label ID="lblUserType" runat="server" Text="UserType" Visible="False"></asp:Label>
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
    <script>
        jQuery(document).ready(function () {
            // initiate layout and plugins
            App.setMainPage(true);
            App.init();
        });
    </script>
</body>
</html>
