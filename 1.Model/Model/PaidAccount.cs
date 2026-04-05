using _1.Model.Abstract_Class;
using _1.Model.Collections;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1.Model.Model
{
    /// <summary>
    /// Represents a paid account that extends the functionality of a standard account by incorporating an interest
    /// rate.
    /// </summary>
    /// <remarks>The <see cref="PaidAccount"/> class provides additional features such as interest calculation
    /// and deposit handling  with interest application. It overrides several methods from the base <see
    /// cref="Account"/> class to implement  behavior specific to paid accounts, such as consulting account details,
    /// depositing funds with interest, and  calculating commissions (which are always zero for this account
    /// type).</remarks>
    public class PaidAccount : Account
    {
        private decimal InterestRate;
        public PaidAccount(int vNumber, string vType, string vClientName, string vClientlastName, decimal vBalance, int vDay, int vMonth, int vYear, decimal vInterestRate)
            : base(vNumber, vType, vClientName, vClientlastName, vBalance, vDay, vMonth, vYear)
        {
            InterestRate = vInterestRate;
        }
        public PaidAccount()
           : base()
        {
            InterestRate = 0;
        }
        public decimal vInterestRate
        {
            get { return InterestRate; }
            set { InterestRate = value; }
        }

        /// <summary>
        /// Opens a new account with the specified details.
        /// </summary>
        /// <remarks>This method overrides the base implementation to open an account with the provided
        /// details. Ensure that all parameters meet the required constraints to avoid errors.</remarks>
        /// <param name="vNumber">The unique account number for the new account.</param>
        /// <param name="vType">The type of the account (e.g., "Savings", "Checking").</param>
        /// <param name="vClientName">The first name of the account holder.</param>
        /// <param name="vClientlastName">The last name of the account holder.</param>
        /// <param name="vBalance">The initial balance of the account. Must be a non-negative value.</param>
        /// <param name="vDay">The day of the account's opening date (1-31).</param>
        /// <param name="vMonth">The month of the account's opening date (1-12).</param>
        /// <param name="vYear">The year of the account's opening date.</param>
        public override void OpenAccount(int vNumber, string vType, string vClientName, string vClientlastName, decimal vBalance, int vDay, int vMonth, int vYear)
        {
            base.OpenAccount(vNumber, vType, vClientName, vClientlastName, vBalance, vDay, vMonth, vYear);
        }
        /// <summary>
        /// Retrieves account information, including the interest rate and details from the base account.
        /// </summary>
        /// <remarks>The returned string includes the interest rate formatted as a percentage, followed by
        /// additional account details provided by the base implementation of <see cref="ConsultAccount"/>.</remarks>
        /// <returns>A string containing the interest rate and other account details.</returns>
        public override string ConsultAccount()
        {
            string accountInfo = "";
            accountInfo += $"Interest Rate: {InterestRate:P2}\n";
            accountInfo += base.ConsultAccount();
            return accountInfo;
        }
        public override decimal Withdraw(decimal amount)
        {
            return base.Withdraw(amount);
        }
        /// <summary>
        /// Calculates the interest to be paid on a specified principal amount using the account's interest rate.
        /// </summary>
        /// <param name="Deposited">The principal amount on which interest is to be calculated. Must be non-negative.</param>
        /// <returns>The interest amount calculated based on the current interest rate.</returns>
        protected override decimal PayInterest(decimal Deposited)
        {
            // Example implementation: pay interest based on InterestRate
            return Deposited * InterestRate;
        }
        /// <summary>
        /// Deposits a specified amount into the account and applies interest based on the account's interest rate.
        /// </summary>
        /// <param name="deposited">The amount of money to be deposited. Must be a non-negative value.</param>
        /// <returns>Returns true if the deposit was successful; otherwise, false.</returns>
        public override bool Deposit(decimal deposited)
        {
            decimal amountTotal = deposited + PayInterest(deposited);
            return base.Deposit(amountTotal);
        }
        /// <summary>
        /// Calculates the commission to be charged for a given transaction amount.
        /// </summary>
        /// <param name="amount">The transaction amount for which the commission is to be calculated.</param>
        /// <returns>The commission amount to be charged. For this implementation, always returns <see langword="0m"/>.</returns>
        protected override decimal ChargeCommission(decimal amount)
        {
            // Example implementation: no commission for PaidAccount
            return 0m;
        }
    }
}
