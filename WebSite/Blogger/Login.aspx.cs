using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogPost;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;

public partial class AdminPanel_Login : System.Web.UI.Page
{
    connection con = new connection();
    BlogPostDataClassesDataContext dbobj;
    protected void Page_Load(object sender, EventArgs e)
    {


        Session["username"] = null;
        Session["username"] = "";

    }
    protected void Page_Init(Object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["username"] = "";

    }

    protected void btlogin_Click(object sender, EventArgs e)
    {
        try
        {
           /*
                         
                        Session["id"] = result.Organization_id;
                        Application["orgid"] = result.Organization_id;
                        Session["Blogger_username"] = result.Name;

                        Session["id"] = result.Blogger_id;
                        Application["blogid"] = result.Blogger_id;
                      
                        Response.Redirect("~/Blogger/Default.aspx");
            
    */
        }
        catch (Exception ex)
        {

        }
    }
}