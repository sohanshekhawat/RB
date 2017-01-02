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

public partial class Admin_SubCategory : System.Web.UI.Page
{
    BlogPostDataClassesDataContext dbobj;
    connection con = new connection();
    tb_SubCategory tbobj = new tb_SubCategory();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            filldata();
            categoryfill();
        }
    }

    protected void btadd_Click(object sender, EventArgs e)
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            if (lblstats.Text != "0")
            {
                tbobj = dbobj.tb_SubCategories.Where(T => T.Sub_cat_id == Convert.ToInt32(lblstats.Text)).SingleOrDefault();
            }
            var result = dbobj.tb_SubCategories.Where(t => t.Sub_cat_Nm == txtsubcate.Text && t.Category_id==Convert.ToInt32(dropcategory.Text) && t.Sub_cat_id != Convert.ToInt32(lblid.Text)).Count();
            if (result > 0)
            {
                txtsubcate.Focus();

                ScriptManager.RegisterStartupScript(Page, GetType(), "DuplicateRecord", "alert('Subcategory name already exist');", true);
                return;

            }
            tbobj.Sub_cat_Nm = txtsubcate.Text;
            tbobj.Category_id = Convert.ToInt32(dropcategory.Text);
            tbobj.Entry_Date = DateTime.Now.Date;
            if (lblstats.Text == "0")
            {
                dbobj.tb_SubCategories.InsertOnSubmit(tbobj);
                dbobj.SubmitChanges();
                ScriptManager.RegisterStartupScript(Page, GetType(), "emptyfile", "alert('Data Added Successfully');", true);
            }
            else
            {
                dbobj.SubmitChanges();
                ScriptManager.RegisterStartupScript(Page, GetType(), "emptyfile", "alert('Data Updated Successfully');", true);
            }

        }
        catch (Exception)
        {

            throw;
        }
        filldata();
        //clear all controls
        clearcontrols();
        //fill gried

    }
    public void categoryfill()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            var result=dbobj.sp_category();
            dropcategory.DataSource = result;
            dropcategory.DataTextField = "Category_Nm";
            dropcategory.DataValueField = "Category_id";
            dropcategory.DataBind();
        }
        catch (Exception)
        {
            
            throw;
        }
    }
    public void clearcontrols()
    {
        try
        {
            txtsubcate.Text = string.Empty;
            dropcategory.SelectedIndex = 0;
            lblid.Text = "0";
            lblstats.Text = "0";

        }
        catch (Exception)
        {

            throw;
        }
    }
    public void filldata()
    {
        try
        {
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            var result = dbobj.sp_Categoryview();
            gridbod.DataSource = result;
            gridbod.DataBind();

        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void gridbod_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            Label id = default(Label);
            dbobj = new BlogPostDataClassesDataContext(con.cn);
            if (e.CommandName == "btndelete")
            {
                GridViewRow item = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                id = (Label)item.FindControl("lbluid");
                try
                {
                    tb_SubCategory tbobj = dbobj.tb_SubCategories.Single(T => T.Sub_cat_id == Convert.ToInt32(id.Text));
                    dbobj.tb_SubCategories.DeleteOnSubmit(tbobj);
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
                GridViewRow item = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                id = (Label)item.FindControl("lbluid");

                try
                {

                    tb_SubCategory tbobj = dbobj.tb_SubCategories.Single(T => T.Sub_cat_id == Convert.ToInt32(id.Text));

                    txtsubcate.Text = tbobj.Sub_cat_Nm;
                    dropcategory.Text = tbobj.Category_id.ToString();
                    lblstats.Text = id.Text;
                    lblid.Text = id.Text;

                }
                catch (Exception ex)
                {

                    ScriptManager.RegisterStartupScript(Page, GetType(), "Error", "alert('" + ex.Message + "');", true);
                }
            }

        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void gridbod_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridbod.PageIndex = e.NewPageIndex;
        filldata();
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
                    tb_SubCategory tbobj = dbobj.tb_SubCategories.Single(T => T.Sub_cat_id == Convert.ToInt32(cid.Text));
                    // Select the checkboxes from the GridView control

                    dbobj.tb_SubCategories.DeleteOnSubmit(tbobj);
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
}