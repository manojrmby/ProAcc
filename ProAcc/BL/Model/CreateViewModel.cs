using ProACC_DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProAcc.BL.Model
{
    public class CreateViewModel
    {
        public Customer customer { get; set; }
        public Consultant consultant { get; set; }
    }
}