using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_login_Click(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;
        SqlConnection conn = new SqlConnection(constring);
        conn.Open();
        string checkuser = "select count(*) from staff where staff_name= '" + TextBoxUsername.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        conn.Close();
        if (temp == 1)
        {
            conn.Open();
            string checkPassword = "select password from staff where staff_name= '" + TextBoxUsername.Text + "'";
            SqlCommand passComm = new SqlCommand(checkPassword, conn);
            string password = passComm.ExecuteScalar().ToString().Replace(" ","");
            if(password == TextBoxPassword.Text)
            {
                Session["New"] = TextBoxUsername.Text;
                //Response.Redirect("package_pickup.aspx");
                Label1.Text = "Password is correct!";
            }
            else
            {
                Label1.Text = "Password is not correct!";
                //Response.Write("Password is not correct!");
            }
        }
        else
        {
            Label1.Text = "Username is not correct!";
            //Response.Write("Username is not correct!");
        }


    }
}