using System;
using System.Web.UI.WebControls;

public partial class game_overview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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