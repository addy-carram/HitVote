using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HitVote.Modals
{
    public class Singer
    {
        public  int id_singer     { get; set; }
        public string full_name      { get; set; }
        public DateTime date_birth     { get; set; }
        public  string email     { get; set; }
        public  string phone     { get; set; }
        public  string image_path     { get; set; }

        public ICollection<Form> Forms { get; set; } = new List<Form>();
    }
}
