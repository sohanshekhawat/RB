using System;
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
    LoggedInUser loggedInUser = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        loggedInUser = Session["loggedinuser"] as LoggedInUser;

        if (!IsPostBack)
        {
            if (loggedInUser != null) {
                if (loggedInUser.UserType == "O")
                {
                    LoadOrganization(loggedInUser.OrgId);
                }
                else if (loggedInUser.UserType == "B")
                {
                    LoadBlogger(loggedInUser.BloggerId);
                }
            }
        }
    }
    
    private void LoadOrganization(int id)
    {
        tb_OrganizationList tbobj = RepositoryCollection.Instance.OrgRepo.GetOrganisationById(id);
            
        txtName.Text= tbobj.Name;
        txtphone.Text= tbobj.Phone;
        txtStreetAddress.Text=tbobj.StreetAddress ;
        txtzipcode.Text= tbobj.Zipcode ;
        txtcity.Text = tbobj.City ;
        txtstate.Text= tbobj.State;
        txtcontry.Text=tbobj.Country;
        transl2.InnerText = tbobj.Description;
       // test_img_my.Src = "~/siteimages/OrganizationImg/" + tbobj.ProfilePict;
          profileimage.Src = "~/siteimages/OrganizationImg/" + tbobj.ProfilePict;
        imgCropped.InnerHtml += "<img runat='server' id='test_img_my' src='" + profileimage.Src + "'>";


    }

    private void LoadBlogger(int id)
    {
        tb_bloggerregistration tbobj = RepositoryCollection.Instance.BloggerRepo.GetBloggerById(id);
        var org = RepositoryCollection.Instance.OrgRepo.GetOrganisationById((int)tbobj.Organization_id);
        if (org != null)
            lblOrgName.Text = org.Name;
        else
            lblOrgName.Text = "N/A";

        org = null;

        txtName.Text = tbobj.Name;
        txtphone.Text = tbobj.Phone;
        txtStreetAddress.Text = tbobj.StreetAddress;
        txtzipcode.Text = tbobj.Zipcode;
        txtcity.Text = tbobj.City;
        txtstate.Text = tbobj.State;
        txtcontry.Text = tbobj.Country;
        transl2.InnerText = tbobj.Description;

    //    test_img_my.Src = "~/siteimages/BloggerImg/" + tbobj.ProfilePict;
        profileimage.Src = "~/siteimages/BloggerImg/" + tbobj.ProfilePict;
        imgCropped.InnerHtml += "<img runat='server' id='test_img_my' src='" + profileimage.Src + "'>";
       // cropped_.innerHTML += '<img runat="server" id="test_img_my1" src="' + img + '">';

    }


    private void UpdateBlogger()
    {
        tb_bloggerregistration tbobj = RepositoryCollection.Instance.BloggerRepo.GetBloggerById(loggedInUser.BloggerId);
        tbobj.Name = txtName.Text;
        tbobj.Phone = txtphone.Text;
        tbobj.StreetAddress = txtStreetAddress.Text;
        tbobj.Zipcode = txtzipcode.Text;
        tbobj.City = txtcity.Text;
        tbobj.State = txtstate.Text;
        tbobj.Phone = txtphone.Text;
        tbobj.Country = txtcontry.Text;
        tbobj.Description = transl2.InnerText;
        tbobj.ProfilePict = test("BloggerImg");
        RepositoryCollection.Instance.BloggerRepo.Update(tbobj);
    }
    private void UpdateOrganisation() {

        tb_OrganizationList tbobj = RepositoryCollection.Instance.OrgRepo.GetOrganisationById(loggedInUser.OrgId);

        tbobj.Name = txtName.Text;
        tbobj.Phone = txtphone.Text;
        tbobj.StreetAddress = txtStreetAddress.Text;
        tbobj.Zipcode = txtzipcode.Text;
        tbobj.City = txtcity.Text;
        tbobj.State = txtstate.Text;
        tbobj.Phone = txtphone.Text;
        tbobj.Country = txtcontry.Text;
        tbobj.Description = transl2.InnerText;
        tbobj.ProfilePict = test("OrganizationImg");
        RepositoryCollection.Instance.OrgRepo.Update(tbobj);
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        var userId = 0;
        if (loggedInUser.UserType == "O")
        {
            userId = loggedInUser.OrgId;
        }
        else if (loggedInUser.UserType == "B")
        {
            userId = loggedInUser.BloggerId;
        }

        try
        {
            var user = RepositoryCollection.Instance.UserManageRepo.IsMobileAlreadyExist(userId, txtphone.Text);

            if (user == null)
            {
                if (loggedInUser.UserType == "O")
                {
                    UpdateOrganisation();
                }
                else if (loggedInUser.UserType == "B")
                {
                    UpdateBlogger();

                }


                Response.Redirect("default.aspx");

            }
            else if (user.Mobile.Equals(txtphone.Text, StringComparison.OrdinalIgnoreCase))
                {
                    RegularExpressionValidator3.ErrorMessage = "Mobile is already registered.";
                    RegularExpressionValidator3.IsValid = false;
                }
            }
        
        catch (Exception ex)
        {

        }
    }

    private string test(string imageFolder)
    {
        if (imgCropped.Value.ToString() != null && imgCropped.Value.Trim() != "")
        {
            return GetImageName(imageFolder);            
        }
        else if (lbloldprofilepict.Text.ToString() != null && lbloldprofilepict.Text.ToString() != "")
        {
            return lbloldprofilepict.Text;
        }
        else
        {
            return "noimage.png";
        }
    }

    private string GetImageName(string imageFolder)
    {
        string imageName = string.Empty;
        if (imgCropped.Value != null && imgCropped.Value.Trim() != "")
        {
            string base64 = imgCropped.Value.ToString();
            byte[] bytes = Convert.FromBase64String(base64.Split(',')[1]);

            imageName = Guid.NewGuid() + ".png";
            string pathCropped = Server.MapPath("~/siteimages/" + imageFolder + "/" + imageName);
            using (System.IO.FileStream stream = new System.IO.FileStream(pathCropped, System.IO.FileMode.Create))
            {
                stream.Write(bytes, 0, bytes.Length);
                stream.Flush();
            }

            return imageName;
        }
        return imageName;
    }

    public void ClearData()
    {
        try
        {   txtphone.Text = string.Empty;
            txtStreetAddress.Text = string.Empty;
            txtName.Text = string.Empty;
            txtphone.Text = string.Empty;
            txtcity.Text = string.Empty;
            txtstate.Text = string.Empty;
            txtzipcode.Text = string.Empty;            
            txtcontry.Text = "";
            transl2.InnerText = "";
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "emptyfile", "alert('" + ex.Message + "');", true);
        }
    }
}