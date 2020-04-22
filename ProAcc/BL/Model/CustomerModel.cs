using ProACC_DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ProAcc.BL.Model
{
    public class CustomerModel
    {
        public CustomerModel()
        {
            this.CustomerProjectConfigs = new HashSet<CustomerProjectConfig>();
        }

        public System.Guid Id { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public int UserTypeID { get; set; }
        public string Name { get; set; }
        public string Company { get; set; }
        public string Work_Function { get; set; }
        
        //[Required(ErrorMessage = "You must provide a phone number")]
        //[Display(Name = "Phone")]
        //[DataType(DataType.PhoneNumber)]
        //[RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$", ErrorMessage = "Not a valid phone number")]
        [Required(ErrorMessage = "Required")]
        [RegularExpression(@"^(\d{10})$", ErrorMessage = "Wrong mobile")]
        public string Phone { get; set; }
        public string Email { get; set; }
        [DisplayName("Estimated Sale")]
        public Nullable<decimal> EstimatedSale { get; set; }
        
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? LastContact_Dt { get; set; }
        public Nullable<System.DateTime> NextAction_Dt { get; set; }
        public Nullable<System.DateTime> NextContact_Dt { get; set; }
        public string LeadStatus { get; set; }
        public string LeadSource { get; set; }
        public string Conv_Cust_Status { get; set; }
        public bool isActive { get; set; }
        public System.DateTime Cre_on { get; set; }
        public System.Guid Cre_By { get; set; }
        public Nullable<System.DateTime> Modified_On { get; set; }
        public Nullable<System.Guid> Modified_by { get; set; }
        public bool IsDeleted { get; set; }

        public virtual User_Master User_Master { get; set; }
        public virtual Project Project { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CustomerProjectConfig> CustomerProjectConfigs { get; set; }
    }
}