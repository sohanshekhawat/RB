using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogPost;

public partial class postdetail : System.Web.UI.Page
{
    //connection con = new connection();
    //BlogPostDataClassesDataContext dbobj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            postdetails();
        }
    }
    public void postdetails()
    {
        try
        {
            //dbobj = new BlogPostDataClassesDataContext(con.cn);
            //int id = 0;
            var id = Convert.ToInt32(Request.QueryString["Id"]);

            //var ftd = dbobj.sp_postlist("post", 0,0).Where(T => T.Post_id == id).FirstOrDefault();


            var ftd = RepositoryCollection.Instance.PostRepo.GetPostById(id);


            string fbpath = "http://demo.rajputbook.com/postdetail.aspx?Id=" + ftd.Post_id;

            postde.InnerHtml = postde.InnerHtml + "<article class=\"post-wrapper clearfix\"> ";
            postde.InnerHtml = postde.InnerHtml + "<header class=\"post-header\"><h1 class=\"post-title\">" + ftd.PostTitle + "</h1>";
            postde.InnerHtml = postde.InnerHtml + "<p class=\"simple-share\">";
            postde.InnerHtml = postde.InnerHtml + "<span> by  <b>" + ftd.bloggername + "</b></span>";
            postde.InnerHtml = postde.InnerHtml + "<span><span class=\"article-date\"><i class=\"fa fa-clock-o\"></i>" + ftd.EntryDate + "</span></span></p>";
            postde.InnerHtml = postde.InnerHtml + "<figure class=\"image-overlay\"><img src=siteimages/postImg/" + ftd.Image + " alt=></figure></header>";
            postde.InnerHtml = postde.InnerHtml + "<div class=\"post-content clearfix\"><p>" + ftd.PostContent + "</p></div>";
            postde.InnerHtml = postde.InnerHtml + "<a style=\"cursor:pointer\"><img id =\"share_button\" src=\"img/facebook.png\" /></a></article>";


            Session["ImageUrl"] = "http://demo.rajputbook.com/siteimages/postImg/" + ftd.Image;
            Session["caption"] = ftd.PostTitle;
            Session["description"] = ftd.PostContent;
            Session["link"] = "http://demo.rajputbook.com/postdetail.aspx?Id=" + id;


        }
        catch (Exception ex)
        {

        }

    }
}