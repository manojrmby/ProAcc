﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProAcc.BL.Model
{
    public class Common
    {
        public class GeneralList
        {

            public List<Lis> _List { get; set; }


        }
        public class Lis
        {
            public string Name { get; set; }
            public int _Value { get; set; }
        }
    }
}