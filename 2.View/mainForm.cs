using _3.Control;
using System;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace _2.View
{
    public partial class mainForm : Form
    {
        public mainForm mainView;
       //public CD_GetLists getLists = new CD_GetLists();
        public mainForm()
        {
            InitializeComponent();
        }
        private void mainForm_Load(object sender, EventArgs e)
        {
            // Load the default view (e.g., Client view)
            buttonClient_Click(sender, e);

        }

        private void buttonClient_Click(object sender, EventArgs e)
        {
            clientForm formclient = new clientForm();
            
            mainPanel.Controls.Clear();
            formclient.TopLevel = false;
            formclient.FormBorderStyle = FormBorderStyle.None;
            formclient.Dock = DockStyle.Fill;
            mainPanel.Controls.Add(formclient);
            formclient.Show();
            formclient.BringToFront();
        }

        private void buttonEmployee_Click(object sender, EventArgs e)
        {
            employeeForm formEmployee = new employeeForm();

            mainPanel.Controls.Clear();
            formEmployee.TopLevel = false;
            formEmployee.FormBorderStyle = FormBorderStyle.None;
            formEmployee.Dock = DockStyle.Fill;
            mainPanel.Controls.Add(formEmployee);
            formEmployee.Show();
            formEmployee.BringToFront();
        }

        private void buttonAgence_Click(object sender, EventArgs e)
        {
            agenceForm formAgence = new agenceForm();

            mainPanel.Controls.Clear();
            formAgence.TopLevel = false;
            formAgence.FormBorderStyle = FormBorderStyle.None;
            formAgence.Dock = DockStyle.Fill;
            mainPanel.Controls.Add(formAgence);
            formAgence.Show();
            formAgence.BringToFront();
        }
    }
}
