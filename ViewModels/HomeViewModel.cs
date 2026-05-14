using CommunityToolkit.Mvvm.ComponentModel;
using HitVote.Models;
using HitVote.Services;
using System.Collections.ObjectModel;
using System.Windows.Media;

namespace HitVote.ViewModels
{
    public partial class HomeViewModel : ObservableObject
    {
        private readonly SongService _songService = new();
        private readonly SingerService _singerService = new();

        [ObservableProperty]
        private ObservableCollection<Song> songs = new();

        [ObservableProperty]
        private ObservableCollection<Singer> singers = new();

        [ObservableProperty]
        private Song topSong;

        public HomeViewModel()
        {
            LoadData();
        }

        private void LoadData()
        {
            var songList = _songService.GetAllSongs();
            Songs = new ObservableCollection<Song>(songList);
            TopSong = _songService.GetTopSong();

            var singerList = _singerService.GetAllSingers();
            Singers = new ObservableCollection<Singer>(singerList);
        }
    }
}