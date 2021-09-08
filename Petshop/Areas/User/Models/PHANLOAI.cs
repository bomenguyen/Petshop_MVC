namespace Petshop.Areas.User.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PHANLOAI")]
    public partial class PHANLOAI
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PHANLOAI()
        {
            DANHMUCs = new HashSet<DANHMUC>();
        }

        [Key]
        public int MaPL { get; set; }

        [StringLength(50)]
        public string TenPL { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DANHMUC> DANHMUCs { get; set; }
    }
}
