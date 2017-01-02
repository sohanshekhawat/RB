using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RepositoryCollection
/// </summary>
public class RepositoryCollection
{
    private MasterDataRepo masterDataRepo;
    private BloggerRepo bloggerRepo;
    private PostRepo postRepo;
    private OrgRepo orgRepo;

    private static readonly RepositoryCollection instance = new RepositoryCollection();

    public static RepositoryCollection Instance
    {
        get
        {
            return instance;
        }
    }

    public BlogPostDataClassesDataContext dbobj;

    private RepositoryCollection()
    {
        SqlConnection cn = new SqlConnection(@"Data Source = EPINHYDW1026\SQLEXPRESS;Initial Catalog = db_rajputbook; Integrated Security = True");
        dbobj = new BlogPostDataClassesDataContext(cn);

        masterDataRepo = new MasterDataRepo(dbobj);
        bloggerRepo = new BloggerRepo(dbobj);
        postRepo = new PostRepo(dbobj);
        orgRepo = new OrgRepo(dbobj);
    }

    public MasterDataRepo MasterDataRepo { get { return masterDataRepo; } }
    public BloggerRepo BloggerRepo { get { return bloggerRepo; } }
    public PostRepo PostRepo { get { return postRepo; } }
    public OrgRepo OrgRepo { get { return orgRepo; } }
}