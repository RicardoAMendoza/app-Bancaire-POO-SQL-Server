using _1.Model.Model;
using _1.Model.Model.IModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1.Model.Collections
{
    public class ListEmployees : IModelLists
    {
        /// <summary>
        /// Manages a collection of Employee objects, providing methods to add, remove, find, and display employees.
        /// </summary>
        private Dictionary<int, Employee> listEmployees;
        /// <summary>
        /// Initializes a new instance of the <see cref="ListEmployees"/> class with an empty collection of employees.
        /// </summary>
        public ListEmployees()
        {
            listEmployees = new Dictionary<int, Employee>();
        }
        /// <summary>
        /// Gets or sets the collection of employees, indexed by their unique identifiers.
        /// </summary>
        public Dictionary<int, Employee> vlistEmployees
        {
            get { return listEmployees; }
            set { listEmployees = value; }
        }
        /// <summary>
        /// Gets the total number of employees in the collection.
        /// </summary>
        public int Quantity
        {
            get { return listEmployees.Values.Count; }
        }
        /// <summary>
        /// Gets a collection containing the values of all employees in the dictionary.
        /// </summary>
        public Dictionary<int, Employee>.ValueCollection Elements
        {
            get { return listEmployees.Values; }
        }

        /// <summary>
        /// Determines whether an employee with the specified employee number exists in the collection.
        /// </summary>
        /// <param name="employeeNumber">The unique identifier of the employee to locate.</param>
        /// <returns><see langword="true"/> if an employee with the specified employee number exists; otherwise, <see
        /// langword="false"/>.</returns>
        public bool Exist(int employeeNumber)
        {
            return listEmployees.ContainsKey(employeeNumber);
        }
        /// <summary>
        /// Finds and returns an employee based on the specified employee number.
        /// </summary>
        /// <param name="employeeNumber">The unique identifier of the employee to find. Cannot be null or empty.</param>
        /// <returns>The <see cref="Employee"/> object associated with the specified employee number,  or <see langword="null"/>
        /// if no employee with the given number exists.</returns>
        object IModelLists.Find(int employeeNumber)
        {
            if (Exist(employeeNumber))
            {
                return listEmployees[employeeNumber];
            }
            else
            {
                // if there is not object return null
                return null;
            }
        }
        /// <summary>
        /// Adds a new employee to the collection if the employee does not already exist.
        /// </summary>
        /// <param name="employee">The employee to add. The employee's <see cref="Employee.vNumber"/> must be unique.</param>
        /// <exception cref="Exception"></exception>
        public bool Add(object obj)
        {
            Employee employee = (Employee)obj;
            if (!Exist(employee.vNumber))
            {
                 listEmployees.Add(employee.vNumber, employee); return true;
            }
            else
            {
                throw new Exception("Employee already exists");
            }
        }
        public bool Update(int cemployeeNumber, object obj)
        {
            Employee employee = (Employee)obj;
            if (Exist(cemployeeNumber))
            {
                listEmployees[cemployeeNumber] = employee;
                return true;
            }
            return false;
        }
        public bool Delete(int employeeNumber)
        {
            /// Remove an employee from the collection by their employee number.
            if (Exist(employeeNumber))
            {
                return listEmployees.Remove(employeeNumber);
            }
            else
            {
                return false;
            }
        }
        public void Clear()
        {
            listEmployees.Clear();
        }
        /// <summary>
        ///  Displays a list of all employees in the collection.
        /// </summary>
        /// <returns></returns>
        public string ShowList()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("List of Employees:");
            foreach (var emp in listEmployees.Values)
            {
                sb.AppendLine(emp.ShowHuman());
            }
            return sb.ToString();
        }
    }
}
