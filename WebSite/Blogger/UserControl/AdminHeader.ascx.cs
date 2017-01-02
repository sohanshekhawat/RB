using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UControl_AdminHeader : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Blogger_username"] == null || Session["Blogger_username"] == "")
        {
            Response.Redirect("~/Blogger/login.aspx");
        }
        else
        {
            welcomeadmin.InnerText = "Welcome : " + Session["Blogger_username"].ToString();
        }
    }
    protected void Page_Init(Object sender, EventArgs e)
    {
        if (Session["Blogger_username"] == null || Session["Blogger_username"] == "")
        {
            Response.Redirect("~/Blogger/login.aspx");
        }
        else
        {
            welcomeadmin.InnerText = "Welcome : " + Session["Blogger_username"].ToString();
        }
    }
    protected void logout_Click(object sender, EventArgs e)
    {
        Session["Blogger_username"] = string.Empty;
        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/Blogger/login.aspx");
    }
}