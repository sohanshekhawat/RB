using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistrationActivation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            string registeredEmail = !string.IsNullOrEmpty(Request.QueryString["Email"]) ? Request.QueryString["Email"] : Guid.Empty.ToString();
            string activationCode = !string.IsNullOrEmpty(Request.QueryString["ActivationCode"]) ? Request.QueryString["ActivationCode"] : Guid.Empty.ToString();

            if (RepositoryCollection.Instance.UserManageRepo.ActivateUserByEmail(registeredEmail, activationCode))
            {
                ltMessage.Text = "Activation successful.";
            }
            else
            {
                ltMessage.Text = "Activation failed, Either email/code is invalid OR already activated.";
            }
        }
    }
}