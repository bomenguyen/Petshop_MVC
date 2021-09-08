using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Petshop.Areas.User.Models
{
    public partial class UserContent : DbContext
    {
        public UserContent()
            : base("name=UserContent")
        {
        }

        public virtual DbSet<CT_DAT_HANG> CT_DAT_HANG { get; set; }
        public virtual DbSet<DANGNHAP> DANGNHAPs { get; set; }
        public virtual DbSet<DANHMUC> DANHMUCs { get; set; }
        public virtual DbSet<DON_DAT_HANG> DON_DAT_HANG { get; set; }
        public virtual DbSet<KHACHHANG> KHACHHANGs { get; set; }
        public virtual DbSet<NCC> NCCs { get; set; }
        public virtual DbSet<PHANLOAI> PHANLOAIs { get; set; }
        public virtual DbSet<THONGTIN_PET> THONGTIN_PET { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CT_DAT_HANG>()
                .Property(e => e.MaDH)
                .IsUnicode(false);

            modelBuilder.Entity<CT_DAT_HANG>()
                .Property(e => e.MaP)
                .IsUnicode(false);

            modelBuilder.Entity<CT_DAT_HANG>()
                .Property(e => e.SoLuong)
                .IsUnicode(false);

            modelBuilder.Entity<CT_DAT_HANG>()
                .Property(e => e.DonGia)
                .IsUnicode(false);

            modelBuilder.Entity<DANGNHAP>()
                .Property(e => e.tenDN)
                .IsUnicode(false);

            modelBuilder.Entity<DANGNHAP>()
                .Property(e => e.pass)
                .IsUnicode(false);

            modelBuilder.Entity<DANHMUC>()
                .HasMany(e => e.THONGTIN_PET)
                .WithRequired(e => e.DANHMUC)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DON_DAT_HANG>()
                .Property(e => e.MaDH)
                .IsUnicode(false);

            modelBuilder.Entity<DON_DAT_HANG>()
                .Property(e => e.DienthoaiKH)
                .IsUnicode(false);

            modelBuilder.Entity<DON_DAT_HANG>()
                .Property(e => e.Ngaydat)
                .IsUnicode(false);

            modelBuilder.Entity<DON_DAT_HANG>()
                .HasMany(e => e.CT_DAT_HANG)
                .WithRequired(e => e.DON_DAT_HANG)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<KHACHHANG>()
                .Property(e => e.DienthoaiKH)
                .IsUnicode(false);

            modelBuilder.Entity<KHACHHANG>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<KHACHHANG>()
                .HasMany(e => e.DON_DAT_HANG)
                .WithRequired(e => e.KHACHHANG)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NCC>()
                .Property(e => e.MaNCC)
                .IsUnicode(false);

            modelBuilder.Entity<NCC>()
                .Property(e => e.DIENTHOAI)
                .IsUnicode(false);

            modelBuilder.Entity<PHANLOAI>()
                .HasMany(e => e.DANHMUCs)
                .WithRequired(e => e.PHANLOAI)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<THONGTIN_PET>()
                .Property(e => e.MaP)
                .IsUnicode(false);

            modelBuilder.Entity<THONGTIN_PET>()
                .Property(e => e.Giaban)
                .IsUnicode(false);

            modelBuilder.Entity<THONGTIN_PET>()
                .Property(e => e.MaNCC)
                .IsUnicode(false);

            modelBuilder.Entity<THONGTIN_PET>()
                .HasMany(e => e.CT_DAT_HANG)
                .WithRequired(e => e.THONGTIN_PET)
                .WillCascadeOnDelete(false);
        }
    }
}
