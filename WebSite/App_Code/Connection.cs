using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Connection
/// </summary>
namespace BlogPost
{
    public class connection
    {
        //  public SqlConnection cn = new SqlConnection(@"Data Source=MAA-PC;Initial Catalog=db_Rajputbooks;Integrated Security=True");
        //public SqlConnection cn = new SqlConnection(@"Data Source=192.95.6.215,1470;Initial Catalog=db_rajputbook;User ID=rajputbook;Password=sPc2$e98");
        public SqlConnection cn = new SqlConnection(@"Data Source = EPINHYDW1026\SQLEXPRESS;Initial Catalog = db_rajputbook; Integrated Security = True");
    }
}