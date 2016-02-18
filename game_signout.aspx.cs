using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class game_signout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(constring))
        {
            conn.Open();
            SqlCommand myCommand = new SqlCommand("select [std_id] from student where student_id  = '" + stdidText.Text + "'; ", conn);

            using (SqlDataReader reader = myCommand.ExecuteReader())
            {
                while (reader.Read())
                {
                    SqlCommand cmd = new SqlCommand(@"INSERT INTO lend_game VALUES (@std_id, @game_id @glend_date)", conn);

                    cmd.Parameters.AddWithValue("@std_id", reader["std_id"]);
                    cmd.Parameters.AddWithValue("@game_id", 1);
                    cmd.Parameters.AddWithValue("@glend_date", DateTime.Now.ToShortDateString());

                    cmd.ExecuteNonQuery();  
                }
            }
            myCommand.ExecuteNonQuery();

            SqlCommand sc = new SqlCommand("UPDATE game SET game_amount = (SELECT game_amount from game WHERE game_id = @game_id) - '" + amountNum.Text + "' WHERE game_id = @game_id", conn);
            sc.Parameters.AddWithValue("@game_id", 1);
            sc.ExecuteNonQuery();
            
            conn.Close();
        }
        MessageBox.Show("Data Inserted");
        Response.Redirect("game_overview.aspx");
    }

    protected void stdidText_TextChanged(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(constring))
        {
            conn.Open();
            SqlCommand cmd2 = new SqlCommand("select std_id, student_id, student_phone, student_email, (select house_name from house h where h.house_id = s.house_id) AS house, (select room_name from room r where r.room_id = s.room_id) AS room from student s where student_id  = '" + stdidText.Text + "' ", conn);

            using (SqlDataReader reader = cmd2.ExecuteReader())
            {
                while (reader.Read())
                {
                    fnameText.Text = (reader["student_fname"].ToString());
                    lnameText.Text = (reader["student_lname"].ToString());
                    houseText.Text = (reader["house"].ToString());
                    roomText.Text = (reader["room"].ToString());
                    phoneText.Text = (reader["student_phone"].ToString());
                }
            }
            conn.Close();
        }
    }

    protected void lnameText_TextChanged(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(constring))
        {
            conn.Open();
            SqlCommand cmd2 = new SqlCommand("select std_id, student_id, student_phone, student_email, (select house_name from house h where h.house_id = s.house_id) AS house, (select room_name from room r where r.room_id = s.room_id) AS room from student s where student_fname  = '" + fnameText.Text + "' and student_lname = '" + lnameText.Text + "' ", conn);

            using (SqlDataReader reader = cmd2.ExecuteReader())
            {
                while (reader.Read())
                {
                    stdidText.Text = (reader["student_id"].ToString());
                    houseText.Text = (reader["house"].ToString());
                    roomText.Text = (reader["room"].ToString());
                    phoneText.Text = (reader["student_phone"].ToString());
                }
            }
            conn.Close();
        } 
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(constring))
        {
            conn.Open();
            SqlCommand cmd2 = new SqlCommand("select std_id, student_id, student_phone, student_email, (select house_name from house h where h.house_id = s.house_id) AS house, (select room_name from room r where r.room_id = s.room_id) AS room from student s where student_fname  = '" + fnameText.Text + "' and student_lname = '" + lnameText.Text + "' ", conn);

            using (SqlDataReader reader = cmd2.ExecuteReader())
            {
                while (reader.Read())
                {
                    stdidText.Text = (reader["student_id"].ToString());
                    houseText.Text = (reader["house"].ToString());
                    roomText.Text = (reader["room"].ToString());
                    phoneText.Text = (reader["student_phone"].ToString());
                }
            }
            conn.Close();
        }
    }
}