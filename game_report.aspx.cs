using project3900.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

public partial class game_report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getGame();
    }

    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        getGame();
    }
    private void getGame()
    {
        List<SqlParameter> spParams = new List<SqlParameter>();
        spParams.Add(new SqlParameter("@gameName", searchText.Value));
        spParams.Add(new SqlParameter("@stdName", searchText.Value));
        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("GameReportSearch", spParams.ToArray());
        GameGridView.DataSource = ds.Tables[0];
        GameGridView.DataBind();
    }
}