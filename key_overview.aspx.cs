using project3900.App_Code;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Configuration;

public partial class key_overview : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)

    {

        List<SqlParameter> spParams = new List<SqlParameter>();
        spParams.Add(new SqlParameter("@KeyName", searchbar.Text));

        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("KeysOverview_GetByName", spParams.ToArray());

        SearchResult.DataSource = ds.Tables[0];
        SearchResult.DataBind();
    }


    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        List<SqlParameter> spParams = new List<SqlParameter>();
        spParams.Add(new SqlParameter("@KeyName", searchbar.Text));

        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("KeysOverview_GetByName", spParams.ToArray());

        SearchResult.DataSource = ds.Tables[0];
        SearchResult.DataBind();
    }

    

     public void Button_click_event(object sender, GridViewCommandEventArgs e)
         {
        DialogResult result = MessageBox.Show("Are you sure to return a key?", "Confirmation", MessageBoxButtons.YesNo);
        if ( e.CommandName == "ReturnKey")
        {
            string constring = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(constring);
            conn.Open();
            int rowIndex = Int32.Parse((e.CommandArgument).ToString());
            int keys_id = Int32.Parse(SearchResult.DataKeys[rowIndex].Value.ToString());
            SqlCommand cmd = new SqlCommand("update lend_key set keyreturn_date = @return_date where keys_id = '" + keys_id + "'", conn);
            string test = DateTime.Now.ToString();

            cmd.Parameters.AddWithValue("@return_date", DateTime.Now.ToString());
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect(Request.RawUrl);
        }
        else if (result == DialogResult.No)
        {
            //...
        }

    }


}
