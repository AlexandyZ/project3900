using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Windows.Forms;

public partial class game_signout : System.Web.UI.Page
{
    string constring = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        stdidText.TextChanged += new EventHandler(StdId_onTextChanged);

        SqlConnection conn = new SqlConnection(constring);
        conn.Open();

        int gameID = Int32.Parse(Request.QueryString.ToString());
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
        SqlConnection conn = new SqlConnection(constring);
        conn.Open();

        int gameID = Int32.Parse(Request.QueryString.ToString());
        SqlCommand cmd = new SqlCommand("SELECT game_invent FROM game WHERE game_id = '" + gameID + "'", conn);       
        int inv = int.Parse(Convert.ToString(cmd.ExecuteScalar()));

        if (string.IsNullOrWhiteSpace(amountNum.Text))
        {
            validateQTY.Text = "Please enter a number";
        }
        else if (!Regex.IsMatch(amountNum.Text, @"^\d?[1-9]\d{0,2}$"))
        {
            validateQTY.Text = "This cannot be a negative number or zero";
        }
        else if(inv >= int.Parse(amountNum.Text))
        {
            SqlCommand sqlcmd = new SqlCommand("SELECT 1 FROM student WHERE student_id = @studentID", conn);
            sqlcmd.Parameters.AddWithValue("@studentID", stdidText.Text);
            SqlDataReader rd = sqlcmd.ExecuteReader();
            if(rd.Read())
            {
                SqlCommand cmd2 = new SqlCommand("INSERT INTO lend_game VALUES((SELECT std_id FROM student WHERE student_id  = @stdId), '" + gameID + "', '" + DateTime.Now.ToShortDateString() + "', NULL, @gameQTY)", conn);
                cmd2.Parameters.AddWithValue("@stdId", stdidText.Text);
                cmd2.Parameters.AddWithValue("@gameQTY", amountNum.Text);
                cmd2.ExecuteNonQuery();

                SqlCommand sc = new SqlCommand("UPDATE game SET game_invent = (SELECT game_invent from game WHERE game_id = '" + gameID + "') - @gameQTY WHERE game_id = '" + gameID + "'", conn);
                sc.Parameters.AddWithValue("@gameQTY", amountNum.Text);
                sc.ExecuteNonQuery();

                conn.Close();

                validateQTY.Text = "";
                MessageBox.Show(new Form { TopMost = true }, "Game signed out!");
                Response.Redirect("game_list.aspx");
            }
            else
            {
                validateStdID.Text = "This student ID doesn't exist, please check it";
            }
        }
        else
        {
            validateQTY.Text = "Only have " + inv + " game(s) left...";
        }
        conn.Close();        
    }

    protected void StdId_onTextChanged(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(constring);
        conn.Open();
        SqlCommand sqlcmd = new SqlCommand("SELECT 1 FROM student WHERE student_id = @studentID", conn);
        sqlcmd.Parameters.AddWithValue("@studentID", stdidText.Text);
        SqlDataReader rd = sqlcmd.ExecuteReader();
        Regex r = new Regex(@"^[aA'.\s]{1}(\d{8})$");
        if (string.IsNullOrWhiteSpace(stdidText.Text))
        {
            validateStdID.Text = "Please enter a student ID";
        }
        else if (!r.IsMatch(stdidText.Text))
        {
            validateStdID.Text =  "Wrong Student ID format! hint: A00123456";
        }
        else if (!rd.Read())
        {
            validateStdID.Text = "This student ID doesn't exist, please check it.";
        }
        else
        {
            validateStdID.Text = "";
        }
        conn.Close();
    }
}