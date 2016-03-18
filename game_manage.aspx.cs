using project3900.App_Code;
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
            if (rd.Read())
            {
                SqlCommand cmd1 = new SqlCommand("UPDATE game SET game_invent = game_invent + @gameInvent WHERE game_name = @gameName", conn);
                cmd1.Parameters.AddWithValue("@gameName", gameText.Text);
                cmd1.Parameters.AddWithValue("@gameInvent", qtyText.Text);
                cmd1.ExecuteNonQuery();
            }
            else
            {
                SqlCommand cmd1 = new SqlCommand("INSERT INTO game VALUES (@game_name,@game_invent)", conn);
                cmd1.Parameters.AddWithValue("@game_name", gameText.Text);
                cmd1.Parameters.AddWithValue("@game_invent", qtyText.Text);
                cmd1.ExecuteNonQuery();
            }
            rd.Close();
            conn.Close();
            
            string msg = qtyText.Text + " " + gameText.Text + " added!";
            MessageBox.Show(msg);
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
            string inv = Convert.ToString(cmd.ExecuteScalar());
            if (inv == qtyText.Text || qtyText.Text == null)
            {
                SqlCommand cmd1 = new SqlCommand("DELETE FROM game WHERE game_name = @gameName", conn);
                cmd1.Parameters.AddWithValue("@gameName", gameText.Text);
                cmd1.ExecuteNonQuery();

                //string msg = qtyText.Text + " " + gameText.Text + " added!";
                //MessageBox.Show(msg);
                //Response.Redirect("game_list.aspx");
            }
            else if(int.Parse(inv) > int.Parse(qtyText.Text))
            {
                SqlCommand cmd1 = new SqlCommand("UPDATE game SET game_invent = game_invent - @gameInvent WHERE game_name = @gameName", conn);
                cmd1.Parameters.AddWithValue("@game_name", gameText.Text);
                cmd1.Parameters.AddWithValue("@game_invent", qtyText.Text);
                cmd1.ExecuteNonQuery();

                //string msg = qtyText.Text + " " + gameText.Text + " added!";
                //MessageBox.Show(msg);
                //Response.Redirect("game_list.aspx");
            }
            else
            {
                string msg = "Invalid input! The number should less or equal than inventory.";
                validateQTY.Text = msg;
            }
            conn.Close();
        }
    }
}