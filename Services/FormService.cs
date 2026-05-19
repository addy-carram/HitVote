using HitVote.Data;
using HitVote.Models.ViewsJoins;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
namespace HitVote.Services
{
    public class FormService
    {
        private readonly AppDbContext _context;

        public FormService(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<FormSong>> GetActiveFormsAsync()
        {
            return await _context.Form
                .Where(f => f.status == "activ")
                .Include(f => f.Song)
                .Include(f => f.Singer)
                .Select(f => new FormSong
                {
                    IdForm = f.id_form,
                    SongName = f.Song.name_song,
                    SingerName = f.Singer.full_name,
                    SingerImage = f.Singer.image_path,
                    SongImage = f.Song.image_path,
                    Duration = f.Song.duration,
                    DateLog = f.date_log,
                    TotalPoints = f.Votes.Sum(v => v.points),
                    VoteCount = f.Votes.Count(),
                    status = f.status
                })
                .ToListAsync();
        }
    }
}
