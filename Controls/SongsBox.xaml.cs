using System;
using System.Collections.Generic;
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

namespace HitVote.Controls
{
    /// <summary>
    /// Interaction logic for SongsBox.xaml
    /// </summary>
    public partial class SongsBox : UserControl
    {
         public static readonly DependencyProperty TitleProperty =
            DependencyProperty.Register("Title", typeof(string), typeof(SongCard));

        public static readonly DependencyProperty ArtistProperty =
            DependencyProperty.Register("Artist", typeof(string), typeof(SongCard));

        public static readonly DependencyProperty ImageSourceProperty =
            DependencyProperty.Register("ImageSource", typeof(string), typeof(SongCard));

        public string Title
        {
            get => (string)GetValue(TitleProperty);
            set => SetValue(TitleProperty, value);
        }
        public string Artist
        {
            get => (string)GetValue(ArtistProperty);
            set => SetValue(ArtistProperty, value);
        }
        public string ImageSource
        {
            get => (string)GetValue(ImageSourceProperty);
            set => SetValue(ImageSourceProperty, value);
        }

        public SongsBox() => InitializeComponent();
    }
}
