using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace project3900.App_Code
{
    public class DBHelper
    {
        public static String GetConfiguration(string key)
        {
            return ConfigurationManager.AppSettings[key];
        }

        public static DataSet ExecuteBySPName(string spName, SqlParameter[] spParams)
        {
            DataSet ds = new DataSet();
            DbProviderFactory factory = DbProviderFactories.GetFactory("System.Data.SqlClient");

            using (DbConnection connection = factory.CreateConnection())
            {
                connection.ConnectionString = GetConfiguration("ConnectionString");
                using (DbCommand command = factory.CreateCommand())
                {
                    command.Connection = connection;
                    command.CommandText = spName;
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandTimeout = int.MaxValue;

                    if (spParams != null && spName.Length > 0)
                    {
                        command.Parameters.AddRange(spParams);
                    }

                    using (DbDataAdapter da = DbProviderFactories.GetFactory("System.Data.SqlClient").CreateDataAdapter())
                    {
                        da.SelectCommand = command;
                        da.Fill(ds);
                    }
                }
            }

            return ds;
        }

        public static DataSet ExecuteBySPName(string v, SqlParameter spParams)
        {
            throw new NotImplementedException();
        }

        public static Object ExecuteScalarBySPName(string spName, SqlParameter[] spParams)
        {
            Object obj;
            DbProviderFactory factory = DbProviderFactories.GetFactory("System.Data.SqlClient");

            using (DbConnection connection = factory.CreateConnection())
            {
                connection.ConnectionString = GetConfiguration("ConnectionString");
                using (DbCommand command = factory.CreateCommand())
                {
                    command.Connection = connection;
                    command.CommandText = spName;
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandTimeout = int.MaxValue;

                    if (spParams != null && spName.Length > 0)
                    {
                        command.Parameters.AddRange(spParams);
                    }

                    obj = command.ExecuteScalar();
                }
            }

            return obj;
        }

        public static void ExecuteNonQueryBySPName(string spName, SqlParameter[] spParams)
        {
            DbProviderFactory factory = DbProviderFactories.GetFactory("System.Data.SqlClient");

            using (DbConnection connection = factory.CreateConnection())
            {
                connection.ConnectionString = GetConfiguration("ConnectionString");
                using (DbCommand command = factory.CreateCommand())
                {
                    command.Connection = connection;
                    command.CommandText = spName;
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandTimeout = int.MaxValue;

                    if (spParams != null && spName.Length > 0)
                    {
                        command.Parameters.AddRange(spParams);
                    }

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }
    }
}
