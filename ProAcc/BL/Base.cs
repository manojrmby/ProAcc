
using ProAcc.BL.Model;
using ProACC_DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using static ProAcc.BL.Model.Common;

namespace ProAcc.BL
{
    public class Base
    {
        Guid userID = Guid.Empty;
        //Graph
        public SP_ReadinessReport_Result sAPInput()
        {
            SP_ReadinessReport_Result GetRelevant = new SP_ReadinessReport_Result();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_ReadinessReport", CommandType.StoredProcedure);
            dB.addIn("@Type", "Simple_Donut");
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
        public GeneralList sP_SimplificationReport()
        {
            GeneralList sP_ = new GeneralList();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_SimplificationReport", CommandType.StoredProcedure);
            dB.addIn("@Type", "GetDropdown");
            dt = dB.ExecuteDataTable();
            List<Lis> _Lob = new List<Lis>();

            int count = 0;
            foreach (DataRow dr in dt.Rows)
            {
                _Lob.Add(new Lis { Name = dr["LOB"].ToString(), _Value = count });
                count = count++;
            }

            sP_._List = _Lob;
            return sP_;
        }
        public GeneralList sP_SimplificationReport_Bar(String Input)
        {
            GeneralList sP_ = new GeneralList();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_SimplificationReport", CommandType.StoredProcedure);
            if (Input == "ALL")
            {
                dB.addIn("@Type", "ALL");
            }
            else
            {
                dB.addIn("@Type", "Single");
                dB.addIn("@Input", Input);
            }
            dt = dB.ExecuteDataTable();
            if (dt.Rows.Count > 0)
            {
                List<Lis> _Lob = new List<Lis>();
                foreach (DataRow dr in dt.Rows)
                {
                    _Lob.Add(
                        new Lis
                        {
                            Name = dr["LOB_NAME"].ToString(),
                            _Value = Convert.ToInt32(dr["_Count"].ToString()
                            )
                        });

                }

                sP_._List = _Lob;


            }
            return sP_;
        }

        public GeneralList sP_GetActivities_Bar1()
        {
            GeneralList sP_ = new GeneralList();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_ReadinessReport", CommandType.StoredProcedure);

            dB.addIn("@Type", "Activities_Bar1");
            dt = dB.ExecuteDataTable();
            if (dt.Rows.Count > 0)
            {
                List<Lis> _Lob = new List<Lis>();
                foreach (DataRow dr in dt.Rows)
                {
                    _Lob.Add(
                        new Lis
                        {
                            Name = dr["ACT_NAME"].ToString(),
                            _Value = Convert.ToInt32(dr["_Count"].ToString()
                            )
                        });

                }

                sP_._List = _Lob;


            }
            return sP_;
        }
        public GeneralList sP_GetActivities_Bar2()
        {
            GeneralList sP_ = new GeneralList();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_ReadinessReport", CommandType.StoredProcedure);

            dB.addIn("@Type", "Activities_Bar2");
            dt = dB.ExecuteDataTable();
            if (dt.Rows.Count > 0)
            {
                List<Lis> _Lob = new List<Lis>();
                foreach (DataRow dr in dt.Rows)
                {
                    _Lob.Add(
                        new Lis
                        {
                            Name = dr["Phase"].ToString(),
                            _Value = Convert.ToInt32(dr["_Count"].ToString()
                            )
                        });

                }

                sP_._List = _Lob;


            }
            return sP_;
        }
        public GeneralList sP_GetActivities_Donut()
        {
            GeneralList sP_ = new GeneralList();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_ReadinessReport", CommandType.StoredProcedure);

            dB.addIn("@Type", "Activities_Donut");
            dt = dB.ExecuteDataTable();
            if (dt.Rows.Count > 0)
            {
                List<Lis> _Lob = new List<Lis>();
                foreach (DataRow dr in dt.Rows)
                {
                    _Lob.Add(
                        new Lis
                        {
                            Name = dr["Condition"].ToString(),
                            _Value = Convert.ToInt32(dr["_Count"].ToString()
                            )
                        });

                }

                sP_._List = _Lob;


            }
            return sP_;
        }


        public GeneralList sP_GetFiori_Bar()
        {
            GeneralList sP_ = new GeneralList();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_ReadinessReport", CommandType.StoredProcedure);

            dB.addIn("@Type", "Fiori_Bar");
            dt = dB.ExecuteDataTable();
            if (dt.Rows.Count > 0)
            {
                List<Lis> _Lob = new List<Lis>();
                foreach (DataRow dr in dt.Rows)
                {
                    _Lob.Add(
                        new Lis
                        {
                            Name = dr["Application_Area"].ToString(),
                            _Value = Convert.ToInt32(dr["_Count"].ToString()
                            )
                        });

                }

                sP_._List = _Lob;


            }
            return sP_;
        }
        public GeneralList sP_GetCustomCode_Bar()
        {
            GeneralList sP_ = new GeneralList();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_ReadinessReport", CommandType.StoredProcedure);

            dB.addIn("@Type", "CustomCode_Bar");
            dt = dB.ExecuteDataTable();
            if (dt.Rows.Count > 0)
            {
                List<Lis> _Lob = new List<Lis>();
                foreach (DataRow dr in dt.Rows)
                {
                    _Lob.Add(
                        new Lis
                        {
                            Name = dr["_Status"].ToString(),
                            _Value = Convert.ToInt32(dr["_Count"].ToString()
                            )
                        });

                }

                sP_._List = _Lob;


            }
            return sP_;
        }
        public List<SAPInput_SimplificationReport> SAPInput_SimplificationReport()
        {
            List<SAPInput_SimplificationReport> SR = new List<SAPInput_SimplificationReport>();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_SimplificationReport", CommandType.StoredProcedure);
            dB.addIn("@Type", "SR_Table");
            dt = dB.ExecuteDataTable();
            //  List<DataRow> list = new List<DataRow>(dt.Select());
            int i = 0;
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    i += 1;
                    SAPInput_SimplificationReport data = new SAPInput_SimplificationReport();
                    data.S_No = i;
                    data.Title = dr["Title"].ToString();
                    data.Category = dr["Category"].ToString();
                    data.Relevance = dr["Relevance"].ToString();
                    data.LoB_Technology = dr["LoB/Technology"].ToString();
                    data.Business_Area = dr["Business Area"].ToString();
                    data.Consistency_Status = dr["Consistency Status"].ToString();
                    data.Manual_Status = dr["Manual Status"].ToString();
                    data.SAP_Notes = dr["SAP Notes"].ToString();
                    data.Relevance_Summary = dr["Relevance Summary"].ToString();
                    SR.Add(data);
                }
            }
            return SR;
        }

        public List<SAPInput_CustomCode> SAPInput_CustomCodeReport()
        {
            List<SAPInput_CustomCode> CR = new List<SAPInput_CustomCode>();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_CustomCode", CommandType.StoredProcedure);
            dB.addIn("@Type", "CustomTable");
            dt = dB.ExecuteDataTable();
            //  List<DataRow> list = new List<DataRow>(dt.Select());
            int i = 0;
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    i += 1;
                    SAPInput_CustomCode data = new SAPInput_CustomCode();
                    data.S_No = i;
                    data.Custom_Code_Topic = dr["Custom Code Topic"].ToString();
                    data.Status = dr["Status"].ToString();
                    data.Application_Component = dr["Application Component"].ToString();
                    data.Custom_Code_Note = dr["Custom Code Note"].ToString();

                    CR.Add(data);
                }
            }
            return CR;
        }

        //public GeneralList sP_AnalysisDropdownProject()
        //{
        //    GeneralList sP_ = new GeneralList();
        //    DataSet ds = new DataSet();
        //    DBHelper dB = new DBHelper("SP_CreateAnalysis", CommandType.StoredProcedure);
        //    dB.addIn("@Type", "Drp_Project");
        //    ds = dB.ExecuteDataSet();
        //    List<Lis> _Lob = new List<Lis>();
        //    if (ds.Tables.Count > 0)
        //    {
        //        DataTable dt = new DataTable();
        //        dt = ds.Tables[0];
        //        foreach (DataRow dr in dt.Rows)
        //        {
        //            _Lob.Add(new Lis
        //            {
        //                Name = dr["ProjectName"].ToString(),
        //                Value = dr["CustProjconfigID"].ToString()
        //            });

        //        }
        //    }


        //    sP_._List = _Lob;
        //    return sP_;
        //}
        public Tuple<List<Lis>, List<Lis>> sP_AnalysisDropdowns()
        {
            List<Lis> list1 = new List<Lis>();
            List<Lis> list2 = new List<Lis>();
            DataSet ds = new DataSet();
            DBHelper dB = new DBHelper("SP_CreateAnalysis", CommandType.StoredProcedure);
            dB.addIn("@Type", "Drp_Project");
            ds = dB.ExecuteDataSet();

            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataTable dt = new DataTable();
                    dt = ds.Tables[0];//Customer
                    foreach (DataRow dr in dt.Rows)
                    {
                        list1.Add(new Lis
                        {
                            Name = dr["Name"].ToString(),
                            Value = dr["ID"].ToString()
                        });

                    }
                }
                if (ds.Tables[1].Rows.Count > 0)
                {
                    DataTable dt = new DataTable();
                    dt = ds.Tables[1];//ProjectName
                    foreach (DataRow dr in dt.Rows)
                    {
                        list2.Add(new Lis
                        {

                            Name = dr["ProjectName"].ToString(),
                            Value = dr["CustProjconfigID"].ToString()
                        });

                    }
                }

            }

            return Tuple.Create(list1, list2);
        }



        //FileUpload
        public Boolean Upload_Activities(DataTable CustomTable, string fileName, Guid Instance_ID)
        {
            Boolean status = false;


            DBHelper dB = new DBHelper("SP_FileUpload", CommandType.StoredProcedure);

            dB.addIn("@Type", "up_Activities");
            dB.addIn("@tblActivities", CustomTable);
            dB.addIn("@File_Type", "Activities");
            dB.addIn("@FileUploadID", Guid.NewGuid());
            dB.addIn("@instanceId", Instance_ID);
            dB.addIn("@fileName", fileName);
            dB.addIn("@Createdby", userID);

            dB.ExecuteScalar();
            status = true;
            return status;

        }
        public Boolean Upload_CustomCode(DataTable CustomTable, string fileName, Guid Instance_ID)
        {
            Boolean status = false;


            DBHelper dB = new DBHelper("SP_FileUpload", CommandType.StoredProcedure);

            dB.addIn("@Type", "up_CustomCode");
            dB.addIn("@tblCustomCode", CustomTable);
            dB.addIn("@File_Type", "CustomCode");
            dB.addIn("@FileUploadID", Guid.NewGuid());
            dB.addIn("@instanceId", Instance_ID);
            dB.addIn("@fileName", fileName);
            dB.addIn("@Createdby", userID);

            dB.ExecuteScalar();
            status = true;
            return status;

        }
        public Boolean Upload_FioriApps(DataTable CustomTable, string fileName, Guid Instance_ID)
        {
            Boolean status = false;


            DBHelper dB = new DBHelper("SP_FileUpload", CommandType.StoredProcedure);

            dB.addIn("@Type", "up_FioriApps");
            dB.addIn("@tblFioriApps", CustomTable);
            dB.addIn("@File_Type", "RecommendedFioriApp");
            dB.addIn("@FileUploadID", Guid.NewGuid());
            dB.addIn("@instanceId", Instance_ID);
            dB.addIn("@fileName", fileName);
            dB.addIn("@Createdby", userID);

            dB.ExecuteScalar();
            status = true;
            return status;

        }

        public Boolean Upload_Simplification(DataTable CustomTable, string fileName, Guid Instance_ID)
        {
            Boolean status = false;


            DBHelper dB = new DBHelper("SP_FileUpload", CommandType.StoredProcedure);

            dB.addIn("@Type", "up_Simplification");
            dB.addIn("@tblSimplification", CustomTable);
            dB.addIn("@File_Type", "RelevantSimplificationItems");
            dB.addIn("@FileUploadID", Guid.NewGuid());
            dB.addIn("@instanceId", Instance_ID);
            dB.addIn("@fileName", fileName);
            dB.addIn("@Createdby", userID);

            dB.ExecuteScalar();
            status = true;
            return status;

        }

        public Boolean Upload_Bwextractors(string fileName, Guid Instance_ID)
        {
            Boolean status = false;


            DBHelper dB = new DBHelper("SP_FileUpload", CommandType.StoredProcedure);

            dB.addIn("@Type", "up_Bwextractors");
            //dB.addIn("@tblSimplification", CustomTable);
            dB.addIn("@File_Type", "Bwextractors");
            dB.addIn("@FileUploadID", Guid.NewGuid());
            dB.addIn("@instanceId", Instance_ID);
            dB.addIn("@fileName", fileName);
            dB.addIn("@Createdby", userID);

            dB.ExecuteScalar();
            status = true;
            return status;

        }
        public Boolean Upload_HanaDatabaseTables(string fileName, Guid Instance_ID)
        {
            Boolean status = false;


            DBHelper dB = new DBHelper("SP_FileUpload", CommandType.StoredProcedure);

            dB.addIn("@Type", "up_HanaDatabaseTables");
            //dB.addIn("@tblSimplification", CustomTable);
            dB.addIn("@File_Type", "HanaDatabaseTables");
            dB.addIn("@FileUploadID", Guid.NewGuid());
            dB.addIn("@instanceId", Instance_ID);
            dB.addIn("@fileName", fileName);
            dB.addIn("@Createdby", userID);

            dB.ExecuteScalar();
            status = true;
            return status;

        }
        public Boolean Upload_SAPReadinessCheck(string fileName, Guid Instance_ID)
        {
            Boolean status = false;


            DBHelper dB = new DBHelper("SP_FileUpload", CommandType.StoredProcedure);

            dB.addIn("@Type", "up_SAPReadinessCheck");
            //dB.addIn("@tblSimplification", CustomTable);
            dB.addIn("@File_Type", "SAPReadinessCheck");
            dB.addIn("@FileUploadID", Guid.NewGuid());
            dB.addIn("@instanceId", Instance_ID);
            dB.addIn("@fileName", fileName);
            dB.addIn("@Createdby", userID);

            dB.ExecuteScalar();
            status = true;
            return status;

        }


        public Boolean AddInstance(string ProjectID, string InstaceName, Guid Instance_ID)
        {
            Boolean status = false;

            Guid Project_ID = Guid.Parse(ProjectID);
            DBHelper dB = new DBHelper("SP_Instance", CommandType.StoredProcedure);
            dB.addIn("@Type", "AddInstance");
            dB.addIn("@Id", Instance_ID);
            dB.addIn("@InstaceName", InstaceName);
            dB.addIn("@CustProjconfigID", Project_ID);
            dB.addIn("@Cre_By", userID);
            dB.ExecuteScalar();
            status = false;
            return status;
        }

    }
}