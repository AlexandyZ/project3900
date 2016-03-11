using project3900.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data.Common;
using System.IO;
using System.Drawing;
using System.Net;
using Microsoft.SqlServer.Server;

public partial class key_addnew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string filePath = @"C:\Users\Kwanchanok\Desktop\project3900\temp\Book1.xlsx";
        /* string hostName = "ftp://xxxxxxxx";
         NetworkCredential nwct = new NetworkCredential("username", "password");
         bool isPassiveMode=false;
         FTP ftp = new FTP();
         ftp.Upload(filePath, hostName, nwct, isPassiveMode);*/

        Boolean hasHeader = true;
        FTPHelper fhp = new FTPHelper();
        DataSet ds = fhp.ReadExcelFile(filePath, hasHeader);

        
        string sheetName = "Sheet1";
     List<SqlParameter> spParams = new List<SqlParameter>();
        spParams.Add(new SqlParameter("@ImportStudentType", SqlDbType.Structured));
        spParams[0].Value = CreateSqlDataRecords(ds.Tables[sheetName]);

        DBHelper.ExecuteNonQueryBySPName("Student_Import", spParams.ToArray());

        //if (ds != null && ds.Tables[0].Rows.Count > 0) {
        //    string keyName = ds.Tables[0].Rows[0][1].ToString();
        //}
    }

    private static List<SqlDataRecord> CreateSqlDataRecords(DataTable dt)
    {
        List<SqlMetaData> metaData = new List<SqlMetaData> {
               new SqlMetaData("student_id", SqlDbType.VarChar,9),
               new SqlMetaData("student_fname", SqlDbType.VarChar,20),
               new SqlMetaData("student_lname", SqlDbType.VarChar,20),
                new SqlMetaData("student_phone", SqlDbType.VarChar,20),
               new SqlMetaData("student_email", SqlDbType.VarChar,30),
               new SqlMetaData("house_id", SqlDbType.Int),
                new SqlMetaData("room_id", SqlDbType.Int)
           };

        //SqlDataRecord record = new SqlDataRecord(metaData.ToArray());
        List<SqlDataRecord> records = new List<SqlDataRecord>();

        foreach (DataRow row in dt.Rows)
        {   if (row["student_id"] == DBNull.Value) { continue; }
            SqlDataRecord record = new SqlDataRecord(metaData.ToArray());
            record.SetSqlString(0, Convert.ToString(row["student_id"]));
            record.SetSqlString(1, Convert.ToString(row["student_fname"]));
            record.SetSqlString(2, Convert.ToString(row["student_lname"]));
            record.SetSqlString(3, Convert.ToString(row["student_phone"]));
            record.SetSqlString(4, Convert.ToString(row["student_email"]));
            record.SetInt32(5, Convert.ToInt32(row["house_id"]));
            record.SetInt32(6, Convert.ToInt32(row["room_id"]));
            //yield return record;
            string testID = row["student_id"].ToString();
            records.Add(record);
        }

        return records;
    }
}
    
