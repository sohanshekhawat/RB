
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

    public tb_bloggerregistration GetBloggerById(int id)
    {
        return dbobj.tb_bloggerregistrations.FirstOrDefault(T => T.Blogger_id == id);
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

    public bool Update(tb_bloggerregistration blogger)
    {
        var temp = dbobj.tb_bloggerregistrations.Single(t => t.Blogger_id == blogger.Blogger_id);
        temp = blogger;
        dbobj.SubmitChanges();
        return true;
    }
}