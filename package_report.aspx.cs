using project3900.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
public partial class package_report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        List<SqlParameter> spParams = new List<SqlParameter>();
        spParams.Add(new SqlParameter("@StudentName", searchbar.Value));
        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("package_report", spParams.ToArray());
        SearchResult.DataSource = ds.Tables[0];
        SearchResult.DataBind();

    }

    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        List<SqlParameter> spParams = new List<SqlParameter>();
        spParams.Add(new SqlParameter("@StudentName", searchbar.Value));
        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("package_report", spParams.ToArray());
        SearchResult.DataSource = ds.Tables[0];
        SearchResult.DataBind();
    }
}