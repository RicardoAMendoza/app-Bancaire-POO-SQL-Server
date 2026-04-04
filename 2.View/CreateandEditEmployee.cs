using _1.Model.Model;
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

    public partial class CreateandEditEmployee : Form
    {
        public static Agency agency = new Agency();
        public static CD_getData obj = new CD_getData();
        public CreateandEditEmployee()
        {
            InitializeComponent();
            this.DialogResult = DialogResult.Cancel;
        }

        private int employeeId = 0;
        /* Plan (pseudocode):
           1. Replace the existing `Ediemployee` method to ensure `Date` and `Decimal` values are converted to strings
              before assigning them to text boxes.
           2. For the `vHiringDate` (type `Date`):
              - If `employee.vHiringDate` is not null, call its `ShowDate()` method to obtain a "day/month/year" string.
              - Otherwise use an empty string.
           3. For the `vSalary` (type `Decimal`):
              - Convert to string using the current culture to preserve decimal separators/formatting.
           4. Preserve all other assignments and set the internal `employeeId`.
        */

        public void Editemployee(Employee employee)
        {
            this.Text = "Edit employee";
            this.labelEmployeeID.Text = "Edit employee";
            this.labeID.Text = " ID: " + employee.vId.ToString();

            this.textBoxNumber.Text = employee.vNumber;
            this.textBoxName.Text = employee.vName;
            this.textBoxLastName.Text = employee.vLastName;
            this.textBoxEMail.Text = employee.vEMail;
            this.textBoxImagen.Text = employee.vPhoto;

            // Convert Date -> string using ShowDate(), handle null
            this.textBoxHiringDate.Text = employee.vHiringDate != null
                ? employee.vHiringDate.ShowDate()
                : string.Empty;

            // Convert Decimal -> string using current culture
            this.textBoxSalary.Text = employee.vSalary.ToString(System.Globalization.CultureInfo.CurrentCulture);

            this.textBoxSexe.Text = employee.vSexe;
            this.textBoxActive.Text = employee.vActive;

            this.employeeId = employee.vId;
        }
        private void buttonSave_Click(object sender, EventArgs e)
        {
            /* Detailed plan / pseudocode:
               1. Read and trim input values from textboxes safely.
               2. Validate required fields (employee number).
               3. Duplicate check via agency.vListEmployees.Exist(number).
               4. Parse the hiring date textbox into the project's Date type:
                  - If textbox is empty -> use new Date() (defaults to today).
                  - Try DateTime.TryParseExact with common formats ("d/M/yyyy","dd/MM/yyyy","yyyy-MM-dd","M/d/yyyy","MM/dd/yyyy").
                  - If that fails, fall back to DateTime.TryParse.
                  - If still fails, attempt to split by non-digits and parse day/month/year parts.
                  - If parsing succeeds create new Date(day, month, year); otherwise use new Date().
               5. Parse salary text into decimal using culture-aware parsing and fallbacks.
               6. Create Employee instance and set its vHiringDate and vSalary to parsed values.
               7. Add to list and call Createemployee/Updateemployee as before.
               This keeps conversion safe and robust against common input formats.
            */

            // Safe reads
            string number = this.textBoxNumber.Text?.Trim() ?? string.Empty;
            string name = this.textBoxName.Text?.Trim() ?? string.Empty;
            string lastName = this.textBoxLastName.Text?.Trim() ?? string.Empty;

            // Basic validation
            if (string.IsNullOrEmpty(number))
            {
                MessageBox.Show("Please enter a employee number.", "Validation", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                this.DialogResult = DialogResult.Cancel;
                return;
            }

            // Duplicate check
            if (agency.vListEmployees != null && agency.vListEmployees.Exist(number))
            {
                MessageBox.Show($"A employee with number '{number}' already exists.", "Duplicate", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.DialogResult = DialogResult.Cancel;
                return;
            }

            // Parse hiring date into project's Date type
            Date hiringDateObj;
            string hiringText = this.textBoxHiringDate.Text?.Trim() ?? string.Empty;

            if (string.IsNullOrWhiteSpace(hiringText))
            {
                hiringDateObj = new Date(); // default/current date
            }
            else
            {
                System.DateTime dt;
                string[] formats = new[] { "d/M/yyyy", "dd/MM/yyyy", "yyyy-MM-dd", "M/d/yyyy", "MM/dd/yyyy" };
                var culture = System.Globalization.CultureInfo.InvariantCulture;

                if (System.DateTime.TryParseExact(hiringText, formats, culture, System.Globalization.DateTimeStyles.None, out dt)
                    || System.DateTime.TryParse(hiringText, culture, System.Globalization.DateTimeStyles.None, out dt))
                {
                    hiringDateObj = new Date(dt.Day, dt.Month, dt.Year);
                }
                else
                {
                    // Fallback: split by non-digits and try to parse components
                    try
                    {
                        var parts = System.Text.RegularExpressions.Regex.Split(hiringText, @"\D+")
                            .Where(p => !string.IsNullOrEmpty(p)).ToArray();
                        if (parts.Length >= 3)
                        {
                            int p1, p2, p3;
                            // Heuristic: if first part looks like year (4 digits), assume yyyy[sep]MM[sep]dd
                            if (parts[0].Length == 4 && int.TryParse(parts[0], out p1) && int.TryParse(parts[1], out p2) && int.TryParse(parts[2], out p3))
                            {
                                hiringDateObj = new Date(p3, p2, p1); // day, month, year
                            }
                            else if (int.TryParse(parts[0], out p1) && int.TryParse(parts[1], out p2) && int.TryParse(parts[2], out p3))
                            {
                                // assume day/month/year
                                hiringDateObj = new Date(p1, p2, p3);
                            }
                            else
                            {
                                hiringDateObj = new Date();
                            }
                        }
                        else
                        {
                            hiringDateObj = new Date();
                        }
                    }
                    catch
                    {
                        hiringDateObj = new Date();
                    }
                }
            }

            // Parse salary into decimal (monetary) type
            decimal salaryValue = 0m;
            string salaryText = this.textBoxSalary.Text?.Trim() ?? string.Empty;
            if (!string.IsNullOrEmpty(salaryText))
            {
                // Try current culture and invariant culture with currency/number styles
                var tried = false;
                tried = System.Decimal.TryParse(salaryText, System.Globalization.NumberStyles.Currency | System.Globalization.NumberStyles.Number, System.Globalization.CultureInfo.CurrentCulture, out salaryValue);
                if (!tried)
                {
                    tried = System.Decimal.TryParse(salaryText, System.Globalization.NumberStyles.Currency | System.Globalization.NumberStyles.Number, System.Globalization.CultureInfo.InvariantCulture, out salaryValue);
                }

                if (!tried)
                {
                    // Clean string and apply heuristics
                    try
                    {
                        var cleaned = System.Text.RegularExpressions.Regex.Replace(salaryText, @"[^\d\.,\-]", string.Empty);

                        if (string.IsNullOrWhiteSpace(cleaned))
                        {
                            salaryValue = 0m;
                        }
                        else if (cleaned.Contains(",") && cleaned.Contains("."))
                        {
                            // If both present, assume the last one is decimal separator.
                            var lastDot = cleaned.LastIndexOf('.');
                            var lastComma = cleaned.LastIndexOf(',');
                            if (lastDot > lastComma)
                            {
                                // '.' is decimal separator -> remove commas (thousands)
                                cleaned = cleaned.Replace(",", string.Empty);
                                System.Decimal.TryParse(cleaned, System.Globalization.NumberStyles.Number, System.Globalization.CultureInfo.InvariantCulture, out salaryValue);
                            }
                            else
                            {
                                // ',' is decimal separator -> remove dots (thousands) and replace comma with '.'


                                cleaned = cleaned.Replace(".", string.Empty).Replace(',', '.');
                                System.Decimal.TryParse(cleaned, System.Globalization.NumberStyles.Number, System.Globalization.CultureInfo.InvariantCulture, out salaryValue);
                            }
                        }
                        else if (cleaned.Contains(","))
                        {
                            // Only comma present -> assume it's decimal separator
                            var alt = cleaned.Replace(',', '.');
                            System.Decimal.TryParse(alt, System.Globalization.NumberStyles.Number, System.Globalization.CultureInfo.InvariantCulture, out salaryValue);
                        }
                        else
                        {
                            // Only dot or only digits -> try invariant parse
                            System.Decimal.TryParse(cleaned, System.Globalization.NumberStyles.Number, System.Globalization.CultureInfo.InvariantCulture, out salaryValue);
                        }
                    }
                    catch
                    {
                        salaryValue = 0m;
                    }
                }
            }
            else
            {
                salaryValue = 0m;
            }

            // Create and populate employee
            var employee = new Employee()
            {
                vId = this.employeeId,
                vNumber = number,
                vName = name,
                vLastName = lastName,
                vEMail = this.textBoxEMail.Text?.Trim() ?? string.Empty,
                vPhoto = this.textBoxImagen.Text?.Trim() ?? string.Empty,
                vHiringDate = hiringDateObj,
                vSalary = salaryValue, // monetary type (decimal)
                vSexe = this.textBoxSexe.Text?.Trim() ?? string.Empty,
                vActive = this.textBoxActive.Text?.Trim() ?? string.Empty
            };

            // Add to list and set DialogResult based on outcome
            bool added = false;
            if (agency.vListEmployees != null)
            {
                try
                {
                    // Listemployees.Add returns bool according to signature
                    added = agency.vListEmployees.Add(employee);

                    if (employee.vId == 0)
                    {
                        // Additionally, call Createemployee if needed, saved in database
                       obj.CreateEmployee(employee);
                    }
                    else
                    {  // If editing existing employee, update in database
                       obj.UpdateEmployee(employee);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error adding employee: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    added = false;
                }
            }

            if (added)
            {
                this.DialogResult = DialogResult.OK;
            }
            else
            {
                MessageBox.Show("The employee could not be added.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                this.DialogResult = DialogResult.Cancel;
            }
        } // end Add one employee in the li

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
        }
    }
}
