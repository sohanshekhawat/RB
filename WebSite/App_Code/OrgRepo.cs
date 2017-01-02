using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OrgRepo
/// </summary>
public class OrgRepo
{
    private BlogPostDataClassesDataContext dbobj;

    public OrgRepo(BlogPostDataClassesDataContext dbobj)
    {
        this.dbobj = dbobj;
    }
   
    public IQueryable<tb_OrganizationList> GetOrganisations()
    {
        return dbobj.tb_OrganizationLists.OrderByDescending(T => T.Organization_id).Where(T => T.Status == "Approved" && T.Active == true).Take(10);
    }

    public tb_OrganizationList GetOrganisationById(int id)
    {
        return dbobj.tb_OrganizationLists.Where(T => T.Organization_id == id && T.Status == "Approved" && T.Active == true).FirstOrDefault();
    }
}