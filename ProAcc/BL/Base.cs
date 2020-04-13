using ProAcc.BL.Model;
using ProACC_DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using static ProAcc.BL.Model.SP_SimplificationReport;

namespace ProAcc.BL
{
    public class Base
    {
        public SP_ReadinessReport_Result sAPInput()
        {
            SP_ReadinessReport_Result GetRelevant = new SP_ReadinessReport_Result();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_ReadinessReport", CommandType.StoredProcedure);
            dt = dB.ExecuteDataTable();
            if (dt.Rows.Count == 1)
            {
                GetRelevant.RC = Convert.ToInt32(dt.Rows[0]["RC"].ToString());
                GetRelevant.RC_NON = Convert.ToInt32(dt.Rows[0]["RC_NON"].ToString());
                GetRelevant.R_NON = Convert.ToInt32(dt.Rows[0]["R_NON"].ToString());
                GetRelevant.R = Convert.ToInt32(dt.Rows[0]["R"].ToString());
            }
            return GetRelevant;
        }
        public SP_SimplificationReport.GetDropdown sP_SimplificationReport()
        {
            SP_SimplificationReport.GetDropdown sP_ = new SP_SimplificationReport.GetDropdown();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_SimplificationReport", CommandType.StoredProcedure);
            dB.addIn("@Type", "GetDropdown");
            dt = dB.ExecuteDataTable();
            List<LOB> _Lob = new List<LOB>();

            int count = 0;
            foreach (DataRow dr in dt.Rows)
            {
                _Lob.Add(new LOB { Name = dr["LOB"].ToString(), ID = count });
                count = count++;
            }

            sP_.List_LOB = _Lob;
            return sP_;
        }
        //public SP_SimplificationReport.GetDropdown sP_SimplificationReport()
        //{
        //    SP_SimplificationReport.GetDropdown sP_ = new SP_SimplificationReport.GetDropdown();
        //    DataTable dt = new DataTable();
        //    DBHelper dB = new DBHelper("SP_SimplificationReport", CommandType.StoredProcedure);
        //    dB.addIn("@Type", "GetDropdown");
        //    dt = dB.ExecuteDataTable();
        //    List<LOB> _Lob = new List<LOB>();

        //    int count = 0;
        //    foreach (DataRow dr in dt.Rows)
        //    {
        //        _Lob.Add(new LOB { Name = dr["LOB"].ToString(), ID = count });
        //        count = count++;
        //    }

        //    sP_.List_LOB = _Lob;
        //    return sP_;
        //}
    }
}