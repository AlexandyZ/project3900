﻿using project3900.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class key_overview : System.Web.UI.Page
{

    

    protected void Page_Load(object sender, EventArgs e)

    {

        List<SqlParameter> spParams = new List<SqlParameter>();
        spParams.Add(new SqlParameter("@KeyName", searchbar.Value));

        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("KeysOverview_GetByName", spParams.ToArray());

        SearchResult.DataSource = ds.Tables[0];
        SearchResult.DataBind();
    }


    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        List<SqlParameter> spParams = new List<SqlParameter>();
        spParams.Add(new SqlParameter("@KeyName", searchbar.Value));

        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("KeysOverview_GetByName", spParams.ToArray());

        SearchResult.DataSource = ds.Tables[0];
        SearchResult.DataBind();
    }

    

     public void Button_click_event(Object sender, EventArgs e)
         {
        DialogResult result = MessageBox.Show("Are you sure to return a key?", "Confirmation", MessageBoxButtons.YesNo);
        if (result == DialogResult.Yes)
        {
           //....
        }
        else if (result == DialogResult.No)
        {
            //...
        }

    }


}
