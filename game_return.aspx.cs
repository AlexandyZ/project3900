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

public partial class game_return : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void searchButton_Click(object sender, EventArgs e)
    {
        List<SqlParameter> sp = new List<SqlParameter>();
        sp.Add(new SqlParameter("@gameName", searchText.Text));
        sp.Add(new SqlParameter("@stdfName", searchText.Text));
        sp.Add(new SqlParameter("@stdlName", searchText.Text));
        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("Game_getSearchResult", sp.ToArray());

        GameSearch.DataSource = ds.Tables[0];
        GameSearch.DataBind();
    }
}