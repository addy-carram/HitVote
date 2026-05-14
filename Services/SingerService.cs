using HitVote.Data;
using HitVote.Models;

namespace HitVote.Services
{
    public class SingerService
    {
        private readonly AppDbContext _db = new();

        public List<Singer> GetAllSingers() =>
            _db.Singer.ToList();
    }
}