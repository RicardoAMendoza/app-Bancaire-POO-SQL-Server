using _1.Model.Model;
using _3.Control;
using System;
using System.Data;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace _2.View
{
    public partial class clientForm : Form, IView
    {
        public static Agency agency = new Agency();
        public clientForm()
        {
            InitializeComponent();
            ReadClient();
        }
 
        private void ReadClient()
        {
            // agregar int id.
            DataTable datatable = new DataTable();
            datatable.Columns.Add("ID");
            datatable.Columns.Add("NUMBER");
            datatable.Columns.Add("NAME");
            datatable.Columns.Add("lastName");
            datatable.Columns.Add("eMAIL");
            datatable.Columns.Add("PHOTO");
            datatable.Columns.Add("ADDRESS");
            datatable.Columns.Add("CARD");
            datatable.Columns.Add("NIP");
            datatable.Columns.Add("SEXE");
            datatable.Columns.Add("AGE");
            datatable.Columns.Add("ACTIVE");
            // ID
            datatable.Columns.Add("IDAGENCE");
            datatable.Columns.Add("IDEMPLOYE");
            // object CD_getData
            var model = new CD_getData();
            /// Get clients from listClients
            var clients = CD_getLists.fncGetClientsFromDb();

            foreach (var client in clients.Elements)
            {
                DataRow row = datatable.NewRow();
                row["ID"] = client.vId;
              
                row["NAME"] = client.vName;
                row["lastName"] = client.vLastName;
                row["eMAIL"] = client.vEMail;
                row["PHOTO"] = client.vPhoto;
                row["ADDRESS"] = client.vAddress;
                row["CARD"] = client.vNumerodeCarte;
                row["NIP"] = client.vNip;
                row["SEXE"] = client.vSexe;
                row["AGE"] = client.vAge;
                row["ACTIVE"] = client.vActive;
                // ID
                row["IDAGENCE"] = client.vIdAgences;
                row["IDEMPLOYE"] = client.vIdEmploye;


                datatable.Rows.Add(row);
            }
            this.gridViewclientsTable.DataSource = datatable;
        }
        private void mainForm_Load(object sender, EventArgs e)
        {
            // ListDirecteurs();
            //ListAgences();
            //  ListClients();
        }
        /// <summary>
        /// 1. Loads Employees in the combo box employees
        /// </summary>
        private void ListDirecteurs()
        {
            // new Controller cleans the object everytime it is called
            // new Controllercleans the view with every click
            //CD_Interaction Controller = new CD_Interaction();
           // gridViewclientsTable.DataSource = Controller.DirectorList();
        }
        private void ListAgences()
        {
            // new Controller cleans the object everytime it is called
            // new Controllercleans the view with every click
            // CD_Interaction Controller = new CD_Interaction();
         //   gridViewclientsTable.DataSource = Controller.AgenceList();
        }
        private void ListClients()
        {
            // new Controller cleans the object everytime it is called
            // new Controllercleans the view with every click
            //gridViewclientsTable.DataSource = Controller.ClientList();
        }

        private void gvDirecteur_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void butSearch_Click(object sender, EventArgs e)
        {
            // searchClient();
        }

        public void searchClient()
        {
            throw new NotImplementedException();
        }

        private void butAddClient_Click(object sender, EventArgs e)
        {
            CreateandEditClient form = new CreateandEditClient();
            if (form.ShowDialog() == DialogResult.OK)
            {
                // Refresh the clients list after adding a new client
                ReadClient();
            }
        }

        private void butUpdateClient_Click(object sender, EventArgs e)
        {
            // Fix: Remove extra dot and brackets, use correct property names
            if (gridViewclientsTable.SelectedRows.Count == 0)
            {
                MessageBox.Show("Please select a client to edit.");
                return;
            }
            var val = this.gridViewclientsTable.SelectedRows[0].Cells[0].Value?.ToString();
            if (string.IsNullOrEmpty(val))
                return;
            int clientId = int.Parse(val);

            var obj = new CD_getData();
            var client = obj.GetClientById(clientId);

            if (client == null)
            {
                MessageBox.Show("Client not found.");
                return;
            }

            CreateandEditClient form = new CreateandEditClient();
            form.EditClient(client);
            if (form.ShowDialog() == DialogResult.OK)
            {
                // Refresh the clients list after updating a client
                ReadClient();
            }
        }

        private void butDeleteClient_Click(object sender, EventArgs e)
        {
            // Fix: Remove extra dot and brackets, use correct property names
            if (gridViewclientsTable.SelectedRows.Count == 0)
            {
                MessageBox.Show("Please select a client to edit.");
                return;
            }
            var val = this.gridViewclientsTable.SelectedRows[0].Cells[0].Value?.ToString();
            if (string.IsNullOrEmpty(val))
                return;
            int clientId = int.Parse(val);

            DialogResult result = MessageBox.Show("Are you sure you want to delete this client?",
                "Confirm Deletion", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (result == DialogResult.No)
            {
                return;
            }
            else
            {
                var obj = new CD_getData();
                obj.DeleteClient(clientId);
                ReadClient();
            }
        }
    }
}
