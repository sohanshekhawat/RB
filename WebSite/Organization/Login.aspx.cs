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


        Session["email"] = null;
        Session["email"] = "";

    }
    protected void Page_Init(Object sender, EventArgs e)
    {
        Session["email"] = null;
        Session["email"] = "";

    }

    protected void btlogin_Click(object sender, EventArgs e)
    {
        try
        {

            if (txtuname.Text == "" || txtpwd.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "Please Enter Username Or Password", "alert('Please Enter Username Or Password');", true);

            }
            else
            {
                dbobj = new BlogPostDataClassesDataContext(con.cn);
                var result = dbobj.tb_OrganizationLists.Where(T => T.email == txtuname.Text && T.Password == txtpwd.Text && T.Status == "Approved" && T.Active == true).Single();
                if (result != null)
                {

                    if (String.Equals(result.email, txtuname.Text) == true & string.Equals(result.Password, txtpwd.Text))
                    {
                        Session["Org_username"] = result.Name;
                        Session["id"] = result.Organization_id;
                        Application["orgid"] = result.Organization_id;
                        Response.Redirect("~/Organization/Default.aspx");
                    }

                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, GetType(), "Invalid Username", "alert('invalid username or password');", true);

                    }
                }
            }

        }
        catch (Exception ex)
        {

        
        }
    }
}