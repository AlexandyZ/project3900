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
using System.Windows.Forms;
using System.Windows;

public partial class import : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        if (FileUploadControl.HasFile)
        {
            string filename = FileUploadControl.FileName;
            string I_Docx_type = filename.Substring(filename.LastIndexOf(".") + 1);

            if (I_Docx_type == "xlsx" || I_Docx_type == "xls")
            {
                try
                {
                   
                    FileUploadControl.SaveAs(DBHelper.GetConfiguration("FTPDirectory") + filename);
                  
                  
                    string filePath = DBHelper.GetConfiguration("FTPDirectory") + filename;

                    Boolean hasHeader = true;
                    FTPHelper fhp = new FTPHelper();
                    DataSet ds = fhp.ReadExcelFile(filename, hasHeader);


                    string sheetName = "Sheet1";
                    List<SqlParameter> spParams = new List<SqlParameter>();
                    spParams.Add(new SqlParameter("@ImportStudentType", SqlDbType.Structured));
                    spParams[0].Value = CreateSqlDataRecords(ds.Tables[sheetName]);

                    DBHelper.ExecuteNonQueryBySPName("Student_Import", spParams.ToArray());

                    StatusLabel.Text = "Upload status: File uploaded!";
                    

                }
                catch (Exception ex)
                {
                    StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;

                }
            }
            else {
                StatusLabel.Text = "Upload status: Only .xlsx  and .xls files are accepted!";
            }
        }
    }

    private static List<SqlDataRecord> CreateSqlDataRecords(DataTable dt)
    {
        List<SqlMetaData> metaData = new List<SqlMetaData> {
               new SqlMetaData("student_id", SqlDbType.VarChar,9),
               new SqlMetaData("firstname", SqlDbType.VarChar,20),
               new SqlMetaData("lastname", SqlDbType.VarChar,20),
                new SqlMetaData("phone", SqlDbType.VarChar,20),
               new SqlMetaData("email", SqlDbType.VarChar,30),
               new SqlMetaData("house",SqlDbType.VarChar,10),
                new SqlMetaData("room", SqlDbType.VarChar,4)
           };

        
        List<SqlDataRecord> records = new List<SqlDataRecord>();

        foreach (DataRow row in dt.Rows)
        {
            if (row["student_id"] == DBNull.Value) { continue; }
            SqlDataRecord record = new SqlDataRecord(metaData.ToArray());
            record.SetSqlString(0, Convert.ToString(row["student_id"]));
            record.SetSqlString(1, Convert.ToString(row["firstname"]));
            record.SetSqlString(2, Convert.ToString(row["lastname"]));
            record.SetSqlString(3, Convert.ToString(row["phone"]));
            record.SetSqlString(4, Convert.ToString(row["email"]));
            record.SetSqlString(5, Convert.ToString(row["house"]));
            record.SetSqlString(6, Convert.ToString(row["room"]));
           
            records.Add(record);
        }

        return records;
    }
}

