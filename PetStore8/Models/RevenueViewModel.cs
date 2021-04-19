using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PetStore8.Models
{
    public class RevenueViewModel
    {
        [Key]
        public int Id { get; set; }
        [Display(Name = "From date")]
        public Nullable<System.DateTime> FromDate { get; set; }
        [Display(Name = "To date")]
        public Nullable<System.DateTime> ToDate { get; set; }
    }
}