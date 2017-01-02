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

            fillbloger();
            fillpost();
    
            countblog();
            countpost();
        }
    }

    public void fillpost()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            int id = 0;
            int.TryParse(Application["orgid"].ToString(), out id);
            var res = dbobj.tb_PostLists.OrderByDescending(T => T.Post_id).Where(T => T.Organization_id == id && T.Status == "Pending").Take(15);
            gridbod.DataSource = res;
            gridbod.DataBind();

        }
        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
        }
    }
    public void fillbloger()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            int id = 0;
            int.TryParse(Application["orgid"].ToString(), out id);
            var res = dbobj.tb_bloggerregistrations.OrderByDescending(T => T.Blogger_id).Where(T => T.Organization_id == id && T.Status == "Pending").Take(15);
            GridView1.DataSource = res;
            GridView1.DataBind();

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
 
    public void countblog()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            int id = 0;
            int.TryParse(Application["orgid"].ToString(), out id);
            
            int count = dbobj.tb_bloggerregistrations.Where(T => T.Organization_id == id).OrderByDescending(T => T.Blogger_id).Count();
            lblb.Text = Convert.ToString(count);

        }
        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
        }

    }
    public void countpost()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            int id = 0;
            int.TryParse(Application["orgid"].ToString(), out id);

            
            int count = dbobj.tb_PostLists.Where(T => T.Organization_id == id).OrderByDescending(T => T.Post_id).Count();
            lblp.Text = Convert.ToString(count);

        }
        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        Label id = default(Label);
        dbobj = new BlogPostDataClassesDataContext(con.cn);
        if (e.CommandName == "btnprofileblog")
        {

            Application["id1"] = e.CommandArgument.ToString();
            Application["type"] = "B";
            Response.Redirect("ViewProfile.aspx");

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

                    tb_PostList ptbobj = new tb_PostList();
                    ptbobj = dbobj.tb_PostLists.Where(T => T.Post_id == Convert.ToInt32(txtreasonid.Text)).FirstOrDefault();
                    ptbobj.Status = "Approved";
                    dbobj.SubmitChanges();

                    var res = dbobj.sp_postlist("post", 0,0).Single(T => T.Post_id == Convert.ToInt32(txtreasonid.Text));
                    mailfunction(res.bloggeremailid, true);
                    fillpost();
                    rbtnpending.Checked = true;
                    ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('Post Approve Successfully');", true);
                }

                else
                {

                    tb_PostList ptbobj = new tb_PostList();
                    ptbobj = dbobj.tb_PostLists.Where(T => T.Post_id == Convert.ToInt32(txtreasonid.Text)).FirstOrDefault();
                    ptbobj.Reason = txtresn.Text;
                    ptbobj.Status = "Approved";
                    dbobj.SubmitChanges();

                    var res = dbobj.sp_postlist("post", 0,0).Single(T => T.Post_id == Convert.ToInt32(txtreasonid.Text));
                    mailfunction(res.bloggeremailid, true);
                    txtresn.Text = string.Empty;
                    fullresn.Visible = false;
                    rbtnpending.Checked = true;
                    fillpost();
                    ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('post Rejected Successfully');", true);
                }
            }
            else if (txttype.Text == "B")
            {
                dbobj = new BlogPostDataClassesDataContext(con.cn);
                if (rbtnapprv.Checked == true)
                {
                    tb_bloggerregistration tbobj = dbobj.tb_bloggerregistrations.Single(T => T.Blogger_id == Convert.ToInt32(txtreasonid.Text));
                    tbobj.Status = "Approved";
                    dbobj.SubmitChanges();
                    mailfunction(tbobj.email, true);
                    fillbloger();
                    rbtnpending.Checked = true;
                    ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('Blogger Approved Successfully');", true);

                }

                else
                {
                    tb_bloggerregistration tbobj = dbobj.tb_bloggerregistrations.Single(T => T.Blogger_id == Convert.ToInt32(txtreasonid.Text));
                    tbobj.Reason = txtresn.Text;
                    tbobj.Status = "Reject";
                    dbobj.SubmitChanges();
                    mailfunction(tbobj.email, true);                    
                    txtresn.Text = string.Empty;
                    fullresn.Visible = false;
                    fillbloger();
                    rbtnpending.Checked = true;
                    ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('Blogger Rejected Successfully');", true);
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

  
   
}