using _1.Model.Collections;
using _1.Model.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _3.Control
{
    public static class CD_getLists
    {

        /// <summary>
        /// Provides data access and entity representation for Director records in the database.
        /// 1. CD_getConnection -> object connection with the data base
        /// </summary>
        private static CD_getConnection Connection = new CD_getConnection();
        // 2. Execute SQl
        private static SqlCommand Command = new SqlCommand();
        // 3 . Read Rows
        private static SqlDataReader Read;


        /// <summary>
        /// Retrieves a list of clients from the database.
        /// </summary>
        /// <remarks>The returned list includes all client records from the underlying data source. The
        /// method establishes and closes the database connection automatically. Callers are responsible for handling
        /// any exceptions related to database connectivity or data access as appropriate for their
        /// application.</remarks>
        /// <returns>A <see cref="ListClients"/> collection containing all clients found in the database. The collection will be
        /// empty if no clients are present.</returns>
        public static ListClients fncGetClientsFromDb()
        {
            ListClients listClients = new ListClients();
            const string sql = @"
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
            ";
            // 2. Execute open connection
            Command.Connection = Connection.OpenConnection();
            // Create and configure command
            using (var cmd = new System.Data.SqlClient.SqlCommand(sql, Command.Connection))
            {
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        // Client fields (null-safe)
                        int vId = reader["IDCLIENT"] != DBNull.Value ? Convert.ToInt32(reader["IDCLIENT"]) : 0;
                       
                       // string vNumber = reader["NUMBER"] as string ?? string.Empty;
                        string vName = reader["NAME"] as string ?? string.Empty;
                        string vLastName = reader["lastName"] as string ?? string.Empty;
                        string vEmail = reader["eMAIL"] as string ?? string.Empty;
                        string vPhoto = reader["PHOTO"] as string ?? string.Empty;
                        string vAddress = reader["ADDRESS"] as string ?? string.Empty;
                       // vNumerodeCarte
                        //string vNumerodeCarte = reader["CARD"] as string ?? string.Empty;
                        int vNumerodeCarte = reader["CARD"] != DBNull.Value ? Convert.ToInt32(reader["CARD"]) : 0;
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
                        listClients.Add(client);
                    }
                }
                Command.Connection = Connection.CloseConnection();
            }
            return listClients;
        }
        /// <summary>
        /// Retrieves a list of employees from the database.
        /// </summary>
        /// <remarks>Each employee in the returned collection contains information such as ID, name,
        /// email, photo, hiring date, salary, gender, and active status. The method establishes a database connection
        /// and reads all employee records from the underlying data source. Callers are responsible for handling any
        /// exceptions related to database connectivity or data access that may occur outside this method.</remarks>
        /// <returns>A <see cref="ListEmployees"/> collection containing all employees retrieved from the database. The
        /// collection will be empty if no employees are found.</returns>
        public static ListEmployees fncGetEmployeesFromDb()
        {
            ListEmployees listEmployees = new ListEmployees();
            const string sql = @"
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
            ";
            // 2. Execute open connection
            Command.Connection = Connection.OpenConnection();
            // Create and configure command
            using (var cmd = new System.Data.SqlClient.SqlCommand(sql, Command.Connection))
            {
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        // EMPLOYEE fields (null-safe)
                        int vId = reader["IDEMPLOYEE"] != DBNull.Value ? Convert.ToInt32(reader["IDEMPLOYEE"]) : 0;
                        
                        //string vNumber = reader["NUMBER"] as string ?? string.Empty;
                        string vName = reader["NAME"] as string ?? string.Empty;
                        string vLastName = reader["lastName"] as string ?? string.Empty;
                        string vEmail = reader["eMAIL"] as string ?? string.Empty;
                        string vPhoto = reader["PHOTO"] as string ?? string.Empty;
                        Date vHiringDate = null;
                        if (reader["HIRINGDATA"] != DBNull.Value)
                        {
                            DateTime dt = Convert.ToDateTime(reader["HIRINGDATA"]);
                            vHiringDate = new Date();
                            vHiringDate.vDay = dt.Day;
                            vHiringDate.vMonth = dt.Month;
                            vHiringDate.vYear = dt.Year;
                        } // Date type
                        decimal vSalary = reader["SALARY"] != DBNull.Value ? Convert.ToDecimal(reader["SALARY"]) : 0;  // Money type
                        string vSexe = reader["SEXE"] as string ?? string.Empty;
                        string vActive = reader["ACTIVE"] as string ?? string.Empty;
                        // idagencies
                        int vIdAgences = reader["IDAGENCE"] != DBNull.Value ? Convert.ToInt32(reader["IDAGENCE"]) : 0;
                        Employee employee;
                        try
                        {
                            employee = new Employee(vId, vName, vLastName, vEmail, vPhoto, vHiringDate, vSalary, vSexe, vActive, vIdAgences);
                        }
                        catch
                        {
                            // Fallback: use default constructor and set public properties
                            employee = new Employee();
                            employee.vName = vName;
                            employee.vLastName = vLastName;
                            employee.vEMail = vEmail;
                            employee.vPhoto = vPhoto;
                            employee.vHiringDate=null;
                            employee.vSexe = vSexe;
                            employee.vActive = vActive;
                            
                            // vNip might be read-only; if it is, prefer the constructor approach above.
                        }
                        listEmployees.Add(employee);
                    }
                }
                // Connection.CloseConnection();
                Command.Connection = Connection.CloseConnection();
            }
            return listEmployees;
        }

        public static ListAgencies fncGetAgencesFromDb()
        {
            ListAgencies listAgencies = new ListAgencies();
            const string sql = @"
                SELECT
                    c.idagences AS IDAGENCE,
              
                    c.nom AS NAME,
                    c.adresse AS ADDRESS,
                    c.idbanque AS IDBANQUE
                FROM tagences c
            ";
            // 2. Execute open connection
            Command.Connection = Connection.OpenConnection();
            // Create and configure command
            using (var cmd = new System.Data.SqlClient.SqlCommand(sql, Command.Connection))
            {
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        // Agency fields (null-safe)
                        int vId = reader["IDAGENCE"] != DBNull.Value ? Convert.ToInt32(reader["IDAGENCE"]) : 0;
                       // string vNumber = reader["NUMBER"] as string ?? string.Empty;
                        
                        string vName = reader["NAME"] as string ?? string.Empty;
                        string vAddress = reader["ADDRESS"] as string ?? string.Empty;
                        // [idbanque]
                        int vIdBanque = reader["IDBANQUE"] != DBNull.Value ? Convert.ToInt32(reader["IDBANQUE"]) : 0;
                        Agency agency;
                        try
                        {
                            agency = new Agency(vId, vName, vAddress, vIdBanque);
                        }
                        catch
                        {
                            // Fallback: use default constructor and set public properties
                            agency = new Agency();
                            agency.vIdAgency = vId;
                        
                            agency.vAgencyName = vName;
                            agency.vAgencyAddress = vAddress;
                            agency.vIdBanque = vIdBanque;
                            // vNip might be read-only; if it is, prefer the constructor approach above.
                        }
                        listAgencies.Add(agency);
                    }
                }
                Command.Connection = Connection.CloseConnection();
            }
            return listAgencies;
        }
    }
}
