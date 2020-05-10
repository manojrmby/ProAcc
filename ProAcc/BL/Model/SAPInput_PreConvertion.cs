using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProAcc.BL.Model
{
    public class SAPInput_PreConvertion
    {
		public Guid FileUploadID { get; set; }
		public string Relevance { get; set; }
		public string Last_Consistency_Result { get; set; }
		public string Exemption_Possible { get; set; }
		public string ID { get; set; }
		public string Title { get; set; }
		public string Lob_Technology {get;set;}
		public string Business_Area { get; set; }
		public string Catetory { get; set; }
		public string Component { get; set; }
		public string Status { get; set; }
		public string Note { get; set; }
		public string Application_Area { get; set; }
		public string Summary { get; set; }

	}
}