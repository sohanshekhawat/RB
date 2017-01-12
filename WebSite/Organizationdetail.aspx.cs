using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogPost;

public partial class Organizationdetail : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadOrganisationById();
            GetRecentBloggersByOrg();
        }
    }
    public void LoadOrganisationById()
    {
        try
        {
            int id = 0;
            id = Convert.ToInt32(Request.QueryString["Id"]);
            var item = RepositoryCollection.Instance.OrgRepo.GetOrganisationById(id);
            
                orgDetail.InnerHtml = orgDetail.InnerHtml + "<div class=\"author-thumb\">";
                orgDetail.InnerHtml = orgDetail.InnerHtml + "<a href=><img alt=\" Rajpoot Books\" src=siteimages/OrganizationImg/" + item.ProfilePict + " class=\"avatar\"></a></div>";
                orgDetail.InnerHtml = orgDetail.InnerHtml + "<div class=\"author-meta\">";
                orgDetail.InnerHtml = orgDetail.InnerHtml + "<h3 class=\"author-title\" style=\" word-wrap: break-word;\"><a href=#>" + item.Name + "</a></h3>";
                orgDetail.InnerHtml = orgDetail.InnerHtml + "<p class=\"author-bio\">" + item.Description + "</p>";
            orgDetail.InnerHtml = orgDetail.InnerHtml + "<div class=\"author-page-contact\"></div>";
            orgDetail.InnerHtml = orgDetail.InnerHtml + "<a style=\"cursor:pointer\"><img id =\"share_button\" src=\"img/facebook.png\" /></a></div>";
        }
        catch (Exception)
        {

            throw;
        }
    }

    public void GetRecentBloggersByOrg()
    {
        int id = 0;
        id = Convert.ToInt32(Request.QueryString["Id"]);
        var ftd = RepositoryCollection.Instance.BloggerRepo.GetRecentBloggersByOrg(id);
        
        foreach (var item in ftd)
        {
            orgblogger.InnerHtml = orgblogger.InnerHtml + "<article class=\"widget-post clearfix\"> ";
            orgblogger.InnerHtml = orgblogger.InnerHtml + "<div class=\"simple-thumb\">";
            orgblogger.InnerHtml = orgblogger.InnerHtml + "<a href=Blogdetail.aspx?id=" + item.Blogger_id + "><img src=siteimages/BloggerImg/" + item.ProfilePict + "></a></div>";
            orgblogger.InnerHtml = orgblogger.InnerHtml + "<header><h3><a href=Blogdetail.aspx?id=" + item.Blogger_id + ">" + item.Name + "</a></h3>";

            if (item.Description != null)
            {
                string content = null;
                if (item.Description.ToString().Length > 125)
                {
                    content = item.Description.ToString().Substring(0, 125);
                }
                else
                {
                    content = item.Description.ToString();
                }
                orgblogger.InnerHtml = orgblogger.InnerHtml + "<p class=\"simple-share\" style=\"text-align: justify;\"><span style=\" line-height: 125%;\">" + content + "...<a style=\"color:#45619D;font-size:14px;font-weight:bold\"  href=Blogdetail.aspx?Id=" + item.Blogger_id + " >Read More</a></span></p></header></article></hr>";
            }
        }
    }
}