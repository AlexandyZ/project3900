﻿using project3900.App_Code;
using System;
using System.Collections.Generic;
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
        string constr = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand("SELECT game_invent FROM game WHERE game_name = @gameName",conn);
            cmd.Parameters.AddWithValue("@gameName", gameText.Text);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (string.IsNullOrWhiteSpace(qtyText.Text))
            {
                string msg1 = "Required";
                validateQTY.Text = msg1;
            }
            else
            {
                if (rd.Read())
                {
                    SqlCommand cmd1 = new SqlCommand("UPDATE game SET game_invent = game_invent + @gameInvent,game_status = 1 WHERE game_name = @gameName", conn);
                    cmd1.Parameters.AddWithValue("@gameName", gameText.Text);
                    cmd1.Parameters.AddWithValue("@gameInvent", qtyText.Text);
                    cmd1.ExecuteNonQuery();
                }
                else
                {
                    SqlCommand cmd1 = new SqlCommand("INSERT INTO game VALUES (@game_name,@game_invent,1)", conn);
                    cmd1.Parameters.AddWithValue("@game_name", gameText.Text);
                    cmd1.Parameters.AddWithValue("@game_invent", qtyText.Text);
                    cmd1.ExecuteNonQuery();
                }
                rd.Close();
                conn.Close();
            }

            string msg = qtyText.Text + " of " + gameText.Text + " added!";
            MessageBox.Show(new Form { TopMost = true }, msg);
            //Response.Write("<script>alert('abc')</script>");
            Response.Redirect("game_list.aspx");
        }
    }

    protected void deleteSubmit_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand("SELECT game_invent FROM game WHERE game_name = @gameName", conn);
            cmd.Parameters.AddWithValue("@gameName", gameText.Text);
            conn.Open();
            int inv = int.Parse(Convert.ToString(cmd.ExecuteScalar()));
            if (inv == int.Parse(qtyText.Text))
            {
                SqlCommand cmd0 = new SqlCommand("SELECT 1 FROM lend_game lg INNER JOIN game g ON lg.game_id = g.game_id WHERE lg.game_name = @gameName AND greturn_date is null", conn);
                cmd0.Parameters.AddWithValue("@gameName", gameText.Text);
                SqlDataReader rd = cmd0.ExecuteReader();

                if (rd.Read())
                {
                    SqlCommand cmd1 = new SqlCommand("UPDATE game SET game_invent = 0 WHERE game_name = @gameName", conn);
                    cmd1.Parameters.AddWithValue("@gameName", gameText.Text);
                    cmd1.ExecuteNonQuery();

                    string msg = qtyText.Text + " of " + gameText.Text + " deleted!";
                    MessageBox.Show(new Form { TopMost = true }, msg);
                }
                else
                {
                    SqlCommand cmd1 = new SqlCommand("UPDATE game SET game_invent = 0, game_status = 0 WHERE game_name = @gameName", conn);
                    cmd1.Parameters.AddWithValue("@gameName", gameText.Text);
                    cmd1.ExecuteNonQuery();

                    string msg = gameText.Text + " deleted!";
                    MessageBox.Show(new Form { TopMost = true }, msg);
                }
                Response.Redirect("game_list.aspx");
            }
            else if (inv > int.Parse(qtyText.Text))
            {
                SqlCommand cmd1 = new SqlCommand("UPDATE game SET game_invent = game_invent - @gameInvent WHERE game_name = @gameName", conn);
                cmd1.Parameters.AddWithValue("@gameName", gameText.Text);
                cmd1.Parameters.AddWithValue("@gameInvent", qtyText.Text);
                cmd1.ExecuteNonQuery();

                string msg = qtyText.Text + " of " + gameText.Text + " deleted!";
                MessageBox.Show(new Form { TopMost = true }, msg);
                Response.Redirect("game_list.aspx");
            }
            else
            {
                string msg = "Only have " + inv + " game(s) left...";
                validateQTY.Text = msg;
            }
            conn.Close();
        }
    }
}