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

public partial class key_addnew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<SqlParameter> spParams = new List<SqlParameter>();
        spParams.Add(new SqlParameter("@StudentName", searchbar.Value));
        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("Package_Search", spParams.ToArray());
        SearchResult.DataSource = ds.Tables[0];
        SearchResult.DataBind();
    }
    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        List<SqlParameter> spParams = new List<SqlParameter>();
        spParams.Add(new SqlParameter("@StudentName", searchbar.Value));
        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("Package_Search", spParams.ToArray());
        SearchResult.DataSource = ds.Tables[0];
        SearchResult.DataBind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        DialogResult result = MessageBox.Show("Are you sure to pick up this package?", "Confirmation", MessageBoxButtons.YesNo);
        if (result == DialogResult.Yes && e.CommandName == "select")
        {
            int rowIndex = Int32.Parse((e.CommandArgument).ToString());
            int package_id = Int32.Parse(SearchResult.DataKeys[rowIndex].Value.ToString());

            string constring = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(constring);
            conn.Open();

            SqlCommand cmd = new SqlCommand("update package set pickup_date = @pickup_date where package_id = '" + package_id + "'", conn);
            cmd.Parameters.AddWithValue("@pickup_date", DateTime.Today.ToShortDateString());
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect(Request.RawUrl);
        } else if (result == DialogResult.No)
        {
            //...
        }
    }

}