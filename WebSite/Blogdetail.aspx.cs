using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogPost;

public partial class Blogdetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            blogerlist();
            postlist();

        }
    }
    public void blogerlist()
    {
        try
        {
            int id = 0;
            id = Convert.ToInt32(Request.QueryString["Id"]);
            var item = RepositoryCollection.Instance.BloggerRepo.GetBloggerDetail(id);
                blogerdetail.InnerHtml = blogerdetail.InnerHtml + "<div class=\"author-thumb\">";
                blogerdetail.InnerHtml = blogerdetail.InnerHtml + "<a href=><img alt=\" Rajpoot Books\" src=siteimages/BloggerImg/" + item.ProfilePict + " class=\"avatar\"></a></div>";
                blogerdetail.InnerHtml = blogerdetail.InnerHtml + "<div class=\"author-meta\">";
                blogerdetail.InnerHtml = blogerdetail.InnerHtml + "<h3 class=\"author-title\"><a href=#>" + item.Name + "</a></h3>";
                blogerdetail.InnerHtml = blogerdetail.InnerHtml + "<p class=\"author-bio\">" + item.Description + "</p>";
            blogerdetail.InnerHtml = blogerdetail.InnerHtml + "<div class=\"author-page-contact\"></div>";
            blogerdetail.InnerHtml = blogerdetail.InnerHtml + "<a style=\"cursor:pointer\"><img id =\"share_button\" src=\"img/facebook.png\" /></a></div>";

        }
        catch (Exception)
        {

            throw;
        }

    }
    public void postlist()
    {
        try
        {
            int id = 0;
            id = Convert.ToInt32(Request.QueryString["Id"]);
            var ftd = RepositoryCollection.Instance.PostRepo.GetAllPostByBlogger(id);
            foreach (var item in ftd)
            {
                bloggerposts.InnerHtml = bloggerposts.InnerHtml + " <article class=\"simple-post simple-big clearfix\"> ";
                bloggerposts.InnerHtml = bloggerposts.InnerHtml + "<h3><a href=postdetail.aspx?Id=" + item.Post_id + ">" + item.PostTitle + "</a></h3>";
                
                string content = null;
                if (item.PostContent.ToString().Length > 270)
                {
                    content = item.PostContent.ToString().Substring(0, 270);
                }
                else
                {
                    content = item.PostContent.ToString();
                }

                bloggerposts.InnerHtml = bloggerposts.InnerHtml + "<p class=\"excerpt\" style=\"float:left;text-align:justify;width:72%\">" + content + "...<a style=\"color:#45619D;font-size:14px;font-weight:bold\"  href=postdetail.aspx?Id=" + item.Post_id + " >Read More</a></p></header></article>";
            }

        }
        catch (Exception)
        {

            throw;
        }
    }
}