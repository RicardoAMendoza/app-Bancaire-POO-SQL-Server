namespace _2.View
{
    partial class mainForm
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
            this.panel1 = new System.Windows.Forms.Panel();
            this.buttonEmployee = new System.Windows.Forms.Button();
            this.buttonClient = new System.Windows.Forms.Button();
            this.mainPanel = new System.Windows.Forms.Panel();
            this.buttonAgence = new System.Windows.Forms.Button();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.buttonAgence);
            this.panel1.Controls.Add(this.buttonEmployee);
            this.panel1.Controls.Add(this.buttonClient);
            this.panel1.Location = new System.Drawing.Point(-1, 1);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(108, 479);
            this.panel1.TabIndex = 0;
            // 
            // buttonEmployee
            // 
            this.buttonEmployee.Location = new System.Drawing.Point(3, 32);
            this.buttonEmployee.Name = "buttonEmployee";
            this.buttonEmployee.Size = new System.Drawing.Size(92, 23);
            this.buttonEmployee.TabIndex = 1;
            this.buttonEmployee.Text = "Empoyee";
            this.buttonEmployee.UseVisualStyleBackColor = true;
            this.buttonEmployee.Click += new System.EventHandler(this.buttonEmployee_Click);
            // 
            // buttonClient
            // 
            this.buttonClient.Location = new System.Drawing.Point(3, 3);
            this.buttonClient.Name = "buttonClient";
            this.buttonClient.Size = new System.Drawing.Size(92, 23);
            this.buttonClient.TabIndex = 0;
            this.buttonClient.Text = "Client";
            this.buttonClient.UseVisualStyleBackColor = true;
            this.buttonClient.Click += new System.EventHandler(this.buttonClient_Click);
            // 
            // mainPanel
            // 
            this.mainPanel.Location = new System.Drawing.Point(100, 1);
            this.mainPanel.Name = "mainPanel";
            this.mainPanel.Size = new System.Drawing.Size(752, 479);
            this.mainPanel.TabIndex = 2;
            // 
            // buttonAgence
            // 
            this.buttonAgence.Location = new System.Drawing.Point(4, 62);
            this.buttonAgence.Name = "buttonAgence";
            this.buttonAgence.Size = new System.Drawing.Size(92, 23);
            this.buttonAgence.TabIndex = 2;
            this.buttonAgence.Text = "Agence";
            this.buttonAgence.UseVisualStyleBackColor = true;
            this.buttonAgence.Click += new System.EventHandler(this.buttonAgence_Click);
            // 
            // mainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(851, 482);
            this.Controls.Add(this.mainPanel);
            this.Controls.Add(this.panel1);
            this.IsMdiContainer = true;
            this.Name = "mainForm";
            this.Text = "mainForm";
            this.panel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button buttonClient;
        private System.Windows.Forms.Panel mainPanel;
        private System.Windows.Forms.Button buttonEmployee;
        private System.Windows.Forms.Button buttonAgence;
    }
}