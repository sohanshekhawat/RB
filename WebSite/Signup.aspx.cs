﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogPost;
using System.Drawing;
using System.IO;

public partial class index : System.Web.UI.Page
{
    connection con = new connection();
    BlogPostDataClassesDataContext dbobj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Oranization();

        }
    }



    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
           
           
            if (rbO.Checked == true)
            {
                tb_OrganizationList tbobj = new tb_OrganizationList();
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
                    string pathCropped = Server.MapPath("~/siteimages/OrganizationImg/" + Convert.ToString(maxno + 1) + txtOrgName.Text.Replace(" ", "") + ".png");
                    using (System.IO.FileStream stream = new System.IO.FileStream(pathCropped, System.IO.FileMode.Create))
                    {
                        stream.Write(bytes, 0, bytes.Length);
                        stream.Flush();
                    }
                }
                tbobj.ProfilePict =  Convert.ToString(maxno + 1) + txtOrgName.Text + ".png";
                if (imgCropped.Value.ToString() != null && imgCropped.Value.Trim() != "")
                {
                    tbobj.ProfilePict = Convert.ToString(maxno + 1) + txtOrgName.Text.Replace(" ", "") + ".png";
                }
                else if (lbloldprofilepict.Text.ToString() != null && lbloldprofilepict.Text.ToString() != "")
                {
                    tbobj.ProfilePict = lbloldprofilepict.Text;
                }
                else
                {
                    tbobj.ProfilePict = "noimage.png";
                }
                tbobj.Name = txtOrgName.Text;
                tbobj.email = txtemail.Text;
                tbobj.Phone = txtphone.Text;
                tbobj.StreetAddress = txtStreetAddress.Text;
                tbobj.Zipcode = txtzipcode.Text;
                tbobj.City = txtcity.Text;
                tbobj.State = txtstate.Text;
                tbobj.Phone = txtphone.Text;
                tbobj.Password = txtpassword.Text;
                tbobj.Country = txtcontry.Text;
                tbobj.EntryDate = DateTime.Now.Date;
                tbobj.Status = "Pending";
                if (rbO.Visible == true)
                {
                    tbobj.LoginUser = rbO.Text;
                }
                else
                {
                    tbobj.LoginUser = rbB.Text;
                }
                tbobj.Active = false;

                tbobj.Password = txtpassword.Text;
                dbobj.tb_OrganizationLists.InsertOnSubmit(tbobj);
                dbobj.SubmitChanges();
                Response.Redirect("ThankYou.aspx");
                ClearData();
                // Clear All Field

            }
            else if (rbB.Checked == true)
            {
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
                    string pathCropped = Server.MapPath("~/siteimages/BloggerImg/" + Convert.ToString(maxno + 1) + txtOrgName.Text.Replace(" ", "") + ".png");
                    using (System.IO.FileStream stream = new System.IO.FileStream(pathCropped, System.IO.FileMode.Create))
                    {
                        stream.Write(bytes, 0, bytes.Length);
                        stream.Flush();
                    }
                }
                dbobj = new BlogPostDataClassesDataContext(con.cn);
                tb_bloggerregistration tbobjB = new tb_bloggerregistration();
                tbobjB.ProfilePict = Convert.ToString(maxno + 1) + txtOrgName.Text + ".png";
                if (imgCropped.Value.ToString() != null && imgCropped.Value.Trim() != "")
                {
                    tbobjB.ProfilePict = Convert.ToString(maxno + 1) + txtOrgName.Text.Replace(" ", "") + ".png";
                }
                else if (lbloldprofilepict.Text.ToString() != null && lbloldprofilepict.Text.ToString() != "")
                {
                    tbobjB.ProfilePict = lbloldprofilepict.Text;
                }
                else
                {
                    tbobjB.ProfilePict = "noimage.png";
                }
                tbobjB.Name = txtOrgName.Text;
                tbobjB.email = txtemail.Text;
                tbobjB.Phone = txtphone.Text;
                tbobjB.StreetAddress = txtStreetAddress.Text;
                tbobjB.Zipcode = txtzipcode.Text;
                tbobjB.City = txtcity.Text;
                tbobjB.State = txtstate.Text;
                tbobjB.Phone = txtphone.Text;
                tbobjB.Organization_id = Convert.ToInt32(cmbOrganization.SelectedValue);
                tbobjB.Password = txtpassword.Text;
                tbobjB.Country = txtcontry.Text;
                tbobjB.EntryDate = DateTime.Now.Date;
                tbobjB.Status = "Pending";

                tbobjB.Active = false;
                tbobjB.Password = txtpassword.Text;
                dbobj.tb_bloggerregistrations.InsertOnSubmit(tbobjB);
                dbobj.SubmitChanges();
                Response.Redirect("ThankYou.aspx");
                ClearData();
                // Clear All Field

            }


        }
        catch (Exception)
        {

        }
    }
    public void ClearData()
    {
        try
        {


            txtemail.Text = string.Empty;
            txtphone.Text = string.Empty;
            txtStreetAddress.Text = string.Empty;
            txtOrgName.Text = string.Empty;
            txtphone.Text = string.Empty;
            txtcity.Text = string.Empty;
            txtstate.Text = string.Empty;
            txtzipcode.Text = string.Empty;
            txtemail.Text = string.Empty;
            txtpassword.Text = null;
            lblstats.Text = "0";
            cmbOrganization.SelectedIndex = 0;
            txtcontry.Text = "";
            txtemail.Text = "";
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "emptyfile", "alert('" + ex.Message + "');", true);
        }
    }
    protected void rbO_CheckedChanged(object sender, EventArgs e)
    {
        cmbOrganization.Visible = false;
    }
    protected void rbB_CheckedChanged(object sender, EventArgs e)
    {
        cmbOrganization.Visible = true;
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

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

}