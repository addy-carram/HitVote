using CommunityToolkit.Mvvm.ComponentModel;
using HitVote.Models;
using HitVote.Services;
using System.Collections.ObjectModel;
using System.Windows.Media;

namespace HitVote.ViewModels
{
    public partial class MusicViewModel : ObservableObject
    {
        private readonly SongService _songService = new();

        [ObservableProperty]
        private ObservableCollection<Song> songs = new();


        public MusicViewModel()
        {
            LoadData();
        }

        private void LoadData()
        {
            var songList = _songService.GetAllSongs();
            var song3list = _songService.Get3Songs();
            Songs = new ObservableCollection<Song>(songList.Skip(1));
        }

    }
}