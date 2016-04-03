﻿using System;
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

        if (string.IsNullOrWhiteSpace(stdidText.Text))
        {
            string msg1 = "Required";
            validateStdID.Text = msg1;
        }
        else
        {
            SqlCommand sqlcmd = new SqlCommand("SELECT 1 FROM student WHERE student_id = @studentID", conn);
            sqlcmd.Parameters.AddWithValue("@studentID", stdidText.Text);
            SqlDataReader rd = sqlcmd.ExecuteReader();
            if(rd.Read())
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO lend_game VALUES((SELECT std_id FROM student WHERE student_id  = @stdId), '" + gameID + "', '" + DateTime.Now.ToShortDateString() + "', NULL, @gameQTY)", conn);
                cmd.Parameters.AddWithValue("@stdId", stdidText.Text);
                cmd.Parameters.AddWithValue("@gameQTY", amountNum.Text);
                cmd.ExecuteNonQuery();

                SqlCommand sc = new SqlCommand("UPDATE game SET game_invent = (SELECT game_invent from game WHERE game_id = '" + gameID + "') - @gameQTY WHERE game_id = '" + gameID + "'", conn);
                sc.Parameters.AddWithValue("@gameQTY", amountNum.Text);
                sc.ExecuteNonQuery();

                conn.Close();

                MessageBox.Show(new Form { TopMost = true }, "Game signed out!");
                Response.Redirect("game_list.aspx");
            }
            else
            {
                string msg = "This student ID doesn't exist, please check it.";
                validateStdID.Text = msg;
            }
        }

        
    }

}