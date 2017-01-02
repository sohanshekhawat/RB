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
            if (Session["username"] == null || Session["username"] == "")
            {
                Response.Redirect("~/Admin/login.aspx");
            }
        }
    }
    protected void Page_Init(Object sender, EventArgs e)
    {
        if (Session["username"] == null || Session["username"]=="")
        {
            Response.Redirect("~/Admin/login.aspx");
        }
       
    }
    protected void logout_Click(object sender, EventArgs e)
    {
        Session["username"] = string.Empty;
        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/Admin/login.aspx");
    }
}