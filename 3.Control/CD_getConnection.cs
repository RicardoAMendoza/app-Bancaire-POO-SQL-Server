using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
// Data
using System.Data;
using System.Data.SqlClient;
// Message Box
using System.Windows.Forms;


namespace _3.Control
{
    public class CD_getConnection
    {

        // Error 40: Could not open a connection to SQL Server fixed with  http://msdn.microsoft.com/en-us/library/ms174212.aspx
        // in My computer : C:\Windows\SysWOW64\SQLServerManager14.msc
        static private string stringConnection = "Data Source = .; DataBase = bdLaBanqueNationaleduQuebec; Integrated Security = true";
        private SqlConnection MyConnection = new SqlConnection(stringConnection);
        // CLOSED CONNECTION
        /// <summary>
        /// Closes the SQL connection if it is open.
        /// </summary>
        /// <returns></returns>
        public SqlConnection CloseConnection()
        {
            try
            {
                if (MyConnection.State == ConnectionState.Open)
                {
                    MyConnection.Close();
                }
                return MyConnection;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error in Open Connection : " + " " + ex.Message);
                return null;
            }
        }

        // OPEN CONNECTION
        /// <summary>
        /// Opens the database connection if it is currently closed.
        /// </summary>
        /// <remarks>If the connection is already open, this method does nothing and returns the existing
        /// connection.</remarks>
        /// <returns>An <see cref="SqlConnection"/> object representing the open connection.  Returns <see langword="null"/> if
        /// an error occurs while attempting to open the connection.</returns>
        public SqlConnection OpenConnection()
        {
            try
            {
                if (MyConnection.State == ConnectionState.Closed)
                {
                    MyConnection.Open();
                }
                return MyConnection;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error in Open Connection : " + " " + ex.Message);
                return null;
            }
        }
    }
}
