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


public partial class Admin_CMS_Page : System.Web.UI.Page
{
    BlogPostDataClassesDataContext dbobj;
    connection con = new connection();
    //tb_CMS tbobj = new tb_CMS();
    protected void btadd_Click(object sender, EventArgs e)
    {

    }

    protected void btsave_Click(object sender, EventArgs e)
    {
        dbobj = new BlogPostDataClassesDataContext(con.cn);
        try
        {

            //tbobj.Pagetitle = txtpagetitle.Text;
            //tbobj.metakeyword = txtmeta.Text;
            //tbobj.metadescrition = txtmetadesc.Text;
            //tbobj.Title = txttitle.Text;
            //tbobj.Description = CKEditorControl1.Text;

            //dbobj.tb_CMS.InsertOnSubmit(tbobj);
            dbobj.SubmitChanges();

        }
        catch (Exception)
        {

            throw;
        }
        txttitle.Text = "";
        txtpagetitle.Text = "";
        txtmetadesc.Text = "";
        txtmeta.Text = "";
        CKEditorControl1.Text = "";

    }
}