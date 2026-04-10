using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using _1.Model.Collections;

namespace _1.Model.Model
{
    public class Agency
    {
        private int IdAgency;

        private string AgencyName;
        private string AgencyAddress;
        private int agencyIdCounter;
        private int idBanque;


        private static int staticNbcounter;
        private ListEmployees listEmployees = new ListEmployees();
        private ListClients listClients = new ListClients();

        public Agency(int vIdAgency, string vName, string vAddress, int idBanque)
        {
            IdAgency = vIdAgency;
            AgencyName = vName;
            AgencyAddress = vAddress;
            agencyIdCounter = 0;
            staticNbcounter++;
            this.idBanque = idBanque;
        }
        public Agency(ListClients vListClients, ListEmployees vListEmployees)
        {
            listClients = vListClients;
            listEmployees = vListEmployees;
            agencyIdCounter = 0;
            staticNbcounter++;
        }
        public Agency()
        {
            
            AgencyName = EmptyConstructor.stringEmptyConstructor();
            AgencyAddress = EmptyConstructor.stringEmptyConstructor();
            agencyIdCounter = 0;
            staticNbcounter++;
        }
        public ListClients vListClients
        {
            get { return listClients; }
            set { listClients = value; }
        }
        public ListEmployees vListEmployees
        {
            get { return listEmployees; }
            set { listEmployees = value; }
        }
        public int vIdAgency
        {
            get { return IdAgency; }
            set { IdAgency = value; }
        }
        public int vIdBanque
        {
            get { return idBanque; }
            set { idBanque = value; }
        }
     
        public string vAgencyName
        {
            get { return AgencyName; }
            set { AgencyName = value; }
        }
        public string vAgencyAddress
        {
            get { return AgencyAddress; }
            set { AgencyAddress = value; }
        }
        public int vAgencyIdCounter
        {
            get { return agencyIdCounter; }
        }
        public static int vStaticNbcounter
        {
            get { return staticNbcounter; }
        }

      

        public string ShowAgencies()
        {
            string info = " ";
    
            info += " Agence Name : " + AgencyName + "\n";
            info += " Agence Address : " + AgencyAddress + "\n";
            info += " Clients : " + listClients.ShowList() + "\n";
            info += " Employees : " + listEmployees.ShowList() + "\n";
            return info;
        }
        public void OpenAgence(int IdAgency, string vName, string vAddress, ListClients vListClients, ListEmployees vListEmployee)
        {

            AgencyName = vName;
            AgencyAddress = vAddress;
            listClients = vListClients;
            listEmployees = vListEmployee;
            agencyIdCounter = ++staticNbcounter;
        }

    }
}
