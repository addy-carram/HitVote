using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Data;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Documents;

namespace HitVote.Modals
{
 
    internal class Form
    {
       public int id_form   {get;set;}
       public int id_singer  {get;set;}
       public int id_song  {get;set;}
       public DateTime date_log  {get;set;}
       public string status  {get;set;}
    }
}
