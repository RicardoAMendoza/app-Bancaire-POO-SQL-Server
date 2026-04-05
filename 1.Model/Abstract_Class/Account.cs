using System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Build.Framework.XamlTypes;
using _1.Model.Model;

namespace _1.Model.Abstract_Class
{
    /// <summary> it
    /// 
    /// Represents a financial account with details such as account number, type, client information, balance, and the
    /// date the account was opened.
    /// </summary>
    /// <remarks>The <see cref="Account"/> class serves as a base class for different types of financial
    /// accounts.  It encapsulates common properties such as the account number, type, client name, balance, and the
    /// account's opening date. Derived classes can extend this class to implement specific account behaviors or
    /// additional functionality.</remarks>
    public abstract class Account
    {
        /// <summary>
        /// Fields
        /// </summary>
        private int Number;
        private string Type;
        private string ClientName;
        private string ClientLastname;
        private decimal Balance;
        Date OpenDate;

        public Account(int vNumber, string vType, string vClientName, string vClientlastName, decimal vBalance, int vDay, int vMonth, int vYear)
        {
            Number = vNumber;
            Type = vType;
            ClientName = vClientName;
            ClientLastname = vClientlastName;
            Balance = vBalance;
            OpenDate = new Date(vDay, vMonth, vYear);
        }
        public Account()
        {
            Number = EmptyConstructor.intEmptyConstructor();
            Type = EmptyConstructor.stringEmptyConstructor();
            ClientName = EmptyConstructor.stringEmptyConstructor();
            ClientLastname = EmptyConstructor.stringEmptyConstructor();
            Balance = EmptyConstructor.decimalEmptyConstructor();
            OpenDate = new Date();
        }
        public int vNumber
        {
            get { return Number; }
            set { vNumber = value; }
        }
        public string vType
        {
            get { return Type; }
            set { vType = value; }
        }
        public string vClientName
        {
            get { return ClientName; }
            set { vClientName = value; }
        }
        public string vClientLastName
        {
            get { return ClientLastname; }
            set { vClientName = value; }

        }
        public decimal vBalance
        {
            get { return Balance; }
            set { vBalance = value; }
        }
        public Date vOpenDate
        {
            get { return OpenDate; }
            set { vOpenDate = value; }
        }
        /// <summary>
        /// Opens a new account with the specified details.
        /// </summary>
        /// <remarks>This method initializes the account with the provided details, including the account
        /// holder's name, account type, and opening balance. The opening date is constructed using the specified day,
        /// month, and year.</remarks>
        /// <param name="vNumber">The unique account number to assign to the new account. Cannot be null or empty.</param>
        /// <param name="vType">The type of the account (e.g., "Savings", "Checking"). Cannot be null or empty.</param>
        /// <param name="vClientName">The first name of the account holder. Cannot be null or empty.</param>
        /// <param name="vClientlastName">The last name of the account holder. Cannot be null or empty.</param>
        /// <param name="vBalance">The initial balance of the account. Must be a non-negative value.</param>
        /// <param name="vDay">The day of the account's opening date. Must be a valid day of the specified month and year.</param>
        /// <param name="vMonth">The month of the account's opening date. Must be a value between 1 and 12.</param>
        /// <param name="vYear">The year of the account's opening date. Must be a valid year.</param>
        public virtual void OpenAccount(int vNumber, string vType, string vClientName, string vClientlastName, decimal vBalance, int vDay, int vMonth, int vYear)
        {
            Number = vNumber;
            Type = vType;
            ClientName = vClientName;
            ClientLastname = vClientlastName;
            Balance = vBalance;
            OpenDate = new Date(vDay, vMonth, vYear);
        }

        public virtual string ConsultAccount()
        {
            return $"Account Number: {Number}, Type: {Type}, Client: {ClientName} {ClientLastname}, Balance: {Balance}, Open Date: {OpenDate.vDay}/{OpenDate.vMonth}/{OpenDate.vYear}";
        }
        /// <summary>
        /// Attempts to withdraw the specified amount from the account.
        /// </summary>
        /// <remarks>The account balance is only updated if the withdrawal is successful. Ensure that the
        /// amount meets all conditions before calling this method to avoid unnecessary checks.</remarks>
        /// <param name="amount">The amount to withdraw. Must be a multiple of 20 and within the allowed range.</param>
        /// <returns>A status code indicating the result of the withdrawal: <list type="bullet"> <item><description><c>0</c> if
        /// the withdrawal was successful.</description></item> <item><description><c>-1</c> if the amount is less than
        /// the minimum allowed withdrawal of 20.</description></item> <item><description><c>-2</c> if the amount
        /// exceeds the maximum allowed withdrawal of 500.</description></item> <item><description><c>1</c> if the
        /// amount exceeds the current account balance.</description></item> <item><description><c>2</c> if the amount
        /// is not a multiple of 20.</description></item> </list></returns>
        public virtual decimal Withdraw(decimal amount)
        {
            if (amount > 500) { return -2; }
            if (amount < 20) { return -1; }
            if (amount > vBalance) { return 1; }
            if (amount % 20 != 0) { return 2; }
            else
            {
                vBalance -= amount;
                return 0;
            }

        }
        /// <summary>
        /// Deposits a specified amount into the account if it is within the allowed range.
        /// </summary>
        /// <param name="deposit">The amount to deposit. Must be between 20 and 500 inclusive.</param>
        /// <returns>True if the deposit was successful; otherwise, false.</returns>
        public virtual bool Deposit(decimal deposit)
        {
            if (deposit < 20 || 500 < deposit)
            {
                return false;
            }
            else
            {
                vBalance += deposit;
                return true;
            }
        }
        /// <summary>
        /// Calculates and applies a commission charge to the specified amount.
        /// </summary>
        /// <remarks>
        /// This abstract method should be implemented by derived account types to define how commission fees are calculated and deducted.
        /// The commission may vary depending on account type or transaction rules.
        /// </remarks>
        /// <param name="amount">The amount on which the commission is to be charged.</param>
        /// <returns>The commission amount to be charged.</returns>
        protected abstract decimal ChargeCommission(decimal amount);
        /// <summary>
        /// Calculates and applies interest to the specified amount.
        /// </summary>
        /// <remarks>This method is abstract and must be implemented by a derived class to define the
        /// specific interest calculation logic.</remarks>
        /// <param name="amount">The principal amount to which interest will be applied. Must be a non-negative value.</param>
        /// <returns>The total amount after applying the calculated interest.</returns>
        protected abstract decimal PayInterest(decimal amount);
    }
}