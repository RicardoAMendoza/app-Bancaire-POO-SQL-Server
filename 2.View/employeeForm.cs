using _3.Control;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _2.View
{
    public partial class employeeForm : Form
    {
        public employeeForm()
        {
            InitializeComponent();
            ReadEmployee();
        }

        private void ReadEmployee()
        {
            // agregar int id.
            DataTable datatable = new DataTable();
            datatable.Columns.Add("ID");
            datatable.Columns.Add("NAME");
            datatable.Columns.Add("lastName");
            datatable.Columns.Add("eMAIL");
            datatable.Columns.Add("PHOTO");
            datatable.Columns.Add("HIRINGDATA");
            datatable.Columns.Add("SALARY");
            datatable.Columns.Add("SEXE");
            datatable.Columns.Add("ACTIVE");
            datatable.Columns.Add("IDAGENCE");

            /// Get employees from listEmployees
            var employees = CD_getLists.fncGetEmployeesFromDb();

            foreach (var employee in employees.Elements)
            {
                DataRow row = datatable.NewRow();
                row["ID"] = employee.vId;
                row["NAME"] = employee.vName;
                row["lastName"] = employee.vLastName;
                row["eMAIL"] = employee.vEMail;
                row["PHOTO"] = employee.vPhoto;
                row["HIRINGDATA"] = employee.vHiringDate;
                row["SALARY"] = employee.vSalary;
                row["SEXE"] = employee.vSexe;
                row["ACTIVE"] = employee.vActive;
                row["IDAGENCE"] = employee.vIdAgences;
                datatable.Rows.Add(row);
            }
            this.gridViewemployeesTable.DataSource = datatable;
        }

        private void butAddEmployee_Click(object sender, EventArgs e)
        {
            CreateandEditEmployee form = new CreateandEditEmployee();
            if (form.ShowDialog() == DialogResult.OK)
            {
                // Refresh the clients list after adding a new client
                ReadEmployee();
            }
        }

        private void butUpdateEmployee_Click(object sender, EventArgs e)
        {
            // Fix: Remove extra dot and brackets, use correct property names
            if (gridViewemployeesTable.SelectedRows.Count == 0)
            {
                MessageBox.Show("Please select a employee to edit.");
                return;
            }
            var val = this.gridViewemployeesTable.SelectedRows[0].Cells[0].Value?.ToString();
            if (string.IsNullOrEmpty(val))
                return;
            int employeeId = int.Parse(val);

            var obj = new CD_getData();
            var employee = obj.GetEmployeeById(employeeId);

            if (employee == null)
            {
                MessageBox.Show("Employee not found.");
                return;
            }

            CreateandEditEmployee form = new CreateandEditEmployee();
            form.Editemployee(employee);
            if (form.ShowDialog() == DialogResult.OK)
            {
                // Refresh the clients list after updating a client
                ReadEmployee();
            }
        }

        private void butDeleteEmployee_Click(object sender, EventArgs e)
        {
            // Fix: Remove extra dot and brackets, use correct property names
            if (gridViewemployeesTable.SelectedRows.Count == 0)
            {
                MessageBox.Show("Please select an employee to delete.");
                return;
            }
            var val = this.gridViewemployeesTable.SelectedRows[0].Cells[0].Value?.ToString();
            if (string.IsNullOrEmpty(val))
                return;
            int employeId = int.Parse(val);

            DialogResult result = MessageBox.Show("Are you sure you want to delete this employe?",
                "Confirm Deletion", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (result == DialogResult.No)
            {
                return;
            }
            else
            {
                var obj = new CD_getData();
                obj.DeleteEmploye(employeId);
                ReadEmployee();
            }
        }
    }
}
