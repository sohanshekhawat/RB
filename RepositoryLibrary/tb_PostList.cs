//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class tb_PostList
    {
        public decimal Post_id { get; set; }
        public string PostTitle { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
        public Nullable<bool> Active { get; set; }
        public Nullable<decimal> Organization_id { get; set; }
        public Nullable<decimal> Category_id { get; set; }
        public Nullable<decimal> Blogger_id { get; set; }
        public string PostContent { get; set; }
        public Nullable<System.DateTime> EntryDate { get; set; }
        public string Status { get; set; }
        public string Reason { get; set; }
        public Nullable<decimal> Sub_cat_id { get; set; }
        public string Image { get; set; }
    }
}
