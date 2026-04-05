using _1.Model.Model;
using _1.Model.Model.IModel;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1.Model.Collections
{
    public class ListClients : IModelLists
    {
        private Dictionary<int, Client> listClients;
        public ListClients()
        {
            listClients = new Dictionary<int, Client>();
        }
        public Dictionary<int, Client> vlistClients
        {
            get { return listClients; }
            set { listClients = value; }
        }
        public int Quantity
        {
            get { return listClients.Values.Count; }
        }
        public Dictionary<int, Client>.ValueCollection Elements
        {
            get { return listClients.Values; }
        }

        
        public bool Exist(int clientNumber)
        {
            return listClients.ContainsKey(clientNumber);
        }
        public object Find(int clientNumber)
        {
            if (Exist(clientNumber))
            {
                return listClients[clientNumber];
            }
            else
                return null;
        }
        public Client FindClient(int clientNumber)
        {
            if (Exist(clientNumber))
            {
                return listClients[clientNumber];
            }
            else
                return null;
        }
        /// <summary>
        /// RM. Attempts to add a client to the collection if a client with the same identifier does not already exist.
        /// </summary>
        /// <remarks>If a client with the same identifier already exists in the collection, the method
        /// does not add the new client and returns false. The parameter must be a valid <see cref="Client"/> instance;
        /// otherwise, a runtime exception may occur.</remarks>
        /// <param name="obj">An object representing the client to add. Must be of type <see cref="Client"/>.</param>
        /// <returns>true if the client was added successfully; otherwise, false.</returns>
        public bool Add(object obj)
        {
            Client client = (Client)obj;
            if (!Exist(client.vNumber))
            {
                listClients.Add(client.vNumber, client);
                return true;
            }
            return false;
        }
      /// <summary>
      /// Updates the client information associated with the specified client number.
      /// </summary>
      /// <remarks>If the specified client number does not exist, no update is performed and the method
      /// returns false. The method does not validate the contents of the provided client object.</remarks>
      /// <param name="clientNumber">The unique identifier of the client to update. Cannot be null.</param>
      /// <param name="obj">An object containing the updated client data. Must be of type <see cref="Client"/>.</param>
      /// <returns>true if the client was found and updated; otherwise, false.</returns>
        public bool Update(int clientNumber, object obj)
        {
            Client client = (Client)obj;
            if (Exist(clientNumber))
            {
                listClients[clientNumber] = client;
                return true;
            }
            return false;
        }

        public bool Delete(int number)
        {
            return listClients.Remove(number);
        }
        public void Clear()
        {
            listClients.Clear();
        }
        public string ShowList()
        {
            string allClients = "";
            foreach (var client in listClients.Values)
            {
                allClients += client.ShowHuman() + "\n";
            }
            return allClients;
        }
    }
}
