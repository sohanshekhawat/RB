using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserManagement
/// </summary>
public class UserManagement
{
    private BlogPostDataClassesDataContext dbobj;

    public UserManagement(BlogPostDataClassesDataContext dbobj)
    {
        this.dbobj = dbobj;
    }

    public LoggedInUser Login(string email, string password)
    {
        LoggedInUser user = null;
        var blogger = dbobj.tb_bloggerregistrations.FirstOrDefault(T => T.email == email && T.Password == password && T.Status == "Approved" && T.Active == true);
        if (blogger != null)
        {
            user = new LoggedInUser((int) blogger.Blogger_id, "B", blogger.Name, blogger.email, (int)blogger.Organization_id);
        }
        else
        {
           var organisation = dbobj.tb_OrganizationLists.FirstOrDefault(T => T.email == email && T.Password == password && T.Status == "Approved" && T.Active == true);
           if (organisation != null)
           {
                user = new LoggedInUser((int)organisation.Organization_id, "O", organisation.Name, organisation.email, (int)organisation.Organization_id);
            }
        }
        return user;
    }

    public string GetPassword(string email)
    {
        string password = null;
        var blogger = dbobj.tb_bloggerregistrations.FirstOrDefault(T => T.email == email);
        if (blogger != null)
        {
            password = blogger.Password;
        }
        else
        {
            var organisation = dbobj.tb_OrganizationLists.FirstOrDefault(T => T.email == email);
            if (organisation != null)
            {
                password = organisation.Password;
            }
        }
        return password;
    }

    public UserEmailMobile IsEmailMobileAlreadyExist(string email, string mobile)
    {
        UserEmailMobile userEmailMobile = null;
        var blogger = dbobj.tb_bloggerregistrations.FirstOrDefault(T => T.email == email || T.Phone == mobile);
        if (blogger != null)
        {
            return new UserEmailMobile(blogger.email, blogger.Phone);
        }
        else
        {
            var organisation = dbobj.tb_OrganizationLists.FirstOrDefault(T => T.email == email || T.Phone == mobile);
            if (organisation != null)
            {
                return new UserEmailMobile(organisation.email, organisation.Phone);
            }
        }
        return userEmailMobile;
    }
    public bool ActivateUserByEmail(string email, string activationCode)
    {
        var blogger = dbobj.tb_bloggerregistrations.FirstOrDefault(T => (T.EmailVerified == false) && (T.email == email || T.EmailCode == activationCode));
        if (blogger != null)
        {
            blogger.Active = true;
            blogger.EmailVerified = true;
            blogger.EmailCode= string.Empty;
            dbobj.SubmitChanges();
            return true; ;
        }
        else
        {
            var organisation = dbobj.tb_OrganizationLists.FirstOrDefault(T => (T.EmailVerified == false) && (T.email == email || T.Phone== activationCode));
            if (organisation != null)
            {
                organisation.Active = true;
                organisation.EmailVerified = true;
                organisation.EmailCode = string.Empty;
                dbobj.SubmitChanges();
                return true;
            }
        }
        return false;
    }

}