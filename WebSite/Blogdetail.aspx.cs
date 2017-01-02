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
                blogerdetail.InnerHtml = blogerdetail.InnerHtml + "<div class=\"author-page-contact\">";
                blogerdetail.InnerHtml = blogerdetail.InnerHtml + "<a href=#><i class=\"fa fa-envelope-o\"></i></a>";
                blogerdetail.InnerHtml = blogerdetail.InnerHtml + "<a href=# target=\"_blank\"><i class=\"fa fa-link\"></i></a>";
                blogerdetail.InnerHtml = blogerdetail.InnerHtml + "<a href=# target=\"_blank\"><i class=\"fa fa-twitter\"></i></a>";
                blogerdetail.InnerHtml = blogerdetail.InnerHtml + "<a href=# target=\"_blank\"><i class=\"fa fa-instagram\"></i></a></div></div>";
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
                postall.InnerHtml = postall.InnerHtml + " <article class=\"simple-post simple-big clearfix\"> ";
                //postall.InnerHtml = postall.InnerHtml + " <div class=\"simple-thumb\" style=\"width:160px;\">";
                //postall.InnerHtml = postall.InnerHtml + "<a href=#><img style=\"height:115px;width:170px\" src=siteimages/postImg/" + item.Image + " alt=\"Rajput Book\"></a></div>";
                //postall.InnerHtml = postall.InnerHtml + "<header><p class=\"simple-share\"><a href=#>" + item.organizationname + "</a> / by <a href=# style=\"color:#45619D;font-size:14px;font-weight:bold\">" + item.bloggername + "</a>  ";

                postall.InnerHtml = postall.InnerHtml + "<h3><a href=ostdetail.aspx?Id=" + item.Post_id + ">" + item.PostTitle + "</a></h3>";
                postall.InnerHtml = postall.InnerHtml + " <span>" + item.EntryDate + "</span>";

                string content = null;
                if (item.PostContent.ToString().Length > 270)
                {
                    content = item.PostContent.ToString().Substring(0, 270);
                }
                else
                {
                    content = item.PostContent.ToString();
                }

                postall.InnerHtml = postall.InnerHtml + "<p class=\"excerpt\" style=\"float:left;text-align:justify;width:72%\">" + content + "...<a style=\"color:#45619D;font-size:14px;font-weight:bold\"  href=postdetail.aspx?Id=" + item.Post_id + " >Read More</a></p></header></article>";
            }

        }
        catch (Exception)
        {

            throw;
        }

    }












}