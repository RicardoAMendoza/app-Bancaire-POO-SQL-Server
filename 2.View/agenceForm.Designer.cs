namespace _2.View
{
    partial class agenceForm
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
            this.gridViewagencesTable = new System.Windows.Forms.DataGridView();
            this.butUpdateAgence = new System.Windows.Forms.Button();
            this.butDeleteAgence = new System.Windows.Forms.Button();
            this.butAddAgence = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.gridViewagencesTable)).BeginInit();
            this.SuspendLayout();
            // 
            // gridViewagencesTable
            // 
            this.gridViewagencesTable.AccessibleName = "agencesTable";
            this.gridViewagencesTable.AllowUserToOrderColumns = true;
            this.gridViewagencesTable.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.gridViewagencesTable.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.gridViewagencesTable.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridViewagencesTable.Location = new System.Drawing.Point(6, 55);
            this.gridViewagencesTable.MultiSelect = false;
            this.gridViewagencesTable.Name = "gridViewagencesTable";
            this.gridViewagencesTable.RowHeadersVisible = false;
            this.gridViewagencesTable.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.gridViewagencesTable.Size = new System.Drawing.Size(830, 362);
            this.gridViewagencesTable.TabIndex = 0;
            // 
            // butUpdateAgence
            // 
            this.butUpdateAgence.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.butUpdateAgence.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.butUpdateAgence.Location = new System.Drawing.Point(610, 21);
            this.butUpdateAgence.Name = "butUpdateAgence";
            this.butUpdateAgence.Size = new System.Drawing.Size(109, 28);
            this.butUpdateAgence.TabIndex = 8;
            this.butUpdateAgence.Text = "Edit Agence";
            this.butUpdateAgence.UseVisualStyleBackColor = true;
            this.butUpdateAgence.Click += new System.EventHandler(this.butUpdateAgence_Click);
            // 
            // butDeleteAgence
            // 
            this.butDeleteAgence.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.butDeleteAgence.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.butDeleteAgence.Location = new System.Drawing.Point(725, 21);
            this.butDeleteAgence.Name = "butDeleteAgence";
            this.butDeleteAgence.Size = new System.Drawing.Size(109, 28);
            this.butDeleteAgence.TabIndex = 7;
            this.butDeleteAgence.Text = "Delete";
            this.butDeleteAgence.UseVisualStyleBackColor = true;
            this.butDeleteAgence.Click += new System.EventHandler(this.butDeleteAgence_Click);
            // 
            // butAddAgence
            // 
            this.butAddAgence.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.butAddAgence.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.butAddAgence.Location = new System.Drawing.Point(495, 21);
            this.butAddAgence.Name = "butAddAgence";
            this.butAddAgence.Size = new System.Drawing.Size(109, 28);
            this.butAddAgence.TabIndex = 6;
            this.butAddAgence.Text = "AddAgence";
            this.butAddAgence.UseVisualStyleBackColor = true;
            this.butAddAgence.Click += new System.EventHandler(this.butAddAgence_Click);
            // 
            // agenceForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(839, 429);
            this.Controls.Add(this.butUpdateAgence);
            this.Controls.Add(this.butDeleteAgence);
            this.Controls.Add(this.butAddAgence);
            this.Controls.Add(this.gridViewagencesTable);
            this.Name = "agenceForm";
            this.Text = "agenceForm";
            ((System.ComponentModel.ISupportInitialize)(this.gridViewagencesTable)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView gridViewagencesTable;
        private System.Windows.Forms.Button butUpdateAgence;
        private System.Windows.Forms.Button butDeleteAgence;
        private System.Windows.Forms.Button butAddAgence;
    }
}