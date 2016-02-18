using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using project3900.App_Code;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class game_manage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void addSubmit_Click(object sender, EventArgs e)
    {
        string con = "Data Source = ant-comp3900.database.windows.net;Database=RMS;User Id=ant;Password=Tna12345";
        using (SqlConnection conn = new SqlConnection(con))
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO game VALUES (@game_name,@game_amount)");
            cmd.Connection = conn;


            cmd.Parameters.AddWithValue("@game_name", gameText.Text);
            cmd.Parameters.AddWithValue("@game_amount", amoutText.Text);

            conn.Open();

            cmd.ExecuteNonQuery();
            MessageBox.Show("Game added...");
            Response.Redirect("");
        }
    }
}