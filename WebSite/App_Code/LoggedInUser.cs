using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for LoggedInUser
/// </summary>
public class LoggedInUser
{
    public LoggedInUser(int bloggerId, string userType, string name, string email, int orgId, bool? isActive, string status)
    {
        this.BloggerId = bloggerId;
        this.UserType = userType;
        this.Name = name;
        this.Email = email;
        this.OrgId = orgId;
        this.IsActive = isActive.HasValue ? isActive.Value : false;
        this.Status = status;
    }

    public bool IsActive { get; set; }
    public string Status { get; set; }
    public int BloggerId { get; set; }
    public string UserType { get; set; }
    public string Name { get; set; }
    public string Email { get; set; }
    public int OrgId { get; set; }
}