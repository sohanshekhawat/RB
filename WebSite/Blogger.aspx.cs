using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogPost;

public partial class index : System.Web.UI.Page
{
    connection con = new connection();
    BlogPostDataClassesDataContext dbobj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            toptenposts();
            // blogger();
            postpo();


        }
    }
    public void toptenposts()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            var ftd = dbobj.tb_bloggerregistrations.OrderByDescending(T => T.Blogger_id).Where(T => T.Status == "Approved" && T.Active == true);
            foreach (var item in ftd)
            {
                tppost.InnerHtml = tppost.InnerHtml + "<article class=\"simple-post simple-big clearfix\">";
                tppost.InnerHtml = tppost.InnerHtml + "<div class=\"simple-thumb\" style=\"width:160px;\"><a href=Blogdetail.aspx?Id=" + item.Blogger_id + ">";
                tppost.InnerHtml = tppost.InnerHtml + "<img  style=\"height:115px;width:170px\" alt=\"Rajpootbooks\" src=siteimages/BloggerImg/" + item.ProfilePict + "  ></a></div>";
                tppost.InnerHtml = tppost.InnerHtml + " <header><p class=\"simple-share\">";
                // tppost.InnerHtml = tppost.InnerHtml + "<a href=# style=\"color:#45619D;font-size:14px;font-weight:bold\"> " + item.Name + " </a><span>  " + Convert.ToDateTime(item.EntryDate).ToString("dd/MMM/yyyy") + " </span></p>";
                tppost.InnerHtml = tppost.InnerHtml + "<h3><a href=Blogdetail.aspx?Id=" + item.Blogger_id + ">" + item.Name + "</a></h3>";
                if (item.Description != null)
                {

                    if (item.Description.ToString().Length > 270)
                    {
                        string content = item.Description.ToString().Substring(0, 270);
                        tppost.InnerHtml = tppost.InnerHtml + "<p class=\"excerpt\" style=\"text-align: justify;\">" + content + "...<a style=\"color:#45619D;font-size:14px;font-weight:bold\"  href=Detailofblogger.aspx?Id=" + item.Blogger_id + " >Read More</a></p></header></article>";
                    }
                    else
                    {
                        tppost.InnerHtml = tppost.InnerHtml + "<p class=\"excerpt\" style=\"text-align: justify;\">" + item.Description + "...<a style=\"color:#45619D;font-size:14px;font-weight:bold\"  href=Detailofblogger.aspx?Id=" + item.Blogger_id + " >Read More</a></p></header></article></hr>";
                    }
                }
                else
                {
                    tppost.InnerHtml = tppost.InnerHtml + "<p class=\"excerpt\" style=\"text-align: justify;\">" + item.Description + "...<a style=\"color:#45619D;font-size:14px;font-weight:bold\"  href=Detailofblogger.aspx?Id=" + item.Blogger_id + " >Read More</a></p></header></article></hr>";
                }
            }

        }
        catch (Exception)
        {

            throw;
        }

    }
    public void postpo()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            var ftd = dbobj.sp_postlist("post", 0, 0).OrderByDescending(T => T.Post_id).Where(T => T.organizationstatus == "Approved" && T.bloggerstatus == "Approved" && T.Active == true).Take(10);

            foreach (var item in ftd)
            {
                postpop.InnerHtml = postpop.InnerHtml + "<article class=\"widget-post clearfix\"> ";
                postpop.InnerHtml = postpop.InnerHtml + "<div class=\"simple-thumb\">";
                postpop.InnerHtml = postpop.InnerHtml + "<a href=postdetail.aspx?Id=" + item.Organization_id + "><img src=siteimages/postImg/" + item.Image + " alt=></a></div>";
                postpop.InnerHtml = postpop.InnerHtml + "<header><h3><a href=postdetail.aspx?Id=" + item.Organization_id + ">" + item.PostTitle + "</a></h3>";

                if (item.PostContent.ToString().Length > 150)
                {
                    string content = item.PostContent.ToString().Substring(0, 150);
                    postpop.InnerHtml = postpop.InnerHtml + "<p class=\"simple-share\" style=\"text-align: justify;\"><span style=\" line-height: 125%;\">" + content + "...<a style=\"color:#45619D;font-size:14px;font-weight:bold\"  href=postdetail.aspx?Id=" + item.Post_id + " >Read More</a</span>></p></header></article>";
                }
                else
                { postpop.InnerHtml = postpop.InnerHtml + "<p class=\"simple-share\" style=\"text-align: justify;\"><span style=\" line-height: 125%;\">" + item.PostContent + "...<a style=\"color:#45619D;font-size:14px;font-weight:bold\"  href=postdetail.aspx?Id=" + item.Post_id + " >Read More</a></span></p></header></article></hr>"; };
            }

        }
        catch (Exception)
        {

            throw;
        }

    }


    //public void blogger()
    //{
    //    try
    //    {
    //        dbobj = new BlogPostDataClassesDataContext(con.cn);
    //        var ftd = dbobj.tb_bloggerregistrations.Take(5);

    //        foreach (var item in ftd)
    //        {
    //            blog.InnerHtml = blog.InnerHtml + "<article class=\"simple-post simple-big clearfix\">";
    //            blog.InnerHtml = blog.InnerHtml + "<div class=\"simple-thumb\"><a href=#>";
    //            blog.InnerHtml = blog.InnerHtml + "<img alt=\"Rajpootbooks\" src=siteimages/BloggerImg/" + item.ProfilePict + "></a></div>";
    //            blog.InnerHtml = blog.InnerHtml + " <header><p class=\"simple-share\"><a href=#>Business</a> / by ";
    //            blog.InnerHtml = blog.InnerHtml + "<a href=#> John Doe </a><span> <i class=\"fa fa-clock-o\"></i> 23 minutes ago </span></p>";
    //            blog.InnerHtml = blog.InnerHtml + "<h3><a href=#>" + item.Name + "</a></h3>";
    //            blog.InnerHtml = blog.InnerHtml + "<p class=\"excerpt\">" + item.Description + "</p></header></article>";
    //        }


    //    }
    //    catch (Exception)
    //    {

    //        throw;
    //    }

    //}
}