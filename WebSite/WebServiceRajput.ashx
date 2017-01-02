<%@ WebHandler Language="C#" Class="webservices" %>

using System;
using System.Web;
using System.Web.SessionState;
using System.Data.Linq;
using System.Linq;
using BlogPost;

public class webservices : IHttpHandler
{
    BlogPostDataClassesDataContext dbObj;
    connection con = new connection();
    public HttpRequest Request;
    public HttpResponse Response;

    public void ProcessRequest(HttpContext context)
    {
        Response = context.Response;
        Request = context.Request;

        if (Request["action"].ToString() == "category")
        {
            categorylist();
        }
        else if (Request["action"].ToString() == "Org_list")
        {
            Org_list();
        }

        else if (Request["action"].ToString() == "Bloger_list")
        {
            Blogger_list();
        }
        else if (Request["action"].ToString() == "Bloger_list_all")
        {
            Blogger_list_all();
        }
        else if (Request["action"].ToString() == "all_post")
        {
            all_post();
        }
        else if (Request["action"].ToString() == "blogger_all_post")
        {
            Blogger_all_post();
        }

        else if (Request["action"].ToString() == "Blogger_Each_post")
        {
            Blogger_Each_post();
        }
        else if (Request["action"].ToString() == "Category_all_post")
        {
            CategoryWishall_post();
        }



    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }


    //public void RestauratSearch()
    //{
    //    try
    //    {
    //        //************* http://spoonup.in/webservices.ashx?action=restaurant&restaurantname=test *******////
    //        if (Request["action"].ToString() == "restaurant")
    //        {
    //            string Result = "";
    //            int k = 0;
    //            dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);

    //            var getgroup = dbObj.tb_RestaurantEntries.Where(T => T.Restaurant_name == Request["restaurantname"].ToString());
    //            var groupcoutner = dbObj.tb_RestaurantEntries.Where(T => T.Restaurant_name == Request["restaurantname"].ToString()).Count();
    //            if (getgroup != null)
    //            {
    //                Result = Result + @"{""restaurant"":[";
    //                foreach (var groupslist in getgroup)
    //                {
    //                    k++;
    //                    Result = Result + @"{""Id"":""";
    //                    Result = Result + groupslist.Restaurant_id;
    //                    Result = Result + @""",""restarantname"":""";
    //                    Result = Result + groupslist.Restaurant_name;
    //                    Result = Result + @""",""restarantimge"":""";
    //                    Result = Result + "http://spoonup.in/UploadedImage/RestaurantLogo/" + groupslist.Logo;
    //                    Result = Result + @""",""fromtime"":""";
    //                    Result = Result + groupslist.Available_Time;
    //                    Result = Result + @""",""totime"":""";
    //                    Result = Result + groupslist.ToAvailable;
    //                    Result = Result + @""",""Cuisines"":""";
    //                    Result = Result + groupslist.Cuisine;
    //                    Result = Result + @""",""Address"":""";
    //                    Result = Result + groupslist.Address;
    //                    Result = Result + @""",""Description"":""";
    //                    Result = Result + groupslist.Sort_Description;
    //                    Result = Result + @"""}";
    //                    if (k != groupcoutner)
    //                    {
    //                        Result = Result + ",";
    //                    }
    //                }

    //                Result = Result + "]}";

    //                Response.Write(Result);
    //            }

    //        }
    //        else
    //        { Response.Write(@"{""success"":""No Record Found""}"); }






    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write(@"{""error"":""Fail""}");
    //    }

    //}


    //public void AreaSearch()
    //{
    //    try
    //    {
    //        //************* http://spoonup.in/webservices.ashx?action=area*******////
    //        if (Request["action"].ToString() == "area")
    //        {
    //            string Result = "";
    //            int k = 0;
    //            dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);

    //            var getgroup = dbObj.tb_AreaMasters;
    //            var groupcoutner = dbObj.tb_AreaMasters.Count();
    //            if (getgroup != null)
    //            {
    //                Result = Result + @"{""area"":[";
    //                foreach (var groupslist in getgroup)
    //                {
    //                    k++;
    //                    Result = Result + @"{""Id"":""";
    //                    Result = Result + groupslist.Area_id;
    //                    Result = Result + @""",""areaname"":""";
    //                    Result = Result + groupslist.Area_nm;
    //                    Result = Result + @""",""Delivery_Amount"":""";
    //                    Result = Result + groupslist.Amount;
    //                    Result = Result + @"""}";
    //                    if (k != groupcoutner)
    //                    {
    //                        Result = Result + ",";
    //                    }
    //                }

    //                Result = Result + "]}";

    //                Response.Write(Result);
    //            }

    //        }
    //        else
    //        { Response.Write(@"{""success"":""No Record Found""}"); }






    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write(@"{""error"":""Fail""}");
    //    }

    //}

    //public void MenuBasedOnRestaurant()
    //{
    //    try
    //    {
    //        //************* http://spoonup.in/webservices.ashx?action=menubasedonrestaurant&rest_id=0 *******////
    //        if (Request["action"].ToString() == "menubasedonrestaurant")
    //        {
    //            string Result = "";
    //            int k = 0;
    //            dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);

    //            var getgroup = dbObj.menu_list("menulist", Convert.ToInt32(Request["rest_id"].ToString()), 0);
    //            var groupcoutner = dbObj.menu_list("menulist", Convert.ToInt32(Request["rest_id"].ToString()), 0).Count();
    //            if (getgroup != null)
    //            {
    //                Result = Result + @"{""menulist"":[";
    //                foreach (var groupslist in getgroup)
    //                {
    //                    k++;
    //                    Result = Result + @"{""Id"":""";
    //                    Result = Result + groupslist.Menu_Id;
    //                    Result = Result + @""",""itemname"":""";
    //                    Result = Result + groupslist.ItemName;
    //                    Result = Result + @""",""itemimg"":""";
    //                    Result = Result + "http://spoonup.in/UploadedImage/FoodImage/" + groupslist.Image;
    //                    Result = Result + @""",""restaurantname"":""";
    //                    Result = Result + groupslist.Restaurant_name;
    //                    Result = Result + @""",""restaurantimg"":""";
    //                    Result = Result + "http://spoonup.in/UploadedImage/RestaurantLogo/" + groupslist.Logo;
    //                    Result = Result + @""",""fullprice"":""";
    //                    Result = Result + groupslist.FullPrise;
    //                    Result = Result + @""",""halfprice"":""";
    //                    Result = Result + groupslist.HalfPrise;
    //                    Result = Result + @""",""vagnonvagimg"":""";
    //                    Result = Result + "http://spoonup.in/images/Veg.jpg";
    //                    Result = Result + @""",""description"":""";
    //                    Result = Result + groupslist.Item_fulldisc;
    //                    Result = Result + @"""}";
    //                    if (k != groupcoutner)
    //                    {
    //                        Result = Result + ",";
    //                    }
    //                }

    //                Result = Result + "]}";

    //                Response.Write(Result);
    //            }

    //        }
    //        else
    //        { Response.Write(@"{""success"":""No Record Found""}"); }






    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write(@"{""error"":""Fail""}");
    //    }

    //}


    //public void Menu()
    //{
    //    try
    //    {
    //        //************* http://spoonup.in/webservices.ashx?action=menu&menu_id=0 *******////
    //        if (Request["action"].ToString() == "menu")
    //        {
    //            string Result = "";
    //            int k = 0;
    //            dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);

    //            var getgroup = dbObj.menu_list("menulist", Convert.ToInt32(Request["rest_id"].ToString()), 0);
    //            var groupcoutner = dbObj.menu_list("menulist", Convert.ToInt32(Request["rest_id"].ToString()), 0).Count();
    //            if (getgroup != null)
    //            {
    //                Result = Result + @"{""menulist"":[";
    //                foreach (var groupslist in getgroup)
    //                {
    //                    k++;
    //                    Result = Result + @"{""Id"":""";
    //                    Result = Result + groupslist.Menu_Id;
    //                    Result = Result + @""",""itemname"":""";
    //                    Result = Result + groupslist.ItemName;
    //                    Result = Result + @""",""itemimg"":""";
    //                    Result = Result + "http://spoonup.in/UploadedImage/FoodImage/" + groupslist.Image;
    //                    Result = Result + @""",""restaurantname"":""";
    //                    Result = Result + groupslist.Restaurant_name;
    //                    Result = Result + @""",""restaurantimg"":""";
    //                    Result = Result + "http://spoonup.in/UploadedImage/RestaurantLogo/" + groupslist.Logo;
    //                    Result = Result + @""",""fullprice"":""";
    //                    Result = Result + groupslist.FullPrise;
    //                    Result = Result + @""",""halfprice"":""";
    //                    Result = Result + groupslist.HalfPrise;
    //                    Result = Result + @""",""vagnonvagimg"":""";
    //                    Result = Result + "http://spoonup.in/images/Veg.jpg";
    //                    Result = Result + @""",""description"":""";
    //                    Result = Result + groupslist.Item_fulldisc;
    //                    Result = Result + @"""}";
    //                    if (k != groupcoutner)
    //                    {
    //                        Result = Result + ",";
    //                    }
    //                }

    //                Result = Result + "]}";

    //                Response.Write(Result);
    //            }

    //        }
    //        else
    //        { Response.Write(@"{""success"":""No Record Found""}"); }






    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write(@"{""error"":""Fail""}");
    //    }

    //}

    //public void RestaurantList()
    //{
    //    try
    //    {
    //        //************* http://spoonup.in/webservices.ashx?action=restaurantlist *******////
    //        if (Request["action"].ToString() == "restaurantlist")
    //        {
    //            string Result = "";
    //            int k = 0;
    //            dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //            var getgroup = dbObj.tb_RestaurantEntries;
    //            var groupcoutner = dbObj.tb_RestaurantEntries.Count();
    //            if (getgroup != null)
    //            {
    //                Result = Result + @"{""restaurantlist"":[";
    //                foreach (var groupslist in getgroup)
    //                {
    //                    k++;
    //                    Result = Result + @"{""Id"":""";
    //                    Result = Result + groupslist.Restaurant_id;
    //                    Result = Result + @""",""restarantname"":""";
    //                    Result = Result + groupslist.Restaurant_name;
    //                    Result = Result + @""",""restarantimge"":""";
    //                    Result = Result + "http://spoonup.in/UploadedImage/RestaurantLogo/" + groupslist.Logo;
    //                    Result = Result + @""",""fromtime"":""";
    //                    Result = Result + groupslist.Available_Time;
    //                    Result = Result + @""",""totime"":""";
    //                    Result = Result + groupslist.ToAvailable;
    //                    Result = Result + @""",""Cuisines"":""";
    //                    Result = Result + groupslist.Cuisine;
    //                    Result = Result + @""",""Address"":""";
    //                    Result = Result + groupslist.Address;
    //                    Result = Result + @""",""Description"":""";
    //                    Result = Result + groupslist.Sort_Description;
    //                    Result = Result + @""",""Status"":""";
    //                    Result = Result + groupslist.Status;
    //                    Result = Result + @"""}";
    //                    if (k != groupcoutner)
    //                    {
    //                        Result = Result + ",";
    //                    }
    //                }

    //                Result = Result + "]}";
    //                Response.Write(Result);
    //            }

    //        }
    //        else
    //        { Response.Write(@"{""success"":""No Record Found""}"); }
    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write(@"{""error"":""Fail""}");
    //    }
    //}

    public void categorylist()
    {
        try
        {
            //************* http://demo.rajputbook.com//WebServiceRajput.ashx?action=category *******////
            if (Request["action"].ToString() == "category")
            {
                string Result = "";
                int k = 0;
                dbObj = new BlogPostDataClassesDataContext(con.cn);
                var getgroup = dbObj.tb_BlogCategories.OrderByDescending(T => T.Category_id);
                var groupcoutner = dbObj.tb_BlogCategories.Count();
                if (getgroup != null)
                {
                    Result = Result + @"{""categorylist"":[";
                    foreach (var categorylist in getgroup)
                    {
                        k++;
                        Result = Result + @"{""Id"":""";
                        Result = Result + categorylist.Category_id;
                        Result = Result + @""",""categoryname"":""";
                        Result = Result + categorylist.Category_Nm;

                        Result = Result + @"""}";

                        if (k != groupcoutner)
                        {
                            Result = Result + ",";
                        }
                    }

                    Result = Result + "]}";
                    Response.Write(Result);
                }

            }
            else
            { Response.Write(@"{""success"":""No Record Found""}"); }
        }
        catch (Exception ex)
        {
            Response.Write(@"{""error"":""Fail""}");
        }

    }

    public void Org_list()
    {
        try
        {
            //************* http://demo.rajputbook.com//WebServiceRajput.ashx?action=Org_list *******////
            if (Request["action"].ToString() == "Org_list")
            {
                string Result = "";
                int k = 0;
                dbObj = new BlogPostDataClassesDataContext(con.cn);
                var getgroup = dbObj.tb_OrganizationLists.Where(T => T.Status == "Approved").OrderByDescending(T => T.Organization_id);
                var groupcoutner = dbObj.tb_OrganizationLists.Where(T => T.Status == "Approved").Count();
                if (getgroup != null)
                {
                    Result = Result + @"{""org_list"":[";
                    foreach (var organizaionlist in getgroup)
                    {
                        k++;
                        Result = Result + @"{""Id"":""";
                        Result = Result + organizaionlist.Organization_id;
                        Result = Result + @""",""org_name"":""";
                        Result = Result + organizaionlist.Name;
                        Result = Result + @""",""profilepic"":""";
                        Result = Result + "http://demo.rajputbook.com//siteimages/OrganizationImg/" + organizaionlist.ProfilePict;
                        Result = Result + @""",""description"":""";
                        Result = Result + organizaionlist.Description;

                        Result = Result + @"""}";

                        if (k != groupcoutner)
                        {
                            Result = Result + ",";
                        }
                    }

                    Result = Result + "]}";
                    Response.Write(Result);
                }

            }
            else
            { Response.Write(@"{""success"":""No Record Found""}"); }
        }
        catch (Exception ex)
        {
            Response.Write(@"{""error"":""Fail""}");
        }

    }

    public void Blogger_list()
    {
        try
        {
            //************* http://demo.rajputbook.com//WebServiceRajput.ashx?action=Bloger_list&Org_Id=0 *******////
            if (Request["action"].ToString() == "Bloger_list")
            {
                string Result = "";
                int k = 0;
                dbObj = new BlogPostDataClassesDataContext(con.cn);
                int ID = 0;
                int.TryParse(Request["Org_Id"].ToString(), out ID);

                var getgroup = dbObj.tb_bloggerregistrations.Where(T => T.Organization_id == ID && T.Status == "Approved").OrderByDescending(T => T.Blogger_id);
                var groupcoutner = dbObj.tb_bloggerregistrations.Where(T => T.Organization_id == ID && T.Status == "Approved").Count();
                if (getgroup != null)
                {
                    Result = Result + @"{""blogger_list"":[";
                    foreach (var Bloggerlist in getgroup)
                    {
                        k++;
                        Result = Result + @"{""Id"":""";
                        Result = Result + Bloggerlist.Blogger_id;
                        Result = Result + @""",""blogger_name"":""";
                        Result = Result + Bloggerlist.Name;
                        Result = Result + @""",""profilepic"":""";
                        Result = Result + "http://demo.rajputbook.com//siteimages/BloggerImg/" + Bloggerlist.ProfilePict;
                        Result = Result + @""",""description"":""";
                        Result = Result + Bloggerlist.Description;

                        Result = Result + @"""}";

                        if (k != groupcoutner)
                        {
                            Result = Result + ",";
                        }
                    }

                    Result = Result + "]}";
                    Response.Write(Result);
                }

            }
            else
            { Response.Write(@"{""success"":""No Record Found""}"); }
        }
        catch (Exception ex)
        {
            Response.Write(@"{""error"":""Fail""}");
        }

    }

    public void Blogger_list_all()
    {
        try
        {
            //************* http://demo.rajputbook.com//WebServiceRajput.ashx?action=Bloger_list_all *******////
            if (Request["action"].ToString() == "Bloger_list_all")
            {
                string Result = "";
                int k = 0;
                dbObj = new BlogPostDataClassesDataContext(con.cn);

                var getgroup = dbObj.tb_bloggerregistrations.Where(T => T.Status == "Approved").OrderByDescending(T => T.Blogger_id);
                var groupcoutner = dbObj.tb_bloggerregistrations.Where(T => T.Status == "Approved").Count();
                if (getgroup != null)
                {
                    Result = Result + @"{""blogger_list"":[";
                    foreach (var Bloggerlist in getgroup)
                    {
                        k++;
                        Result = Result + @"{""Id"":""";
                        Result = Result + Bloggerlist.Blogger_id;
                        Result = Result + @""",""blogger_name"":""";
                        Result = Result + Bloggerlist.Name;
                        Result = Result + @""",""profilepic"":""";
                        Result = Result + "http://demo.rajputbook.com//siteimages/BloggerImg/" + Bloggerlist.ProfilePict;
                        Result = Result + @""",""description"":""";
                        Result = Result + Bloggerlist.Description;

                        Result = Result + @"""}";

                        if (k != groupcoutner)
                        {
                            Result = Result + ",";
                        }
                    }

                    Result = Result + "]}";
                    Response.Write(Result);
                }

            }
            else
            { Response.Write(@"{""success"":""No Record Found""}"); }
        }
        catch (Exception ex)
        {
            Response.Write(@"{""error"":""Fail""}");
        }

    }

    public void all_post()
    {
        try
        {
            //************* http://demo.rajputbook.com//WebServiceRajput.ashx?action=all_post *******////
            if (Request["action"].ToString() == "all_post")
            {
                string Result = "";
                int k = 0;
                dbObj = new BlogPostDataClassesDataContext(con.cn);

                var getgroup = dbObj.sp_postlist("post", 0, 0).Where(T => T.Status == "Approved").OrderByDescending(T => T.Post_id);
                var groupcoutner = dbObj.sp_postlist("post", 0, 0).Where(T => T.Status == "Approved").Count();
                if (getgroup != null)
                {
                    Result = Result + @"{""all_post"":[";
                    foreach (var PostList in getgroup)
                    {
                        k++;
                        Result = Result + @"{""Id"":""";
                        Result = Result + PostList.Post_id;
                        Result = Result + @""",""post_title"":""";
                        Result = Result + PostList.PostTitle;
                        Result = Result + @""",""post_pict"":""";
                        Result = Result + "http://demo.rajputbook.com//siteimages/postImg/" + PostList.Image;
                        Result = Result + @""",""description"":""";
                        Result = Result + PostList.PostContent;

                        Result = Result + @"""}";

                        if (k != groupcoutner)
                        {
                            Result = Result + ",";
                        }
                    }

                    Result = Result + "]}";
                    Response.Write(Result);
                }

            }
            else
            { Response.Write(@"{""success"":""No Record Found""}"); }
        }
        catch (Exception ex)
        {
            Response.Write(@"{""error"":""Fail""}");
        }

    }

    public void CategoryWishall_post()
    {
        try
        {
            //************* http://demo.rajputbook.com//WebServiceRajput.ashx?action=Category_all_post&category=0 *******////
            if (Request["action"].ToString() == "Category_all_post")
            {
                int catid = 0;
                int.TryParse(Request["category"].ToString(), out catid);

                string Result = "";
                int k = 0;
                dbObj = new BlogPostDataClassesDataContext(con.cn);

                var getgroup = dbObj.sp_postlist("post", 0, 0).Where(T => T.Category_id == catid && T.Status == "Approved").OrderByDescending(T => T.Post_id);
                var groupcoutner = dbObj.sp_postlist("post", 0, 0).Where(T => T.Category_id == catid).Count();
                if (getgroup != null)
                {
                    Result = Result + @"{""Category_all_post"":[";
                    foreach (var PostList in getgroup)
                    {
                        k++;
                        Result = Result + @"{""Id"":""";
                        Result = Result + PostList.Post_id;
                        Result = Result + @""",""post_title"":""";
                        Result = Result + PostList.PostTitle;
                        Result = Result + @""",""post_pict"":""";
                        Result = Result + "http://demo.rajputbook.com//siteimages/postImg/" + PostList.Image;
                        Result = Result + @""",""description"":""";
                        Result = Result + PostList.PostContent;

                        Result = Result + @"""}";

                        if (k != groupcoutner)
                        {
                            Result = Result + ",";
                        }
                    }

                    Result = Result + "]}";
                    Response.Write(Result);
                }

            }
            else
            { Response.Write(@"{""success"":""No Record Found""}"); }
        }
        catch (Exception ex)
        {
            Response.Write(@"{""error"":""Fail""}");
        }

    }

    public void Blogger_all_post()
    {
        try
        {
            //************* http://demo.rajputbook.com//WebServiceRajput.ashx?action=blogger_all_post&blogger_ID=0 *******////
            if (Request["action"].ToString() == "blogger_all_post")
            {
                string Result = "";
                int k = 0;
                int _bloggerid = 0;

                int.TryParse(Request["blogger_ID"].ToString(), out _bloggerid);



                dbObj = new BlogPostDataClassesDataContext(con.cn);

                var getgroup = dbObj.sp_postlist("bloggerpost", _bloggerid, 0).OrderByDescending(T => T.Post_id);
                var groupcoutner = dbObj.sp_postlist("bloggerpost", _bloggerid, 0).Count();
                if (getgroup != null)
                {
                    Result = Result + @"{""all_post"":[";
                    foreach (var PostList in getgroup)
                    {
                        k++;
                        Result = Result + @"{""Id"":""";
                        Result = Result + PostList.Post_id;
                        Result = Result + @""",""post_title"":""";
                        Result = Result + PostList.PostTitle;
                        Result = Result + @""",""post_pict"":""";
                        Result = Result + "http://demo.rajputbook.com//siteimages/postImg/" + PostList.Image;
                        Result = Result + @""",""description"":""";
                        Result = Result + PostList.PostContent;

                        Result = Result + @"""}";

                        if (k != groupcoutner)
                        {
                            Result = Result + ",";
                        }
                    }

                    Result = Result + "]}";
                    Response.Write(Result);
                }

            }
            else
            { Response.Write(@"{""success"":""No Record Found""}"); }
        }
        catch (Exception ex)
        {
            Response.Write(@"{""error"":""Fail""}");
        }

    }

    public void Blogger_Each_post()
    {
        try
        {
            //************* http://demo.rajputbook.com//WebServiceRajput.ashx?action=Blogger_Each_post&postid=0 *******////
            if (Request["action"].ToString() == "Blogger_Each_post")
            {
                string Result = "";
                int k = 0;
                int postid = 0;

                int.TryParse(Request["postid"].ToString(), out postid);



                dbObj = new BlogPostDataClassesDataContext(con.cn);

                var getgroup = dbObj.sp_postlist("postdetail", postid, 0).Where(T => T.Post_id == postid).OrderByDescending(T => T.Post_id);
                var groupcoutner = dbObj.sp_postlist("postdetail", postid, 0).Where(T => T.Post_id == postid).Count();
                if (getgroup != null)
                {
                    Result = Result + @"{""single_post"":[";
                    foreach (var PostList in getgroup)
                    {
                        k++;
                        Result = Result + @"{""Id"":""";
                        Result = Result + PostList.Post_id;
                        Result = Result + @""",""post_title"":""";
                        Result = Result + PostList.PostTitle;
                        Result = Result + @""",""post_pict"":""";
                        Result = Result + "http://demo.rajputbook.com//siteimages/postImg/" + PostList.Image;
                        Result = Result + @""",""description"":""";
                        Result = Result + PostList.PostContent;
                        Result = Result + @""",""date"":""";
                        Result = Result + PostList.EntryDate;
                        Result = Result + @"""}";

                        if (k != groupcoutner)
                        {
                            Result = Result + ",";
                        }
                    }

                    Result = Result + "]}";
                    Response.Write(Result);
                }

            }
            else
            { Response.Write(@"{""success"":""No Record Found""}"); }
        }
        catch (Exception ex)
        {
            Response.Write(@"{""error"":""Fail""}");
        }

    }

    public void Org_list_categorywise()
    {
        try
        {
            //************* http://demo.rajputbook.com//WebServiceRajput.ashx?action=Org_listbycategory?cat_Id=0 *******////
            if (Request["action"].ToString() == "Org_listbycategory")
            {
                string Result = "";
                int k = 0;
                dbObj = new BlogPostDataClassesDataContext(con.cn);
                var getgroup = dbObj.tb_OrganizationLists;
                var groupcoutner = dbObj.tb_OrganizationLists.Count();
                if (getgroup != null)
                {
                    Result = Result + @"{""org_list"":[";
                    foreach (var organizaionlist in getgroup)
                    {
                        k++;
                        Result = Result + @"{""Id"":""";
                        Result = Result + organizaionlist.Organization_id;
                        Result = Result + @""",""org_name"":""";
                        Result = Result + organizaionlist.Name;
                        Result = Result + @""",""profilepic"":""";
                        Result = Result + "http://demo.rajputbook.com//siteimages/OrganizationImg/" + organizaionlist.ProfilePict;
                        Result = Result + @""",""description"":""";
                        Result = Result + organizaionlist.Description;

                        Result = Result + @"""}";

                        if (k != groupcoutner)
                        {
                            Result = Result + ",";
                        }
                    }

                    Result = Result + "]}";
                    Response.Write(Result);
                }

            }
            else
            { Response.Write(@"{""success"":""No Record Found""}"); }
        }
        catch (Exception ex)
        {
            Response.Write(@"{""error"":""Fail""}");
        }

    }


    //public void login()
    //{
    //    try
    //    {
    //        //************* http://spoonup.in/webservices.ashx?action=login&Email=abc@gmail.com&Password=123456 *******////
    //        if (Request["action"].ToString() == "login")
    //        {
    //            string Result = "";
    //            int k = 0;
    //            dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //            var getgroup = dbObj.tb_SignUps.Where(T => T.Email == Request["Email"].ToString() && T.Password == Request["Password"].ToString()).Single();
    //            var groupcoutner = dbObj.tb_SignUps.Where(T => T.Email == Request["Email"].ToString() && T.Password == Request["Password"].ToString()).Count();
    //            if (getgroup != null)
    //            {
    //                if (groupcoutner > 0)
    //                {
    //                    Result = Result + @"{""categorylist"":[";


    //                    Result = Result + @"{""Id"":""";
    //                    Result = Result + getgroup.UserId;
    //                    Result = Result + @""",""UserName"":""";
    //                    Result = Result + getgroup.Name;                       
    //                    Result = Result + @"""}";




    //                Result = Result + "]}";
    //                Response.Write(Result);

    //                }
    //                else
    //                { Response.Write(@"{""success"":""0""}"); }

    //            }
    //            else
    //            { Response.Write(@"{""success"":""0""}"); }

    //        }
    //        else
    //        { Response.Write(@"{""success"":""No Record Found""}"); }
    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write(@"{""error"":""Fail""}");
    //    }

    //}

    //public void SigupUser()
    //{
    //    try
    //    {
    //        //************* http://spoonup.in/webservices.ashx?action=sigup_user&uname=name&email=abc@gmail.com&mobile=9999999999&password=123456 *******////
    //        if (Request["action"].ToString() == "sigup_user")
    //        {
    //            string Result = "";
    //            int k = 0;
    //            dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //            tb_SignUp sigup = new tb_SignUp();
    //            var resigtercount = dbObj.tb_SignUps.Where(T => T.Email == Request["email"].ToString()).Count();
    //            if (resigtercount == 0)
    //            {
    //                sigup.Email = Request["email"].ToString();
    //                sigup.Name = Request["uname"].ToString();
    //                sigup.Password = Request["password"].ToString();
    //                sigup.Phone = Request["mobile"].ToString();
    //                dbObj.tb_SignUps.InsertOnSubmit(sigup);
    //                dbObj.SubmitChanges();
    //                Response.Write(@"{""success"":""1""}");
    //            }
    //            else { Response.Write(@"{""already_exist"":""0""}"); }

    //        }
    //        else
    //        { Response.Write(@"{""error"":""Fail""}"); }
    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write(@"{""error"":""Fail""}");
    //    }

    //}



    //public void Webservices()
    //{
    //    if (Request["action"].ToString() == "login")
    //    {
    //        //************* http://3ibis.webprodeveloper.net/webservices.ashx?action=login&emailid=abc@gmail.com&password=aaaa *******////
    //        Login();
    //    }
    //    else if (Request["action"].ToString() == "regdevice")
    //    {
    //        //************* http://3ibis.webprodeveloper.net/webservices.ashx?action=regdevice&emailid=abc@gmail.com&deviceid=adfasfasdds33a133a2sdf3ads3 *******////
    //        try
    //        {
    //            dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //            var result1 = dbObj.tb_Users.Where(T => T.EmailId == Request["email"]).Count();
    //            if (result1 > 0)
    //            {

    //                tb_User tbuser = new tb_User();
    //                tbuser = dbObj.tb_Users.Where(T => T.EmailId == Request["email"]).SingleOrDefault();
    //                if (tbuser != null)
    //                {
    //                    tbuser.DeviceId = Request["deviceid"];
    //                    dbObj.SubmitChanges();
    //                    Response.Write(@"{""success"":""true""}");
    //                }
    //            }
    //            else { Response.Write(@"{""erorr"":""email not foud""}"); }

    //        }
    //        catch (Exception ex)
    //        {
    //            Response.Write(@"{""erorr"":""" + ex.Message.ToString() + "}");
    //        }
    //    }
    //    else if (Request["action"].ToString() == "getusers")
    //    {   //************* http://3ibis.webprodeveloper.net/webservices.ashx?action=getusers *******////

    //        getusers();
    //    }
    //    else if (Request["action"].ToString() == "register")
    //    {
    //        try
    //        {
    //            //************* http://3ibis.webprodeveloper.net/webservices.ashx?action=regdevice&emailid=abc@gmail.com&username=chavdaatul&password=abc&image=bytearray *******////

    //            dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //            var idExisting = dbObj.tb_Users.Where(T => T.EmailId == Request["email"]).Count();

    //            if (idExisting == 0)
    //            {
    //                tb_User tbuser1 = new tb_User();
    //                tbuser1.EmailId = Request["email"];
    //                tbuser1.UserName = Request["username"];
    //                tbuser1.Password = Request["password"];
    //                HttpPostedFile file = Request.Files["image"];
    //                byte[] buffer = new byte[file.ContentLength];
    //                file.InputStream.Read(buffer, 0, file.ContentLength);
    //                string imgpath = byteArrayToImage(buffer);
    //                tbuser1.ProfilePc = imgpath;
    //                dbObj.tb_Users.InsertOnSubmit(tbuser1);
    //                dbObj.SubmitChanges();
    //                Response.Write(@"{""success"":""true""}");
    //            }
    //            else
    //            {
    //                Response.Write(@"{""message"":""Email Already Registered""}");
    //            }




    //        }
    //        catch (Exception)
    //        {
    //            Response.Write(@"{""erorr"":""false""}");
    //        }
    //    }
    //    else if (Request["action"].ToString() == "getusers")
    //    {
    //        try
    //        {
    //            getusers();
    //        }
    //        catch (Exception)
    //        {
    //            Response.Write(@"{""erorr"":""false""}");
    //        }
    //    }
    //    else if (Request["action"].ToString() == "joingroup")
    //    {
    //        try
    //        {
    //            joingroup();
    //        }
    //        catch (Exception)
    //        {
    //            Response.Write(@"{""erorr"":""false""}");
    //        }
    //    }
    //    else if (Request["action"].ToString() == "invite")
    //    {
    //        try
    //        {
    //            joingroup();
    //        }
    //        catch (Exception)
    //        {
    //            Response.Write(@"{""erorr"":""false""}");
    //        }
    //    }
    //    else if (Request["action"].ToString() == "suggestfriend")
    //    {
    //        try
    //        {
    //            suggestfriend();
    //        }
    //        catch (Exception)
    //        {
    //            Response.Write(@"{""erorr"":""false""}");
    //        }
    //    }
    //    else if (Request["action"].ToString() == "updateImage")
    //    {
    //        try
    //        {
    //            //************* http://3ibis.webprodeveloper.net/webservices.ashx?action=updateImage&email=abc&image=filepath *******////

    //            dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //            var idExisting = dbObj.tb_Users.Where(T => T.EmailId == Request["email"]).Count();

    //            if (idExisting == 0)
    //            {

    //                tb_User tbuser1 = new tb_User();
    //                tbuser1 = dbObj.tb_Users.Where(T => T.EmailId == Request["email"]).SingleOrDefault();
    //                HttpPostedFile file = Request.Files["image"];
    //                byte[] buffer = new byte[file.ContentLength];
    //                file.InputStream.Read(buffer, 0, file.ContentLength);
    //                string imgpath = byteArrayToImage(buffer);
    //                tbuser1.ProfilePc = imgpath;
    //                dbObj.SubmitChanges();
    //                Response.Write(@"{""success"":""true""}");
    //            }
    //            else
    //            {
    //                Response.Write(@"{""message"":""Email Already Registered""}");
    //            }


    //        }
    //        catch (Exception Ex)
    //        {

    //            throw Ex;
    //        }

    //    }

    //    else if (Request["action"].ToString() == "logout")
    //    {
    //        try
    //        {
    //            dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //            string emailid = Request["emailid"].ToString();
    //            int topicid = Convert.ToInt32(Request["topicid"]),
    //                subtopicid = Convert.ToInt32(Request["subtopicid"]),
    //                groupid = Convert.ToInt32(Request["groupid"]);

    //            dbObj.SP_TSG("logout", emailid, topicid, "", "", subtopicid, groupid);
    //            Response.Write(@"{""success"":""true""}");


    //            dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //            tb_chat tbChat = new tb_chat();
    //            var result = dbObj.tb_chats.Where(T => T.GroupId == Convert.ToInt32(Request["groupid"]) && T.SubTopicId == Convert.ToInt32(Request["subtopicid"]) && T.TopicId == Convert.ToInt32(Request["topicid"]) && T.EmailId == Request["emailid"].ToString()).Count();
    //            if (result > 0)
    //            {
    //                var resultMessage = dbObj.tb_chats.Where(T => T.GroupId == Convert.ToInt32(Request["groupid"]) && T.SubTopicId == Convert.ToInt32(Request["subtopicid"]) && T.TopicId == Convert.ToInt32(Request["topicid"]) && T.EmailId != Request["emailid"].ToString());
    //                if (resultMessage != null)
    //                {
    //                    string message1 = "";
    //                    message1 = message1 + @"{""logout"":""true";
    //                    message1 = message1 + @""",""email"":""";
    //                    message1 = message1 + emailid;
    //                    message1 = message1 + @"""}";
    //                    Response.Write(message1);
    //                    foreach (var item in resultMessage)
    //                    {
    //                        Message(item.DeviceId, message1, Request["emailid"].ToString());
    //                    }

    //                }

    //            }



    //        }
    //        catch (Exception ex)
    //        {
    //            Response.Write(@"{""erorr"":""false""}");
    //        }

    //    }

    //    else if (Request["action"].ToString() == "gettopics")
    //    {

    //        gettopics();

    //    }
    //    else if (Request["action"].ToString() == "getmessage")
    //    {
    //        SendNotification();
    //    }

    //    else if (Request["action"].ToString() == "getgroup")
    //    { grouplist(); }

    //    else if (Request["action"].ToString() == "getprofile")
    //    {
    //        getProfile();
    //    }
    //    else if (Request["action"].ToString() == "promtgroup")
    //    {
    //        groupPromtedlist();
    //    }


    //}

    //#region Gettopics
    //public void gettopics()
    //{
    //    try
    //    {
    //        dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //        var gettopics = dbObj.SP_TSG("gettopics", "", 0, "", "", 0, 0);
    //        var topiccounter = dbObj.SP_TSG("gettopics", "", 0, "", "", 0, 0).Count();
    //        int i = 0;
    //        if (gettopics != null)
    //        {
    //            string Result = "";
    //            Result = @"{""success"":""true"",""result"" : [";

    //            foreach (var item in gettopics)
    //            {
    //                i++;
    //                Result = Result + @"{""Id"":""";
    //                Result = Result + item.Id;
    //                Result = Result + @""",""name"":""";
    //                Result = Result + item.Category;

    //                int j = 0;
    //                var getsubtopics = dbObj.SP_SubCategory("getsubtopics", "", Convert.ToInt32(item.Id), "", "", 0);
    //                var subtopicscounter = dbObj.SP_SubCategory("getsubtopics", "", Convert.ToInt32(item.Id), "", "", 0).Count();
    //                if (getsubtopics != null)
    //                {
    //                    Result = Result + @""",""subtopics"":[";
    //                    foreach (var subitems in getsubtopics)
    //                    {
    //                        j++;
    //                        Result = Result + @"{""Id"":""";
    //                        Result = Result + subitems.subId;
    //                        Result = Result + @""",""name"":""";
    //                        Result = Result + subitems.subcatname;

    //                        int k = 0;
    //                        var getgroup = dbObj.SP_Group("grouplist", "", Convert.ToInt32(item.Id), "", "", Convert.ToInt32(subitems.subId));
    //                        var groupcoutner = dbObj.SP_Group("grouplist", "", Convert.ToInt32(item.Id), "", "", Convert.ToInt32(subitems.subId)).Count();
    //                        if (getgroup != null)
    //                        {
    //                            Result = Result + @""",""groups"":[";
    //                            foreach (var groupslist in getgroup)
    //                            {
    //                                k++;
    //                                Result = Result + @"{""Id"":""";
    //                                Result = Result + groupslist.Id;
    //                                Result = Result + @""",""name"":""";
    //                                Result = Result + groupslist.GroupName;
    //                                Result = Result + @"""}";

    //                                if (k != groupcoutner)
    //                                {
    //                                    Result = Result + ",";
    //                                }


    //                            }

    //                            Result = Result + "]}";

    //                        }
    //                        else
    //                        {
    //                            Result = Result + @"}";
    //                        }


    //                        if (j != subtopicscounter)
    //                        {
    //                            Result = Result + ",";
    //                        }
    //                    }
    //                    Result = Result + "]}";


    //                }
    //                else
    //                {
    //                    Result = Result + @"}";

    //                }



    //                if (i != topiccounter)
    //                {
    //                    Result = Result + ",";
    //                }

    //            }
    //            Result = Result + "]}";
    //            Response.Write(Result);
    //        }

    //        else
    //        {
    //            Response.Write(@"{""success"":""false""}");
    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write(@"{""erorr"":""" + ex.Message.ToString() + "}");
    //    }

    //}
    //#endregion

    //public void grouplist()
    //{
    //    try
    //    {

    //        string Result = "";
    //        int k = 0;
    //        dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //        var getgroup = dbObj.tb_Groupmasters;
    //        var groupcoutner = dbObj.tb_Groupmasters.Count();
    //        if (getgroup != null)
    //        {
    //            Result = Result + @"{""groups"":[";
    //            foreach (var groupslist in getgroup)
    //            {
    //                k++;
    //                Result = Result + @"{""Id"":""";
    //                Result = Result + groupslist.Id;
    //                Result = Result + @""",""name"":""";
    //                Result = Result + groupslist.GroupName;
    //                Result = Result + @"""}";
    //                if (k != groupcoutner)
    //                {
    //                    Result = Result + ",";
    //                }
    //            }

    //            Result = Result + "]}";

    //            Response.Write(Result);

    //        }
    //        else
    //        { Response.Write(@"{""success"":""table is empaty""}"); }

    //    }
    //    catch (Exception)
    //    {

    //        throw;
    //    }

    //}

    //public void SendNotification()
    //{
    //    try
    //    {
    //        dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //        tb_chat tbChat = new tb_chat();
    //        var result = dbObj.tb_chats.Where(T => T.GroupId == Convert.ToInt32(Request["groupid"]) && T.SubTopicId == Convert.ToInt32(Request["subtopicid"]) && T.TopicId == Convert.ToInt32(Request["topicid"]) && T.EmailId == Request["emailid"].ToString()).Count();
    //        if (result > 0)
    //        {
    //            var resultMessage = dbObj.tb_chats.Where(T => T.GroupId == Convert.ToInt32(Request["groupid"]) && T.SubTopicId == Convert.ToInt32(Request["subtopicid"]) && T.TopicId == Convert.ToInt32(Request["topicid"]) && T.EmailId != Request["emailid"].ToString());
    //            if (resultMessage != null)
    //            {
    //                foreach (var item in resultMessage)
    //                {
    //                    Message(item.DeviceId, Request["message"].ToString(), Request["emailid"].ToString());
    //                }
    //                // Response.Write(@"{""success"":""true""}");
    //            }

    //        }
    //        else
    //        {
    //            tbChat.EmailId = Request["emailid"].ToString();
    //            tbChat.TopicId = Convert.ToInt32(Request["topicid"]);
    //            tbChat.SubTopicId = Convert.ToInt32(Request["subtopicid"]);
    //            tbChat.GroupId = Convert.ToInt32(Request["groupid"]);
    //            tbChat.DeviceId = Request["deviceid"].ToString();
    //            dbObj.tb_chats.InsertOnSubmit(tbChat);
    //            dbObj.SubmitChanges();
    //            SendNotification();
    //        }
    //    }
    //    catch (Exception Ex)
    //    {
    //        Response.Write(@"{""erorr"":""" + Ex.Message.ToString() + "}");
    //    }

    //}
    //public static byte[] ImageToByteArray(string imagefilePath)
    //{
    //    System.Drawing.Image image = System.Drawing.Image.FromFile(imagefilePath);
    //    byte[] imageByte = ImageToByteArraybyImageConverter(image);
    //    return imageByte;
    //}
    //private static byte[] ImageToByteArraybyImageConverter(System.Drawing.Image image)
    //{
    //    System.Drawing.ImageConverter imageConverter = new System.Drawing.ImageConverter();
    //    byte[] imageByte = (byte[])imageConverter.ConvertTo(image, typeof(byte[]));
    //    return imageByte;
    //}

    //public string byteArrayToImage(byte[] byteArrayIn)
    //{
    //    string getpath = "";
    //    System.IO.MemoryStream ms = new System.IO.MemoryStream(byteArrayIn);
    //    System.Drawing.Image returnImage = System.Drawing.Image.FromStream(ms);
    //    Random name = new Random();
    //    int rendomno = name.Next();

    //    getpath = @"C:\HostingSpaces\webprode\3ibis.webprodeveloper.net\wwwroot\groupchat\profpc\" + rendomno + ".png";
    //    returnImage.Save(getpath);
    //    getpath = @"http://3ibis.webprodeveloper.net/groupchat/profpc/" + rendomno + ".png";
    //    return getpath;
    //}

    //public string Message(string deviceId, string message, string emailid)
    //{
    //    string GoogleAppID = "AIzaSyB5BtIOMzUfN5MHSNXNRBeWwcT_oFflDfw";
    //    var SENDER_ID = "507217171137";
    //    var value = message;
    //    System.Net.WebRequest tRequest;
    //    tRequest = System.Net.WebRequest.Create("https://android.googleapis.com/gcm/send");
    //    tRequest.Method = "post";
    //    tRequest.ContentType = " application/x-www-form-urlencoded;charset=UTF-8";
    //    tRequest.Headers.Add(string.Format("Authorization: key={0}", GoogleAppID));

    //    tRequest.Headers.Add(string.Format("Sender: id={0}", SENDER_ID));
    //    string message1 = "";
    //    if (Request["action"] == "joingroup")
    //    {
    //        dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //        tb_User tbuser = new tb_User();

    //        var getjoingroup = dbObj.tb_Users.Where(T => T.EmailId == Request["emailid"]).SingleOrDefault();

    //        if (getjoingroup != null)
    //        {

    //            message1 = message1 + @"{""title"":""joingroup";

    //            message1 = message1 + @""",""sender"":""";
    //            message1 = message1 + getjoingroup.EmailId;

    //            message1 = message1 + @""",""groupid"":""";
    //            message1 = message1 + Request["groupid"];

    //            message1 = message1 + @""",""groupname"":""";
    //            message1 = message1 + Request["groupname"];

    //            message1 = message1 + @""",""topicid"":""";
    //            message1 = message1 + Request["topicid"];


    //            message1 = message1 + @""",""subtopicid"":""";
    //            message1 = message1 + Request["subtopicid"];

    //            message1 = message1 + @""",""profileimage"":""";
    //            message1 = message1 + getjoingroup.ProfilePc;

    //            message1 = message1 + @"""}";
    //        }

    //    }
    //    else if (Request["action"] == "invite")
    //    {
    //        dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //        tb_User tbuser = new tb_User();

    //        var getjoingroup = dbObj.tb_Users.Where(T => T.EmailId == Request["senderemailid"]).SingleOrDefault();

    //        if (getjoingroup != null)
    //        {

    //            message1 = message1 + @"{""title"":""invitefriend";

    //            message1 = message1 + @""",""sender"":""";
    //            message1 = message1 + getjoingroup.EmailId;

    //            message1 = message1 + @""",""groupid"":""";
    //            message1 = message1 + Request["groupid"];

    //            message1 = message1 + @""",""groupname"":""";
    //            message1 = message1 + Request["groupname"];

    //            message1 = message1 + @""",""topicid"":""";
    //            message1 = message1 + Request["topicid"];


    //            message1 = message1 + @""",""subtopicid"":""";
    //            message1 = message1 + Request["subtopicid"];

    //            message1 = message1 + @""",""profileimage"":""";
    //            message1 = message1 + getjoingroup.ProfilePc;

    //            message1 = message1 + @"""}";
    //        }
    //    }
    //    else if (Request["action"] == "suggestfriend")
    //    {
    //        dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //        tb_User tbuser = new tb_User();

    //        var getjoingroup = dbObj.tb_Users.Where(T => T.EmailId == Request["senderemailid"]).SingleOrDefault();

    //        if (getjoingroup != null)
    //        {

    //            message1 = message1 + @"{""title"":""suggestfriend";

    //            message1 = message1 + @""",""sender"":""";
    //            message1 = message1 + getjoingroup.EmailId;

    //            message1 = message1 + @"""}";
    //        }
    //    }
    //    else
    //    {
    //        message1 = "";
    //        message1 = message1 + @"{""message"":""";
    //        message1 = message1 + message;
    //        message1 = message1 + @""",""email"":""";
    //        message1 = message1 + emailid;
    //        message1 = message1 + @"""}";

    //        //Response.Write(message1);
    //    }

    //    string postData = "collapse_key=score_update&time_to_live=108&delay_while_idle=1&data.message=" + message1 + "&data.time=" +
    //    System.DateTime.Now.ToString() + "&registration_id=" + deviceId + "";
    //    Console.WriteLine(postData);
    //    Byte[] byteArray = System.Text.Encoding.UTF8.GetBytes(postData);
    //    tRequest.ContentLength = byteArray.Length;

    //    System.IO.Stream dataStream = tRequest.GetRequestStream();
    //    dataStream.Write(byteArray, 0, byteArray.Length);
    //    dataStream.Close();

    //    System.Net.WebResponse tResponse = tRequest.GetResponse();

    //    dataStream = tResponse.GetResponseStream();

    //    System.IO.StreamReader tReader = new System.IO.StreamReader(dataStream);

    //    String sResponseFromServer = tReader.ReadToEnd();

    //    tReader.Close();
    //    dataStream.Close();
    //    tResponse.Close();
    //    return sResponseFromServer;
    //}

    //public void Login()
    //{
    //    try
    //    {

    //        dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //        tb_User tbuser = new tb_User();
    //        var result = dbObj.tb_Users.Where(T => T.EmailId == Request["email"] && T.Password == Request["password"]).Count();
    //        if (result > 0)
    //        {
    //            //var result1 = dbObj.tb_Users.Where(T => T.EmailId == Request["email"] && T.Password == Request["password"]).Count();

    //            Response.Write(@"{""success"":""true""}");

    //            //if (result1 == 0)
    //            //{
    //            //    tbuser = dbObj.tb_Users.Where(T => T.EmailId == Request["email"]).SingleOrDefault();
    //            //    tbuser.DeviceId = Request["deviceid"];
    //            //    dbObj.SubmitChanges();
    //            //    Response.Write(@"{""success"":""true""}");
    //            //}
    //            //else { Response.Write(@"{""success"":""true""}"); }
    //        }
    //        else
    //        {
    //            Response.Write(@"{""erorr"":""false""}");

    //        }

    //        dbObj.Dispose();


    //    }
    //    catch (Exception Ex)
    //    {

    //        Response.Write(@"{""erorr"":""" + Ex.Message.ToString() + "}");
    //    }
    //}
    //public void Category()
    //{

    //    try
    //    {
    //        dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //        tb_category tbuser = new tb_category();
    //        var getcategory = dbObj.tb_categories;
    //        var Count = dbObj.tb_categories.Count();
    //        int i = 0;
    //        if (getcategory != null)
    //        {
    //            string Result = "";
    //            Result = @"{""success"":""true"",""result"" : [";

    //            foreach (var item in getcategory)
    //            {
    //                i++;
    //                Result = Result + @"{""Id"":""";
    //                Result = Result + item.Id;
    //                Result = Result + @""",""name"":""";
    //                Result = Result + item.SubCategory;
    //                Result = Result + @"""}";
    //                if (i != Count)
    //                {
    //                    Result = Result + ",";
    //                }

    //            }
    //            Result = Result + "]}";
    //            Response.Write(Result);
    //        }

    //        else
    //        {
    //            Response.Write(@"{""success"":""false""}");
    //        }
    //    }
    //    catch (Exception Ex)
    //    {
    //        Response.Write(@"{""erorr"":""" + Ex.Message.ToString() + "}");
    //    }
    //}
    //public void getusers()
    //{
    //    try
    //    {
    //        dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //        tb_User tbuser = new tb_User();
    //        var getcategory = dbObj.tb_Users;
    //        var Count = dbObj.tb_Users.Count();
    //        int i = 0;
    //        if (getcategory != null)
    //        {
    //            string Result = "";
    //            Result = @"{""success"":""true"",""users"" : [";

    //            foreach (var item in getcategory)
    //            {
    //                i++;
    //                Result = Result + @"{""id"":""";
    //                Result = Result + item.Id;
    //                Result = Result + @""",""username"":""";
    //                Result = Result + item.UserName;

    //                Result = Result + @""",""emailid"":""";
    //                Result = Result + item.EmailId;

    //                Result = Result + @""",""profileimage"":""";
    //                Result = Result + item.ProfilePc;

    //                Result = Result + @"""}";
    //                if (i != Count)
    //                {
    //                    Result = Result + ",";
    //                }

    //            }
    //            Result = Result + "]}";
    //            Response.Write(Result);
    //        }

    //        else
    //        {
    //            Response.Write(@"{""success"":""false""}");
    //        }
    //    }
    //    catch (Exception)
    //    {

    //        throw;
    //    }
    //}

    //public void getProfile()
    //{

    //    //  http://3ibis.webprodeveloper.net/webservices.ashx?action=getprofile&emailid=sojitrasagar108@gmail.com

    //    try
    //    {

    //        dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //        tb_User tbuser = new tb_User();

    //        var getcategory = dbObj.tb_Users.Where(T => T.EmailId == Request["emailid"]).SingleOrDefault();
    //        var Count = dbObj.tb_Users.Count();
    //        int i = 0;
    //        if (getcategory != null)
    //        {
    //            string Result = "";
    //            Result = @"{""success"":""true"",";


    //            i++;
    //            Result = Result + @"""id"":""";
    //            Result = Result + getcategory.Id;
    //            Result = Result + @""",""username"":""";
    //            Result = Result + getcategory.UserName;

    //            Result = Result + @""",""emailid"":""";
    //            Result = Result + getcategory.EmailId;

    //            Result = Result + @""",""password"":""";
    //            Result = Result + getcategory.Password;

    //            Result = Result + @""",""profileimage"":""";
    //            Result = Result + getcategory.ProfilePc;

    //            Result = Result + @"""}";




    //            Response.Write(Result);
    //        }

    //        else
    //        {
    //            Response.Write(@"{""success"":""false""}");
    //        }

    //    }
    //    catch (Exception Ex)
    //    {
    //        Response.Write(@"{""erorr"":""" + Ex.Message.ToString() + "}");
    //    }




    //}

    //public void joingroup()
    //{
    //    dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //    tb_User tbuser = new tb_User();
    //    var getjoingroup = dbObj.tb_Users.Where(T => T.EmailId == Request["recevieremailid"]).SingleOrDefault();
    //    //?action=joingroup&emailid=abc@gmail.com&recevieremailid=abc@gmail&groupid=1&topicid=1&subtopicid=1

    //    try
    //    {
    //        if (getjoingroup != null)
    //        {

    //            Message(getjoingroup.DeviceId, "", "");
    //            Response.Write(@"{""success"":""true""}");

    //        }
    //        else
    //        { Response.Write(@"{""success"":""false""}"); }

    //    }
    //    catch (Exception Ex)
    //    {
    //        Response.Write(@"{""erorr"":""" + Ex.Message.ToString() + "}");
    //    }
    //}


    //public void invite()
    //{
    //    dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //    tb_User tbuser = new tb_User();
    //    var getjoingroup = dbObj.tb_Users.Where(T => T.EmailId == Request["recevieremailid"]).SingleOrDefault();
    //    //	?action=invite&senderemailid=abc@gmail.com&recevieremailid=email@email.com&groupname=mygroup&subtopicid=1&groupid=1&topicid=1

    //    try
    //    {
    //        if (getjoingroup != null)
    //        {

    //            Message(getjoingroup.DeviceId, "", "");
    //            Response.Write(@"{""success"":""true""}");

    //        }
    //        else
    //        { Response.Write(@"{""success"":""false""}"); }

    //    }
    //    catch (Exception Ex)
    //    {
    //        Response.Write(@"{""erorr"":""" + Ex.Message.ToString() + "}");
    //    }
    //}

    //public void suggestfriend()
    //{
    //    dbObj = new SnoopUpSolutionDataClassesDataContext(con.cn);
    //    tb_User tbuser = new tb_User();
    //    var getjoingroup = dbObj.tb_Users.Where(T => T.EmailId == Request["recevieremailid"]).SingleOrDefault();
    //    //	?action=invite&senderemailid=abc@gmail.com&recevieremailid=email@email.com&groupname=mygroup&subtopicid=1&groupid=1&topicid=1

    //    try
    //    {
    //        if (getjoingroup != null)
    //        {

    //            Message(getjoingroup.DeviceId, "", "");
    //            Response.Write(@"{""success"":""true""}");

    //        }
    //        else
    //        { Response.Write(@"{""success"":""false""}"); }

    //    }
    //    catch (Exception Ex)
    //    {
    //        Response.Write(@"{""erorr"":""" + Ex.Message.ToString() + "}");
    //    }
    //}

}