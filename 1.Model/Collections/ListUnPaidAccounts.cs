using _1.Model.Abstract_Class;
using _1.Model.Model;
using _1.Model.Model.IModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1.Model.Collections
{
    /// <summary>
    /// Represents a collection of paid accounts, providing methods to manage and access them.
    /// </summary>
    public class ListUnPaidAccounts : IModelLists
    {
        /// <summary>
        /// Internal dictionary storing paid accounts, keyed by account number.
        /// </summary>
        private Dictionary<string, UnPaidAccount> listUnPaidAccounts;
        /// <summary>
        /// Initializes a new instance of the <see cref="ListUnPaidAccounts"/> class with the specified collection of paid
        /// accounts.
        /// </summary>
        /// <param name="vlistUnPaidAccounts">A dictionary containing the initial set of paid accounts, where the key is a unique identifier and the value
        /// is a <see cref="UnPaidAccount"/> object. Cannot be null.</param>
        public ListUnPaidAccounts()
        {
            listUnPaidAccounts = new Dictionary<string, UnPaidAccount>();
        }
        public Dictionary<string, UnPaidAccount> vlistUnPaidAccounts
        {
            get { return listUnPaidAccounts; }
            set { listUnPaidAccounts = value; }
        }
        /// <summary>
        /// Gets the total number of paid accounts in the collection.
        /// </summary>
        public int Quantity
        {
            get { return listUnPaidAccounts.Values.Count; }
        }
        /// <summary>
        /// Gets a collection containing the values of all paid accounts.
        /// </summary>
        public Dictionary<string, UnPaidAccount>.ValueCollection Elements
        {
            get { return listUnPaidAccounts.Values; }
        }
        /// <summary>
        /// Gets or sets the client associated with this collection of unpaid accounts.
        /// </summary>
       
        /// <summary>
        /// Checks if a paid account exists in the collection by its account number.
        /// </summary>
        /// <param name="accountNumber">The account number of the paid account to check.</param>
        /// <returns>True if the account exists, false otherwise.</returns>
        public bool Exist(string accountNumber)
        {
            return listUnPaidAccounts.ContainsKey(accountNumber);
        }
        /// <summary>
        /// Finds and returns the paid account associated with the specified account number.
        /// </summary>
        /// <param name="AccountNumber">The account number to search for.</param>
        /// <returns>
        /// The <see cref="UnPaidAccount"/> object if found; otherwise, <c>null</c>.
        /// </returns>
        object IModelLists.Find(string AccountNumber)
        {
            if (Exist(AccountNumber))
                return listUnPaidAccounts[AccountNumber];
            else // is there is not object return null
                return null;
        }
        /// <summary>
        /// Adds a new paid account to the collection if the account number does not already exist.
        /// </summary>
        /// <param name="account">The <see cref="UnPaidAccount"/> object to add. The account's number must be unique.</param>
        /// <returns>
        /// <c>true</c> if the account was added successfully; <c>false</c> if an account with the same number already exists.
        /// </returns>
        public bool Add(object obj)
        {
            UnPaidAccount account = (UnPaidAccount)obj;
            if (!listUnPaidAccounts.ContainsKey(account.vNumber))
            {
                listUnPaidAccounts.Add(account.vNumber, account);
                return true;
            }
            else
                return false;
        }
        public bool Update(string accountNumber, object obj)
        {
            UnPaidAccount account = (UnPaidAccount)obj;
            if (Exist(accountNumber))
            {
                listUnPaidAccounts[accountNumber] = account;
                return true;
            }
            return false;
        }
        /// <summary>
        /// Removes a paid account from the collection by its account number.
        /// </summary>
        /// <param name="number">The account number of the paid account to remove.</param>
        /// <returns>True if the account was removed successfully, false if the account was not found.</returns>
        public bool Delete(string number)
        {
            return listUnPaidAccounts.Remove(number);
        }
        public void Clear()
        {
            listUnPaidAccounts.Clear();
        }
        /// <summary>
        /// Returns a string containing the details of all paid accounts in the collection.
        /// Each account's information is separated by a newline.
        /// </summary>
        /// <returns>A string with details of all paid accounts.</returns>
        /// 
        public string ShowList()
        {
            StringBuilder info = new StringBuilder();
            foreach (Account account in listUnPaidAccounts.Values)
            {
                info.AppendLine(account.ConsultAccount());
            }
            return info.ToString();
        }

        /// <summary>
        /// Updates the details of an existing paid account.
        /// </summary>
        /// <param name="accountNumber">The account number of the paid account to update.</param>
        /// <param name="updatedAccount">A <see cref="UnPaidAccount"/> object containing the updated details.</param>
        /// <returns>True if the account was updated successfully, false otherwise.</returns>
        public bool Update(string accountNumber, UnPaidAccount updatedAccount)
        {
            if (Exist(accountNumber))
            {
                listUnPaidAccounts[accountNumber] = updatedAccount;
                return true;
            }
            return false;
        }
    }
}
