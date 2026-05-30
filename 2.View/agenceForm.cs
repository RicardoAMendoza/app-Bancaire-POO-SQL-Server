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
    public partial class agenceForm : Form
    {
        public agenceForm()
        {
            InitializeComponent();
            ReadAgence();
        }

        private void ReadAgence()
        {
            // agregar int id.
            DataTable datatable = new DataTable();
            datatable.Columns.Add("IDAGENCE");
            datatable.Columns.Add("NUMBER");
            datatable.Columns.Add("NAME");   
            datatable.Columns.Add("ADDRESS");  
            // ID
            datatable.Columns.Add("IDBANQUE");

            // object CD_getData
            var model = new CD_getData();
            /// Get agencies from listAgences
            var agencies = CD_getLists.fncGetAgencesFromList();

            foreach (var agency in agencies.Elements)
            {
                DataRow row = datatable.NewRow();
                row["IDAGENCE"] = agency.vIdAgency;
                row["NAME"] = agency.vAgencyName;
                row["ADDRESS"] = agency.vAgencyAddress;
                // ID
                row["IDBANQUE"] = agency.vIdBanque;
                datatable.Rows.Add(row);
            }
            this.gridViewagencesTable.DataSource = datatable;
        }

        private void butDeleteAgence_Click(object sender, EventArgs e)
        {
            // Fix: Remove extra dot and brackets, use correct property names
            if (gridViewagencesTable.SelectedRows.Count == 0)
            {
                MessageBox.Show("Please select an AGENCE TO DELETE.");
                return;
            }
            var val = this.gridViewagencesTable.SelectedRows[0].Cells[0].Value?.ToString();
            if (string.IsNullOrEmpty(val))
                return;
            int agenceId = int.Parse(val);

            DialogResult result = MessageBox.Show("Are you sure you want to delete this AGENCE?",
                "Confirm Deletion", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (result == DialogResult.No)
            {
                return;
            }
            else
            {
                var obj = new CD_getData();
                obj.DeleteAgence(agenceId);
                ReadAgence();
            }
        }

        private void butAddAgence_Click(object sender, EventArgs e)
        {
            CreateandEditAgences form = new CreateandEditAgences();
            if (form.ShowDialog() == DialogResult.OK)
            {
                // Refresh the clients list after adding a new client
                ReadAgence();
            }
        }

        private void butUpdateAgence_Click(object sender, EventArgs e)
        {
            // Fix: Remove extra dot and brackets, use correct property names
            if (gridViewagencesTable.SelectedRows.Count == 0)
            {
                MessageBox.Show("Please select an agence to edit.");
                return;
            }
            var val = this.gridViewagencesTable.SelectedRows[0].Cells[0].Value?.ToString();
            if (string.IsNullOrEmpty(val))
                return;
            int agenceId = int.Parse(val);

            var obj = new CD_getData();
            var agency = obj.GetAgenceById(agenceId);

            if (agency == null)
            {
                MessageBox.Show("Agence not found.");
                return;
            }

            CreateandEditAgences form = new CreateandEditAgences();
            form.EditAgency(agency);
            if (form.ShowDialog() == DialogResult.OK)
            {
                // Refresh the clients list after updating a client
                ReadAgence();
            }
        }
    }
}
