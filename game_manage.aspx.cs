using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class game_manage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void addSubmit_Click(object sender, EventArgs e)
    {
        string con = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(con))
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO game VALUES (@game_name,@game_invent)");
            cmd.Connection = conn;


            cmd.Parameters.AddWithValue("@game_name", gameText.Text);
            cmd.Parameters.AddWithValue("@game_invent", qtyText.Text);

            conn.Open();

            cmd.ExecuteNonQuery();
            string msg = qtyText.Text + " " + gameText.Text + " added!";
            MessageBox.Show(msg);
            Response.Redirect("game_overview.aspx");
        }
    }

    /*protected void deleteSubmit_Click(object sender, EventArgs e)
    {
        string con = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(con))
        {
            SqlCommand cmd = new SqlCommand("UPDATE game SET game_invent = game_invent - @game_invent WHERE game_name = @game_name");
            cmd.Connection = conn;


            cmd.Parameters.AddWithValue("@game_name", gameText.Text);
            cmd.Parameters.AddWithValue("@game_invent", qtyText.Text);

            conn.Open();

            cmd.ExecuteNonQuery();
            MessageBox.Show("Game deleted..."); //show more information here : game name and qty.
            Response.Redirect("game_overview.aspx");
        }
    }*/
}