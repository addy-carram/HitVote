using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HitVote.Models
{
    public class Song
    {
       public int id_song   {get;set;}
       public string name_song   {get;set;}
       public int duration   {get;set;}
       public string image_path   {get;set;}
        public ICollection<Form> Forms { get; set; } = new List<Form>();
    }
}
