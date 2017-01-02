using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogPost;

public partial class postdetail : System.Web.UI.Page
{
    connection con = new connection();
    BlogPostDataClassesDataContext dbobj;
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
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            int id = 0;
            id = Convert.ToInt32(Request.QueryString["Id"]);
            var ftd = dbobj.tb_OrganizationLists.Where(T => T.Organization_id == id);

            foreach (var item in ftd)
            {
                postde.InnerHtml = postde.InnerHtml + "<article class=\"post-wrapper clearfix\"> ";
                postde.InnerHtml = postde.InnerHtml + "<header class=\"post-header\"><h1 class=\"post-title\">" + item.Name + "</h1>";
                postde.InnerHtml = postde.InnerHtml + "<p class=\"simple-share\">";
                postde.InnerHtml = postde.InnerHtml + "<span> From  <b>" + item.Name + "</b></span>";
                postde.InnerHtml = postde.InnerHtml + "<span><span class=\"article-date\"><i class=\"fa fa-clock-o\"></i>" + Convert.ToDateTime(item.EntryDate).ToString("dd/MMM/yyyy") + "</span></span></p>";
                postde.InnerHtml = postde.InnerHtml + "<figure class=\"image-overlay\"><img src=siteimages/OrganizationImg/" + item.ProfilePict + " alt=></figure></header>";
                postde.InnerHtml = postde.InnerHtml + "<div class=\"post-content clearfix\"><p>" + item.Description + "</p></div></article>";

            }

        }
        catch (Exception)
        {

            throw;
        }

    }
}