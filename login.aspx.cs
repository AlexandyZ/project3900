using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;


public partial class login : System.Web.UI.Page
{
    string constring = ConfigurationManager.ConnectionStrings["RMSConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        TextBoxUsername.TextChanged += new EventHandler(Username_onTextChanged);
    }

    protected void Button_login_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(constring);
        conn.Open();
        SqlCommand passComm = new SqlCommand("select password from staff where staff_name= @username", conn);
        if (Read_Username())
        {
            passComm.Parameters.AddWithValue("@username", TextBoxUsername.Text);
            string password = passComm.ExecuteScalar().ToString();
            
            if (string.IsNullOrWhiteSpace(TextBoxPassword.Text))
            {
                validPassword.Text = "Please enter password";
            }
            else if(password == TextBoxPassword.Text)
            {
                Session["username"] = TextBoxUsername.Text;
                FormsAuthentication.RedirectFromLoginPage(TextBoxPassword.Text, false);
                Response.Redirect("key_overview.aspx");
            }
            else
            {
                validPassword.Text = "Password is not correct!";
            }
        }
        else
        {
            //validPassword.Text = "Please enter username";
        }
    }

    protected void Username_onTextChanged(object sender, EventArgs e)
    {
        
        if (string.IsNullOrWhiteSpace(TextBoxUsername.Text))
        {
            validUsername.Text = "Please enter username";
        }
        else if (!Read_Username())
        {
            validUsername.Text = "Username is not correct";
        }
        else
        {
            validUsername.Text = "";
        }
    }

    protected bool Read_Username()
    {
        SqlConnection conn = new SqlConnection(constring);
        conn.Open();

        SqlCommand cmd = new SqlCommand("SELECT 1 FROM staff WHERE staff_name = @username", conn);
        cmd.Parameters.AddWithValue("@username", TextBoxUsername.Text);
        SqlDataReader rd = cmd.ExecuteReader();
        return rd.Read();
    }
}