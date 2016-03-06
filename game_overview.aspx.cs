using project3900.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class game_overview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*List<SqlParameter> spParams = new List<SqlParameter>();
        spParams.Add(new SqlParameter("@GameName", searchText.Value));
        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("GameOverviewByGameName", spParams.ToArray());
        GameGridView.DataSource = ds.Tables[0];
        GameGridView.DataBind();*/
    }

    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        /*List<SqlParameter> spParams = new List<SqlParameter>();
        spParams.Add(new SqlParameter("@GameName", searchText.Value));*/
        SqlParameter spParams = new SqlParameter("@GameName", searchText.Value);

        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("GameOverviewByGameName", spParams);

        GameGridView.DataSource = ds.Tables[0];
        GameGridView.DataBind();
    }
    protected void GameGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        /*if (((Button)e.Row.Cells[1].Controls[0]).Text == "0")
        {
            ((Button)e.Row.Cells[2].Controls[0]).Enabled = false;
        }
        else
        {
            Response.Redirect("game_signout.aspx");
        }*/
    }

    protected void GameGridView_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Signout_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {

            int rowIndex = Int32.Parse((e.CommandArgument).ToString());
            int gameID = Int32.Parse(GameGridView.DataKeys[rowIndex].Value.ToString());
            
            Response.Redirect("game_signout.aspx?" + gameID);
        }
    }
}