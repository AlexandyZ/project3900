using System;
using System.Windows;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class key_lend : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void submit_Click(object sender, EventArgs e)
    {
        string connection = "Data Source = ant-comp3900.database.windows.net;Initial Catalog=RMS;User ID=ant;Password=Tna12345";

        using (SqlConnection conn = new SqlConnection(connection))
        {

        
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO worker (comp_id,worker_fname,worker_lname)VALUES (@worker_fname, @worker_lname,@comp_id)");
            cmd.Connection = conn;
           
            cmd.Parameters.AddWithValue("@worker_fname", fnfield.Text);
            cmd.Parameters.AddWithValue("@worker_lname", lnfield.Text);
            cmd.Parameters.AddWithValue("@comp_id", DropDownList1.Text);

            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            /**/
            SqlCommand cmd1 = new SqlCommand("INSERT INTO company (comp_name, comp_phone)VALUES (@comp_name,@phone)");
            cmd1.Connection = conn;

            cmd1.Parameters.AddWithValue("@phone", phonefield.Text);
            cmd1.Parameters.AddWithValue("@comp_name", DropDownList1.Text);

            cmd1.ExecuteNonQuery();
            cmd1.Parameters.Clear();
            /**/
            SqlCommand cmd2 = new SqlCommand("INSERT INTO keys (keys_name)VALUES (@key_name)");
            cmd2.Connection = conn;

            cmd2.Parameters.AddWithValue("@key_name", keyfield.Text);
            cmd2.ExecuteNonQuery();
            cmd2.Parameters.Clear();

           MessageBox.Show("Data Inserted");
            Response.Redirect(Request.RawUrl);
        }
    }

    protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Session["passCompanyID"] = DropDownList1.SelectedValue;
    }
}