using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace HitVote.Controls
{
    public partial class SongCard : UserControl
    {
        public static readonly DependencyProperty TitleProperty =
            DependencyProperty.Register("Title", typeof(string), typeof(SongCard));

        public static readonly DependencyProperty ArtistProperty =
            DependencyProperty.Register("Artist", typeof(string), typeof(SongCard));

        public static readonly DependencyProperty ImageSourceProperty =
            DependencyProperty.Register("ImageSource", typeof(string), typeof(SongCard));

        public static readonly DependencyProperty DurationProperty =
            DependencyProperty.Register("Duration", typeof(string), typeof(SongCard));

        public static readonly DependencyProperty DateProperty =
            DependencyProperty.Register("Date", typeof(string), typeof(SongCard));

        
        public static readonly DependencyProperty ActiveProperty =
            DependencyProperty.Register("Active", typeof(string), typeof(SongCard));
        public static readonly DependencyProperty TotalPointsProperty =
    DependencyProperty.Register("TotalPoints", typeof(int), typeof(SongCard));

        public static readonly DependencyProperty VoteCountProperty =
            DependencyProperty.Register("VoteCount", typeof(int), typeof(SongCard));

        public int TotalPoints
        {
            get => (int)GetValue(TotalPointsProperty);
            set => SetValue(TotalPointsProperty, value);
        }

        public int VoteCount
        {
            get => (int)GetValue(VoteCountProperty);
            set => SetValue(VoteCountProperty, value);
        }

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
        public string Duration
        {
            get => (string)GetValue(DurationProperty);
            set => SetValue(DurationProperty, value);
        }
        public string Date
        {
            get => (string)GetValue(DateProperty);
            set => SetValue(DateProperty, value);
        }
       
        public string Active
        {
            get => (string)GetValue(ActiveProperty);
            set => SetValue(ActiveProperty, value);
        }
        public SongCard() => InitializeComponent();
    }
}