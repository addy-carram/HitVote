using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HitVote.Models
{

    public class Vote
    {
      public int id_vote   {get;set;}
      public int id_person   {get;set;}
      public int id_form   {get;set;}
      public int points   {get;set;}
        public Person? Person { get; set; }
        public Form? Form { get; set; }
    }
}
