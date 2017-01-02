﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RepositoryLibrary
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class db_rajputbookEntities : DbContext
    {
        public db_rajputbookEntities()
            : base("name=db_rajputbookEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tb_AdminLogin> tb_AdminLogin { get; set; }
        public virtual DbSet<tb_BlogCategory> tb_BlogCategory { get; set; }
        public virtual DbSet<tb_BloggerList> tb_BloggerList { get; set; }
        public virtual DbSet<tb_bloggerregistration> tb_bloggerregistration { get; set; }
        public virtual DbSet<tb_CountryMaster> tb_CountryMaster { get; set; }
        public virtual DbSet<tb_OrganizationList> tb_OrganizationList { get; set; }
        public virtual DbSet<tb_PostList> tb_PostList { get; set; }
        public virtual DbSet<tb_SubCategory> tb_SubCategory { get; set; }
        public virtual DbSet<tb_UserRegistration> tb_UserRegistration { get; set; }
    
        public virtual ObjectResult<postlist_Result> postlist(string action, Nullable<decimal> id, Nullable<decimal> blogCeteogryID)
        {
            var actionParameter = action != null ?
                new ObjectParameter("action", action) :
                new ObjectParameter("action", typeof(string));
    
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(decimal));
    
            var blogCeteogryIDParameter = blogCeteogryID.HasValue ?
                new ObjectParameter("blogCeteogryID", blogCeteogryID) :
                new ObjectParameter("blogCeteogryID", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<postlist_Result>("postlist", actionParameter, idParameter, blogCeteogryIDParameter);
        }
    
        public virtual ObjectResult<sp_Blogger_Result> sp_Blogger(string action)
        {
            var actionParameter = action != null ?
                new ObjectParameter("action", action) :
                new ObjectParameter("action", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_Blogger_Result>("sp_Blogger", actionParameter);
        }
    
        public virtual ObjectResult<sp_bloggerdiscription_Result> sp_bloggerdiscription(string action)
        {
            var actionParameter = action != null ?
                new ObjectParameter("action", action) :
                new ObjectParameter("action", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_bloggerdiscription_Result>("sp_bloggerdiscription", actionParameter);
        }
    
        public virtual ObjectResult<sp_BloggerView_Result> sp_BloggerView(string action, Nullable<decimal> org_Id)
        {
            var actionParameter = action != null ?
                new ObjectParameter("action", action) :
                new ObjectParameter("action", typeof(string));
    
            var org_IdParameter = org_Id.HasValue ?
                new ObjectParameter("Org_Id", org_Id) :
                new ObjectParameter("Org_Id", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_BloggerView_Result>("sp_BloggerView", actionParameter, org_IdParameter);
        }
    
        public virtual ObjectResult<sp_category_Result> sp_category(string action)
        {
            var actionParameter = action != null ?
                new ObjectParameter("action", action) :
                new ObjectParameter("action", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_category_Result>("sp_category", actionParameter);
        }
    
        public virtual ObjectResult<sp_Categoryview_Result> sp_Categoryview(string action)
        {
            var actionParameter = action != null ?
                new ObjectParameter("action", action) :
                new ObjectParameter("action", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_Categoryview_Result>("sp_Categoryview", actionParameter);
        }
    
        public virtual int sp_completeorder(string action)
        {
            var actionParameter = action != null ?
                new ObjectParameter("action", action) :
                new ObjectParameter("action", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_completeorder", actionParameter);
        }
    
        public virtual ObjectResult<sp_Countryfill_Result> sp_Countryfill(string action)
        {
            var actionParameter = action != null ?
                new ObjectParameter("action", action) :
                new ObjectParameter("action", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_Countryfill_Result>("sp_Countryfill", actionParameter);
        }
    
        public virtual ObjectResult<sp_Organization_Result> sp_Organization(string action)
        {
            var actionParameter = action != null ?
                new ObjectParameter("action", action) :
                new ObjectParameter("action", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_Organization_Result>("sp_Organization", actionParameter);
        }
    
        public virtual int sp_pendingorder(string action)
        {
            var actionParameter = action != null ?
                new ObjectParameter("action", action) :
                new ObjectParameter("action", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_pendingorder", actionParameter);
        }
    
        public virtual ObjectResult<sp_PostView_Result> sp_PostView(string action)
        {
            var actionParameter = action != null ?
                new ObjectParameter("action", action) :
                new ObjectParameter("action", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_PostView_Result>("sp_PostView", actionParameter);
        }
    
        public virtual ObjectResult<sp_subcategory_Result> sp_subcategory(string action)
        {
            var actionParameter = action != null ?
                new ObjectParameter("action", action) :
                new ObjectParameter("action", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_subcategory_Result>("sp_subcategory", actionParameter);
        }
    }
}
