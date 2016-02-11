using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class key_overview : System.Web.UI.Page
{

    SqlConnection conn = new SqlConnection("Data Source = ant-comp3900.database.windows.net; Initial Catalog = RMS; User ID = ant; Password=Tna12345");

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
     



        String str = "select k.keys_name as KeyNumber, w.worker_fname + ' '+ w.worker_lname as Name, c.comp_phone as PhoneNumber, lk.keylend_date as TimeOut, lk.keyreturn_date as TimeIn , k.keyoutstanding as Status FROM lend_key as lk INNER JOIN keys as k ON lk.keys_id = k.keys_id INNER JOIN worker as w ON w.worker_id = lk.worker_id INNER JOIN company as c ON c.comp_id = w.comp_id  where (keys_name like'%' + @search + '%')";
        SqlCommand xp = new SqlCommand(str, conn);
        xp.Parameters.Add("@search", SqlDbType.NVarChar).Value = searchbar_key.Text;

        conn.Open();
        xp.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = xp;
        DataSet ds = new DataSet();
        da.Fill(ds, "keys_name");
        GridView1.DataSource = ds;
        GridView1.DataBind();
        conn.Close();
    }
 }
