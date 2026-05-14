using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HitVote.Models
{
    public class Person
        
    {
        public int id_person { get; set; }
        public string p_name     {get; set;}
        public DateTime p_birth  {get; set;}
        public string p_phone    {get; set;}
        public string p_password {get; set;}
        public string p_email    {get; set;}
        public int id_role { get; set; }
        public Role_Person? Role { get; set; }
        public ICollection<Vote> Votes { get; set; } = new List<Vote>();
    }   
}
