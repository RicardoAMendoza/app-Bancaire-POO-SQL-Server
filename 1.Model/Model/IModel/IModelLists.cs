using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1.Model.Model.IModel
{
    public interface IModelLists
    {
        bool Exist(int index);
        Object Find(int index);
        bool Add(Object obj);
        bool Delete(int index);
        string ShowList();
        void Clear();
        bool Update(int accountNumber, object obj);
    }
}
