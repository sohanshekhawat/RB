using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogPost;
using System.Net.Mail;
using System.IO;

public partial class Admin_Default : System.Web.UI.Page
{
    connection con = new connection();
    BlogPostDataClassesDataContext dbobj;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

          
            fillpost();
    
          
            countpost();
        }
    }

    public void fillpost()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            int id = 0;
            int id1 = 0;
            int.TryParse(Application["blogid"].ToString(), out id);
            int.TryParse(Application["orgid"].ToString(), out id1);
            var res = dbobj.tb_PostLists.Where(T => T.Blogger_id == id && T.Organization_id == id1 && T.Status == "Pending").OrderByDescending(T => T.Post_id).Take(15);

            gridbod.DataSource = res;
            gridbod.DataBind();

        }
        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
        }
    }
    



    protected void gridbod_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        Label id = default(Label);
        dbobj = new BlogPostDataClassesDataContext(con.cn);

        if (e.CommandName == "btnprofilepost")
        {

            Application["id2"] = e.CommandArgument.ToString();
            Application["type"] = "P";
            Response.Redirect("ViewProfile.aspx");

        }


    }


    public void countpost()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            int id = 0;
            int id1 = 0;
            int.TryParse(Application["blogid"].ToString(), out id);
            int.TryParse(Application["orgid"].ToString(), out id1);
         


            int count = dbobj.tb_PostLists.Where(T => T.Blogger_id == id && T.Organization_id == id1).OrderByDescending(T => T.Post_id).Count();
            lblp.Text = Convert.ToString(count);

        }
        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
        }

    }
  
    protected void btnok_Click(object sender, EventArgs e)
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            if (txttype.Text == "P")
            {
                if (rbtnapprv.Checked == true)
                {
                    var res = dbobj.sp_postlist("post", 0, 0).Single(T => T.Post_id == Convert.ToInt32(txtreasonid.Text));
                    res.Status = "Approved";
                    dbobj.SubmitChanges();
                    mailfunction(res.bloggeremailid, true);
                    ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('Post Approve Successfully');", true);
                }

                else
                {
                    var res = dbobj.sp_postlist("post", 0,0).Single(T => T.Post_id == Convert.ToInt32(txtreasonid.Text));
                    res.Reason = txtresn.Text;
                    res.Status = "Reject";
                    dbobj.SubmitChanges();
                    mailfunction(res.bloggeremailid, true);
                    ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('post Rejected Successfully');", true);
                    txtresn.Text = string.Empty;
                    fullresn.Visible = false;
                }
            }


        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);

        }
    }



    public void mailfunction(string toemail, bool reason)
    {
        try
        {
            MailMessage email = new MailMessage();
            email.From = new MailAddress(toemail); //Enter sender email address
            email.To.Add(toemail); //Destination Recipient e-mail address.
            if (txtresn.Text != "")
                email.Subject = "Profile Status Rejected";//Subject for your request
            else
                email.Subject = "Profile Status Approved";
            StreamReader reader = new StreamReader(Server.MapPath("Status.htm"));
            string readFile = reader.ReadToEnd();

            string Contain = "";
            Contain = readFile;

            if (txtresn.Text != "")
                Contain = Contain.Replace("{message}", txtresn.Text);
            else
                Contain = Contain.Replace("{message}", "Message should be your profile has been approved");

            email.Body = Contain.ToString();
            email.IsBodyHtml = true;

            //SMTP SERVER DETAILS
            SmtpClient smtpc = new SmtpClient("smtp.gmail.com");
            smtpc.Port = 587;
            smtpc.UseDefaultCredentials = false;
            smtpc.EnableSsl = true;

            smtpc.Credentials = new System.Net.NetworkCredential("developers.webpro@gmail.com", "devwebpro@1!$4");
            smtpc.Send(email);




        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);

        }

    }
 
    protected void btnprofile_Click(object sender, EventArgs e)
    {
      
    }

    protected void btnprofileblog_Click(object sender, EventArgs e)
    {

    }

    public void status()
    { 
    
    
    
    
    }
    protected void rbthnreject_CheckedChanged(object sender, EventArgs e)
    {
        fullresn.Visible = true;
    }
    protected void rbtnapprv_CheckedChanged(object sender, EventArgs e)
    {
        fullresn.Visible = false;
    }

    protected void gridbod_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void gridbod_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}