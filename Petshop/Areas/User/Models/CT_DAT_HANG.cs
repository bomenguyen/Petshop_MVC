namespace Petshop.Areas.User.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class CT_DAT_HANG
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string MaDH { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string MaP { get; set; }

        [Required]
        [StringLength(20)]
        public string SoLuong { get; set; }

        [Required]
        [StringLength(50)]
        public string DonGia { get; set; }

        public virtual DON_DAT_HANG DON_DAT_HANG { get; set; }

        public virtual THONGTIN_PET THONGTIN_PET { get; set; }
    }
}
