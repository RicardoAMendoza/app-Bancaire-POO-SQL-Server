using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1.Model.Model.IModel
{
    public interface IModelLists
    {
        bool Exist(string index);
        Object Find(string index);
        bool Add(Object obj);
        bool Delete(string index);
        string ShowList();
        void Clear();
        bool Update(string accountNumber, object obj);
    }
}
