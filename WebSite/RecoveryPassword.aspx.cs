using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RecoveryPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Login1_VerifyingUser(object sender, LoginCancelEventArgs e)
    {
        var password = RepositoryCollection.Instance.UserManageRepo.GetPassword(Login1.UserName);

        EmailSender emailSender = new EmailSender();
        emailSender.SendForgetPasswordEmail(Login1.UserName, password);
        if (password != null)
        {
            Response.Redirect("~/Thankyou.aspx?ForgotPassword=success");
        }
        else {
            Response.Redirect("~/Thankyou.aspx?ForgotPassword=failed");
        }
    }
}