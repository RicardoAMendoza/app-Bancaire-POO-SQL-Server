using Microsoft.Build.Framework.XamlTypes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using _1.Model.Collections;

namespace _1.Model.Model
{
    public class BanqueNationaleduQuebec
    {
        // Attributes
        public int bancIdCounter;
        private string bankNumber;
        private string bankName;
        private decimal Capital;
        private string bankAddress;
        // lists
        private ListAgencies listAgencies = new ListAgencies();
        private ListDirectors listDirectors = new ListDirectors(); 
        private static int staticNbcounter;

        // Constructors
        public BanqueNationaleduQuebec(ListAgencies vListAgencies, ListDirectors vListDirectors)
        {
            listAgencies = vListAgencies;
            listDirectors = vListDirectors;
            bancIdCounter = ++staticNbcounter;
        }
        public BanqueNationaleduQuebec(string vBankNumber, string vBankName, decimal vCapital,string vBankAddress)
        {
            bankNumber = vBankNumber;
            bankName = vBankName;
            Capital = vCapital;
            bankAddress = vBankAddress;
            bancIdCounter = ++staticNbcounter;
        }
        public BanqueNationaleduQuebec()
        {
            bankNumber = EmptyConstructor.stringEmptyConstructor();
            bankName = EmptyConstructor.stringEmptyConstructor();
            bankAddress = EmptyConstructor.stringEmptyConstructor();
            Capital = EmptyConstructor.decimalEmptyConstructor();
            listAgencies = null;
            listDirectors = null;
            bancIdCounter = ++staticNbcounter;
        }
        // propierties
        public int vbancIdCounter
        {
            get { return bancIdCounter; }
            /// No set accessor: bancIdCounter is read-only and auto-incremented
        }
        public string vBankNumber
        {
            get { return bankNumber; }
            set { bankNumber = value; }
        }
        public string vBankName
        {
            get { return bankName; }
            set { bankName = value; }
        }
        public decimal vCapital
        {
            get { return Capital; }
            set { Capital = value; }
        }
        public string vBankAddress
        {
            get { return bankAddress; }
            set { bankAddress = value; }
        }
        
        public ListAgencies vListAgencies
        {
            get { return listAgencies; }
            set { listAgencies = value; }
        }
        public ListDirectors vListDirectors
        {
            get { return listDirectors; }
            set { listDirectors = value; }
        }

        // Functions
        public void OpenaBank(string vBankNumber, string vBankName, decimal vCapital, string vBankAddress,  ListAgencies vListAgencies, ListDirectors vListDirectors)
        {
            //Console.WriteLine("Welcome to La Banque Nationale du Quebec!");
            //Console.WriteLine("We are committed to providing excellent financial services to our customers.");
            //Console.WriteLine("Our bank offers a wide range of products including savings accounts, checking accounts, loans, and investment services.");
            //Console.WriteLine("Thank you for choosing La Banque Nationale du Quebec. We look forward to serving you!");
            bankNumber = vBankNumber;
            bankName = vBankName;
            Capital = vCapital;
            bankAddress = vBankAddress;
            
            listAgencies = vListAgencies;
            listDirectors = vListDirectors;
        }

        public string ShowBank()
        {
            return $"Bank ID: {bancIdCounter}, Name: {bankName}, Address: {bankAddress}, Capital: {Capital:C}, Number of Agencies: {listAgencies.Quantity}, Number of Directors: {listDirectors.Quantity}";
        }
    }
}
