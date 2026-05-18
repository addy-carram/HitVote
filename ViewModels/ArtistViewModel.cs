using CommunityToolkit.Mvvm.ComponentModel;
using HitVote.Models;
using HitVote.Services;
using System.Collections.ObjectModel;

namespace HitVote.ViewModels
{
    public partial class ArtistViewModel : ObservableObject
    {
        private readonly SingerService _singerService = new();

        [ObservableProperty]
        private ObservableCollection<Singer> singers = new();

        public ArtistViewModel()
        {
            LoadData();
        }

        private void LoadData()
        {
            var singerList = _singerService.GetAllSingers();
            Singers = new ObservableCollection<Singer>(singerList);
        }
    }
}