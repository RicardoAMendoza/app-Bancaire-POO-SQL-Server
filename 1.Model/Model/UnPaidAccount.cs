using _1.Model.Abstract_Class;
using _1.Model.Collections;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1.Model.Model
{
    public class UnPaidAccount : Account
    {
        private decimal Overdraft;
        private decimal Fees;

        public UnPaidAccount(int vNumber, string vType, string vClientName, string vClientlastName, decimal vBalance, int vDay, int vMonth, int vYear, decimal vOverdraft, decimal vFees)
            : base(vNumber, vType, vClientName, vClientlastName, vBalance, vDay, vMonth, vYear)
        {
            Overdraft = vOverdraft;
            Fees = vFees;
        }
        public UnPaidAccount()
           : base()
        {
            Overdraft = 0;
        }
        public decimal vOverdaraft
        {
            get { return Overdraft; }
            set { Overdraft = value; }
        }
        public decimal vFees
        {
            get { return Fees; }
            set { Fees = value; }
        }

        public override void OpenAccount(int vNumber, string vType, string vClientName, string vClientlastName, decimal vBalance, int vDay, int vMonth, int vYear)
        {
            base.OpenAccount(vNumber, vType, vClientName, vClientlastName, vBalance, vDay, vMonth, vYear);
        }
        public override string ConsultAccount()
        {
            string accountInfo = "";
            accountInfo += $"Overdraft: {Overdraft:P2}\n";
            accountInfo += base.ConsultAccount();
            return accountInfo;
        }
        protected override decimal ChargeCommission(decimal withdrawal)
        {
            if (withdrawal > Overdraft)
            {
                withdrawal = withdrawal * Fees;
                return withdrawal;
            }
            else
                return withdrawal;
        }
        public override decimal Withdraw(decimal amount)
        {
            decimal totalAmount = amount + ChargeCommission(amount);
            return base.Withdraw(totalAmount);
        }
        public override bool Deposit(decimal deposit)
        {
            return base.Deposit(deposit);
        }
        protected override decimal PayInterest(decimal amount)
        {
            throw new NotImplementedException();
        }
    }
}
