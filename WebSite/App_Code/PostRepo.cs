
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PostRepo
/// </summary>
public class PostRepo : BaseRepo
{
    private BlogPostDataClassesDataContext dbobj;

    public PostRepo(BlogPostDataClassesDataContext dbobj)
    {
        this.dbobj = dbobj;
    }
    public List<sp_postlistResult> GetAllPost()
    {
        return dbobj.sp_postlist("post", null,null).ToList();
    }
    public sp_postlistResult GetPostById(int postId)
    {
        return dbobj.sp_postlist("postdetail", postId, null).FirstOrDefault();
    }
    public List<sp_postlistResult> GetAllPostByBlogger(int bloggerId)
    {
        return dbobj.sp_postlist("bloggerpost", bloggerId,null).ToList();
    }
    public List<sp_postlistResult> GetApprovedPost()
    {
        return dbobj.sp_postlist("HomePageto10", null,null).ToList();
    }


}