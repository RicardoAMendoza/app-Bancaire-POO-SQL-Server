using _1.Model.Model;
using _3.Control;
using System;
using System.Data.SqlClient;
using System.Dynamic;
using System.Security.Cryptography;
using System.Windows.Forms;

namespace _2.View
{
    public partial class CreateandEditClient : Form
    {
        public static Agency agency = new Agency();
        public static CD_getData obj = new CD_getData();


        /// <summary>
        /// Provides data access and entity representation for Director records in the database.
        /// 1. CD_getConnection -> object connection with the data base
        /// </summary>
        private static CD_getConnection Connection = new CD_getConnection();
        // 2. Execute SQl
        private static SqlCommand Command = new SqlCommand();
        // 3 . Read Rows
        private static SqlDataReader Read;

        // static variables employee
        static string stringdbaseemployee;
        static string stringcmboxemployee;

        public static CD_getInfo Controller = new CD_getInfo();

        public CreateandEditClient()
        {
            InitializeComponent();
            this.DialogResult = DialogResult.Cancel;
        }
        private void CreateandEditClient_Load(object sender, EventArgs e)
        {
            try
            {
                SqlConnection cn = new SqlConnection( "Data Source = .; DataBase = bdLaBanqueNationaleduQuebec; Integrated Security = true");
                SqlCommand cm = new SqlCommand(" Select number FROM temployee ", cn);
                cn.Open();
                SqlDataReader dr = cm.ExecuteReader();
                 while (dr.Read())
                {
                    cmbEmployees.Items.Add(dr.GetString(1));
                }
                 dr.Close();
                 cn.Close();
                //ListEmployees();
                stringdbaseemployee = null;
                stringcmboxemployee = null;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error loading employees: " + ex.Message);
            }
        }

        public void ListEmployees()
        {
            cmbEmployees.DisplayMember = "";
            cmbEmployees.ValueMember = "";
        }


        private int clientId = 0;
        /// <summary>
        /// Populates the client editing form fields with the data from the specified client.
        /// </summary>
        /// <param name="client">The client whose information is used to populate the form fields. Cannot be null.</param>
        public void EditClient(Client client)
        {
            this.Text = "Edit Client";
            this.labelClientID.Text = "Edit Client";
            this.labeID.Text = " ID: " + client.vId.ToString();
            this.textBoxName.Text = client.vName;
            this.textBoxLastName.Text = client.vLastName;
            this.textBoxEMail.Text = client.vEMail;
            this.textBoxImagen.Text = client.vPhoto;
            this.textBoxAddresse.Text = client.vAddress;
            //this.textBoxCard.Text = client.vNumerodeCarte;
            this.textBoxCard.Text = client.vNumerodeCarte.ToString();
            this.textBoxNIP.Text = client.vNip;
            this.textBoxSexe.Text = client.vSexe;
            this.textBoxAge.Text = client.vAge.ToString();
            this.textBoxActive.Text = client.vActive;
            //ID
            this.textBoxIdAgence.Text = client.vIdAgences.ToString();
            this.textBoxIdEmploye.Text = client.vIdEmploye.ToString();

            this.clientId = client.vId;
        }

        private void buttonSave_Click(object sender, EventArgs e)
        {
            /* Pseudocode / Plan:
               1. Read and trim input values from textboxes safely (null-check).
               2. Validate required fields (client number) and numeric field (age) using TryParse.
               3. Check for duplicate client via agency.vListClients.Exist(number). If exists, show message and return.
               4. Populate a new Client instance's properties with sanitized values.
               5. Attempt to add the client to the list (vListClients.Add returns bool). If add succeeds set DialogResult = OK, otherwise show error and keep Cancel.
               6. Use MessageBox to inform the user for validation failures or duplicate entries.
               This approach avoids Convert.ToInt32 (which can throw) and ensures clear validation and no syntax issues.
            */

            // Safe reads
            string name = this.textBoxName.Text?.Trim() ?? string.Empty;
            string lastName = this.textBoxLastName.Text?.Trim() ?? string.Empty;

            // Parse age safely
            int ageValue = 0;
            string ageText = this.textBoxAge.Text?.Trim() ?? string.Empty;
            if (!string.IsNullOrEmpty(ageText) && !int.TryParse(ageText, out ageValue))
            {
                MessageBox.Show("Please enter a valid integer integer for Age.", "Validation", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                this.DialogResult = DialogResult.Cancel;
                return;
            }

            // Parse IdAgence safely
            int IdAgenceValue = 0;
            string IdAgenceText = this.textBoxIdAgence.Text?.Trim() ?? string.Empty;
            if (!string.IsNullOrEmpty(IdAgenceText) && !int.TryParse(IdAgenceText, out IdAgenceValue))
            {
                MessageBox.Show("Please enter a valid integer for IdAgence.", "Validation", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                this.DialogResult = DialogResult.Cancel;
                return;
            }
            // Parse IdAgence safely
            int IdEmployeValue = 0;
            string IdEmployeText = this.textBoxIdAgence.Text?.Trim() ?? string.Empty;
            if (!string.IsNullOrEmpty(IdEmployeText) && !int.TryParse(IdEmployeText, out IdEmployeValue))
            {
                MessageBox.Show("Please enter a valid integer for IdEmploye.", "Validation", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                this.DialogResult = DialogResult.Cancel;
                return;
            }
            // Parse IdAgence safely
            int NumerodeCarteValue = 0;
            string NumerodeCarteText = this.textBoxIdAgence.Text?.Trim() ?? string.Empty;
            if (!string.IsNullOrEmpty(NumerodeCarteText) && !int.TryParse(NumerodeCarteText, out NumerodeCarteValue))
            {
                MessageBox.Show("Please enter a valid integer for Numero de Carte.", "Validation", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                this.DialogResult = DialogResult.Cancel;
                return;
            }
            // Create and populate client
            var client = new Client()
            {
                vId = this.clientId, 
                vName = name,
                vLastName = lastName,
                vEMail = this.textBoxEMail.Text?.Trim() ?? string.Empty,
                vPhoto = this.textBoxImagen.Text?.Trim() ?? string.Empty,
                vAddress = this.textBoxAddresse.Text?.Trim() ?? string.Empty,
                vNumerodeCarte = NumerodeCarteValue,
                vNip = this.textBoxNIP.Text?.Trim() ?? string.Empty,
                vSexe = this.textBoxSexe.Text?.Trim() ?? string.Empty,
                vAge = ageValue,
                vActive = this.textBoxActive.Text?.Trim() ?? string.Empty,
                // ID
                vIdAgences= IdAgenceValue,
                vIdEmploye= IdEmployeValue
            };

            // Add to list and set DialogResult based on outcome
            bool added = false;
            if (agency.vListClients != null)
            {
                try
                {
                    // ListClients.Add returns bool according to signature
                    added = agency.vListClients.Add(client);

                    if (client.vId == 0)
                        obj.CreateClient(client);  // New client → INSERT
                    else
                        obj.UpdateClient(client);  // Existing → UPDATE

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
                MessageBox.Show("The client could not be added.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                this.DialogResult = DialogResult.Cancel;
            }
        } // end Add one client in the list client

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
        }

        private void cmbEmployees_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                CD_getInfo Controller = new CD_getInfo();
                stringcmboxemployee = cmbEmployees.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error  : " + " " + ex.Message);
            }
        }
    }
}
