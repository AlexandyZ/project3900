using project3900.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;


public class FTPHelper
{

    private static string excelConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=\"Excel {1};HDR={2};IMEX=1\";";

    public DataSet ReadExcelFile(string filename, Boolean hasHeader)
    {
        string filePath = DBHelper.GetConfiguration("FTPDirectory") + filename;

        string version = Path.GetExtension(filePath) == ".xlsx" ? "12.0 Xml" : "8.0";
        string sheetName = "Sheet1";
        string cellRange = "";
        var cmd = String.Format("SELECT * FROM [{0}${1}]", sheetName, cellRange);
        excelConnectionString = String.Format(excelConnectionString, filePath, version, (hasHeader ? "YES" : "NO"));
        var ds = new DataSet();
        ds.Tables.Add(new DataTable(sheetName));

        using (var connection = new OleDbConnection(excelConnectionString))
        {
            OleDbCommand command = new OleDbCommand(cmd, connection);
            OleDbDataAdapter da = new OleDbDataAdapter(command);
            da.FillSchema(ds.Tables[sheetName], SchemaType.Source);

            foreach (DataColumn dc in ds.Tables[sheetName].Columns)
            {
                dc.DataType = typeof(String);
                dc.ColumnName = dc.ColumnName.Trim();
            }

            da.Fill(ds.Tables[sheetName]);

         
        }

        return ds;
    }
}
