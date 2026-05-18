using HitVote.Views.MainPanel.Home;
using HitVote.Views.MainPanel.Vote;
using HitVote.Views.MainPanel.Artist;
using HitVote.Views.MainPanel.Music;
using HitVote.Views.MainPanel.Raport;
using HitVote.Views.MainPanel.Person;
using HitVote.Views.Account;
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
using System.Windows.Shapes;

namespace HitVote.Views.MainPanel
{
    /// <summary>
    /// Interaction logic for MainPanel.xaml
    /// </summary>
    public partial class MainPanel : Window
    {
        public MainPanel()
        {
            InitializeComponent();
            MainContent.Content = new HomeView();
        }
      
        private void vote_Click_1(object sender, RoutedEventArgs e)
        {
            MainContent.Content = new VoteView();

        }

        private void person_Copy_Click(object sender, RoutedEventArgs e)
        {
            MainContent.Content = new ArtistView();
        }

        private void music_Click(object sender, RoutedEventArgs e)
        {
            MainContent.Content = new MusicView();
        }

        private void Home_Click(object sender, RoutedEventArgs e)
        {
            MainContent.Content = new HomeView();
        }

        private void raport_Click(object sender, RoutedEventArgs e)
        {
            MainContent.Content = new RaportView();
        }

        private void person_Click(object sender, RoutedEventArgs e)
        {
            MainContent.Content = new PersonView();
        }

        private void Account_Click(object sender, RoutedEventArgs e)
        {
            MainContent.Content = new AccountView();
        }
    }
}
