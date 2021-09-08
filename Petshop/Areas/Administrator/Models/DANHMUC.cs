namespace Petshop.Areas.Administrator.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DANHMUC")]
    public partial class DANHMUC
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DANHMUC()
        {
            THONGTIN_PET = new HashSet<THONGTIN_PET>();
        }

        [Key]
        public int MaDM { get; set; }

        public int MaPL { get; set; }

        [StringLength(50)]
        public string TenDM { get; set; }

        public virtual PHANLOAI PHANLOAI { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<THONGTIN_PET> THONGTIN_PET { get; set; }
    }
}
