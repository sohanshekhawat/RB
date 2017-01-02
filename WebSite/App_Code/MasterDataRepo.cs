using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MasterDataRepo
/// </summary>
public class MasterDataRepo : BaseRepo
{
    private BlogPostDataClassesDataContext dbobj;
    
    public MasterDataRepo(BlogPostDataClassesDataContext dbobj)
    {
        this.dbobj = dbobj;
    }

    public List<sp_subcategoryResult> GetSubCategoryList()
    {
        return dbobj.sp_subcategory().ToList();
    }
    
    public List<sp_categoryResult> GetCategoryList()
    {
        return dbobj.sp_category().ToList();
    }
    
    public List<sp_OrganizationResult> GetOrganisationList()
    {
        return dbobj.sp_Organization().ToList();
    }
    public List<sp_CountryfillResult> GetCountryList()
    {
        return dbobj.sp_Countryfill().ToList();
    }

    public List<sp_CategoryviewResult> GetSubCategoryDetailList()
    {
        return dbobj.sp_Categoryview().ToList();
    }

    public List<sp_BloggerResult> GetBloggerList()
    {
        return dbobj.sp_Blogger().ToList();
    }
}