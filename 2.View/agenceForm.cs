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
            var agencies = CD_getLists.fncGetAgencesFromDb();

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

        }
    }
}
