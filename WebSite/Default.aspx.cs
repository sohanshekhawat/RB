using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogPost;

public partial class index : System.Web.UI.Page
{
    //connection con = new connection();
  //  BlogPostDataClassesDataContext dbobj;

//    BlogPostDataClassesDataContext dbobj = RepositoryCollection.Instance.dbobj;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            postlist();            
            postpo();
            populerblog();

        }
    }
    public void postlist()
    {
        try
        {
            var ns = RepositoryCollection.Instance.PostRepo.GetApprovedPost();
            //var dbobj = new BlogPostDataClassesDataContext(con.cn);
            //var ns = dbobj.sp_postlist("post", 0, 0).OrderByDescending(T => T.Post_id).Take(10).Where(T => T.organizationstatus == "Approved" && T.bloggerstatus == "Approved" && T.Active == true);
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
            //    dbobj = new BlogPostDataClassesDataContext(con.cn);
              //  var PostDetails = dbobj.sp_postlist("postdetail", Convert.ToInt32(e.CommandArgument), 0).FirstOrDefault();
                //var PostDetails = RepositoryCollection.Instance.PostRepo.GetPostById(Convert.ToInt32(e.CommandArgument));
                //Session["ImageUrl"] = "http://demo.rajputbook.com/siteimages/postImg/" + PostDetails.Image;
                //Session["caption"] = PostDetails.PostTitle;
                //Session["description"] = PostDetails.PostContent;
                //Session["link"] = "http://demo.rajputbook.com/postdetail.aspx?Id=" + e.CommandArgument.ToString();

                Response.Redirect("postdetail.aspx?Id=" + e.CommandArgument.ToString());
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
        }

    }
    public void postpo()
    {
        try
        {

            //dbobj = new BlogPostDataClassesDataContext(con.cn);
            //var ftd = dbobj.tb_OrganizationLists.OrderByDescending(T => T.Organization_id).Where(T => T.Status == "Approved" && T.Active == true).Take(10);
            var ftd = RepositoryCollection.Instance.OrgRepo.GetOrganisations();
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

                //else
                //{
                //    postpop.InnerHtml = postpop.InnerHtml + "<p class=\"simple-share\" style=\"text-align: justify;\"><span  style=\" line-height: 125%;\">" + item.Description + "...<a style=\"color:#45619D;font-size:14px;font-weight:bold\"  href=Organizationdetail.aspx?Id=" + item.Organization_id + " >Read More</a></span></p></header></article></hr>";
                //}
            }

        }
        catch (Exception)
        {

            throw;
        }

    }
    public void populerblog()
    {
        try
        {
            // dbobj = new BlogPostDataClassesDataContext(con.cn);
            //var ftd = dbobj.tb_bloggerregistrations.OrderByDescending(T => T.Blogger_id).Where(T => T.Status == "Approved" && T.Active == true).Take(10);
            var ftd = RepositoryCollection.Instance.BloggerRepo.GetBloggers();
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