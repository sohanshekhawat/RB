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
        if (!IsPostBack)
        {
            if (Session["Org_username"] == null || Session["Org_username"] == "")
            {
                Response.Redirect("~/Organization/login.aspx");
            }
            else
            {
                welcomeadmin.InnerText = "Welcome : " + Session["Org_username"].ToString();
            }
        }
    }
    protected void Page_Init(Object sender, EventArgs e)
    {
        if (Session["Org_username"] == null || Session["Org_username"] == "")
        {
            Response.Redirect("~/Organization/login.aspx");
        }
       
    }
    protected void logout_Click(object sender, EventArgs e)
    {
        Session["Org_username"] = string.Empty;
        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/Organization/login.aspx");
    }
}