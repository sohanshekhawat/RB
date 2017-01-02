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

public partial class Admin_BlogCategory : System.Web.UI.Page
{
    BlogPostDataClassesDataContext dbobj;
    connection con = new connection();
    tb_BlogCategory tbobj = new tb_BlogCategory();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            filldata();
        }
    }


    protected void btadd_Click(object sender, EventArgs e)
    {
        try
        {

            dbobj = new BlogPostDataClassesDataContext(con.cn);
            if (lblstats.Text != "0")
            {
                tbobj = dbobj.tb_BlogCategories.Where(T => T.Category_id == Convert.ToInt32(lblstats.Text)).SingleOrDefault();
            }
            var result = dbobj.tb_BlogCategories.Where(t => t.Category_Nm== txtName.Text && t.Category_id != Convert.ToInt32(lblid.Text)).Count();
            if (result > 0)
            {
                txtName.Focus();

                ScriptManager.RegisterStartupScript(Page, GetType(), "DuplicateRecord", "alert('category name already exist');", true);
                return;

            }
            tbobj.Category_Nm = txtName.Text;
            if (lblstats.Text == "0")
            {
                dbobj.tb_BlogCategories.InsertOnSubmit(tbobj);
                dbobj.SubmitChanges();
                ScriptManager.RegisterStartupScript(Page, GetType(), "emptyfile", "alert('Data Added Successfully');", true);
            }
            else
            {
                dbobj.SubmitChanges();
                ScriptManager.RegisterStartupScript(Page, GetType(), "emptyfile", "alert('Data Updated Successfully');", true);
            }
            filldata();
            txtName.Text = "";
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
            var res = dbobj.tb_BlogCategories;
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
        if (e.CommandName == "btndelete")
        {
            GridViewRow item = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            id = (Label)item.FindControl("lbluid");
            try
            {
                tb_BlogCategory tbobj = dbobj.tb_BlogCategories.Single(T => T.Category_id == Convert.ToInt32(id.Text));
                dbobj.tb_BlogCategories.DeleteOnSubmit(tbobj);
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

                tb_BlogCategory tbobj = dbobj.tb_BlogCategories.Single(T => T.Category_id == Convert.ToInt32(id.Text));
                txtName.Text = tbobj.Category_Nm;
                lblstats.Text = id.Text;
                lblid.Text = id.Text;

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
                    tb_BlogCategory tbobj = dbobj.tb_BlogCategories.Single(T => T.Category_id == Convert.ToInt32(cid.Text));
                    // Select the checkboxes from the GridView control

                    dbobj.tb_BlogCategories.DeleteOnSubmit(tbobj);
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