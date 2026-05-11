using HitVote.Modals;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HitVote.Data
{
    public class AppDbContext : DbContext
    {
        // Cate un DbSet pentru fiecare tabel
        public DbSet<Role_Person> Role_Person { get; set; }
        public DbSet<Person> Person { get; set; }
        public DbSet<Singer> Singer { get; set; }
        public DbSet<Song> Song { get; set; }
        public DbSet<Form> Form { get; set; }
        public DbSet<Vote> Vote { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(
                @"Server=Adina\SQLEXPRESS; Database=HitVote;Trusted_Connection=True;TrustServerCertificate=True;"
            );
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // RolePerson
            modelBuilder.Entity<Role_Person>(entity =>
            {
                entity.HasKey(e => e.id_role);
                entity.Property(e => e.id_role).ValueGeneratedNever();
                entity.ToTable("Role_Person");
            });

            // Person
            modelBuilder.Entity<Person>(entity =>
            {
                entity.HasKey(e => e.id_person);
                entity.ToTable("Person");
                entity.HasOne(e => e.Role)
                      .WithMany(r => r.Persons)
                      .HasForeignKey(e => e.id_role);
            });

            // Singer
            modelBuilder.Entity<Singer>(entity =>
            {
                entity.HasKey(e => e.id_singer);
                entity.ToTable("Singer");
            });

            // Song
            modelBuilder.Entity<Song>(entity =>
            {
                entity.HasKey(e => e.id_song);
                entity.ToTable("Song");
            });

            // Form
            modelBuilder.Entity<Form>(entity =>
            {
                entity.HasKey(e => e.id_form);
                entity.ToTable("Form");
                entity.HasOne(e => e.Singer)
                      .WithMany(s => s.Forms)
                      .HasForeignKey(e => e.id_singer);
                entity.HasOne(e => e.Song)
                      .WithMany(s => s.Forms)
                      .HasForeignKey(e => e.id_song);
                entity.HasIndex(e => new { e.id_singer, e.id_song })
                      .IsUnique();
            });

            // Vote
            modelBuilder.Entity<Vote>(entity =>
            {
                entity.HasKey(e => e.id_vote);
                entity.ToTable("Vote");
                entity.HasOne(e => e.Person)
                      .WithMany(p => p.Votes)
                      .HasForeignKey(e => e.id_person);
                entity.HasOne(e => e.Form)
                      .WithMany(f => f.Votes)
                      .HasForeignKey(e => e.id_form);
                entity.HasIndex(e => new { e.id_person, e.id_form })
                      .IsUnique();
            });
        }
    }
}
