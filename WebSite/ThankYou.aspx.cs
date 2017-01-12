using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogPost;
using System.Drawing;

public partial class index : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var forgotPassword = Request.QueryString["ForgotPassword"];
            if (string.IsNullOrWhiteSpace(forgotPassword))
            {
                ltMessage.Text = "Thanks for the registration you will get conformation message on your email address shortly";
            }
            else if (string.Equals(forgotPassword, "success", StringComparison.InvariantCultureIgnoreCase))
                {             
                ltMessage.Text = "Password has been sent on your registered email, Please check your inbox.";
            } else
            {
                ltMessage.Text = "This email address NOT registered with us. Please check your email address again.";
            }
        }
    }

    
   
}