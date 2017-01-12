using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserEmailMobile
/// </summary>
public class UserEmailMobile
{
    public string Email { get; set; }
    public string Mobile { get; set; }
    public UserEmailMobile(string email, string mobile)
    {
        this.Email = email;
        this.Mobile = mobile;
    }
}