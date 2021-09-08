namespace Petshop.Areas.Administrator.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class THONGTIN_PET
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public THONGTIN_PET()
        {
            CT_DAT_HANG = new HashSet<CT_DAT_HANG>();
        }

        [Key]
        [StringLength(10)]
        public string MaP { get; set; }

        public int MaDM { get; set; }

        [StringLength(100)]
        public string TenP { get; set; }

        public string MoTa { get; set; }

        [StringLength(20)]
        public string Giaban { get; set; }

        [StringLength(50)]
        public string ANH { get; set; }

        [StringLength(6)]
        public string MaNCC { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CT_DAT_HANG> CT_DAT_HANG { get; set; }

        public virtual DANHMUC DANHMUC { get; set; }

        public virtual NCC NCC { get; set; }
    }
}
