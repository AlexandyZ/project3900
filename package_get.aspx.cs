﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class key_addnew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Calendar1.Visible = false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        if (Calendar1.Visible)
        {
            Calendar1.Visible = false;
        }
        else
        {
            Calendar1.Visible = true;
        }

        /*if (TextDate.Text != string.Empty)
            Calendar1.SelectedDate = Convert.ToDateTime(TextDate.Text);

        Calendar1.Visible = true;
        */
    }


    /*protected void TextDate_TextChanged(object sender, EventArgs e)
    {
        DateTime curDate = DateTime.Now;
        if (DateTime.TryParse(TextDate.Text, out curDate))
        {
            Calendar1.SelectedDate = Convert.ToDateTime(TextDate.Text);
        }
    }*/

    // show selected date in the devlivery date textbox.
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        DelDate.Text = Calendar1.SelectedDate.ToShortDateString();

        Calendar1.Visible = false;
    }

    // insert package record into tables: package(delivery_date, description) & student(std_id).
    protected void Add_Click(object sender, EventArgs e)
    {
        string connection = "Data Source = ant-comp3900.database.windows.net; Initial Catalog = RMS;  MultipleActiveResultSets=true; User ID = ant; Password = Tna12345";
      
        using (SqlConnection conn = new SqlConnection(connection))
        {
            conn.Open();
            SqlCommand myCommand = new SqlCommand("select [std_id] from student where student_fname  = '" + firstname.Text + "' and student_lname = '" + lastname.Text + "'; ", conn);

            using (SqlDataReader reader = myCommand.ExecuteReader())
            {
                while (reader.Read())
                {
                    //int @std_id = Convert.ToInt32(reader["std_id"]);

                    SqlCommand cmd = new SqlCommand(@"INSERT INTO package(std_id, delivery_date, description) VALUES (@std_id, @delivery_date, @description)", conn);

                    cmd.Parameters.AddWithValue("@std_id", reader["std_id"]);
                    cmd.Parameters.AddWithValue("@delivery_date", DelDate.Text);
                    cmd.Parameters.AddWithValue("@description", Des.Text);



                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Data Inserted");
                    Response.Redirect(Request.RawUrl);
                    //reader.Close();
                    //yield return reader;
                }
            }
            myCommand.ExecuteNonQuery();
            conn.Close();
        }
    }



    // show phone and email based on inputting the firstname and lastname
    protected void RoomID_SelectedIndexChanged(object sender, EventArgs e)
    {
        string constring = "Data Source = ant-comp3900.database.windows.net; Initial Catalog = RMS; User ID = ant; Password = Tna12345";

        using (SqlConnection conn = new SqlConnection(constring))
        {
            conn.Open();
            SqlCommand cmd2 = new SqlCommand("select std_id, student_phone, student_email from student where student_fname  = '" + firstname.Text + "' and student_lname = '" + lastname.Text + "' ", conn);

            using (SqlDataReader reader = cmd2.ExecuteReader())
            {
                while (reader.Read())
                {
                    Phone.Text = (reader["student_phone"].ToString());
                    Email.Text = (reader["student_email"].ToString());
                }
            }
            conn.Close();
        }
    }
}