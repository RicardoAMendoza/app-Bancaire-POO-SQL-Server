using _1.Model;
using _1.Model.Collections;
using _1.Model.Model;
using System;
using System.Collections.Generic;
// Data
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace _3.Control
{
    /// <summary>
    /// Represents the data source and operations for Director entities.
    /// /// </summary>
    public class CD_getData
    {
        /// <summary>
        /// Provides data access and entity representation for Director records in the database.
        /// 1. Obj clsConnection -> object connection with the data base
        /// </summary>
        private CD_getConnection Connection = new CD_getConnection();
        //  private CD_getData Model = new CD_getData();
        // 2. Execute SQl
        private SqlCommand Command = new SqlCommand();
        // 3 . Read Rows
        private SqlDataReader Read;

        
        public DataTable DirectorList()
        {
            try
            {
                // 1. Object DataTable
                DataTable Table = new DataTable();
                // 2. Execute open connection
                Command.Connection = Connection.OpenConnection();
                // 3. Execute stored procedure
                Command.CommandText = "selectDirecteur";
                // 4. Execute specify teh command type
                Command.CommandType = CommandType.StoredProcedure;
                // 5. Excute read the rows from stored procedure
                Read = Command.ExecuteReader(); // to read rows - return rows
                // 6. Load the table
                Table.Load(Read);
                // 7. Close connection
                Connection.CloseConnection();
                // 8. Make return
                return Table;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error in the Model loading selectDirecteur from the data base : " + " " + ex.Message);
                return null;
            }
        }

        public DataTable AgenceList()
        {
            try
            {
                // 1. Object DataTable
                DataTable Table = new DataTable();
                // 2. Execute open connection
                Command.Connection = Connection.OpenConnection();
                // 3. Execute stored procedure
                Command.CommandText = "selectAgences";
                // 4. Execute specify teh command type
                Command.CommandType = CommandType.StoredProcedure;
                // 5. Excute read the rows from stored procedure
                Read = Command.ExecuteReader(); // to read rows - return rows
                // 6. Load the table
                Table.Load(Read);
                // 7. Close connection
                Connection.CloseConnection();
                // 8. Make return
                return Table;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error in the Model loading selectAgences from the data base : " + " " + ex.Message);
                return null;
            }
        }

        public DataTable ClientList()
        {
            try
            {
                // 1. Object DataTable
                DataTable Table = new DataTable();
                // 2. Execute open connection
                Command.Connection = Connection.OpenConnection();
                // 3. Execute stored procedure
                Command.CommandText = "selectClient";
                // 4. Execute specify teh command type
                Command.CommandType = CommandType.StoredProcedure;
                // 5. Excute read the rows from stored procedure
                Read = Command.ExecuteReader(); // to read rows - return rows
                // 6. Load the table
                Table.Load(Read);
                // 7. Close connection
                Connection.CloseConnection();
                // 8. Make return
                return Table;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error in the Model loading selectAgences from the data base : " + " " + ex.Message);
                return null;
            }
        }

        public Client GetClientById(int  IdClient)
        {
            try 
            {
                    Command.Connection = Connection.OpenConnection();
                    string sql = @"
                                   SELECT
                                        c.idclient AS IDCLIENT,
                                        c.nomdeFamille NAME,
                                        c.nom AS lastName,
                                        c.courriel AS eMAIL,
                                        c.img AS PHOTO,
                                        c.adresse AS ADDRESS,
                                        c.numerodeCarte AS CARD,
                                        c.nip AS NIP,
                                        c.sexe AS SEXE,
                                        c.age AS AGE,
                                        c.active AS ACTIVE,
                                        c.idagences AS IDAGENCE,
                                        c.idemploye AS IDEMPLOYE
                                    FROM tclient c
                                WHERE idclient = @IdClient";
                    using (SqlCommand cmd = new SqlCommand(sql, Command.Connection))
                    {
                      cmd.Parameters.AddWithValue("@IdClient",  IdClient);
                      using (SqlDataReader reader = cmd.ExecuteReader())
                      {
                            if(reader.Read())
                            {
                                // Client fields (null-safe)
                                int vId = reader["IDCLIENT"] != DBNull.Value ? Convert.ToInt32(reader["IDCLIENT"]) : 0;
                                string vName = reader["NAME"] as string ?? string.Empty;
                                string vLastName = reader["lastName"] as string ?? string.Empty;
                                string vEmail = reader["eMAIL"] as string ?? string.Empty;
                                string vPhoto = reader["PHOTO"] as string ?? string.Empty;
                                string vAddress = reader["ADDRESS"] as string ?? string.Empty;
                                // vNumerodeCarte
                                int vNumerodeCarte = reader["CARD"] != DBNull.Value ? Convert.ToInt32(reader["CARD"]) : 0;
                                // string vNumerodeCarte = reader["CARD"] as string ?? string.Empty;
                                string vNip = reader["NIP"] as string ?? string.Empty;
                                string vSexe = reader["SEXE"] as string ?? string.Empty;
                                int vAge = reader["AGE"] != DBNull.Value ? Convert.ToInt32(reader["AGE"]) : 0;
                                string vActive = reader["ACTIVE"] as string ?? string.Empty;
                                // idagencies
                                int vIdAgences = reader["IDAGENCE"] != DBNull.Value ? Convert.ToInt32(reader["IDAGENCE"]) : 0;
                                // idemployees
                                int vIdEmploye = reader["IDEMPLOYE"] != DBNull.Value ? Convert.ToInt32(reader["IDEMPLOYE"]) : 0;

                            Client client;
                                try
                                {
                                client = new Client(vId, vName, vLastName, vEmail, vPhoto, vAddress, vNumerodeCarte, vNip, vSexe, vAge, vActive, vIdAgences, vIdEmploye);
                            }
                                catch
                                {
                                    // Fallback: use default constructor and set public properties
                                    client = new Client();
                                    client.vName = vName;
                                    client.vLastName = vLastName;
                                    client.vEMail = vEmail;
                                    client.vPhoto = vPhoto;
                                    client.vSexe = vSexe;
                                    client.vActive = vActive;
                                    client.vAddress = vAddress;
                                    // vNip might be read-only; if it is, prefer the constructor approach above.
                                }
                                return client;
                            }
                            else
                            {
                                return null; // Client not found
                            }

                        }
                    }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error retrieving client: " + ex.Message);
                return null;
            }

        }

        public void CreateClient(Client client)
        {
            try
            {
                    Command.Connection = Connection.OpenConnection();
                    string sql = @"
                        INSERT INTO tclient (nomdeFamille, nom, courriel, img, adresse, numerodeCarte, nip, sexe, age, active, idagences, idemploye)
                        VALUES (@Name, @LastName, @Email, @Photo, @Address, @CardNumber, @Nip, @Sexe, @Age, @Active,@IdAgences,@IdEmploye)";
                    using (SqlCommand cmd = new SqlCommand(sql, Command.Connection))
                    {
                        cmd.Parameters.AddWithValue("@Name", client.vName);
                        cmd.Parameters.AddWithValue("@LastName", client.vLastName);
                        cmd.Parameters.AddWithValue("@Email", client.vEMail);
                        cmd.Parameters.AddWithValue("@Photo", client.vPhoto);
                        cmd.Parameters.AddWithValue("@Address", client.vAddress);
                        cmd.Parameters.AddWithValue("@CardNumber", client.vNumerodeCarte);
                        cmd.Parameters.AddWithValue("@Nip", client.vNip);
                        cmd.Parameters.AddWithValue("@Sexe", client.vSexe);
                        cmd.Parameters.AddWithValue("@Age", client.vAge);
                        cmd.Parameters.AddWithValue("@Active", client.vActive);
                        //IDAGENCES and IDEMPLOYE
                        cmd.Parameters.AddWithValue("@IdAgences", client.vIdAgences);
                        cmd.Parameters.AddWithValue("@IdEmploye", client.vIdEmploye);
                    cmd.ExecuteNonQuery();
                    }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error creating client: " + ex.Message);
            }
        }

        public void UpdateClient(Client client)
        {
            try
            {
                    Command.Connection = Connection.OpenConnection();
                    string sql = @"
                        UPDATE tclient
                        SET 
                            nomdeFamille = @Name,
                            nom = @LastName,
                            courriel = @Email,
                            img = @Photo,
                            adresse = @Address,
                            numerodeCarte = @CardNumber,
                            nip = @Nip,
                            sexe = @Sexe,
                            age = @Age,
                            active = @Active
                        WHERE idclient = @IdClient";
                    using (SqlCommand cmd = new SqlCommand(sql, Command.Connection))
                    {
                        cmd.Parameters.AddWithValue("@IdClient", client.vId);
                        cmd.Parameters.AddWithValue("@Name", client.vName);
                        cmd.Parameters.AddWithValue("@LastName", client.vLastName);
                        cmd.Parameters.AddWithValue("@Email", client.vEMail);
                        cmd.Parameters.AddWithValue("@Photo", client.vPhoto);
                        cmd.Parameters.AddWithValue("@Address", client.vAddress);
                        cmd.Parameters.AddWithValue("@CardNumber", client.vNumerodeCarte);
                        cmd.Parameters.AddWithValue("@Nip", client.vNip);
                        cmd.Parameters.AddWithValue("@Sexe", client.vSexe);
                        cmd.Parameters.AddWithValue("@Age", client.vAge);
                        cmd.Parameters.AddWithValue("@Active", client.vActive);
                        cmd.ExecuteNonQuery();
                    }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error updating client: " + ex.Message);
            }
        }

        public void DeleteClient(int clientId)
        {
            try
            {
                Command.Connection = Connection.OpenConnection();
                string sql = "DELETE FROM tclient WHERE idclient = @IdClient";
                    using (SqlCommand cmd = new SqlCommand(sql, Command.Connection))
                    {
                        cmd.Parameters.AddWithValue("@IdClient", clientId);
                        cmd.ExecuteNonQuery();
                    }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error deleting client: " + ex.Message);
            }
        }
        /// <summary>
        /// Retrieves a list of employees from the database by executing the 'selectEmployee' stored procedure.
        /// </summary>
        /// <remarks>This method opens a connection to the database, executes a stored procedure to fetch
        /// employee data, and loads the results into a DataTable. Ensure that the database connection is properly
        /// configured before calling this method.</remarks>
        /// <returns>A DataTable containing the employee records retrieved from the database. Returns null if an error occurs
        /// during the operation.</returns>
        public DataTable EmployeeList()
        {
            try
            {
                // 1. Object DataTable
                DataTable Table = new DataTable();
                // 2. Execute open connection
                Command.Connection = Connection.OpenConnection();
                // 3. Execute stored procedure
                Command.CommandText = "selectCodeEmploye";
                // 4. Execute specify teh command type
                Command.CommandType = CommandType.StoredProcedure;
                // 5. Excute read the rows from stored procedure
                Read = Command.ExecuteReader(); // to read rows - return rows
                // 6. Load the table
                Table.Load(Read);
                // 7. Close connection
                Connection.CloseConnection();
                // 8. Make return
                return Table;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error in the Model loading selectEmployee from the data base : " + " " + ex.Message);
                return null;
            }
        }

        public Employee GetEmployeeById(int idemploye)
        {
            try
            {
                Command.Connection = Connection.OpenConnection();
                string sql = @"
                                SELECT
                                    c.idemploye AS IDEMPLOYEE,
                                    c.nomdeFamille NAME,
                                    c.nom AS lastName,
                                    c.courriel AS eMAIL,
                                    c.img AS PHOTO,
                                    c.hiringDate AS HIRINGDATA,
                                    c.salary AS SALARY,
                                    c.sexe AS SEXE,
                                    c.active AS ACTIVE,
                                    c.idagences AS IDAGENCE
                                FROM temploye c
                                WHERE c.idemploye = @idemploye";
                using (SqlCommand cmd = new SqlCommand(sql, Command.Connection))
                {
                    cmd.Parameters.AddWithValue("@idemploye", idemploye);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            int ordId = reader.GetOrdinal("IDEMPLOYEE");
                          //  int ordNumber = reader.GetOrdinal("NUMBER");
                            int ordName = reader.GetOrdinal("NAME");
                            int ordLast = reader.GetOrdinal("lastName");
                            int ordEmail = reader.GetOrdinal("eMAIL");
                            int ordPhoto = reader.GetOrdinal("PHOTO");
                            int ordHiring = reader.GetOrdinal("HIRINGDATA"); // matches alias
                            int ordSalary = reader.GetOrdinal("SALARY");
                            int ordSexe = reader.GetOrdinal("SEXE");
                            int ordActive = reader.GetOrdinal("ACTIVE");

                            int vIdEmployee = !reader.IsDBNull(ordId) ? reader.GetInt32(ordId) : 0;
                          //  int vNumber = !reader.IsDBNull(ordNumber) ? reader.GetInt32(ordNumber) : 0;
                            string vName = !reader.IsDBNull(ordName) ? reader.GetString(ordName) : string.Empty;
                            string vLastName = !reader.IsDBNull(ordLast) ? reader.GetString(ordLast) : string.Empty;
                            string vEmail = !reader.IsDBNull(ordEmail) ? reader.GetString(ordEmail) : string.Empty;
                            string vPhoto = !reader.IsDBNull(ordPhoto) ? reader.GetString(ordPhoto) : string.Empty;

                            Date vHiringDate = null;
                            if (!reader.IsDBNull(ordHiring))
                            {
                                DateTime dt = reader.GetDateTime(ordHiring);
                                vHiringDate = new Date(dt.Day, dt.Month, dt.Year);
                            }

                            decimal vSalary = !reader.IsDBNull(ordSalary) ? reader.GetDecimal(ordSalary) : 0m;
                            string vSexe = !reader.IsDBNull(ordSexe) ? reader.GetString(ordSexe) : string.Empty;
                            string vActive = !reader.IsDBNull(ordActive) ? reader.GetString(ordActive) : string.Empty;
                            int vIdAgences = !reader.IsDBNull(ordId) ? reader.GetInt32(ordId) : 0;
                            Employee employee;
                            try
                            {
                                employee = new Employee(vIdEmployee, vName, vLastName, vEmail, vPhoto, vHiringDate, vSalary, vSexe,  vActive, vIdAgences);
                            }
                            catch
                            {
                                // Fallback: use default constructor and set public properties
                                employee = new Employee();
                               // employee.vNumber = vNumber;
                                employee.vName = vName;
                                employee.vLastName = vLastName;
                                employee.vEMail = vEmail;
                                employee.vPhoto = vPhoto;
                                employee.vHiringDate = vHiringDate;
                                employee.vSalary = vSalary;


                                employee.vSexe = vSexe;
                                employee.vActive = vActive;
                                
                                // vNip might be read-only; if it is, prefer the constructor approach above.
                            }
                            return employee;
                        }
                        else
                        {
                            return null; // Client not found
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error retrieving client: " + ex.Message);
                return null;
            }

        }

        public void CreateEmployee(Employee employee)
        {
            try
            {
                Command.Connection = Connection.OpenConnection();
                string sql = @"
                INSERT INTO temploye (nomdeFamille, nom, courriel, img, hiringDate, salary, sexe, active, idagences)
                VALUES (@Name, @LastName, @Email, @Photo, @HiringDate, @Salary, @Sexe, @Active, @Idagences)";
        using (SqlCommand cmd = new SqlCommand(sql, Command.Connection))
        {
            cmd.Parameters.AddWithValue("@Name", employee.vName);
            cmd.Parameters.AddWithValue("@LastName", employee.vLastName);
            cmd.Parameters.AddWithValue("@Email", employee.vEMail);
            cmd.Parameters.AddWithValue("@Photo", employee.vPhoto);
            
            DateTime hiringDateTime = new DateTime(employee.vHiringDate.vYear, employee.vHiringDate.vMonth, employee.vHiringDate.vDay);
            cmd.Parameters.AddWithValue("@HiringDate", hiringDateTime);
            
            cmd.Parameters.AddWithValue("@Salary", employee.vSalary);
            cmd.Parameters.AddWithValue("@Sexe", employee.vSexe);
            cmd.Parameters.AddWithValue("@Active", employee.vActive);
            cmd.Parameters.AddWithValue("@Idagences", employee.vIdAgences);
            cmd.ExecuteNonQuery();
        }
        Connection.CloseConnection();
    }
    catch (Exception ex)
    {
        MessageBox.Show("Error creating employee: " + ex.Message);
        Connection.CloseConnection();
    }
        }
        public void UpdateEmployee(Employee employee)
        {
            try
            {
                Command.Connection = Connection.OpenConnection();
                string sql = @"
                UPDATE temploye
                SET 
                    nomdeFamille = @Name,
                    nom = @LastName,
                    courriel = @Email,
                    img = @Photo,
                    hiringdate = @HiringDate,
                    salary = @Salary,
                    sexe = @Sexe,
                    active = @Active,
                    idagences = @IdAgences
                WHERE idemploye = @IdEmploye";
                using (SqlCommand cmd = new SqlCommand(sql, Command.Connection))
                {
                    cmd.Parameters.AddWithValue("@IdEmploye", employee.vId);
                    cmd.Parameters.AddWithValue("@Name", employee.vName);
                    cmd.Parameters.AddWithValue("@LastName", employee.vLastName);
                    cmd.Parameters.AddWithValue("@Email", employee.vEMail);
                    cmd.Parameters.AddWithValue("@Photo", employee.vPhoto);
                    
                    // Null check for vHiringDate
                    if (employee.vHiringDate != null)
                    {
                        DateTime hiringDateTime = new DateTime(employee.vHiringDate.vYear, employee.vHiringDate.vMonth, employee.vHiringDate.vDay);
                        cmd.Parameters.AddWithValue("@HiringDate", hiringDateTime);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@HiringDate", DBNull.Value);
                    }
                    
                    cmd.Parameters.AddWithValue("@Salary", employee.vSalary);
                    cmd.Parameters.AddWithValue("@Sexe", employee.vSexe);
                    cmd.Parameters.AddWithValue("@Active", employee.vActive);
                    cmd.Parameters.AddWithValue("@IdAgences", employee.vIdAgences);
                    cmd.ExecuteNonQuery();
                }
                Connection.CloseConnection(); // ADD THIS
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error updating employee: " + ex.Message);
                Connection.CloseConnection(); // ADD THIS in catch block too
            }
        }

        public string ReaderEmployee(int employeeNumber)
        {
            try
            {
                // 1. Execute open connection
                Command.Connection = Connection.OpenConnection();
                // 2. Execute Stored procedure
                Command.CommandText = "selectqclientByemployeeNumber";
                // 3. Execute command type
                Command.CommandType = CommandType.StoredProcedure;
                // 4. Execute parameter
                Command.Parameters.AddWithValue("@aemployeeNumber", employeeNumber);
                // 5 . Read Rows
                SqlDataReader Read;
                // 6. Excute read the rows from stored procedure
                Read = Command.ExecuteReader(); // to read rows - return rows
                // 7. Execute Load reader
                string reader;
                if (Read.Read() == true)
                {
                    reader = Read.GetString(Read.GetOrdinal("Employee"));
                }
                else
                {
                    reader = "";
                }
                // 8. Execute reuse the object AqlCommand Command
                Command.Parameters.Clear();
                // 9. Close connection
                Connection.CloseConnection();
                // 10. Make return
                return reader;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error in the Model executing the function ReaderEmployee : " + " " + ex.Message);
                return null;
            }


        }

        public void DeleteEmploye(int employeId)
        {
            try
            {
                Command.Connection = Connection.OpenConnection();
                string sql = "DELETE FROM temploye WHERE idemploye = @Idemploye";
                using (SqlCommand cmd = new SqlCommand(sql, Command.Connection))
                {
                    cmd.Parameters.AddWithValue("@Idemploye", employeId);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error deleting employe: " + ex.Message);
            }
        }
    }
}
