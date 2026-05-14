using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HitVote.Models
{
    public class Role_Person
    {
        public int id_role { get; set; }
        public string role_name { get; set; }
        public ICollection<Person> Persons { get; set; } = new List<Person>();
    }
}
