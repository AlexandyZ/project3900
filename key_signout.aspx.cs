using project3900.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

public partial class key_lend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
    
        protected void btnSubmit_Click(object sender, EventArgs e)
    {
        List<SqlParameter> spParams1 = new List<SqlParameter>();
        spParams1.Add(new SqlParameter("@Name", txtKeyName.Text));

        DataSet ds = new DataSet();
        ds = DBHelper.ExecuteBySPName("Key_GetByName", spParams1.ToArray());

        if (ds.Tables[0].Rows.Count == 0)
        {
            //popup
            string test = "test";
        }
        else {
            List<SqlParameter> spParams = new List<SqlParameter>();
            spParams.Add(new SqlParameter("@WorkerFirstName", txtFname.Text));
            spParams.Add(new SqlParameter("@WorkerLastName", txtLname.Text));
            spParams.Add(new SqlParameter("@WorkerPhone", txtPhone.Text));
            spParams.Add(new SqlParameter("@Company", txtCompany.Text.ToString()));
            spParams.Add(new SqlParameter("@KeyName", txtKeyName.Text));

            DBHelper.ExecuteNonQueryBySPName("Key_Insert", spParams.ToArray());

            Response.Redirect("key_overview.aspx");
        }
    }

      
    }
