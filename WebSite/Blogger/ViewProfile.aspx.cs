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

public partial class Admin_BlogCategory : System.Web.UI.Page
{
    BlogPostDataClassesDataContext dbobj;
    connection con = new connection();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Application["type"].ToString() == "B")
            {
                fillprofilebloger();
            }
           

        }
    }

  
    public void fillprofilebloger()
    {


        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);

            int id = Convert.ToInt32(Application["id1"]);

            var result = dbobj.tb_bloggerregistrations.Where(T => T.Blogger_id == Convert.ToInt32(Application["id1"])).FirstOrDefault();
            lblnm.Text = result.Name;
            lblcity.Text = result.City;
            lblcntry.Text = result.Country;
            lblemail.Text = result.email;
            lblpnno.Text = result.Phone;
            lblstate.Text = result.State;
            lblstreet.Text = result.StreetAddress;
            lblzip.Text = result.Zipcode;
            lblonm.Text = result.Name;
            profileimage.Src = "~/siteimages/BloggerImg/" + result.ProfilePict;
        }
        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(Page, GetType(), "emptyfile", "alert('" + ex.Message + "');", true);
        }


    }


}