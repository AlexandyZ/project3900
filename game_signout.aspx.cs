using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class game_signout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;
        int gameID = Int32.Parse(Request.QueryString.ToString());
        SqlConnection conn = new SqlConnection(constring);
        conn.Open();

        SqlCommand cmd = new SqlCommand("select game_name from game where game_id  = '"+ gameID+ "'", conn);
        using (SqlDataReader reader = cmd.ExecuteReader())
        {
            while (reader.Read())
            {
                gamename.Text = (reader["game_name"].ToString());
            }
        }
        conn.Close();
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;
        int gameID = Int32.Parse(Request.QueryString.ToString());

        SqlConnection conn = new SqlConnection(constring);
        conn.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO lend_game VALUES((SELECT std_id FROM student WHERE student_id  = @stdId), '" +gameID+ "', '" +DateTime.Now.ToShortDateString()+ "', NULL, @gameQTY)", conn);
        cmd.Parameters.AddWithValue("@stdId", stdidText.Text);
        cmd.Parameters.AddWithValue("@gameQTY", amountNum.Text);
        cmd.ExecuteNonQuery();

        SqlCommand sc = new SqlCommand("UPDATE game SET game_invent = (SELECT game_invent from game WHERE game_id = '" + gameID + "') - @gameQTY WHERE game_id = '"+gameID+"'", conn);
        sc.ExecuteNonQuery();

        conn.Close();

        /*using (SqlConnection conn = new SqlConnection(constring))
        {
            conn.Open();
            SqlCommand myCommand = new SqlCommand("select std_id from student where student_id  = '" + stdidText.Text + "'; ", conn);

            using (SqlDataReader reader = myCommand.ExecuteReader())
            {
                while (reader.Read())
                {
                    SqlCommand cmd = new SqlCommand(@"INSERT INTO lend_game VALUES (@std_id, '"+gameID+"', @glend_date)", conn);

                    cmd.Parameters.AddWithValue("@std_id", reader["std_id"]);
                    cmd.Parameters.AddWithValue("@game_id", gameID);
                    cmd.Parameters.AddWithValue("@glend_date", DateTime.Now.ToShortDateString());

                    cmd.ExecuteNonQuery();  
                }
            }
            myCommand.ExecuteNonQuery();

            SqlCommand sc = new SqlCommand("UPDATE game SET game_invent = (SELECT game_amount from game WHERE game_id = '"+gameID+"') - '" + amountNum.Text + "' WHERE game_id = @game_id", conn);
            sc.Parameters.AddWithValue("@game_id", 1);
            sc.ExecuteNonQuery();
            
            conn.Close();
        }
        */
        MessageBox.Show("Sign out the game...");
        Response.Redirect("game_list.aspx");
    }

}