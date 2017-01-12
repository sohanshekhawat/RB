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
            catlist();    
            postlist(); 
        }
    }
    public void catlist()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            var ns = dbobj.tb_BlogCategories;
            if (ns != null)
            {
                categorylist.DataSource = ns;
                categorylist.DataBind();
            }

        }
        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
        }
    }
    public void postlist()
    {
        try
        {
           var subCategoryId = Convert.ToInt32(Request.QueryString["subCategoryId"]);

            dbobj = new BlogPostDataClassesDataContext(con.cn);
            var ns = dbobj.sp_postlist("post", 0, 0).OrderByDescending(T => T.Post_id).Where(T => T.organizationstatus == "Approved" && T.bloggerstatus == "Approved" && T.Active == true);
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
    //public void toptenposts()
    //{
    //    try
    //    {
    //        dbobj = new BlogPostDataClassesDataContext(con.cn);
    //        var ftd = dbobj.sp_postlist("post", 0).OrderByDescending(T=>T.Post_id).Where(T=>T.organizationstatus == "Approved" && T.bloggerstatus == "Approved" && T.Active == true);
    //        foreach (var item in ftd)
    //        {
    //            tppost.InnerHtml = tppost.InnerHtml + "<article class=\"simple-post simple-big clearfix\">";
    //            tppost.InnerHtml = tppost.InnerHtml + "<div class=\"simple-thumb\" style=\"width:160px;\"><a href=postdetail.aspx?Id=" + item.Post_id + ">";
    //            tppost.InnerHtml = tppost.InnerHtml + "<img  style=\"height:115px;width:170px\" alt=\"Rajpootbooks\" src=siteimages/postImg/" + item.Image + "  ></a></div>";
    //            tppost.InnerHtml = tppost.InnerHtml + " <header><p class=\"simple-share\"> By / ";
    //            tppost.InnerHtml = tppost.InnerHtml + "<a href=# style=\"color:#45619D;font-size:14px;font-weight:bold\"> " + item.bloggername + " </a><span>  " + Convert.ToDateTime(item.EntryDate).ToString("dd/MMM/yyyy") + " </span></p>";
    //            tppost.InnerHtml = tppost.InnerHtml + "<h3><a href=postdetail.aspx?Id=" + item.Post_id + ">" + item.PostTitle + "</a></h3>";
    //            if (item.PostContent.ToString().Length > 270)
    //            {
    //                string content = item.PostContent.ToString().Substring(0, 270);
    //                tppost.InnerHtml = tppost.InnerHtml + "<p class=\"excerpt\" style=\"text-align: justify;\">" + content + "...<a style=\"color:#45619D;font-size:14px;font-weight:bold\"  href=postdetail.aspx?Id=" + item.Post_id + " >Read More</a></p></header></article>";
    //            }
    //            else
    //            { 
    //                tppost.InnerHtml = tppost.InnerHtml + "<p class=\"excerpt\" style=\"text-align: justify;\">" + item.PostContent + "...<a style=\"color:#45619D;font-size:14px;font-weight:bold\"  href=postdetail.aspx?Id=" + item.Post_id + " >Read More</a></p></header></article></hr>"; 
    //            }
    //        }

    //    }
    //    catch (Exception)
    //    {

    //        throw;
    //    }

    //}
    //public void category()
    //{
    //    try
    //    {
    //        dbobj = new BlogPostDataClassesDataContext(con.cn);
    //        var ftd = dbobj.tb_BlogCategories;
    //        cate.InnerHtml = "<ul>";
    //        foreach (var item in ftd)
    //        {
    //            cate.InnerHtml = cate.InnerHtml + "<li><a href=#>" + item.Category_Nm + "</a></li>";


    //        }
    //        cate.InnerHtml = cate.InnerHtml + "</ul>";
    //    }
    //    catch (Exception)
    //    {

    //        throw;
    //    }

    //}

    protected void menu_list_ItemCommand(object source, DataListCommandEventArgs e)
    {

    }
    protected void allpostlist_ItemCommand(object source, DataListCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "postlist")
            {
                dbobj = new BlogPostDataClassesDataContext(con.cn);
                var PostDetails = dbobj.sp_postlist("postdetail", Convert.ToInt32(e.CommandArgument), 0).FirstOrDefault();
                Session["ImageUrl"] = "http://demo.rajputbook.com/siteimages/postImg/" + PostDetails.Image;
                Session["caption"] = PostDetails.PostTitle;
                Session["description"] = PostDetails.PostContent;
                Session["link"] = "http://demo.rajputbook.com/postdetail.aspx?Id=" + e.CommandArgument.ToString();

                Response.Redirect("postdetail.aspx?Id=" + e.CommandArgument.ToString());
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
        }

    }
    protected void categorylist_ItemCommand(object source, DataListCommandEventArgs e)
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            var ns = dbobj.sp_postlist("categoryWisePost", 0, Convert.ToInt32(e.CommandArgument));
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
    protected void Label2_Click(object sender, EventArgs e)
    {

    }
}