using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace HitVote.Views.MainPanel.Home
{
    /// <summary>
    /// Interaction logic for HomeView.xaml
    /// </summary>
    public partial class HomeView : UserControl
    {
        public HomeView()
        {
            InitializeComponent();
            LoadSongs();
        }

        private void LoadSongs()
        {
            var songs = SongRepository.GetAll(); // your DB call

            // Convert byte[] image to ImageSource
            var items = songs.Select(s => new
            {
                s.Title,
                s.Artist,
                ImageSource = ByteToImage(s.ImageData)
            }).ToList();

            SongList.ItemsSource = items;
        }

        private ImageSource ByteToImage(byte[] data)
        {
            if (data == null) return null;
            var img = new BitmapImage();
            using var ms = new MemoryStream(data);
            img.BeginInit();
            img.CacheOption = BitmapCacheOption.OnLoad;
            img.StreamSource = ms;
            img.EndInit();
            return img;
        }
    }
}
