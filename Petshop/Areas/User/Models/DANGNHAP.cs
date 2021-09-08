namespace Petshop.Areas.User.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DANGNHAP")]
    public partial class DANGNHAP
    {
        [Key]
        [StringLength(10)]
        public string tenDN { get; set; }

        [Required]
        [StringLength(10)]
        public string pass { get; set; }
    }
}
