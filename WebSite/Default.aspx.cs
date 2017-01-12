using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetRecentPosts();            
            GetRecentOrganisations();
            GetRecentBloggers();
        }
    }
    private void GetRecentPosts()
    {
        try
        {
            var ns = RepositoryCollection.Instance.PostRepo.GetRecentPosts();
            if (ns != null)
            {
                allpostlist.DataSource = ns;
                allpostlist.DataBind();
            }
        }
        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
        }
    }
    protected void allpostlist_ItemCommand(object source, DataListCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "postlist")
            {
    
                Response.Redirect("postdetail.aspx?Id=" + e.CommandArgument.ToString());
            }
            else if (e.CommandName == "blogger")
            {
                Response.Redirect("Blogdetail.aspx?Id=" + e.CommandArgument.ToString());
            }
            else if (e.CommandName == "category")
            {
                Response.Redirect("post.aspx?Id=" + e.CommandArgument.ToString());
            }
            
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
        }

    }
    private void GetRecentOrganisations()
    {
        try
        {
            var ftd = RepositoryCollection.Instance.OrgRepo.GetRecentOrganisations();
            foreach (var item in ftd)
            {
                postpop.InnerHtml = postpop.InnerHtml + "<article class=\"widget-post clearfix\"> ";
                postpop.InnerHtml = postpop.InnerHtml + "<div class=\"simple-thumb\">";
                postpop.InnerHtml = postpop.InnerHtml + "<a href=Organizationdetail.aspx?id=" + item.Organization_id + "><img src=siteimages/OrganizationImg/" + item.ProfilePict + "></a></div>";
                postpop.InnerHtml = postpop.InnerHtml + "<header><h3><a href=Organizationdetail.aspx?id=" + item.Organization_id + ">" + item.Name + "</a></h3>";

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
                    postpop.InnerHtml = postpop.InnerHtml + "<p class=\"simple-share\" style=\"text-align: justify;\"><span style=\" line-height: 125%;\">" + content + "...<a style=\"color:#45619D;font-size:14px;font-weight:bold\"  href=Organizationdetail.aspx?Id=" + item.Organization_id + " >Read More</a></span></p></header></article>";
                }
            }

        }
        catch (Exception)
        {

            throw;
        }

    }
    private void GetRecentBloggers()
    {
        try
        {
            var ftd = RepositoryCollection.Instance.BloggerRepo.GetRecentBloggers();
            foreach (var item in ftd)
            {
                bloggerpop.InnerHtml = bloggerpop.InnerHtml + "<article class=\"widget-post clearfix\"> ";
                bloggerpop.InnerHtml = bloggerpop.InnerHtml + "<div class=\"simple-thumb\">";
                bloggerpop.InnerHtml = bloggerpop.InnerHtml + "<a href=Blogdetail.aspx?id=" + item.Blogger_id + "><img src=siteimages/BloggerImg/" + item.ProfilePict + "></a></div>";
                bloggerpop.InnerHtml = bloggerpop.InnerHtml + "<header><h3><a href=Blogdetail.aspx?id=" + item.Blogger_id + ">" + item.Name + "</a></h3>";
                
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
                    bloggerpop.InnerHtml = bloggerpop.InnerHtml + "<p class=\"simple-share\" style=\"text-align: justify;\"><span style=\" line-height: 125%;\">" + content + "...<a style=\"color:#45619D;font-size:14px;font-weight:bold\"  href=Blogdetail.aspx?Id=" + item.Blogger_id + " >Read More</a></span></p></header></article></hr>";
                }
            }
        }
        catch (Exception)
        {

            throw;
        }

    }
}