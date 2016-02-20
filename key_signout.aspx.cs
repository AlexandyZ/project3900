using project3900.App_Code;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;
using System.Threading.Tasks;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class key_lend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
    
       
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            List<SqlParameter> spParams = new List<SqlParameter>();
            spParams.Add(new SqlParameter("@WorkerFirstName", txtFname.Value));
            spParams.Add(new SqlParameter("@WorkerLastName", txtLname.Value));
            spParams.Add(new SqlParameter("@WorkerPhone", txtPhone.Value));
            spParams.Add(new SqlParameter("@Company", txtCompany.Value.ToString()));
            spParams.Add(new SqlParameter("@KeyName", txtKeyName.Value));

            DBHelper.ExecuteNonQueryBySPName("Key_Insert", spParams.ToArray());

          
            Response.Redirect("key_overview.aspx");
        }

      
    }
