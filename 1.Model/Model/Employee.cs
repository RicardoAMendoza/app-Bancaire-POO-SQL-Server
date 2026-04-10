using _1.Model.Abstract_Class;
using _1.Model.Collections;
using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1.Model.Model
{
    public class Employee : Human
    {

        // Fields
        private Date HiringDate;
        private Decimal Salary;
        private int IdAgences;
        /// <summary>
        /// Unique to Each Instance:
        /// </summary>
        private int employeeIdCounter;
        /// <summary>
        /// Shared Across Instances: 
        /// For static fields, there is only one copy of that field, 
        /// shared by all instances of the class.  
        /// </summary>
        /// <remarks>Any changes to a static field are reflected across all instances. 
        /// In contrast, each instance of a class has its own separate copy of non-static (instance) fields.</remarks>
        private static int staticNbcounter;

        // Dictionary
        private ListClients listClients = new ListClients();

       public Employee(ListClients vlistClients)
            : base()
        {
            listClients = vlistClients;
            employeeIdCounter = ++staticNbcounter;
        }

        public ListClients vlistClients
        {
            get { return listClients; }
            set { listClients = value; }
        }
        /// <summary>
        /// Initializes a new instance of the <see cref="Employee"/> class with the specified details.
        /// </summary>
        /// <remarks>This constructor assigns a unique employee ID and updates the total number of
        /// employees.</remarks>
        /// <param name="vId">The unique identifier for the employee.</param>
        /// <param name="vName">The first name of the employee.</param>
        /// <param name="vLastName">The last name of the employee.</param>
        /// <param name="vPhoto">The file path or URL of the employee's photo.</param>
        /// <param name="vHiringDate">The date the employee was hired.</param>
        public Employee(int vId, string vName, string vLastName, string vEMail,string vPhoto, Date vHiringDate,Decimal vSalary,
                        string vSexe,string vActive, int vDay, int vMonth, int vYear)
                        : base(vId, vName, vLastName, vEMail, vPhoto, vSexe, vActive)
        {
            Salary = vSalary;
            HiringDate = new Date(vDay, vMonth, vYear);
            employeeIdCounter = ++staticNbcounter;
        }
        /// <summary>
        /// Initializes a new instance of the <see cref="Employee"/> class.
        /// </summary>
        /// <remarks>This constructor sets the <see cref="HiringDate"/> to the current date and assigns a
        /// unique employee ID.</remarks>
        public Employee()
            : base()
        {
            Salary = 0;
            HiringDate = new Date();
            employeeIdCounter = ++staticNbcounter;
        }
        public Employee(int vId, string vName, string vLastName, string vEMail, string vPhoto, Date vHiringDate,Decimal vSalary, string vSexe, string vActive, int vIdAgences)
           : base(vId, vName, vLastName, vEMail, vPhoto, vSexe, vActive)
        {
            Salary = vSalary;
            HiringDate = vHiringDate;
            IdAgences = vIdAgences;
            employeeIdCounter = ++staticNbcounter;
        }
        /// Properties
        public int vIdAgences
        {
            get { return IdAgences; }
            set { IdAgences = value; }
        }
        public Date vHiringDate
        {
            get { return HiringDate; }
            set { HiringDate = value; }
        }
        public Decimal vSalary
        {
            get { return Salary; }
            set { Salary = value; }
        }
        public int vemployeeIdCounter
        {
            get { return employeeIdCounter; }
            // No setter for employeeIdCounter to prevent external modification
        }
        public static int vstaticNbcounter
        {
            get { return staticNbcounter; }
            // No setter for staticNbcounter to prevent external modification
        }

        /// <summary>
        /// Returns a string representation of the human, including hiring date and employee ID.
        /// </summary>
        /// <remarks>The returned string includes the base human information, followed by the hiring date
        /// in the format  "day/month/year" and the employee ID. This method overrides the base implementation to append
        /// employee-specific details.</remarks>
        /// <returns>A string containing the human's details, including the hiring date and employee ID.</returns>
        public override string ShowHuman()
        {
            string info = "";
            /// Call the base class method to get basic human info
            info = base.ShowHuman();
            /// Append employee-specific details
            info += $"Hiring Date: {HiringDate.vDay}/{HiringDate.vMonth}/{HiringDate.vYear}\n";
            info += $"Employee ID: {employeeIdCounter}\n";
            return info;
        }
        public override void CreateHuman(int vNumber, string vName, string vLastName, string vEMail, string vPhoto, string vSexe, string vActive)
        {
            /// Assign a unique employee ID when creating a new human
            employeeIdCounter = ++staticNbcounter;
            /// Update the total number of employees
            base.CreateHuman(vNumber, vName,  vLastName,  vEMail,  vPhoto,  vSexe,  vActive);
            HiringDate = vHiringDate;
        }
    }
}
