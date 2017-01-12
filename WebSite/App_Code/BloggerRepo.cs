
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BloggerRepo
/// </summary>
public class BloggerRepo : BaseRepo
{
    private BlogPostDataClassesDataContext dbobj;

    public BloggerRepo(BlogPostDataClassesDataContext dbobj)
    {
        this.dbobj = dbobj;
    }
    public sp_bloggerdiscriptionResult GetBloggerDetail(int bloggerId)
    {
        return dbobj.sp_bloggerdiscription(bloggerId).FirstOrDefault();
    }

    public IQueryable<tb_bloggerregistration> GetRecentBloggers()
    {
        return dbobj.tb_bloggerregistrations.OrderByDescending(T => T.Blogger_id).Where(T => T.Status == "Approved" && T.Active == true).Take(10);
    }

    public IQueryable<tb_bloggerregistration> GetRecentBloggersByOrg(int organisationId)
    {
        return dbobj.tb_bloggerregistrations.OrderByDescending(T => T.Blogger_id).Where(T => T.Organization_id == organisationId && T.Status == "Approved" && T.Active == true).Take(10);
    }


    public bool CreateNew(tb_bloggerregistration blogger)
    {
        dbobj.tb_bloggerregistrations.InsertOnSubmit(blogger);
        dbobj.SubmitChanges();
        return true;

    }
}