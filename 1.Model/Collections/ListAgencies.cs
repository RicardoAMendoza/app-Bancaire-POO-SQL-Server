using _1.Model.Model;
using _1.Model.Model.IModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1.Model.Collections
{
    public class ListAgencies : IModelLists
    {
        private Dictionary<int, Agency> listAgency;
        public ListAgencies()
        {
            listAgency = new Dictionary<int, Agency>();
        }
        public int Quantity
        {
            get { return listAgency.Values.Count; }
        }
        public Dictionary<int, Agency>.ValueCollection Elements
        {
            get { return listAgency.Values; }
        }
        public Dictionary<int, Agency> vlistAgency
        {
            get { return listAgency; }
            set { listAgency = value; }

        }

        public bool Exist(int agencyNumber)
        {
            return listAgency.ContainsKey(agencyNumber);
        }
        object IModelLists.Find(int agencyNumber)
        {
            if (Exist(agencyNumber))
            {

                return listAgency[agencyNumber];
            }
            else
                return null;

        }
        //public bool Exist(string agencyNumber)
        //{
        //    return listAgency.ContainsKey(agencyNumber);
        //}
        //public Agency Find(string agencyNumber)
        //{
        //    if (Exist(agencyNumber))
        //    {

        //        return listAgency[agencyNumber];
        //    }
        //    else
        //        return null;

        //}
        public bool Add(object obj)
        {
            Agency agency = (Agency)obj;
            if (Exist(agency.vAgencyNumber))
                return false;

            listAgency.Add(agency.vAgencyNumber, agency);
            return true;
        }
        public bool Update(int accountNumber, object obj)
        {
            Agency agency = (Agency)obj;
            if (Exist(accountNumber))
            {
                listAgency[accountNumber] = agency;
                return true;
            }
            return false;
        }
        public bool Delete(int AgencyNumber)
        {
            if (Exist(AgencyNumber))
            {
                listAgency.Remove(AgencyNumber);
                return true;
            }
            else
                return false;
        }
        public void Clear()
        {
            listAgency.Clear();
        }
        public string ShowList()
        {

            StringBuilder sb = new StringBuilder();
            foreach (var agency in listAgency.Values)
            {
                sb.AppendLine(agency.ShowAgencies());
            }
            return sb.ToString();
        }
    }
}
