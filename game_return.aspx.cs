﻿using project3900.App_Code;
using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Configuration;

public partial class game_return : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    /*protected void searchButton_Click(object sender, EventArgs e)
    {
        List<SqlParameter> sp = new List<SqlParameter>();
        sp.Add(new SqlParameter("@gameName", searchText.Text));
        sp.Add(new SqlParameter("@stdfName", searchText.Text));
        sp.Add(new SqlParameter("@stdlName", searchText.Text));
        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("Game_getSearchResult", sp.ToArray());

        GameReturn.DataSource = ds.Tables[0];
        GameReturn.DataBind();
    }*/

    protected void GameReturn_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GameReturn_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void Return_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {

            int rowIndex = Int32.Parse((e.CommandArgument).ToString());
            int gameID = Int32.Parse(GameReturn.DataKeys[rowIndex].Value.ToString());
            string constring = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(constring);
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE game SET game_invent = game_invent + 1 WHERE game_id = '" + gameID + "'", conn);
            cmd.ExecuteNonQuery();

            //SqlCommand cmd2 = new SqlCommand("UPDATE lend_game SET game_qty = game_qty - 1, greturn_date = '" + DateTime.Now.ToShortDateString() + "' WHERE game_id = '" + gameID + "')", conn);
            //cmd2.ExecuteNonQuery();

            conn.Close();
            Response.Redirect("game_overview.aspx");
        }
    }
}