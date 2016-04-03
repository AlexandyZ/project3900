using project3900.App_Code;
using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Windows.Forms;

public partial class game_return : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getSignedOutGame();
    }
    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        getSignedOutGame();
    }

    protected void GameReturn_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GameReturn_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void Return_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        DialogResult result = MessageBox.Show(new Form { TopMost = true }, "Are you sure to return the game?", "Confirmation", MessageBoxButtons.YesNo);

        if (e.CommandName == "Select")
        {
            if(result == DialogResult.Yes)
            {
                int rowIndex = Int32.Parse((e.CommandArgument).ToString());
                int gameID = Int32.Parse(GameReturn.DataKeys[rowIndex].Value.ToString());
                string constring = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;

                SqlConnection conn = new SqlConnection(constring);
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE game SET game_invent = game_invent + 1 WHERE game_id = '" + gameID + "'", conn);
                cmd.ExecuteNonQuery();

                SqlCommand cmd2 = new SqlCommand("UPDATE lend_game SET game_qty = game_qty - 1, greturn_date = '" + DateTime.Now.ToShortDateString() + "' WHERE game_id = '" + gameID + "'", conn);
                cmd2.ExecuteNonQuery();

                conn.Close();
                MessageBox.Show(new Form { TopMost = true }, "1 game returned!");
                Response.Redirect(Request.RawUrl);
            }
            else
            {

            }          
        }

    }
    private void getSignedOutGame()
    {
        List<SqlParameter> spParams = new List<SqlParameter>();
        spParams.Add(new SqlParameter("@gameName", searchText.Value));
        spParams.Add(new SqlParameter("@stdName", searchText.Value));
        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("GameReturnSearch", spParams.ToArray());
        GameReturn.DataSource = ds.Tables[0];
        GameReturn.DataBind();
    }
}