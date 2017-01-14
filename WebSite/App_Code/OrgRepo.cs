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
   
    public IQueryable<tb_OrganizationList> GetRecentOrganisations()
    {
        return dbobj.tb_OrganizationLists.OrderByDescending(T => T.Organization_id).Where(T => T.Status == "Approved" && T.Active == true).Take(10);
    }

    public tb_OrganizationList GetOrganisationById(int id)
    {
        return dbobj.tb_OrganizationLists.Where(T => T.Organization_id == id).FirstOrDefault();
    }

    public bool CreateNew(tb_OrganizationList organisation)
    {
        dbobj.tb_OrganizationLists.InsertOnSubmit(organisation);
        dbobj.SubmitChanges();
        return true;
    }

    public bool Update(tb_OrganizationList organisation)
    {
        var temp = dbobj.tb_OrganizationLists.Single(t => t.Organization_id == organisation.Organization_id);
        temp = organisation;
        dbobj.SubmitChanges();
        return true;
    }
}