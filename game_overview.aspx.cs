using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class game_overview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void searchText_TextChanged(object sender, EventArgs e)
    {

    }

    protected void searchButton_Click(object sender, EventArgs e)
    {
        Session["searchKeyWord"] = searchText.Text;
    }

    protected void GameGridView_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}