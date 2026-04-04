using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _3.Control
{
    public class CD_getInfo
    {
        private readonly CD_getData.EmployeeInterna Model = new CD_getData.EmployeeInterna();

        private CD_getData obj = new CD_getData();

        public string ReaderEmployee(string employeeNumber)
        {
            if (string.IsNullOrWhiteSpace(employeeNumber))
                throw new ArgumentException(nameof(employeeNumber));

            Model.vEmployeeNumber = employeeNumber;
            return Model.ReaderEmployee();
        }
        public DataTable EmployeeList()
        {
            // 1. Obj DataTable
            DataTable Table = new DataTable();
            // 2. Info Employee in Table Object
            Table = obj.EmployeeList();
            // 3. Make return
            return Table;
        }

    }
}
