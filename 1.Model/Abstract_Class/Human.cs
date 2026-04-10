using Microsoft.Build.Framework;
using Microsoft.Build.Framework.XamlTypes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.Globalization;
using System.Reflection;
using System.ComponentModel.DataAnnotations;
using Xunit;
using Xunit.Sdk;
using RequiredAttribute = System.ComponentModel.DataAnnotations.RequiredAttribute;



/// <summary>
namespace _1.Model.Abstract_Class
{
    public abstract class Human
    {
        private int Id;
        private string Name;
        private string LastName;
        private string EMail;
        private string Photo;
        private string Sexe;
        private string Active;

        public Human(int vId, string vName, string vLastName, string vEMail,  string vPhoto, string vSexe, string vActive)
        {
            Id = vId;  
            Name = vName;
            LastName = vLastName;
            EMail = vEMail;
            Photo = vPhoto;
            Sexe = vSexe;
            Active = vActive;
        }
        public Human()
        {
            Id = 0;
            Name = EmptyConstructor.stringEmptyConstructor();
            LastName = EmptyConstructor.stringEmptyConstructor();
            EMail = EmptyConstructor.stringEmptyConstructor();
            Photo = EmptyConstructor.stringEmptyConstructor();
            Sexe = EmptyConstructor.stringEmptyConstructor();
            Active = EmptyConstructor.stringEmptyConstructor();
        }

        [DisplayName("Pet Name")]
        [Required(ErrorMessage = "Pet name is requerid")]
        [StringLength(50, MinimumLength = 3, ErrorMessage = "Pet name must be between 3 and 50 characters")]
        public int vId
        {
            get { return Id; }
            set { Id = value; }
        }

        public string vName
        {
            get { return Name; }
            set { Name = value; }
        }

        public string vLastName
        {
            get { return LastName; }
            set { LastName = value; }
        }
        public string vEMail
        {
            get { return EMail; }
            set { EMail = value; }
        }
        public string vPhoto
        {
            get { return Photo; }
            set { Photo = value; }
        }
        public string vSexe
        {
            get { return Sexe; }
            set { Sexe = value; }
        }
        public string vActive
        {
            get { return Active; }
            set { Active = value; }
        }

        public virtual void CreateHuman(int vId, string vName, string vLastName, string vEMail, string vPhoto, string vSexe, string vActive)
        {
            Id = vId;
            Name = vName;
            LastName = vLastName;
            EMail = vEMail;
            Photo = vPhoto;
            Sexe = vSexe;
            Active = vActive;
        }
        public virtual string ShowHuman()
        {
            string info = "";
            info += "\n Id : " + Id;
            info = info + "\nName : " + Name;
            info = info + "\nLast Name : " + LastName;
            info = info + "\nPhoto : " + Photo;
            info = info + "\nEMail : " + EMail;
            info = info + "\nSexe : " + Sexe;
            info = info + "\nActive : " + Active;
            return info;
        }
    }
}
