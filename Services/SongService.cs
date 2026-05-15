using HitVote.Data;
using HitVote.Models;
using Microsoft.EntityFrameworkCore;

namespace HitVote.Services
{
    public class SongService
    {
        private readonly AppDbContext _db = new();

        public List<Song> GetAllSongs() =>
            _db.Song.ToList();

        public Song GetTopSong() =>
            _db.Song.FirstOrDefault();
        public List<Song> Get3Songs()=>
            _db.Song.ToList();
    }
}