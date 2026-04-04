namespace _2.View
{
    partial class clientForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.butAddClient = new System.Windows.Forms.Button();
            this.butDeleteClient = new System.Windows.Forms.Button();
            this.butUpdateClient = new System.Windows.Forms.Button();
            this.gridViewclientsTable = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.gridViewclientsTable)).BeginInit();
            this.SuspendLayout();
            // 
            // butAddClient
            // 
            this.butAddClient.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.butAddClient.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.butAddClient.Location = new System.Drawing.Point(497, 21);
            this.butAddClient.Name = "butAddClient";
            this.butAddClient.Size = new System.Drawing.Size(109, 28);
            this.butAddClient.TabIndex = 3;
            this.butAddClient.Text = "AddClient";
            this.butAddClient.UseVisualStyleBackColor = true;
            this.butAddClient.Click += new System.EventHandler(this.butAddClient_Click);
            // 
            // butDeleteClient
            // 
            this.butDeleteClient.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.butDeleteClient.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.butDeleteClient.Location = new System.Drawing.Point(727, 21);
            this.butDeleteClient.Name = "butDeleteClient";
            this.butDeleteClient.Size = new System.Drawing.Size(109, 28);
            this.butDeleteClient.TabIndex = 4;
            this.butDeleteClient.Text = "Delete";
            this.butDeleteClient.UseVisualStyleBackColor = true;
            this.butDeleteClient.Click += new System.EventHandler(this.butDeleteClient_Click);
            // 
            // butUpdateClient
            // 
            this.butUpdateClient.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.butUpdateClient.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.butUpdateClient.Location = new System.Drawing.Point(612, 21);
            this.butUpdateClient.Name = "butUpdateClient";
            this.butUpdateClient.Size = new System.Drawing.Size(109, 28);
            this.butUpdateClient.TabIndex = 5;
            this.butUpdateClient.Text = "Edit Client";
            this.butUpdateClient.UseVisualStyleBackColor = true;
            this.butUpdateClient.Click += new System.EventHandler(this.butUpdateClient_Click);
            // 
            // gridViewclientsTable
            // 
            this.gridViewclientsTable.AccessibleName = "clientsTable";
            this.gridViewclientsTable.AllowUserToOrderColumns = true;
            this.gridViewclientsTable.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.gridViewclientsTable.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.gridViewclientsTable.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridViewclientsTable.Location = new System.Drawing.Point(6, 55);
            this.gridViewclientsTable.MultiSelect = false;
            this.gridViewclientsTable.Name = "gridViewclientsTable";
            this.gridViewclientsTable.RowHeadersVisible = false;
            this.gridViewclientsTable.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.gridViewclientsTable.Size = new System.Drawing.Size(830, 362);
            this.gridViewclientsTable.TabIndex = 0;
            this.gridViewclientsTable.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.gvDirecteur_CellContentClick);
            // 
            // clientForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(839, 429);
            this.Controls.Add(this.gridViewclientsTable);
            this.Controls.Add(this.butUpdateClient);
            this.Controls.Add(this.butDeleteClient);
            this.Controls.Add(this.butAddClient);
            this.Name = "clientForm";
            this.Text = "clientForm";
            this.Load += new System.EventHandler(this.mainForm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.gridViewclientsTable)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Button butAddClient;
        private System.Windows.Forms.Button butDeleteClient;
        private System.Windows.Forms.Button butUpdateClient;
        private System.Windows.Forms.DataGridView gridViewclientsTable;
    }
}

