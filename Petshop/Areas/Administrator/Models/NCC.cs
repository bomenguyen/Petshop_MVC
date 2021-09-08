namespace Petshop.Areas.Administrator.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NCC")]
    public partial class NCC
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NCC()
        {
            THONGTIN_PET = new HashSet<THONGTIN_PET>();
        }

        [Key]
        [StringLength(6)]
        public string MaNCC { get; set; }

        [StringLength(30)]
        public string TeNNCC { get; set; }

        [StringLength(40)]
        public string DIACHI { get; set; }

        [StringLength(11)]
        public string DIENTHOAI { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<THONGTIN_PET> THONGTIN_PET { get; set; }
    }
}
