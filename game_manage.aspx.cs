using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using project3900.App_Code;
using System.Data.SqlClient;

public partial class game_manage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void addSubmit_Click(object sender, EventArgs e)
    {
        List<SqlParameter> sp = new List<SqlParameter>();
        sp.Add(new SqlParameter("@gameName", gameText.Text));
        sp.Add(new SqlParameter("@gameInven", amoutText.Text));

        DBHelper.ExecuteNonQueryBySPName("Game_Insert", sp.ToArray());

        Response.Write("<script>alert('Game added... ;-)');window.location='game_overview.aspx'</script>");
        Response.Redirect(Request.RawUrl);
    }
}