using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.Net.Mime;
using System.Net.Mail;
using System.IO;
using BlogPost;

public partial class BloggerList : System.Web.UI.Page
{
    BlogPostDataClassesDataContext dbobj;
    connection con = new connection();
    tb_bloggerregistration tbobj = new tb_bloggerregistration();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            filldata();
            Oranization();

            // viewtable.Visible =false;
        }
    }


    protected void btadd_Click(object sender, EventArgs e)
    {

        try
        {

            dbobj = new BlogPostDataClassesDataContext(con.cn);
            decimal maxno = 0;
            if (imgCropped.Value != null && imgCropped.Value.Trim() != "")
            {
                string base64 = imgCropped.Value.ToString();
                byte[] bytes = Convert.FromBase64String(base64.Split(',')[1]);
                int count = dbobj.tb_bloggerregistrations.Count();
                if (count > 0)
                {
                    maxno = dbobj.tb_bloggerregistrations.Max(T => T.Blogger_id);
                }
                else { maxno = +1; }
                string pathCropped = Server.MapPath("~/siteimages/BloggerImg/" + Convert.ToString(maxno + 1) + txtName.Text.Replace(" ", "") + ".png");
                using (System.IO.FileStream stream = new System.IO.FileStream(pathCropped, System.IO.FileMode.Create))
                {
                    stream.Write(bytes, 0, bytes.Length);
                    stream.Flush();
                }

            }
        
            var result = dbobj.tb_bloggerregistrations.Where(t => t.email == txtemail.Text && t.Blogger_id != Convert.ToInt32(lblstats.Text)).Count();
            if (result > 0)
            {
                txtemail.Focus();

                ScriptManager.RegisterStartupScript(Page, GetType(), "DuplicateRecord", "alert('Emailid alredy Exist');", true);
                return;

            }

            if (lblstats.Text != "0")
            {
                tbobj = dbobj.tb_bloggerregistrations.Where(T => T.Blogger_id == Convert.ToInt32(lblstats.Text)).SingleOrDefault();
            }



            tbobj.ProfilePict = Convert.ToString(maxno + 1) + txtName.Text.Replace(" ", "") + ".png";
            tbobj.Name = txtName.Text;
            tbobj.email = txtemail.Text;
            tbobj.Phone = txtphone.Text;
            tbobj.Description = transl2.InnerHtml;
            tbobj.StreetAddress = txtAddress.Text;
            tbobj.City = txtcity.Text;
            if (imgCropped.Value.ToString() != null && imgCropped.Value.Trim() != "")
            {
                tbobj.ProfilePict = Convert.ToString(maxno + 1) + txtName.Text.Replace(" ", "") + ".png";
            }
            else if (lbloldprofilepict.Text.ToString() != null && lbloldprofilepict.Text.ToString() != "")
            {
                tbobj.ProfilePict = lbloldprofilepict.Text;
            }
            else
            {
                tbobj.ProfilePict = "noimage.png";
            }
            tbobj.State = txtstate.Text;
            tbobj.Zipcode = txtpincode.Text;
            tbobj.Organization_id = Convert.ToInt32(cmbOrganization.Text);
            tbobj.Country = txtcunrty.Text;
            tbobj.Status = "Pending";
            tbobj.EntryDate = DateTime.Now.Date;
            if (cmbactive.Checked == true)
            {
                tbobj.Active = true;
            }
            else
            {
                tbobj.Active = false;
            }
            if (lblstats.Text == "0")
            {
                tbobj.Password = txtpassword.Text;
                dbobj.tb_bloggerregistrations.InsertOnSubmit(tbobj);
                dbobj.SubmitChanges();
                ScriptManager.RegisterStartupScript(Page, GetType(), "emptyfile", "alert('Data Added Successfully');", true);
            }
            else
            {
                if (txtpassword.Text == "")
                { tbobj.Password = lblPassword.Text; }
                else
                {
                    tbobj.Password = txtpassword.Text;

                }
                dbobj.SubmitChanges();
                ScriptManager.RegisterStartupScript(Page, GetType(), "emptyfile", "alert('Data Updated Successfully');", true);
            }


            // Send Email
            mailsend(txtemail.Text, txtpassword.Text);
            HttpContext.Current.Session["profilepic"] = null;
            ClearData();
            // Clear All Field

            filldata();
            viewtable.Visible = false;




        }

        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "emptyfile", "alert('" + ex.Message + "');", true);
        }

    }
    public void ClearData()
    {
        try
        {

            CKEditorControl1.Text = string.Empty;
            txtemail.Text = string.Empty;
            txtphone.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtName.Text = string.Empty;
            cmbactive.Checked = false;
            txtAddress.Text = string.Empty;
            txtcity.Text = string.Empty;
            txtstate.Text = string.Empty;
            txtpincode.Text = string.Empty;
            txtcunrty.Text = string.Empty;
            cmbOrganization.SelectedIndex = 0;
            txtName.Text = string.Empty;
            lblfilename.Text = string.Empty;
            tbobj.Password = string.Empty;
            lblremove.Visible = false;
            transl2.InnerText = string.Empty;
            lblid.Text = "0";
            lblstats.Text = "0";
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "emptyfile", "alert('" + ex.Message + "');", true);
        }
    }
    public void filldata()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            var res = dbobj.tb_bloggerregistrations.OrderByDescending(T => T.Blogger_id).OrderByDescending(T => T.Blogger_id);
         
            gridbod.DataSource = res;
            gridbod.DataBind();

        }
        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
        }
    }
    public void Oranization()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            var results = dbobj.sp_Organization();
            if (results != null)
            {

                cmbOrganization.DataSource = results;
                cmbOrganization.DataTextField = "Name";
                cmbOrganization.DataValueField = "Organization_id";
                cmbOrganization.DataBind();
            }



        }
        catch (Exception Ex)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + Ex.Message + "');", true);

        }
    }
    protected void gridbod_RowCommand(object sender, GridViewCommandEventArgs e)
    {
       
        dbobj = new BlogPostDataClassesDataContext(con.cn);
        if (e.CommandName == "btndelete")
        {
           
            try
            {
                tb_bloggerregistration tbobj = dbobj.tb_bloggerregistrations.Single(T => T.Blogger_id == Convert.ToInt32(e.CommandArgument));
                dbobj.tb_bloggerregistrations.DeleteOnSubmit(tbobj);
                dbobj.SubmitChanges();
                ClearData();
                ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('Entry Deleted Successfully');", true);

            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
            }
            filldata();
        }

        if (e.CommandName == "btnedit")
        {
            viewtable.Visible = true;
           
            try
            {

                tb_bloggerregistration tbobj = dbobj.tb_bloggerregistrations.Single(T => T.Blogger_id == Convert.ToInt32(e.CommandArgument));

                // Add this code Start for Profile Pice Fill in Div While Edit Profiel Pict
                _profilepic.Style["background-image"] = "url('../siteimages/BloggerImg/" + tbobj.ProfilePict + "');";
                lbloldprofilepict.Text = tbobj.ProfilePict;
                // Add this code End

                txtName.Text = tbobj.Name;
                txtemail.Text = tbobj.email;
                txtphone.Text = tbobj.Phone;
                cmbOrganization.Text = tbobj.Organization_id.ToString();
                lblPassword.Text = tbobj.Password;
                txtpincode.Text = tbobj.Zipcode;
                txtcity.Text = tbobj.City;
                txtstate.Text = tbobj.State;
                txtAddress.Text = tbobj.StreetAddress;
                if (tbobj.Active == true)
                {

                    cmbactive.Checked = true;
                }
                else
                {
                    cmbactive.Checked = false;
                }
                txtcunrty.Text = tbobj.Country.ToString();
                txtpassword.Text = tbobj.Password;
                transl2.InnerHtml = tbobj.Description;
                lblfilename.Text = tbobj.ProfilePict;
                lblremove.Visible = true;
                lblstats.Text = e.CommandArgument.ToString();
                lblid.Text = e.CommandArgument.ToString();

            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
            }
        }

        else if (e.CommandName == "btnprofileblog")
        {

            Application["id1"] = e.CommandArgument.ToString();
            Application["type"] = "B";
            Response.Redirect("ViewProfile.aspx");

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

    protected void gridbod_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridbod.PageIndex = e.NewPageIndex;
        filldata();
    }

    public void mailsend(string ToEmailID, string ToPassword)
    {

        try
        {
            MailMessage email = new MailMessage();
            email.From = new MailAddress(tbobj.email); //Enter sender email address
            email.To.Add(txtemail.Text); //Destination Recipient e-mail address.
            email.Subject = "Thank you for registration";//Subject for your request
            StreamReader reader = new StreamReader(Server.MapPath("RegistrationDetails.htm"));
            string readFile = reader.ReadToEnd();

            string Contain = "";
            Contain = readFile;
            Contain = Contain.Replace("{User Name}", ToEmailID);
            Contain = Contain.Replace("{Password}", ToPassword);
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
        catch (Exception)
        {

            throw;
        }
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        viewtable.Visible = true;
    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        viewtable.Visible = false;
    }
    protected void btnprofileblog_Click(object sender, EventArgs e)
    {

    }

    protected void btnok_Click(object sender, EventArgs e)
    {
        try
        {
            if (txttype.Text == "B")
            {
                dbobj = new BlogPostDataClassesDataContext(con.cn);
                if (rbtnapprv.Checked == true)
                {
                    tb_bloggerregistration tbobj = dbobj.tb_bloggerregistrations.Single(T => T.Blogger_id == Convert.ToInt32(txtreasonid.Text));
                    tbobj.Status = "Approved";
                    dbobj.SubmitChanges();
                    mailfunction(tbobj.email, true);                 
                    txtresn.Text = string.Empty;
                    fullresn.Visible = false;
                    filldata();
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
                    filldata();
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
    protected void rbthnreject_CheckedChanged(object sender, EventArgs e)
    {
        fullresn.Visible = true;
    }
    protected void rbtnapprv_CheckedChanged(object sender, EventArgs e)
    {
        fullresn.Visible = false;
    }


    protected void lbdelete_Click(object sender, EventArgs e)
    {
        dbobj = new BlogPostDataClassesDataContext(con.cn);
        foreach (GridViewRow row in gridbod.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("chkbody");
            if (cb.Checked == true)
            {
                try
                {
                    int i = 0;
                    Label cid = default(Label);
                    cid = (Label)row.FindControl("lbluid");
                    tb_bloggerregistration tbobj = dbobj.tb_bloggerregistrations.Single(T => T.Blogger_id == Convert.ToInt32(cid.Text));

                    dbobj.tb_bloggerregistrations.DeleteOnSubmit(tbobj);
                    dbobj.SubmitChanges();
                    i = i + 1;
                    dbobj.SubmitChanges(); ScriptManager.RegisterStartupScript(Page, GetType(), "Image Upload", "alert('Recored Deleted Successfully');", true);
                }
                catch (Exception ex)
                {

                    ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
                }


            }
        }

        filldata();

    }
    protected void lblupdateall_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gridbod.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("cbactive");
            if (cb.Checked == true)
            {
                try
                {
                    dbobj = new BlogPostDataClassesDataContext(con.cn);
                    int i = 0;
                    Label cid = default(Label);
                    cid = (Label)row.FindControl("lbluid");
                    tb_bloggerregistration tbobj = dbobj.tb_bloggerregistrations.Single(T => T.Blogger_id == Convert.ToInt32(cid.Text));
                    tbobj.Active = true;
                    dbobj.SubmitChanges();
                    i = i + 1;
                    dbobj.SubmitChanges(); ScriptManager.RegisterStartupScript(Page, GetType(), "Sucess", "alert('Recored Update Successfully');", true);
                }
                catch (Exception ex)
                {

                    ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
                }
            }
            else
            {
                try
                {
                    dbobj = new BlogPostDataClassesDataContext(con.cn);
                    int i = 0;
                    Label cid = default(Label);
                    cid = (Label)row.FindControl("lbluid");
                    tb_bloggerregistration tbobj = dbobj.tb_bloggerregistrations.Single(T => T.Blogger_id == Convert.ToInt32(cid.Text));
                    tbobj.Active = false;
                    dbobj.SubmitChanges();
                    i = i + 1;
                    dbobj.SubmitChanges(); ScriptManager.RegisterStartupScript(Page, GetType(), "Sucess", "alert('Recored Update Successfully');", true);
                }
                catch (Exception ex)
                {

                    ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
                }
            
            
            }


        }
        filldata();

    }
    [System.Web.Services.WebMethod]
    public static string GetCurrentTime(string X, string y, string w, string h)
    {
        string filepath = "";
        Page objpage = new Page();
        string fname = "pool.jpg";
        string fpath = Path.Combine(objpage.Server.MapPath("~/images"), fname);
        System.Drawing.Image oimg = System.Drawing.Image.FromFile(fpath);
        Rectangle cropcords = new Rectangle(
        Convert.ToInt32(X),
        Convert.ToInt32(y),
        Convert.ToInt32(w),
        Convert.ToInt32(h));
        string cfname, cfpath;
        Bitmap bitMap = new Bitmap(cropcords.Width, cropcords.Height, oimg.PixelFormat);
        Graphics grph = Graphics.FromImage(bitMap);
        grph.DrawImage(oimg, new Rectangle(0, 0, bitMap.Width, bitMap.Height), cropcords, GraphicsUnit.Pixel);
        cfname = "crop_" + fname;
        cfpath = Path.Combine(objpage.Server.MapPath("~/cropimages"), cfname);
        bitMap.Save(cfpath);
        filepath = "~/cropimages/" + cfname;
        return filepath;
    }
}