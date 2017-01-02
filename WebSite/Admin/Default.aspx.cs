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
            fillorganization();
            count();
            countblog();
            countpost();
        }
    }

    public void fillorganization()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);

            var res = dbobj.tb_OrganizationLists.OrderByDescending(T => T.Organization_id).Take(15).Where(T => T.Status == "Pending");
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

            var res = dbobj.tb_bloggerregistrations.OrderByDescending(T => T.Blogger_id).Take(15).Where(T => T.Status == "Pending");
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
        if (e.CommandName == "btnprofile")
        {

            Application["id"] = e.CommandArgument.ToString();
            Application["type"] = "O";
            Response.Redirect("ViewProfile.aspx");

        }


    }
    public void count()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            int count = dbobj.tb_OrganizationLists.Count();
            lblor.Text = Convert.ToString(count);
        }
        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
        }

    }
    public void countblog()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            int count = dbobj.tb_bloggerregistrations.Count();
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
            int count = dbobj.tb_PostLists.Count();
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
            if (txttype.Text == "O")
            {
                if (rbtnapprv.Checked == true)
                {
                    tb_OrganizationList tbobj = dbobj.tb_OrganizationLists.Single(T => T.Organization_id == Convert.ToInt32(txtreasonid.Text));
                    tbobj.Status = "Approved";
                    dbobj.SubmitChanges();
                    mailfunction(tbobj.email, true);
                    fillorganization();                  
                    rbtnpending.Checked = true;
                    ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('Organization Approved Successfully');", true);
                }

                else
                {
                    tb_OrganizationList tbobj = dbobj.tb_OrganizationLists.Single(T => T.Organization_id == Convert.ToInt32(txtreasonid.Text));
                    tbobj.Reason = txtresn.Text;
                    tbobj.Status = "Reject";
                    dbobj.SubmitChanges();
                    mailfunction(tbobj.email, true);                    
                    txtresn.Text = string.Empty;
                    fullresn.Visible = false;
                    fillorganization();
                    rbtnpending.Checked = true;
                    ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('Organization Rejected Successfully');", true);
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