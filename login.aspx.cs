using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

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
                Session["username"] = TextBoxUsername.Text;
                FormsAuthentication.RedirectFromLoginPage(TextBoxPassword.Text, false);
                Response.Redirect("key_overview.aspx");
            }
            else
            {
                Label1.Text = "Password is not correct!";
            }
        }
        else
        {
            Label1.Text = "Username is not correct!";
        }
    }
}