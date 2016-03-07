using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for FTP
/// </summary>
public class FTP
{

    public FtpWebResponse Upload(string filePath, string hostName, NetworkCredential credentials, bool isPassiveMode)
    {
        FtpWebResponse response = null;
        try
        {
            // Get the object used to communicate with the server.
            FtpWebRequest request = (FtpWebRequest)WebRequest.Create(hostName + Path.GetFileName(filePath));
            request.Method = WebRequestMethods.Ftp.UploadFile;
            request.UsePassive = isPassiveMode;
            request.Credentials = credentials;
            request.KeepAlive = true; // false;
            request.Timeout = -1;

            // Copy the contents of the file to the request stream.
            StreamReader sourceStream = new StreamReader(filePath);
            byte[] fileContents = Encoding.UTF8.GetBytes(sourceStream.ReadToEnd());
            sourceStream.Close();
            request.ContentLength = fileContents.Length;

            using (Stream requestStream = request.GetRequestStream())
            {
                requestStream.Write(fileContents, 0, fileContents.Length);
            }

            response = (FtpWebResponse)request.GetResponse();
            //Console.WriteLine("Upload File Complete, status {0}", response.StatusDescription);
            response.Close();
        }
        catch (Exception ex)
        {
            string test = ex.Message;
            //test = response.StatusDescription;
        }

        return response;
    }
}
