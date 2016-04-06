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

    string searchstr = "";
    protected void Page_Load(object sender, EventArgs e)

    {
        if (!IsPostBack) {
            List<SqlParameter> spParams = new List<SqlParameter>();
            spParams.Add(new SqlParameter("@KeyName", searchstr));

            DataSet ds = new DataSet();
            ds = DBHelper.ExecuteBySPName("KeysOverview_GetByName", spParams.ToArray());

            SearchResult.DataSource = ds.Tables[0];
            SearchResult.DataBind();
        }
    }


    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        searchstr = searchbar.Value;
        List <SqlParameter> spParams = new List<SqlParameter>();
        spParams.Add(new SqlParameter("@KeyName", searchstr));

        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("KeysOverview_GetByName", spParams.ToArray());

        SearchResult.DataSource = ds.Tables[0];
        SearchResult.DataBind();
    }

    

     public void Button_click_event(object sender, GridViewCommandEventArgs e)
         {
     
        DialogResult result = MessageBox.Show(new Form { TopMost = true }, "Are you sure to return a key?", "Confirmation", MessageBoxButtons.YesNo);
        if (result == DialogResult.Yes && e.CommandName == "ReturnKey" )
        {
            string constring = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(constring);
            conn.Open();
            //int index = SearchResult.SelectedIndex;
          
            int rowIndex = Int32.Parse((e.CommandArgument).ToString());
            //string rowIndex1 = e.CommandArgument.ToString();
            int keys_id = Int32.Parse(SearchResult.DataKeys[rowIndex].Value.ToString());
            //string fullName = "ninew mai";
            // string fullName = (string)this.SearchResult.DataKeys[rowIndex]["ReturnKey"];
            //string fullName = SearchResult.DataKeys[rowIndex]["Name"].ToString();
           // string fullName = (string)this.SearchResult.DataKeys[rowIndex].Value.ToString();
            // string fullName = SearchResult.DataKeys[rowIndex].Value.GetType().ToString();
            //string fullName = SearchResult.DataKeys[rowIndex].Values[1].ToString();
            //string fullName = SearchResult.DataKeys[SearchResult.SelectedIndex].Values[1].ToString();
            //string fullName = fullName1;
           // string[] value = fullName.Split(' ');
           // string firstName = value[0];
           // string lastName = value[1];
            //string sqlString = String.Format("UPDATE lk SET lk.keyreturn_date = GETDATE() FROM lend_key lk JOIN worker w ON w.worker_id = lk.worker_id WHERE lk.keyreturn_date IS NULL AND lk.keys_id = {0} AND w.worker_fname = '{1}' AND w.worker_lname = '{2}'", keys_id.ToString(), firstName, lastName);

            string sqlString = String.Format("UPDATE lk SET lk.keyreturn_date = GETDATE() FROM lend_key lk JOIN worker w ON w.worker_id = lk.worker_id WHERE lk.keyreturn_date IS NULL AND lk.keys_id = {0}", keys_id.ToString());
            SqlCommand cmd = new SqlCommand(sqlString , conn);


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
