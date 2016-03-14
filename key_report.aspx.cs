using project3900.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class key_report : System.Web.UI.Page
{



    protected void Page_Load(object sender, EventArgs e)

    {


        List<SqlParameter> spParams = new List<SqlParameter>();
        spParams.Add(new SqlParameter("@KeyName", searchbar.Text));

        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("KeysReport_GetByName", spParams.ToArray());

        SearchResult.DataSource = ds.Tables[0];
        SearchResult.DataBind();
    }


    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        List<SqlParameter> spParams = new List<SqlParameter>();
        spParams.Add(new SqlParameter("@KeyName", searchbar.Text));

        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("KeysReport_GetByName", spParams.ToArray());

        SearchResult.DataSource = ds.Tables[0];
        SearchResult.DataBind();
    }



    public void Button_click_event(Object sender, EventArgs e)
    {
        DialogResult result = MessageBox.Show("Are you sure to return a key?", "Confirmation", MessageBoxButtons.YesNo);
        if (result == DialogResult.Yes)
        {
            //.....
        }
        else if (result == DialogResult.No)
        {
            //.....
        }

    }

}
