using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProAcc.BL.Model
{
    public class SP_SimplificationReport
    {
        public class GetDropdown
        {

            public List<LOB> List_LOB { get; set; }


        }
        public class LOB
        {
            public string Name { get; set; }
            public int ID { get; set; }
        }
    }
}