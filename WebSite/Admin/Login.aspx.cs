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
           
            
            if (txtuname.Text == "" || txtpwd.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "Please Enter Username Or Password", "alert('Please Enter Username Or Password');", true);

            }
            else
            {
                dbobj = new BlogPostDataClassesDataContext(con.cn);

                var result = dbobj.tb_AdminLogins.Where(T => T.username == txtuname.Text && T.password == txtpwd.Text).Single();

                if (result != null)
                {
                  
                    if (String.Equals(result.username, txtuname.Text) == true & string.Equals(result.password, txtpwd.Text))
                    {
                        Session["username"] = result.username;
                        Session["id"] = result.user_id;
                        Response.Redirect("~/Admin/Default.aspx");
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

            ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
        }
    }
}