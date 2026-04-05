using _1.Model.Abstract_Class;
using _1.Model.Collections;
using Microsoft.Build.Framework.XamlTypes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace _1.Model.Model
{
    public class Director : Human
    {
        private decimal Salary;
        private int directorIdCounter;
        private static int staticNbcounter;
        /// <summary>
        /// Initializes a new instance of the Director class with the specified number, name, last name, photo, and salary.
        /// </summary>
        /// <param name="vNumber"></param>
        /// <param name="vName"></param>
        /// <param name="vLastName"></param>
        /// <param name="vPhoto"></param>
        /// <param name="vSalary"></param>
        public Director(int vId,int vNumber, string vName, string vLastName, string vEMail, 
            string vPhoto,string vSexe, string vActive, decimal vSalary)
            : base(vId, vNumber, vName, vLastName, vEMail, vPhoto, vSexe,vActive)
        {
            directorIdCounter = ++staticNbcounter;
            Salary = vSalary;
        }
        public Director()
            : base()
        {
            directorIdCounter = ++staticNbcounter;
            Salary = EmptyConstructor.decimalEmptyConstructor();
        }
        public int vdirectorIdCounter
        {
            get { return directorIdCounter; }
            /// No set accessor: directorIdCounter is read-only and auto-incremented
        }
        public decimal vSalary
        {
            get { return Salary; }
            set { vSalary = value; }
        }

        /// <summary>
        /// Creates a new human with the specified first and last name.
        /// </summary>
        /// <remarks>This method overrides the base implementation to initialize additional properties 
        /// specific to the derived class before delegating to the base class.</remarks>
        /// <param name="vName">The first name of the human to create. Cannot be null or empty.</param>
        /// <param name="vLastName">The last name of the human to create. Cannot be null or empty.</param>
        public override void CreateHuman(int vNumber, string vName, string vLastName, string vEMail, string vPhoto, string vSexe, string vActive)
        {
            directorIdCounter = vdirectorIdCounter;
            base.CreateHuman( vNumber,  vName, vLastName,  vEMail, vPhoto, vSexe, vActive);
            Salary = vSalary;
        }
        /// <summary>
        /// Returns a formatted string containing the director's ID, full name, and salary.
        /// </summary>
        /// <returns>A string in the format "Director ID: {ID}, Name: {FirstName} {LastName}, Salary: {Salary}".</returns>
        public override string ShowHuman()
        {
            string info = "";
            info += "\nClient Number : " + base.ShowHuman();
            info = info + "\nActive : " + Salary;
            return info;
        }
    }
}
