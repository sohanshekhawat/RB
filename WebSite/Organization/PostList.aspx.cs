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
using System.Net.Mail;

public partial class Admin_PostList : System.Web.UI.Page
{
    BlogPostDataClassesDataContext dbobj;
    connection con = new connection();
    tb_PostList tbobj = new tb_PostList();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            filldata();
            categoryfill();
            bloggerfill();
            subcategoryfill();


        }
    }
    public void bloggerfill()
    {


        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            int id = 0;
            int.TryParse(Application["orgid"].ToString(), out id);
            var result = dbobj.sp_Blogger().Where(T => T.Blogger_id == id);
            dpblogger.DataSource = result;
            dpblogger.DataTextField = "Name";
            dpblogger.DataValueField = "Blogger_id";
            dpblogger.DataBind();
        }
        catch (Exception)
        {

            throw;
        }

    }
    public void categoryfill()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            var result = dbobj.sp_category();
            dpcate.DataSource = result;
            dpcate.DataTextField = "Category_Nm";
            dpcate.DataValueField = "Category_id";
            dpcate.DataBind();
        }
        catch (Exception)
        {

            throw;
        }
    }

    public void subcategoryfill()
    {
        if (dpcate.SelectedIndex > 0)
        {

            try
            {
                dbobj = new BlogPostDataClassesDataContext(con.cn);
                var result = dbobj.sp_subcategory();
                dpsubcat.DataSource = result;
                dpsubcat.DataTextField = "Sub_cat_Nm";
                dpsubcat.DataValueField = "Sub_cat_id";
                dpsubcat.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }

    protected void btadd_Click(object sender, EventArgs e)
    {

        dbobj = new BlogPostDataClassesDataContext(con.cn);
        decimal maxno = 0;
        if (imgCropped.Value != null && imgCropped.Value.Trim() != "")
        {
            string base64 = imgCropped.Value.ToString();
            byte[] bytes = Convert.FromBase64String(base64.Split(',')[1]);

            int count = dbobj.tb_PostLists.Count();
            if (count > 0)
            {
                maxno = dbobj.tb_PostLists.Max(T => T.Post_id);
            }
            else { maxno = +1; }
            string pathCropped = Server.MapPath("~/siteimages/postImg/" + Convert.ToString(maxno + 1) + txtpost.Text.Replace(" ", "") + ".png");
            using (System.IO.FileStream stream = new System.IO.FileStream(pathCropped, System.IO.FileMode.Create))
            {
                stream.Write(bytes, 0, bytes.Length);
                stream.Flush();
            }
        }
        try
        {

            dbobj = new BlogPostDataClassesDataContext(con.cn);
            if (lblstats.Text != "0")
            {
                tbobj = dbobj.tb_PostLists.Where(T => T.Post_id == Convert.ToInt32(lblstats.Text)).FirstOrDefault();
            }
            tbobj.Status = "Pending";
            tbobj.PostTitle = txtpost.Text;
            tbobj.Image = Convert.ToString(maxno + 1) + txtpost.Text.Replace(" ", "") + ".png";
            tbobj.Date = DateTime.Now.Date;
            // Add this Code Start
            if (imgCropped.Value.ToString() != null && imgCropped.Value.Trim() != "")
            {
                tbobj.Image = Convert.ToString(maxno + 1) + txtpost.Text.Replace(" ", "") + ".png";
            }
            else if (lbloldprofilepict.Text.ToString() != null && lbloldprofilepict.Text.ToString() != "")
            {
                tbobj.Image = lbloldprofilepict.Text;
            }
            else
            {
                tbobj.Image = "noimage.png";
            }
            // Add this Code End
            tbobj.PostContent = transl2.InnerText;

            if (cmbactive.Checked == true)
            {
                tbobj.Active = true;
            }
            else
            {
                tbobj.Active = false;
            }
            if (dpcate.SelectedIndex > 0)
            {
                tbobj.Category_id = Convert.ToInt32(dpcate.SelectedValue);
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "emptyfile", "alert('Please Select First Category');", true);

            }
            if (dpsubcat.SelectedIndex > 0)
            {
                tbobj.Sub_cat_id = Convert.ToInt32(dpsubcat.SelectedValue);
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "emptyfile", "alert('Please Select First Subcategory');", true);

            }


            tbobj.Blogger_id = Convert.ToInt32(dpblogger.SelectedValue);


            int orgid = 0;
            int.TryParse(Application["orgid"].ToString(), out orgid);
            tbobj.Organization_id = orgid;

            if (lblstats.Text == "0")
            {
                dbobj.tb_PostLists.InsertOnSubmit(tbobj);
                dbobj.SubmitChanges();
                ScriptManager.RegisterStartupScript(Page, GetType(), "emptyfile", "alert('Data Added Successfully');", true);
            }
            else
            {
                dbobj.SubmitChanges();
                ScriptManager.RegisterStartupScript(Page, GetType(), "emptyfile", "alert('Data Updated Successfully');", true);
            }
            filldata();

        }

        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(Page, GetType(), "emptyfile", "alert('" + ex.Message + "');", true);
        }

        txtpost.Text = string.Empty;
        transl2.InnerText = string.Empty;
        txtdate.Text = string.Empty;
        cmbactive.Checked = false;
        lblid.Text = "0";
        lblstats.Text = "0";

        lblfilename.Text = null;
        viewtable.Visible = false;

        dpsubcat.SelectedIndex = 0;
        dpblogger.SelectedIndex = 0;
        dpcate.SelectedIndex = 0;


    }
    public void filldata()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);

            int id = 0;
            int.TryParse(Application["orgid"].ToString(), out id);
            var res = dbobj.tb_PostLists.Where(T => T.Organization_id == id).OrderByDescending(T => T.Post_id);

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

        dbobj = new BlogPostDataClassesDataContext(con.cn);
        if (e.CommandName == "btndelete")
        {
            try
            {
                tb_PostList tbobj = dbobj.tb_PostLists.Single(T => T.Post_id == Convert.ToInt32(e.CommandArgument));
                dbobj.tb_PostLists.DeleteOnSubmit(tbobj);
                dbobj.SubmitChanges();
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

                tb_PostList tbobj = dbobj.tb_PostLists.Single(T => T.Post_id == Convert.ToInt32(e.CommandArgument));
                // Add this code Start for Profile Pice Fill in Div While Edit Profiel Pict
                _profilepic.Style["background-image"] = "url('../siteimages/postImg/" + tbobj.Image + "');";
                lbloldprofilepict.Text = tbobj.Image;
                // Add this code End

                txtpost.Text = tbobj.PostTitle;
                if (tbobj.Active == true)
                {
                    cbactive.Checked = true;

                }
                else
                {
                    cbactive.Checked = false;
                }
                txtdate.Text = tbobj.Date.ToString();
                dpblogger.SelectedValue = Convert.ToString(tbobj.Blogger_id);
                lblfilename.Text = tbobj.Image;
                dpsubcat.SelectedValue = Convert.ToString(tbobj.Sub_cat_id);
                dpcate.SelectedValue = Convert.ToString(tbobj.Category_id);
                dpcate_SelectedIndexChanged(sender, e);
                lblid.Text = e.CommandArgument.ToString();
                lblstats.Text = e.CommandArgument.ToString();
                transl2.InnerText = tbobj.PostContent;
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
            }
        }


    }

    protected void gridbod_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridbod.PageIndex = e.NewPageIndex;
        filldata();
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        viewtable.Visible = true;
    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        viewtable.Visible = false;
    }
    protected void dpcate_SelectedIndexChanged(object sender, EventArgs e)
    {
        subcategoryfill();
    }



    protected void gridbod_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

        }
        catch (Exception)
        {

            throw;
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

                    var res = dbobj.sp_postlist("post", 0, 0).Single(T => T.Post_id == Convert.ToInt32(txtreasonid.Text));
                    mailfunction(res.bloggeremailid, true);
                    filldata();
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

                    var res = dbobj.sp_postlist("post", 0, 0).Single(T => T.Post_id == Convert.ToInt32(txtreasonid.Text));
                    mailfunction(res.bloggeremailid, true);
                    txtresn.Text = string.Empty;
                    fullresn.Visible = false;
                    rbtnpending.Checked = true;
                    filldata();
                    ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('post Rejected Successfully');", true);
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
                    tb_PostList tbobj = dbobj.tb_PostLists.Single(T => T.Post_id == Convert.ToInt32(cid.Text));

                    dbobj.tb_PostLists.DeleteOnSubmit(tbobj);
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
                    tb_PostList tbobj = dbobj.tb_PostLists.Single(T => T.Post_id == Convert.ToInt32(cid.Text));
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
                    tb_PostList tbobj = dbobj.tb_PostLists.Single(T => T.Post_id == Convert.ToInt32(cid.Text));
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