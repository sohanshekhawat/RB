using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        var result = RepositoryCollection.Instance.UserManageRepo.Login(Login1.UserName, Login1.Password);

        if (result != null)
        {
            Session["loggedinuser"] = result;
            //Session["useremail"] = result.Email;
            //Session["username"] = result.Name;
            //Session["userType"] = result.UserType;

            e.Authenticated = true;
            if (result.UserType == "B")
            {
                //Session["id"] = result.BloggerId;
                Response.Redirect("~/Blogger/Default.aspx");
            }
            else if (result.UserType == "O")
            {
                //Session["id"] = result.OrgId;
                Response.Redirect("~/Organization/Default.aspx");
            }
        }
        e.Authenticated = false;
    }
}