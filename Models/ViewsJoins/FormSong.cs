using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace HitVote.Models.ViewsJoins
{
    public class FormSong
    {

        public int IdForm { get; set; }
        public string SongName { get; set; }
        public string SingerName { get; set; }
        public string SingerImage { get; set; }
        public string SongImage { get; set; }
        public int Duration { get; set; }
        public DateTime DateLog { get; set; }
        public int TotalPoints { get; set; }
        public int VoteCount { get; set; }
        public string status { get; set; }

        
        public string DurationFormatted =>
            $"{Duration / 60}:{Duration % 60:D2}";

    }
}
