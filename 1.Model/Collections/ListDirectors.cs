using _1.Model.Model;
using _1.Model.Model.IModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1.Model.Collections
{
    public class ListDirectors : IModelLists
    {
        private Dictionary<int, Director> listDirectors;
        public ListDirectors()
        {
            listDirectors = new Dictionary<int, Director>();
        }
        public Dictionary<int, Director> vlistDirectors
        {
            get { return listDirectors; }
            set { listDirectors = value; }
        }
        public int Quantity
        {
            get { return listDirectors.Values.Count; }
        }
        public Dictionary<int, Director>.ValueCollection Elements
        {
            get { return listDirectors.Values; }
        }

        public bool Exist(int directorNumber)
        {
            return listDirectors.ContainsKey(directorNumber);
        }
  
        object IModelLists.Find(int directorNumber)
        {
            if (Exist(directorNumber))
            {
                return listDirectors[directorNumber];
            }
            else
                return null;
        }
        public bool Add(object obj)
        {
            Director director = (Director)obj;
            if (!Exist(director.vNumber))
            {
                listDirectors.Add(director.vNumber, director);
                return true;
            }
            return false;
        }
        public bool Update(int directorNumber, object obj)
        {
            Director director = (Director)obj;
            if (Exist(directorNumber))
            {
                listDirectors[directorNumber] = director;
                return true;
            }
            return false;
        }
        public bool Delete(int number)
        {
            return listDirectors.Remove(number);
        }
        public void Clear()
        {
            listDirectors.Clear();
        }
        public string ShowList()
        {
            string allDirectors = "";
            foreach (var director in listDirectors.Values)
            {
                allDirectors += director.ShowHuman() + "\n";
            }
            return allDirectors;
        }

        //public bool Add(Director director)
        //{
        //    if (!Exist(director.vNumber))
        //    {
        //        listDirectors.Add(director.vNumber, director);
        //        return true;
        //    }
        //    return false;
        //}


        //public Director Find(string directorNumber)
        //{
        //    if (Exist(directorNumber))
        //    {
        //        return listDirectors[directorNumber];
        //    }
        //    else
        //        return null;
        //}


    }
}
