namespace _2.View
{
    partial class employeeForm
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
            this.gridViewemployeesTable = new System.Windows.Forms.DataGridView();
            this.butUpdateEmployee = new System.Windows.Forms.Button();
            this.butDeleteEmployee = new System.Windows.Forms.Button();
            this.butAddEmployee = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.gridViewemployeesTable)).BeginInit();
            this.SuspendLayout();
            // 
            // gridViewemployeesTable
            // 
            this.gridViewemployeesTable.AccessibleName = "employeesTable";
            this.gridViewemployeesTable.AllowUserToOrderColumns = true;
            this.gridViewemployeesTable.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.gridViewemployeesTable.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.gridViewemployeesTable.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridViewemployeesTable.Location = new System.Drawing.Point(6, 55);
            this.gridViewemployeesTable.MultiSelect = false;
            this.gridViewemployeesTable.Name = "gridViewemployeesTable";
            this.gridViewemployeesTable.RowHeadersVisible = false;
            this.gridViewemployeesTable.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.gridViewemployeesTable.Size = new System.Drawing.Size(830, 362);
            this.gridViewemployeesTable.TabIndex = 0;
            // 
            // butUpdateEmployee
            // 
            this.butUpdateEmployee.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.butUpdateEmployee.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.butUpdateEmployee.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.butUpdateEmployee.Location = new System.Drawing.Point(610, 21);
            this.butUpdateEmployee.Name = "butUpdateEmployee";
            this.butUpdateEmployee.Size = new System.Drawing.Size(109, 28);
            this.butUpdateEmployee.TabIndex = 8;
            this.butUpdateEmployee.Text = "Edit Employee";
            this.butUpdateEmployee.UseVisualStyleBackColor = false;
            this.butUpdateEmployee.Click += new System.EventHandler(this.butUpdateEmployee_Click);
            // 
            // butDeleteEmployee
            // 
            this.butDeleteEmployee.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.butDeleteEmployee.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.butDeleteEmployee.Location = new System.Drawing.Point(725, 21);
            this.butDeleteEmployee.Name = "butDeleteEmployee";
            this.butDeleteEmployee.Size = new System.Drawing.Size(109, 28);
            this.butDeleteEmployee.TabIndex = 7;
            this.butDeleteEmployee.Text = "Delete";
            this.butDeleteEmployee.UseVisualStyleBackColor = true;
            this.butDeleteEmployee.Click += new System.EventHandler(this.butDeleteEmployee_Click);
            // 
            // butAddEmployee
            // 
            this.butAddEmployee.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.butAddEmployee.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.butAddEmployee.Location = new System.Drawing.Point(497, 21);
            this.butAddEmployee.Name = "butAddEmployee";
            this.butAddEmployee.Size = new System.Drawing.Size(109, 28);
            this.butAddEmployee.TabIndex = 6;
            this.butAddEmployee.Text = "AddEmployee";
            this.butAddEmployee.UseVisualStyleBackColor = true;
            this.butAddEmployee.Click += new System.EventHandler(this.butAddEmployee_Click);
            // 
            // employeeForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(839, 429);
            this.Controls.Add(this.butUpdateEmployee);
            this.Controls.Add(this.butDeleteEmployee);
            this.Controls.Add(this.butAddEmployee);
            this.Controls.Add(this.gridViewemployeesTable);
            this.DoubleBuffered = true;
            this.Name = "employeeForm";
            this.Text = "employeeForm";
            ((System.ComponentModel.ISupportInitialize)(this.gridViewemployeesTable)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView gridViewemployeesTable;
        private System.Windows.Forms.Button butUpdateEmployee;
        private System.Windows.Forms.Button butDeleteEmployee;
        private System.Windows.Forms.Button butAddEmployee;
    }
}