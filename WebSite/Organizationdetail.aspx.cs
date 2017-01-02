using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogPost;

public partial class Organizationdetail : System.Web.UI.Page
{
    connection con = new connection();
    BlogPostDataClassesDataContext dbobj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            organizationlist();
            
        }
    }
    public void organizationlist()
    {
        try
        {
            //dbobj = new BlogPostDataClassesDataContext(con.cn);
            int id = 0;
            id = Convert.ToInt32(Request.QueryString["Id"]);
            //var ftd = dbobj.tb_OrganizationLists.Where(T => T.Organization_id == id);
            var item = RepositoryCollection.Instance.OrgRepo.GetOrganisationById(id);

            //foreach (var item in ftd)
            //{
                orgDetail.InnerHtml = orgDetail.InnerHtml + "<div class=\"author-thumb\">";
                orgDetail.InnerHtml = orgDetail.InnerHtml + "<a href=><img alt=\" Rajpoot Books\" src=siteimages/OrganizationImg/" + item.ProfilePict + " class=\"avatar\"></a></div>";
                orgDetail.InnerHtml = orgDetail.InnerHtml + "<div class=\"author-meta\">";
                orgDetail.InnerHtml = orgDetail.InnerHtml + "<h3 class=\"author-title\" style=\" word-wrap: break-word;\"><a href=#>" + item.Name + "</a></h3>";
                orgDetail.InnerHtml = orgDetail.InnerHtml + "<p class=\"author-bio\">" + item.Description + "</p>";
                orgDetail.InnerHtml = orgDetail.InnerHtml + "<div class=\"author-page-contact\">";
                orgDetail.InnerHtml = orgDetail.InnerHtml + "<a href=#><i class=\"fa fa-envelope-o\"></i></a>";
                orgDetail.InnerHtml = orgDetail.InnerHtml + "<a href=# target=\"_blank\"><i class=\"fa fa-link\"></i></a>";
                orgDetail.InnerHtml = orgDetail.InnerHtml + "<a href=# target=\"_blank\"><i class=\"fa fa-twitter\"></i></a>";
                orgDetail.InnerHtml = orgDetail.InnerHtml + "<a href=# target=\"_blank\"><i class=\"fa fa-instagram\"></i></a></div></div>";

            //}

        }
        catch (Exception)
        {

            throw;
        }

    }
}