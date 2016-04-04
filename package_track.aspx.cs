using project3900.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Configuration;

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
    }

    // show selected date in the devlivery date textbox.
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        DelDate.Text = Calendar1.SelectedDate.ToShortDateString();

        Calendar1.Visible = false;
    }

    // can not choose future day from calendar
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date > DateTime.Today)
        {
            e.Day.IsSelectable = false;
        }
    }

    // show phone and email based on information input
    protected void RoomID_SelectedIndexChanged(object sender, EventArgs e)
    {
        string connection = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connection))
        {
            conn.Open();
            SqlCommand cmd2 = new SqlCommand("select std_id, student_phone, student_email from student where student_fname  = '" + firstname.Text + "' and student_lname = '" + lastname.Text + "'and house_id = '" + HouseID.Text + "'and room_id='" + RoomID.Text + "';", conn);

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

    // insert package record into tables: package(delivery_date, description) & student(std_id).
    protected void Add_Click(object sender, EventArgs e)
    {

        DialogResult result = MessageBox.Show(new Form { TopMost = true }, "Are you sure to insert this package?", "Confirmation", MessageBoxButtons.YesNo);
        if (result == DialogResult.Yes)
        {
            string connection = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connection))
                {
                    conn.Open();
                    SqlCommand myCommand = new SqlCommand("select [std_id] from student where student_fname  = '" + firstname.Text + "' and student_lname = '" + lastname.Text + "'; ", conn);

                    using (SqlDataReader reader = myCommand.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            SqlCommand cmd = new SqlCommand(@"INSERT INTO package(std_id, delivery_date, descript) VALUES (@std_id, @delivery_date, @description)", conn);

                            cmd.Parameters.AddWithValue("@std_id", reader["std_id"]);
                            cmd.Parameters.AddWithValue("@delivery_date", DelDate.Text);
                            cmd.Parameters.AddWithValue("@description", Des.Text);
                            cmd.ExecuteNonQuery();
                            Response.Redirect("package_pickup.aspx");
                        }
                    }
                    myCommand.ExecuteNonQuery();
                    conn.Close();
                }
        List<SqlParameter> spParams1 = new List<SqlParameter>();
        spParams1.Add(new SqlParameter("@FirstName", firstname.Text));
        spParams1.Add(new SqlParameter("@LastName", lastname.Text));

        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("Ckeck_StudentName2", spParams1.ToArray());
        if (ds.Tables[0].Rows.Count == 0)
        {
            MessageBox.Show(new Form { TopMost = true }, "This student does not exist in the database system \n Please insert a student again");
            Response.Redirect(Request.RawUrl);

        } else {

                
                MessageBox.Show(new Form { TopMost = true }, "This student does not exist in the database system \n Please insert a student again");
                Response.Redirect(Request.RawUrl);
          
            }
        }



        else if (result == DialogResult.No)
        {

            Response.Redirect(Request.RawUrl);
        }

    }

    protected void Cancel_Click(object sender, EventArgs e)
    {
        firstname.Text = String.Empty;
        lastname.Text = String.Empty;
        HouseID.Text = String.Empty;
        RoomID.Text = String.Empty;
        Phone.Text = String.Empty;
        Email.Text = String.Empty;
        DelDate.Text = String.Empty;
        Des.Text = String.Empty;
        Response.Redirect(Request.RawUrl);
    }
}