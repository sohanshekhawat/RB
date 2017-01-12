<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" MasterPageFile="~/MasterPage.master" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">


    <link href="css/new_login.css" rel="stylesheet" type="text/css" />
    <link href="css/CropBoxStyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>

    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }

        input[type=text], input[type=password] {
            width: 200px;
        }

        table {
            border: 1px solid #ccc;
        }

            table th {
                background-color: #F7F7F7;
                color: #333;
                font-weight: bold;
            }

            table th, table td {
                padding: 5px;
                border-color: #ccc;
            }
    </style>

    <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server">
    </asp:ScriptManager>
    <div id="main" class="header-style1">
        <!-- Begin Main Wrapper -->
        <div class="container main-wrapper">

            <div class="login_signup_bg clearfix">
                <div class="login-warrper signup_section">
                    <div class="login_bg">
                        <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" CreateUserText="Register" CreateUserUrl="~/Signup.aspx" DestinationPageUrl="~/Default.aspx"
                            PasswordRecoveryText="Forget Password" PasswordRecoveryUrl="~/Signup.aspx" DisplayRememberMe="False" RememberMeText="">
                            <LayoutTemplate>
                                <label>Provide email and password to login</label>

                                <asp:TextBox ID="UserName" runat="server" class="social_textbox" placeholder="Enter email"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                <br />

                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="Login1"
                                    ErrorMessage="Invalid Email" ControlToValidate="UserName" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ForeColor="Red" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                <br />
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" class="social_textbox" placeholder="Enter password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>

                                <br />
                                <asp:Label ID="FailureText" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>

                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" class="green_btn" />

                                <asp:HyperLink ID="CreateUserLink" runat="server" NavigateUrl="~/Signup.aspx" ForeColor="Blue">Register</asp:HyperLink>
                                <br />
                                <asp:HyperLink ID="PasswordRecoveryLink" runat="server" NavigateUrl="~/RecoveryPassword.aspx" ForeColor="Blue">Forget Password?</asp:HyperLink>

                            </LayoutTemplate>
                        </asp:Login>

                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
