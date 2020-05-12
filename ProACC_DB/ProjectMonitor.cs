//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProACC_DB
{
    using System;
    using System.Collections.Generic;
    
    public partial class ProjectMonitor
    {
        public System.Guid Id { get; set; }
        public Nullable<System.Guid> Instance { get; set; }
        public Nullable<int> PhaseId { get; set; }
        public string Task { get; set; }
        public Nullable<int> Sequence { get; set; }
        public bool Task_Other_Environment { get; set; }
        public bool Dependency { get; set; }
        public int PendingId { get; set; }
        public bool Delay_occurred { get; set; }
        public bool Team { get; set; }
        public System.Guid ConsultantID { get; set; }
        public int StatusId { get; set; }
        public double EST_hours { get; set; }
        public double Actual_St_hours { get; set; }
        public System.DateTime Planed__St_Date { get; set; }
        public System.DateTime Actual_St_Date { get; set; }
        public System.DateTime Planed__En_Date { get; set; }
        public System.DateTime Actual_En_Date { get; set; }
        public string Notes { get; set; }
        public bool isActive { get; set; }
        public System.DateTime Cre_on { get; set; }
        public System.Guid Cre_By { get; set; }
        public Nullable<System.DateTime> Modified_On { get; set; }
        public Nullable<System.Guid> Modified_by { get; set; }
        public bool IsDeleted { get; set; }
    }
}
