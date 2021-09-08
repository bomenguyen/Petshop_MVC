namespace Petshop.Areas.Administrator.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class DON_DAT_HANG
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DON_DAT_HANG()
        {
            CT_DAT_HANG = new HashSet<CT_DAT_HANG>();
        }

        [Key]
        [StringLength(10)]
        public string MaDH { get; set; }

        [Required]
        [StringLength(50)]
        public string DienthoaiKH { get; set; }

        [StringLength(50)]
        public string Ngaydat { get; set; }

        [StringLength(50)]
        public string Thanhtoan { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CT_DAT_HANG> CT_DAT_HANG { get; set; }

        public virtual KHACHHANG KHACHHANG { get; set; }
    }
}
