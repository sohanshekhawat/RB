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

public partial class Organization_MyProfile : System.Web.UI.Page
{
    BlogPostDataClassesDataContext dbobj;
    connection con = new connection();
    tb_OrganizationList tbobj = new tb_OrganizationList();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            filldata();
            //fillcountry();
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
            int count = dbobj.tb_OrganizationLists.Count();
            if (count > 0)
            {
                maxno = dbobj.tb_OrganizationLists.Max(T => T.Organization_id);
            }
            else { maxno = +1; }
            string pathCropped = Server.MapPath("~/siteimages/OrganizationImg/" + Convert.ToString(maxno + 1) + txtName.Text.Replace(" ", "") + ".png");
            using (System.IO.FileStream stream = new System.IO.FileStream(pathCropped, System.IO.FileMode.Create))
            {
                stream.Write(bytes, 0, bytes.Length);
                stream.Flush();
            }

        }
        

        var result = dbobj.tb_OrganizationLists.Where(t => t.email == txtemail.Text && t.Organization_id != Convert.ToInt32(lblstats.Text)).Count();
      
        try
        {
            if (lblstats.Text != "0")
            {
                tbobj = dbobj.tb_OrganizationLists.Where(T => T.Organization_id == Convert.ToInt32(lblstats.Text)).SingleOrDefault();
            }

            tbobj.Name = txtName.Text;
            tbobj.email = txtemail.Text;
            tbobj.Phone = txtphone.Text;
           
            tbobj.Description = transl2.InnerText;
            tbobj.ProfilePict = Convert.ToString(maxno + 1) + txtName.Text.Replace(" ", "") + ".png";
            if (imgCropped.Value.ToString() != null && imgCropped.Value.ToString() != "")
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
            tbobj.StreetAddress = txtAddress.Text;
            tbobj.City = txtcity.Text;
            tbobj.State = txtstate.Text;
            tbobj.Zipcode = txtpincode.Text;
            tbobj.Country =txtcunrty.Text;
            tbobj.EntryDate = DateTime.Now.Date;
            tbobj.Active = false;

            if (lblstats.Text != "0")
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
   
    public void filldata()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            int id = 0;
            int.TryParse(Application["orgid"].ToString(), out id);
            var res = dbobj.tb_OrganizationLists.Where(T => T.Organization_id == id);
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
        
        if (e.CommandName == "btnedit")
        {
         

            try
            {
                viewtable.Visible = true;
                tb_OrganizationList tbobj = dbobj.tb_OrganizationLists.Single(T => T.Organization_id == Convert.ToInt32(e.CommandArgument));
                // Add this code Start for Profile Pice Fill in Div While Edit Profiel Pict
                _profilepic.Style["background-image"] = "url('../siteimages/OrganizationImg/" + tbobj.ProfilePict + "');";
                lbloldprofilepict.Text = tbobj.ProfilePict;
                // Add this code End
                txtName.Text = tbobj.Name;
                txtemail.Text = tbobj.email;
                txtphone.Text = tbobj.Phone;
               
                lblPassword.Text = tbobj.Password;
                txtpassword.Text = tbobj.Password;
                txtpincode.Text = tbobj.Zipcode;
                txtcity.Text = tbobj.City;
                txtstate.Text = tbobj.State;
                txtAddress.Text = tbobj.StreetAddress;
                txtcunrty.Text = tbobj.Country.ToString();
                transl2.InnerText = tbobj.Description;
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
        else if (e.CommandName == "btnview")
        {

            Application["id"] = e.CommandArgument.ToString();
            Application["type"] = "O";
            Response.Redirect("ViewProfile.aspx");

        }

    }

    protected void gridbod_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridbod.PageIndex = e.NewPageIndex;
        filldata();
    }

 
    public void ClearData()
    {
        try
        {
            
            transl2.InnerText = string.Empty;
            txtemail.Text = string.Empty;
            txtphone.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtName.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtcity.Text = string.Empty;
            txtstate.Text = string.Empty;
            txtpincode.Text = string.Empty;
            txtcunrty.Text = string.Empty;
            lblfilename.Text = string.Empty;
            tbobj.Password = string.Empty;
            lblremove.Visible = false;
            lblid.Text = "0";
            lblstats.Text = "0";
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "emptyfile", "alert('" + ex.Message + "');", true);
        }
    }

    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        viewtable.Visible = false;
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