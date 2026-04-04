// Plan / Pseudocode (detailed):
// 1. Create a single central helper class to share connection/command/reader logic across other classes.
// 2. The helper will be static so all classes can call it without instantiating.
// 3. Keep a single CD_Connection instance internally and expose safe methods:
//    - CreateCommand(): returns a configured SqlCommand with an open connection.
//    - ExecuteStoredProcedureToDataTable(spName, params SqlParameter[]): executes stored proc and returns DataTable.
//    - ExecuteStoredProcedureReader(spName, params SqlParameter[]): executes stored proc and returns SqlDataReader (caller must close).
//    - CloseConnection(): closes connection via CD_Connection.
// 4. Handle exceptions and ensure connection/reader are closed when appropriate.
// 5. Provide short usage examples in comments for callers (e.g., how to replace existing fields).
//
// Usage examples:
// - Simple select into DataTable:
//     var table = CD_DataAccess.ExecuteStoredProcedureToDataTable("selectDirecteur");
// - When you need a reader for custom logic (remember to close):
//     var reader = CD_DataAccess.ExecuteStoredProcedureReader("selectDirecteur");
//     try { while (reader.Read()) { /* process */ } }
//     finally { reader.Close(); CD_DataAccess.CloseConnection(); }
// - To create a custom command:
//     using (var cmd = CD_DataAccess.CreateCommand()) { cmd.CommandText = "myProc"; cmd.CommandType = CommandType.StoredProcedure; /* add params */ }
//
// Note: This centralizes connection/command creation so you can remove
// private CD_Connection Connection = new CD_Connection();
// private SqlCommand Command = new SqlCommand();
// private SqlDataReader Read;
// from the other classes and call CD_DataAccess methods instead.

using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace _3.Control
{
    public static class CD_DataAccess
    {
        // Single shared CD_Connection instance used by helper methods.
        private static readonly CD_Connection Connection = new CD_Connection();

        // Create a SqlCommand with an open connection already assigned.
        // Caller can dispose the returned SqlCommand. Connection remains open until CloseConnection() is called.
        public static SqlCommand CreateCommand()
        {
            try
            {
                var conn = Connection.OpenConnection();
                var cmd = new SqlCommand
                {
                    Connection = conn,
                    CommandType = CommandType.Text // default; caller can override to StoredProcedure
                };
                return cmd;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error creating SqlCommand: " + ex.Message);
                return null;
            }
        }

        // Execute a stored procedure and return results as a DataTable.
        // This method opens the connection, executes, loads the DataTable, and closes the connection.
        public static DataTable ExecuteStoredProcedureToDataTable(string storedProcedureName, params SqlParameter[] parameters)
        {
            var table = new DataTable();
            SqlDataReader reader = null;
            SqlCommand cmd = null;

            try
            {
                cmd = CreateCommand();
                if (cmd == null)
                    return null;

                cmd.CommandText = storedProcedureName;
                cmd.CommandType = CommandType.StoredProcedure;

                if (parameters != null && parameters.Length > 0)
                    cmd.Parameters.AddRange(parameters);

                reader = cmd.ExecuteReader();
                table.Load(reader);
                return table;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error executing stored procedure '" + storedProcedureName + "': " + ex.Message);
                return null;
            }
            finally
            {
                try { reader?.Close(); } catch { }
                try { cmd?.Parameters?.Clear(); } catch { }
                CloseConnection();
                cmd?.Dispose();
            }
        }

        // Execute a stored procedure and return the SqlDataReader.
        // Caller is responsible for closing the reader and calling CloseConnection().
        public static SqlDataReader ExecuteStoredProcedureReader(string storedProcedureName, params SqlParameter[] parameters)
        {
            try
            {
                var cmd = CreateCommand();
                if (cmd == null)
                    return null;

                cmd.CommandText = storedProcedureName;
                cmd.CommandType = CommandType.StoredProcedure;

                if (parameters != null && parameters.Length > 0)
                    cmd.Parameters.AddRange(parameters);

                // CommandBehavior.CloseConnection will close the connection when reader is closed.
                var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                // Do not close connection here; caller will close the reader which will close connection.
                return reader;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error executing stored procedure '" + storedProcedureName + "': " + ex.Message);
                return null;
            }
        }

        // Close the SQL connection via CD_Connection helper.
        public static void CloseConnection()
        {
            try
            {
                Connection.CloseConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error closing connection: " + ex.Message);
            }
        }
    }
}