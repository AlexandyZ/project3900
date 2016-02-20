using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class key_addnew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source = ant-comp3900.database.windows.net; Initial Catalog = RMS; User ID = ant; Password=Tna12345");
        String str = "select p.package_id, s.student_fname as firstname, s.student_lname as lastname, h.house_name as house, r.room_name as room, p.description, p.delivery_date from student s inner join house h on s.house_id = h.house_id inner join room r on s.room_id = r.room_id inner join package p on s.std_id = p.std_id where pickup_date is NULL";
        SqlCommand xp = new SqlCommand(str, conn);
        xp.Parameters.Add("@search", SqlDbType.NVarChar).Value = searchbar_key.Text;
        conn.Open();
        xp.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = xp;
        DataSet ds = new DataSet();
        da.Fill(ds, "student_fname");
        GridView1.DataSource = ds;
        GridView1.DataBind();
        conn.Close();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            string constring = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(constring);
            conn.Open();
            int rowIndex = Int32.Parse((e.CommandArgument).ToString());
            int package_id = Int32.Parse(GridView1.DataKeys[rowIndex].Value.ToString());
            SqlCommand cmd = new SqlCommand("update package set pickup_date = @pickup_date where package_id = '" + package_id + "'", conn);
            cmd.Parameters.AddWithValue("@pickup_date", DateTime.Today.ToString());
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        MessageBox.Show("Are you sure?");
        Response.Redirect(Request.RawUrl);

    }

    
}