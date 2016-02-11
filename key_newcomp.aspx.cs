using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows;
using System.Web;
using System.Text;
using System.Web.UI;
using System.Windows.Forms;

public partial class key_addnew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        


    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connection = "Data Source = ant-comp3900.database.windows.net;Initial Catalog=RMS;User ID=ant;Password=Tna12345";

        using (SqlConnection conn = new SqlConnection(connection))
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO company VALUES (@comp_name,@comp_phone)");
            cmd.Connection = conn;

            
            cmd.Parameters.AddWithValue("@comp_name", compname.Text);
            cmd.Parameters.AddWithValue("@comp_phone", compphone.Text);

            
                conn.Open();
                cmd.ExecuteNonQuery();
            
            MessageBox.Show("Data Inserted");
            Response.Redirect(Request.RawUrl);

             
        }
       
    }
} 