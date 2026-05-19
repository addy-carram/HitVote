using CommunityToolkit.Mvvm.ComponentModel;
using HitVote.Data;
using HitVote.Models.ViewsJoins;
using HitVote.Services;
using System.Collections.ObjectModel;
using System.Threading.Tasks;

namespace HitVote.ViewModels
{
    public class MusicViewModel : ObservableObject
    {
        private readonly FormService _formService;

        private ObservableCollection<FormSong> _songs;
        public ObservableCollection<FormSong> Songs
        {
            get => _songs;
            set { _songs = value; OnPropertyChanged(); }
        }

        private bool _isLoading;
        public bool IsLoading
        {
            get => _isLoading;
            set { _isLoading = value; OnPropertyChanged(); }
        }

        public MusicViewModel()
        {
            try
            {
                _formService = new FormService(new AppDbContext());
                _ = LoadFormsAsync();
            }
            catch (Exception ex)
            {
                // Pune breakpoint aici
                System.Diagnostics.Debug.WriteLine(ex.Message);
                System.Diagnostics.Debug.WriteLine(ex.StackTrace);
            }
        }

        private async Task LoadFormsAsync()
        {
            try
            {
                IsLoading = true;
                var data = await _formService.GetActiveFormsAsync();
                Songs = new ObservableCollection<FormSong>(data);
                IsLoading = false;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("EROARE: " + ex.Message);
                System.Diagnostics.Debug.WriteLine("INNER: " + ex.InnerException?.Message);
            }
        }
    }
}