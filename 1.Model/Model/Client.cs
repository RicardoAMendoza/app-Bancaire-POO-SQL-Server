using _1.Model.Abstract_Class;
using _1.Model.Collections;
using Microsoft.Build.Framework;
using System;
using System.ComponentModel;
using System.Linq;
using System.ComponentModel.DataAnnotations;


namespace _1.Model.Model
{
    public class Client : Human
    {
       // Fields
        private string Address;
        private string Nip;
        private int Age;
        private string NumerodeCarte;
        private Employee Employee;
        private int IdAgences;
        private int IdEmploye;
        private int clientIdCounter;
        private static int staticNbcounter;

        // Dictionary
        private ListPaidAccounts listPaidAccounts = new ListPaidAccounts();
        private ListUnPaidAccounts listUnPaidAccounts = new ListUnPaidAccounts();


        public Client(ListPaidAccounts vlistPaidAccounts, ListUnPaidAccounts vlistUnPaidAccounts)
            : base()
        {
            listPaidAccounts = vlistPaidAccounts;
            listUnPaidAccounts = vlistUnPaidAccounts;
            clientIdCounter = ++staticNbcounter;
        }
        public Client(int vId, string vNumber, string vName, string vLastName, string vEMail, string vPhoto, string vAddress, 
            string vNumerodeCarte,  string vNip, string vSexe, int vAge, string vActive,   ListUnPaidAccounts vListUnPaidAccounts, ListPaidAccounts vListPaidAccounts)
           : base(vId,vNumber, vName, vLastName, vEMail, vPhoto, vSexe, vActive)
        {
            Client.staticNbcounter++;
            clientIdCounter = staticNbcounter;
            Address = vAddress;
            Nip = vNip;
            Age = vAge;
            NumerodeCarte = vNumerodeCarte;
            listUnPaidAccounts = vListUnPaidAccounts;
            listPaidAccounts = vListPaidAccounts;
        }

        public Client(int vId, string vNumber, string vName, string vLastName, string vEMail, string vPhoto, string vAddress, 
            string vNumerodeCarte, string vNip, string vSexe, int vAge, string vActive, int vIdAgences, int vIdEmploye)
            /// Inherit from Human
            : base(vId,vNumber, vName, vLastName, vEMail, vPhoto, vSexe, vActive)
        {
            Employee = new Employee();
            Address = vAddress;
            Nip = vNip;
            Age = vAge;
            IdEmploye = vIdEmploye;
            IdAgences = vIdAgences;

            NumerodeCarte = vNumerodeCarte;
            clientIdCounter = ++staticNbcounter;
        }  
        /// Employee Details
        public Client(int vId,string vNumber, string vName, string vLastName, string vEMail, string vPhoto, string vAddress, string vNumerodeCarte, string vNip, string vSexe, int vAge, string vActive,
            int vEmpId, string vEmpNumber, string vEmpName, string vEmpLastName, string vEmpEMail, string vEmpPhoto, Date vEmpHearingDate, Decimal vEmpSalary, string vEmpSexe, string vEmpActive, int vDay, int vMonth, int vYear)
           /// Inherit from Human
           : base(vId,vNumber, vName, vLastName, vEMail, vPhoto, vSexe, vActive)
        {
            Employee = new Employee(vEmpId, vEmpNumber, vEmpName, vEmpLastName, vEmpEMail, vEmpPhoto, vEmpHearingDate, vEmpSalary,vEmpSexe, vEmpActive, vDay, vMonth, vYear);
            Address = vAddress;
            Nip = vNip;
            Age = vAge;
            NumerodeCarte = vNumerodeCarte;
            clientIdCounter = ++staticNbcounter;
        }
        public Client()
            : base()
        {
            Employee = new Employee();
            Address = EmptyConstructor.stringEmptyConstructor();
            Nip = EmptyConstructor.stringEmptyConstructor();
            Age = EmptyConstructor.intEmptyConstructor();
            clientIdCounter = ++staticNbcounter;
        }
        public int vIdAgences
        {
            get { return IdAgences; }
            set { IdAgences = value; }
        } 
        public int vIdEmploye
        {
            get { return IdEmploye; }
            set { IdEmploye = value; }
        }
        public ListPaidAccounts vListPaidAccounts
        {
            get { return listPaidAccounts; }
            set { vListPaidAccounts = value; }
        }
        public ListUnPaidAccounts vListUnPaidAccounts
        {
            get { return listUnPaidAccounts; }
            set { vListUnPaidAccounts = value; }
        }
        public int vclientIdCounter
        {
            get { return clientIdCounter; }
            /// No set accessor: clientIdCounter is read-only and auto-incremented
        }
        public Employee vEmployee
        {
            get { return Employee; }
            set { Employee = value; }
        }
        public string vEmployeeDetails
        {
            get { return Employee.ShowHuman(); }
            // No set accessor: EmployeeDetails is derived from the Employee object
        }
        //[DisplayName("Pet Name")]
        //[Required(ErrorMessage = "Pet name is required")]
        //[StringLength(50, MinimumLength = 3, ErrorMessage = "Pet name must be between 3 and 50 characters")]
        public string vAddress
        {
            get { return Address; }
            set { Address = value; }
        }
        public string vNumerodeCarte
        {
            get { return NumerodeCarte; }
            set { NumerodeCarte = value; }
        }

        public string vNip
        {
            get { return Nip; }
            set { Nip = value; }
            // No set accessor: Nip can only be set in the constructor or internal methods
        }
        public int vAge
        {
            get { return Age; }
            set { Age = value; }
        }

        /// <summary>
        /// Creates a new human entity with the specified first name and last name.
        /// </summary>
        /// <remarks>This method overrides the base implementation to include additional initialization
        /// logic. Ensure that the provided names meet any validation requirements defined in the base class.</remarks>
        /// <param name="vName">The first name of the human to create. Cannot be null or empty.</param>
        /// <param name="vLastName">The last name of the human to create. Cannot be null or empty.</param>
        public override void CreateHuman(string vNumber, string vName, string vLastName, string vEMail, string vPhoto,  string vSexe,  string vActive)
        {
            //if (string.IsNullOrWhiteSpace(vName))
            //    throw new ArgumentException("First name cannot be null or empty.", nameof(vName));
            //if (string.IsNullOrWhiteSpace(vLastName))
            //    throw new ArgumentException("Last name cannot be null or empty.", nameof(vLastName));
            clientIdCounter = ++staticNbcounter;
            base.CreateHuman(vNumber, vName, vLastName, vEMail, vPhoto, vSexe, vActive);
            //  Employee = new Employee();
            Nip = vNip;
            Age = vAge;
            NumerodeCarte = vNumerodeCarte;
            Address = vAddress;
            
        }
        /// <summary>
        /// Returns a string representation of the human, including client-specific details.
        /// </summary>
        /// <remarks>This method overrides the base implementation to include additional information such
        /// as  the client ID, Nip ID, and address. The base human details are also included in the output.</remarks>
        /// <returns>A string containing the human's details, including the client ID, Nip ID, address, and  any additional
        /// information provided by the base implementation.</returns>
        public override string ShowHuman()
        {
            string info = "";
            info += "\n\nClient Id : " + clientIdCounter;
            info = base.ShowHuman();
            info += "\nNip Id : " + Nip + "\n";
            info += "\nAddress : " + Address;
            return info;
        }
        /// <summary>
        /// Validates the Nip according to custom rules.
        /// Example: Nip must be exactly 4 digits.
        /// </summary>
        /// <param name="Nip">The Nip string to validate.</param>
        /// <returns>True if valid, otherwise false.</returns>
        //public static bool ValidateNip(string Nip)
        //{
        //    // Example rule: Nip must be exactly 4 digits
        //    if (string.IsNullOrWhiteSpace(Nip)) return false;
        //    if (Nip.Length != 4) return false;
        //    return Nip.All(char.IsDigit);
        //}
    }
}
