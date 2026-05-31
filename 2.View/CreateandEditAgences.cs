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
    public partial class CreateandEditAgences : Form
    {
        public static BanqueNationaleduQuebec BanqueNationaleduQuebec = new BanqueNationaleduQuebec();
        public static CD_getData obj = new CD_getData();
        public CreateandEditAgences()
        {
            InitializeComponent();
            this.DialogResult = DialogResult.Cancel;
        }

        private void CreateandEditAgences_Load(object sender, EventArgs e)
        {

        }

        private int agencyId = 0;
        /// <summary>
        /// Populates the agency editing form fields with the data from the specified agency.
        /// </summary>
        /// <param name="agency">The agency whose information is used to populate the form fields. Cannot be null.</param>
        public void EditAgency(Agency agency)
        {
            this.Text = "Edit Agency";
            this.labeID.Text = "Edit Agency";
            this.labeID.Text = " ID: " + agency.vIdAgency.ToString();
            this.textBoxName.Text = agency.vAgencyName;
            this.textBoxAddress.Text = agency.vAgencyAddress;
            //ID
            this.textBoxIdBanque.Text = agency.vIdBanque.ToString();
            this.agencyId = agency.vIdAgency;
        }

        private void buttonSave_Click(object sender, EventArgs e)
        {
            // Validate input fields
            if (string.IsNullOrWhiteSpace(textBoxName.Text))
            {
                MessageBox.Show("Please enter an agency name.", "Validation Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                textBoxName.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(textBoxAddress.Text))
            {
                MessageBox.Show("Please enter an agency address.", "Validation Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                textBoxAddress.Focus();
                return;
            }

            if (!int.TryParse(textBoxIdBanque.Text, out int bankId))
            {
                MessageBox.Show("Please enter a valid bank ID.", "Validation Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                textBoxIdBanque.Focus();
                return;
            }

            try
            {
                // Create or update agency object
                var agency = new Agency
                {
                    vIdAgency = this.agencyId, // 0 for new, existing ID for edit
                    vAgencyName = textBoxName.Text.Trim(),
                    vAgencyAddress = textBoxAddress.Text.Trim(),
                    vIdBanque = bankId
                };

                // TODO: Call your business logic layer to save the agency
                // Example: agencyService.SaveAgency(agency);

                // Add to list and set DialogResult based on outcome
                bool added = false;
                if (BanqueNationaleduQuebec.vListAgencies != null)
                {
                    try
                    {
                        // ListClients.Add returns bool according to signature
                      //  added = BanqueNationaleduQuebec.vListAgencies.Add(agency);
                        added = BanqueNationaleduQuebec.vListAgencies.Add(agency);

                        if (agency.vIdAgency == 0)
                            obj.CreateAgence(agency);  // New client → INSERT
                        else
                            obj.UpdateAgence(agency);  // Existing → UPDATE

                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show($"Error adding client: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        added = false;
                    }
                }

                if (added)
                {
                    this.DialogResult = DialogResult.OK;
                }
                else
                {
                    // Set to Cancel here
                    this.DialogResult = DialogResult.Cancel;
                }
                this.DialogResult = DialogResult.OK;  // ❌ This always runs, defeating the logic above!
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error saving agency: {ex.Message}", "Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
