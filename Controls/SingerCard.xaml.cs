using System.Windows;
using System.Windows.Controls;

namespace HitVote.Controls
{
    public partial class SingerCard : UserControl
    {
        public static readonly DependencyProperty NameProperty =
            DependencyProperty.Register("SingerName", typeof(string), typeof(SingerCard));

        public static readonly DependencyProperty ImageSourceProperty =
            DependencyProperty.Register("ImageSource", typeof(string), typeof(SingerCard));

        public string SingerName
        {
            get => (string)GetValue(NameProperty);
            set => SetValue(NameProperty, value);
        }
        public string ImageSource
        {
            get => (string)GetValue(ImageSourceProperty);
            set => SetValue(ImageSourceProperty, value);
        }

        public SingerCard() => InitializeComponent();
    }
}