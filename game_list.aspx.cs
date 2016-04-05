using project3900.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class game_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getGame();
    }

    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        getGame();
    }
    protected void GameGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.Cells[1].Text == "0")
        {
            ((Button)e.Row.Cells[2].Controls[0]).Enabled = false;
        }
    }

    protected void GameGridView_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Signout_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {

            int rowIndex = Int32.Parse((e.CommandArgument).ToString());
            int gameID = Int32.Parse(GameListView.DataKeys[rowIndex].Value.ToString());
            Response.Redirect("game_signout.aspx?" + gameID);
            //string a = GameView.Rows[rowIndex].Cells[1].Text;
            //Label1.Text = a.ToString();
        }
    }
    private void getGame()
    {
        List<SqlParameter> spParams = new List<SqlParameter>();
        spParams.Add(new SqlParameter("@GameName", searchText.Text));
        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("GameOverviewByGameName", spParams.ToArray());
        GameListView.DataSource = ds.Tables[0];
        GameListView.DataBind();
    }
}