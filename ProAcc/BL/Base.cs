﻿
using ProAcc.BL.Model;
using ProACC_DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using static ProAcc.BL.Model.Common;

namespace ProAcc.BL
{
    public class Base:Common
    {
        private ProAccEntities db = new ProAccEntities();

        #region Login
        public LogedUser UserValidation(LogedUser user)
        {
            DataSet ds = new DataSet();
            DBHelper dB = new DBHelper("SP_Login", CommandType.StoredProcedure);
            dB.addIn("@Type", "Login");
            dB.addIn("@UserName", user.Username);
            dB.addIn("@Password", user.Password);
            ds = dB.ExecuteDataSet();
            DataTable dt = new DataTable();
            if (ds.Tables.Count!=0)
            {
                //DataTable dt1 = new DataTable();
                dt = ds.Tables[0];
                //dt1 = ds.Tables[1];
                if (dt.Rows.Count == 1)
                {
                    if (!string.IsNullOrEmpty(dt.Rows[0][0].ToString()))
                    {


                        user.ID = Guid.Parse(dt.Rows[0][0].ToString());
                        user.Type = Convert.ToInt32(dt.Rows[0][1].ToString());
                        user.Name = dt.Rows[0][2].ToString();

                        //User_ID = user.ID;
                        //User_Name = user.Name;
                        //for (int i = 0; i < dt1.Rows.Count; i++)
                        //{
                        //    if (user.Type == Convert.ToInt32(dt1.Rows[i]["id"]))
                        //    {
                        //        User_Type = dt1.Rows[0]["UserType"].ToString().ToUpper();
                        //        break;
                        //    }
                        //}
                    }
                }
            }
            return user;

        }
        #endregion


        #region Charts
        public GeneralList sP_GetActivities_Bar1(Guid InstanceId)
        {
            GeneralList sP_ = new GeneralList();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_ReadinessReport", CommandType.StoredProcedure);

            dB.addIn("@Type", "Activities_Bar1");
            dB.addIn("@InstanceId", InstanceId);
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
        public GeneralList sP_GetActivities_Bar2(Guid InstanceId)
        {
            GeneralList sP_ = new GeneralList();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_ReadinessReport", CommandType.StoredProcedure);

            dB.addIn("@Type", "Activities_Bar2");
            dB.addIn("@InstanceId", InstanceId);
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
        public GeneralList sP_GetActivities_Donut(Guid InstanceId)
        {
            GeneralList sP_ = new GeneralList();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_ReadinessReport", CommandType.StoredProcedure);

            dB.addIn("@Type", "Activities_Donut");
            dB.addIn("@InstanceId", InstanceId);
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
        public GeneralList sP_GetFiori_Bar(Guid InstanceId)
        {
            GeneralList sP_ = new GeneralList();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_ReadinessReport", CommandType.StoredProcedure);

            dB.addIn("@Type", "Fiori_Bar");
            dB.addIn("@InstanceId", InstanceId);
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
        public GeneralList sP_GetCustomCode_Bar(Guid InstanceId)
        {
            GeneralList sP_ = new GeneralList();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_ReadinessReport", CommandType.StoredProcedure);

            dB.addIn("@Type", "CustomCode_Bar");
            dB.addIn("@InstanceId", InstanceId);
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
        public GeneralList sP_SimplificationReport_Bar(String Input, Guid InstanceId)
        {
            GeneralList sP_ = new GeneralList();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_SimplificationReport", CommandType.StoredProcedure);
            if (Input == "ALL")
            {
                dB.addIn("@Type", "ALL");
                dB.addIn("@InstanceId", InstanceId);
            }
            else
            {
                dB.addIn("@Type", "Single");
                dB.addIn("@Input", Input);
                dB.addIn("@InstanceId", InstanceId);
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

        public GeneralList sP_GetSAPFioriAppsReport_Bar(string Input, Guid InstanceId)
        {
            GeneralList sP_ = new GeneralList();//manoj
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_FioriAppsReport", CommandType.StoredProcedure);

            dB.addIn("@Type", "ALL");
            dB.addIn("@InstanceId", InstanceId);
            dB.addIn("@Input", Input);
            dt = dB.ExecuteDataTable();
            if (dt.Rows.Count > 0)
            {
                List<Lis> _Lob = new List<Lis>();
                foreach (DataRow dr in dt.Rows)
                {
                    _Lob.Add(
                        new Lis
                        {
                            Name = dr["Roles"].ToString(),
                            _Value = Convert.ToInt32(dr["_Count"].ToString()
                            )
                        });

                }

                sP_._List = _Lob;


            }
            return sP_;
        }

        public GeneralList sP_GetActivitiesReport_Bar(string Phase, string condition, Guid InstanceId)
        {
            GeneralList sP_ = new GeneralList();//manoj
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_ActivitiesReport", CommandType.StoredProcedure);

            dB.addIn("@Type", "ALL");
            dB.addIn("@InstanceId", InstanceId);
            dB.addIn("@Phase", Phase);
            dB.addIn("@condition", condition);
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
        #endregion

        #region Reports
        public SP_ReadinessReport_Result sAPInput(Guid InstanceId)
        {
            SP_ReadinessReport_Result GetRelevant = new SP_ReadinessReport_Result();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_ReadinessReport", CommandType.StoredProcedure);
            dB.addIn("@Type", "Simple_Donut");
            dB.addIn("@InstanceId", InstanceId);
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
        public GeneralList sP_SimplificationReport(Guid InstanceId)
        {
            GeneralList sP_ = new GeneralList();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_SimplificationReport", CommandType.StoredProcedure);
            dB.addIn("@Type", "GetDropdown");
            dB.addIn("@InstanceId", InstanceId);
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

        public List<SAPInput_SimplificationReport> SAPInput_Simplification(Guid InstanceId,string LOB)
        {
            List<SAPInput_SimplificationReport> SR = new List<SAPInput_SimplificationReport>();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_SimplificationReport", CommandType.StoredProcedure);
           
            dB.addIn("@InstanceId", InstanceId);
            if (LOB== "ALL")
            {
                dB.addIn("@Type", "SR_Table_All");
            }
            else
            {
                dB.addIn("@Type", "SR_Table_Single");
                dB.addIn("@Input", LOB);

            }
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

        public List<SAPInput_CustomCode> SAPInput_CustomCodeReport(Guid InstanceId)
        {
            List<SAPInput_CustomCode> CR = new List<SAPInput_CustomCode>();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_CustomCode", CommandType.StoredProcedure);
            dB.addIn("@Type", "CustomTable");
            dB.addIn("@InstanceId", InstanceId);
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

        public List<Model.SAPInput_Activities> GetActivitiesReport_Table(Guid InstanceId)
        {
            List<Model.SAPInput_Activities> AR = new List<Model.SAPInput_Activities>();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_ActivitiesReport", CommandType.StoredProcedure);
            dB.addIn("@Type", "ACT_Table");
            dB.addIn("@InstanceId", InstanceId);
            dt = dB.ExecuteDataTable();
            //  List<DataRow> list = new List<DataRow>(dt.Select());
            int i = 0;
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    i += 1;
                    Model.SAPInput_Activities data = new Model.SAPInput_Activities();
                    data.S_No = i;
                    data.Related_Simplification_Items = dr["Related Simplification Items"].ToString();
                    data.Activities = dr["Activities"].ToString();
                    data.Phase = dr["Phase"].ToString();
                    data.Condition = dr["Condition"].ToString();
                    data.Additional_Information = dr["Additional Information"].ToString();

                    AR.Add(data);
                }
            }
            return AR;
        }
        public List<SAPFioriAppsModel> sp_GetSAPFioriAppsTable(Guid InstanceId)
        {
            List<SAPFioriAppsModel> FiR = new List<SAPFioriAppsModel>();
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_FioriAppsReport", CommandType.StoredProcedure);
            dB.addIn("@Type", "FioriApps_Table");
            dB.addIn("@InstanceId", InstanceId);
            dt = dB.ExecuteDataTable();
            //  List<DataRow> list = new List<DataRow>(dt.Select());
            int i = 0;
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    i += 1;
                    SAPFioriAppsModel data = new SAPFioriAppsModel();
                    data.S_No = i;
                    data.Role = dr["Role"].ToString();
                    data.Name = dr["Name"].ToString();
                    data.Application_Area = dr["Application Area"].ToString();
                    data.Description = dr["Description"].ToString();

                    FiR.Add(data);
                }
            }
            return FiR;
        }

        public List<SAPInput_PreConvertion> sp_GetPreConvertionTable(Guid InstanceId)
        {
            List<SAPInput_PreConvertion> PR = new List<SAPInput_PreConvertion>();
            DataSet DS = new DataSet();
            DBHelper dB = new DBHelper("SP_PreConvertion", CommandType.StoredProcedure);
            dB.addIn("@Type", "PreConvertion_Table");
            dB.addIn("@InstanceId", InstanceId);
            DS = dB.ExecuteDataSet();
            DataTable dt1 = new DataTable();
            DataTable dt2 = new DataTable();

            dt1 = DS.Tables[0];
            dt2 = DS.Tables[1];
            List<PicturetoData> Pic = new List<PicturetoData>();
            if (dt2.Rows.Count>0)
            {
                foreach (DataRow dr in dt2.Rows)
                {
                    PicturetoData P = new PicturetoData();
                    P.ID = Convert.ToInt32(dr["Id"].ToString());
                    P.PictureName = dr["PictureName"].ToString();
                    P.GivenName= dr["GivenName"].ToString();
                    Pic.Add(P);
                }
            }

            if (dt1.Rows.Count > 0)
            {
                foreach (DataRow dr in dt1.Rows)
                {
                    //string Re_Result="";
                    //string Re_Possible="";
                    SAPInput_PreConvertion data = new SAPInput_PreConvertion();
                    
                    //foreach (var item in Pic)
                    //{
                    //    var Result = dr["Last Consistency Result"].ToString();
                    //    var Possible = dr["Exemption Possible"].ToString();
                    //    if (item.PictureName == Result)
                    //    {
                    //        Re_Result = item.GivenName.ToString();
                    //    }
                    //    if (item.PictureName == Possible)
                    //    {
                    //        Re_Possible = item.GivenName.ToString();
                    //    }

                    //}

                    
                    //if (Result== Empty)
                    //{Result = RE_Empty;}
                    //else if(Result== Error)
                    //{ Result = RE_Error; }
                    //else if (Result == Warning)
                    //{ Result = RE_Warning; }
                    //else if (Result == NotApplicable)
                    //{ Result = RE_NotApplicable; }
                    //else if (Result == Success)
                    //{ Result = RE_Success; }

                    //if (Possible == Empty)
                    //{ Possible = RE_Empty; }
                    //else if (Possible == Error)
                    //{ Possible = RE_Error; }
                    //else if (Possible == Warning)
                    //{ Possible = RE_Warning; }
                    //else if (Possible == NotApplicable)
                    //{ Possible = RE_NotApplicable; }
                    //else if (Possible == Success)
                    //{ Possible = RE_Success; }

                    data.ID = Convert.ToInt32(dr["id"].ToString());
                    data.Relevance = Convert.ToInt32(dr["Relevance"].ToString());
                    data.Last_Consistency_Result = Convert.ToInt32(dr["Last Consistency Result"].ToString());
                    data.Exemption_Possible = Convert.ToInt32(dr["Exemption Possible"].ToString());
                    data.SAP_ID = dr["SAP_ID"].ToString();
                    data.Title = dr["Title"].ToString();
                    data.Lob_Technology = dr["Lob/Technology"].ToString();
                    data.Business_Area = dr["Business Area"].ToString();
                    data.Catetory = dr["Catetory"].ToString();
                    data.Component = dr["Component"].ToString();
                    data.Status = dr["Status"].ToString();
                    data.Note = dr["Note"].ToString();
                    data.Application_Area = dr["Application Area"].ToString();
                    data.Summary = dr["Summary"].ToString();
                    data.Test = 2;
                    PR.Add(data);
                }
            }
            return PR;
        }
        #endregion

        #region FileUpload
        public Boolean Upload_Activities(DataTable CustomTable, string fileName, Guid Instance_ID,Guid User_ID)
        {
            Boolean status = false;


            DBHelper dB = new DBHelper("SP_FileUpload", CommandType.StoredProcedure);

            dB.addIn("@Type", "up_Activities");
            dB.addIn("@tblActivities", CustomTable);
            dB.addIn("@File_Type", "Activities");
            dB.addIn("@FileUploadID", Guid.NewGuid());
            dB.addIn("@instanceId", Instance_ID);
            dB.addIn("@fileName", fileName);
            dB.addIn("@Createdby", User_ID);

            dB.ExecuteScalar();
            status = true;
            return status;

        }
        public Boolean Upload_CustomCode(DataTable CustomTable, string fileName, Guid Instance_ID, Guid User_ID)
        {
            Boolean status = false;


            DBHelper dB = new DBHelper("SP_FileUpload", CommandType.StoredProcedure);

            dB.addIn("@Type", "up_CustomCode");
            dB.addIn("@tblCustomCode", CustomTable);
            dB.addIn("@File_Type", "CustomCode");
            dB.addIn("@FileUploadID", Guid.NewGuid());
            dB.addIn("@instanceId", Instance_ID);
            dB.addIn("@fileName", fileName);
            dB.addIn("@Createdby", User_ID);

            dB.ExecuteScalar();
            status = true;
            return status;

        }
        public Boolean Upload_FioriApps(DataTable CustomTable, string fileName, Guid Instance_ID, Guid User_ID)
        {
            Boolean status = false;


            DBHelper dB = new DBHelper("SP_FileUpload", CommandType.StoredProcedure);

            dB.addIn("@Type", "up_FioriApps");
            dB.addIn("@tblFioriApps", CustomTable);
            dB.addIn("@File_Type", "RecommendedFioriApp");
            dB.addIn("@FileUploadID", Guid.NewGuid());
            dB.addIn("@instanceId", Instance_ID);
            dB.addIn("@fileName", fileName);
            dB.addIn("@Createdby", User_ID);

            dB.ExecuteScalar();
            status = true;
            return status;

        }

        public Boolean Upload_Simplification(DataTable CustomTable, string fileName, Guid Instance_ID, Guid User_ID)
        {
            Boolean status = false;


            DBHelper dB = new DBHelper("SP_FileUpload", CommandType.StoredProcedure);

            dB.addIn("@Type", "up_Simplification");
            dB.addIn("@tblSimplification", CustomTable);
            dB.addIn("@File_Type", "RelevantSimplificationItems");
            dB.addIn("@FileUploadID", Guid.NewGuid());
            dB.addIn("@instanceId", Instance_ID);
            dB.addIn("@fileName", fileName);
            dB.addIn("@Createdby", User_ID);

            dB.ExecuteScalar();
            status = true;
            return status;

        }

        public Boolean Upload_Bwextractors(string fileName, Guid Instance_ID, Guid User_ID)
        {
            Boolean status = false;


            DBHelper dB = new DBHelper("SP_FileUpload", CommandType.StoredProcedure);

            dB.addIn("@Type", "up_Bwextractors");
            //dB.addIn("@tblSimplification", CustomTable);
            dB.addIn("@File_Type", "Bwextractors");
            dB.addIn("@FileUploadID", Guid.NewGuid());
            dB.addIn("@instanceId", Instance_ID);
            dB.addIn("@fileName", fileName);
            dB.addIn("@Createdby", User_ID);

            dB.ExecuteScalar();
            status = true;
            return status;

        }
        public Boolean Upload_HanaDatabaseTables(string fileName, Guid Instance_ID, Guid User_ID)
        {
            Boolean status = false;


            DBHelper dB = new DBHelper("SP_FileUpload", CommandType.StoredProcedure);

            dB.addIn("@Type", "up_HanaDatabaseTables");
            //dB.addIn("@tblSimplification", CustomTable);
            dB.addIn("@File_Type", "HanaDatabaseTables");
            dB.addIn("@FileUploadID", Guid.NewGuid());
            dB.addIn("@instanceId", Instance_ID);
            dB.addIn("@fileName", fileName);
            dB.addIn("@Createdby", User_ID);

            dB.ExecuteScalar();
            status = true;
            return status;

        }
        public Boolean Upload_SAPReadinessCheck(string fileName, Guid Instance_ID, Guid User_ID)
        {
            Boolean status = false;


            DBHelper dB = new DBHelper("SP_FileUpload", CommandType.StoredProcedure);

            dB.addIn("@Type", "up_SAPReadinessCheck");
            //dB.addIn("@tblSimplification", CustomTable);
            dB.addIn("@File_Type", "SAPReadinessCheck");
            dB.addIn("@FileUploadID", Guid.NewGuid());
            dB.addIn("@instanceId", Instance_ID);
            dB.addIn("@fileName", fileName);
            dB.addIn("@Createdby", User_ID);

            dB.ExecuteScalar();
            status = true;
            return status;

        }

        public Boolean Upload_SAPPreConvertion(DataTable CustomTable, string fileName, Guid Instance_ID, Guid User_ID)
        {
            Boolean status = false;


            DBHelper dB = new DBHelper("SP_FileUpload", CommandType.StoredProcedure);

            dB.addIn("@Type", "up_SAPPreConvertion");
            dB.addIn("@tblPreConvertion", CustomTable);
            dB.addIn("@File_Type", "PreConvertion");
            dB.addIn("@FileUploadID", Guid.NewGuid());
            dB.addIn("@instanceId", Instance_ID);
            dB.addIn("@fileName", fileName);
            dB.addIn("@Createdby", User_ID);

            var a=dB.ExecuteScalar();
            status = true;
            return status;


        }

        #endregion


        #region Drodown
        public GeneralList GetInstanceDropdown(string projectID)
        {
            GeneralList sP_ = new GeneralList();
            DataSet ds = new DataSet();
            Guid ID = Guid.Parse(projectID);
            DBHelper dB = new DBHelper("SP_Instance", CommandType.StoredProcedure);
            dB.addIn("@Type", "GetInstance");
            dB.addIn("@Id", ID);
            ds = dB.ExecuteDataSet();
            List<Lis> _Lob = new List<Lis>();
            if (ds.Tables.Count > 0)
            {
                DataTable dt = new DataTable();
                dt = ds.Tables[0];
                int count = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    _Lob.Add(new Lis
                    {
                        Name = dr["InstaceName"].ToString(),
                        Value = dr["Id"].ToString()
                    });
                    count = count++;
                }
            }


            sP_._List = _Lob;
            return sP_;
        }
        public GeneralList GetPerConvertionUploadInstance(string projectID)
        {
            GeneralList sP_ = new GeneralList();
            DataSet ds = new DataSet();
            Guid ID = Guid.Parse(projectID);
            DBHelper dB = new DBHelper("SP_Instance", CommandType.StoredProcedure);
            dB.addIn("@Type", "GetPerConvertionUploadInstance");
            dB.addIn("@Id", ID);
            ds = dB.ExecuteDataSet();
            List<Lis> _Lob = new List<Lis>();
            if (ds.Tables.Count > 0)
            {
                DataTable dt = new DataTable();
                dt = ds.Tables[0];
                int count = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    _Lob.Add(new Lis
                    {
                        Name = dr["InstaceName"].ToString(),
                        Value = dr["Id"].ToString()
                    });
                    count = count++;
                }
            }


            sP_._List = _Lob;
            return sP_;
        }

        public GeneralList spCustomerDropdown(string Id, int type)
        {
            GeneralList sP_ = new GeneralList();
            DataSet ds = new DataSet();
            DBHelper dB = new DBHelper("SP_CustomerDrp", CommandType.StoredProcedure);
            if (type == 1)
            {
                dB.addIn("@Type", "CustomerDrp_Admin");

            }
            else if (type == 2)
            {
                dB.addIn("@Type", "CustomerDrp_Consultant");
                dB.addIn("@Id", Id);
            }
            else if (type == 3)
            {
                dB.addIn("@Type", "CustomerDrp_Customer");
                dB.addIn("@Id", Id);
            }

            ds = dB.ExecuteDataSet();
            List<Lis> _Lob = new List<Lis>();
            if (ds.Tables.Count > 0)
            {
                DataTable dt = new DataTable();
                dt = ds.Tables[0];
                int count = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    _Lob.Add(new Lis
                    {
                        Name = dr["Name"].ToString(),
                        Value = dr["id"].ToString()
                    });
                    count = count++;
                }
            }
            sP_._List = _Lob;
            return sP_;
        }

        public GeneralList sP_AnalysisDropdownProject()
        {
            GeneralList sP_ = new GeneralList();
            DataSet ds = new DataSet();
            DBHelper dB = new DBHelper("SP_CreateAnalysis", CommandType.StoredProcedure);
            dB.addIn("@Type", "Drp_Project");
            ds = dB.ExecuteDataSet();
            List<Lis> _Lob = new List<Lis>();
            if (ds.Tables.Count > 0)
            {
                DataTable dt = new DataTable();
                dt = ds.Tables[0];
                foreach (DataRow dr in dt.Rows)
                {
                    _Lob.Add(new Lis
                    {
                        Name = dr["ProjectName"].ToString(),
                        Value = dr["CustProjconfigID"].ToString()
                    });

                }
            }


            sP_._List = _Lob;
            return sP_;
        }

        public Tuple<List<Lis>, List<Lis>, List<Lis>> sP_AnalysisDropdowns()
        {
            List<Lis> list1 = new List<Lis>();
            List<Lis> list2 = new List<Lis>();
            List<Lis> list3 = new List<Lis>();
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
                            Value = dr["CustProjconfigID"].ToString(),
                            linkID = dr["CustomerID"].ToString()
                        });

                    }
                }
                if (ds.Tables[2].Rows.Count > 0)
                {
                    DataTable dt = new DataTable();
                    dt = ds.Tables[2];//ProjectName
                    foreach (DataRow dr in dt.Rows)
                    {
                        list3.Add(new Lis
                        {

                            Name = dr["InstaceName"].ToString(),
                            Value = dr["ProjectInstanceConfigID"].ToString(),
                            linkID = dr["CustProjconfigID"].ToString()
                        });

                    }
                }

            }

            return Tuple.Create(list1, list2, list3);
        }

        public Tuple<List<Lis>, List<Lis>> sp_GetActivitiesReportDropdown(Guid InstanceId)
        {
            List<Lis> list1 = new List<Lis>();
            List<Lis> list2 = new List<Lis>();
            DataSet ds = new DataSet();
            DBHelper dB = new DBHelper("SP_ActivitiesReport", CommandType.StoredProcedure);
            dB.addIn("@Type", "GetDropdown");
            dB.addIn("@InstanceId", InstanceId);
            ds = dB.ExecuteDataSet();
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataTable dt = new DataTable();
                    dt = ds.Tables[0];
                    int count = 0;
                    foreach (DataRow dr in dt.Rows)
                    {
                        list1.Add(new Lis
                        {
                            Name = dr["Phase"].ToString(),
                            _Value = count
                        });
                        count = count++;
                    }
                }
                if (ds.Tables[1].Rows.Count > 0)
                {
                    DataTable dt = new DataTable();
                    dt = ds.Tables[1];
                    int count = 0;
                    foreach (DataRow dr in dt.Rows)
                    {
                        list2.Add(new Lis
                        {

                            Name = dr["Condition"].ToString(),
                            _Value = count
                        });
                        count = count++;
                    }
                }
            }

            return Tuple.Create(list1, list2);
        }
        public GeneralList sp_GetFioriAppsReportDropdown(Guid InstanceId)
        {
            GeneralList sP_ = new GeneralList();
            DataSet ds = new DataSet();
            DBHelper dB = new DBHelper("SP_FioriAppsReport", CommandType.StoredProcedure);
            dB.addIn("@Type", "GetDropdown");
            dB.addIn("@InstanceId", InstanceId);
            ds = dB.ExecuteDataSet();
            List<Lis> _Lob = new List<Lis>();
            if (ds.Tables.Count > 0)
            {
                DataTable dt = new DataTable();
                dt = ds.Tables[0];
                int count = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    _Lob.Add(new Lis
                    {
                        Name = dr["Roles"].ToString(),
                        _Value = count
                    });
                    count = count++;
                }
            }


            sP_._List = _Lob;
            return sP_;
        }

        public List<PicturetoData> Sp_GetPicturetoDatas()
        {
            
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_PictureTodata", CommandType.StoredProcedure);
            dB.addIn("@Type", "DropDown");
            //dB.addIn("@InstanceId", InstanceId);
            dt = dB.ExecuteDataTable();
            List<PicturetoData> Pic = new List<PicturetoData>();
            if (dt.Rows.Count > 0)
            {
                
                foreach (DataRow dr in dt.Rows)
                {
                    PicturetoData P = new PicturetoData();
                    P.ID = Convert.ToInt32(dr["Id"].ToString());
                    P.PictureName = dr["PictureName"].ToString();
                    P.GivenName = dr["GivenName"].ToString();
                    Pic.Add(P);
                }
            }
            return Pic;
        }
        #endregion

        #region CUD
        public Boolean sp_PreConvertion_Update(SAPInput_PreConvertion Data)
        {
            Boolean Result = false;
            DBHelper dB = new DBHelper("SP_PreConvertion", CommandType.StoredProcedure);
            dB.addIn("@Type", "UpdatePreConvertion");
            dB.addIn("@ID", Data.ID);
            dB.addIn("@Last_Consistency_Result", Data.Last_Consistency_Result);
            dB.addIn("@Exemption_Possible", Data.Exemption_Possible);
            dB.ExecuteScalar();
            Result = true;

            return Result;
        }
        #endregion

        #region Masters
        public List<PhaseMaster>GetPhaseMasters()
        {
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_Master", CommandType.StoredProcedure);
            dB.addIn("@Type", "GetPhase");
            dt = dB.ExecuteDataTable();
            List<PhaseMaster> PM = new List<PhaseMaster>();
            if (dt.Rows.Count > 0)
            {

                foreach (DataRow dr in dt.Rows)
                {
                    PhaseMaster P = new PhaseMaster();
                    P.Id = Convert.ToInt32(dr["Id"].ToString());
                    P.PhaseName = dr["PhaseName"].ToString();
                    PM.Add(P);
                }
            }

            return PM;
        }

        public List<PendingMaster> GetPendingMasters()
        {
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_Master", CommandType.StoredProcedure);
            dB.addIn("@Type", "GetPending");
            dt = dB.ExecuteDataTable();
            List<PendingMaster> PM = new List<PendingMaster>();
            if (dt.Rows.Count > 0)
            {

                foreach (DataRow dr in dt.Rows)
                {
                    PendingMaster P = new PendingMaster();
                    P.Id = Convert.ToInt32(dr["Id"].ToString());
                    P.PendingName = dr["PendingName"].ToString();
                    PM.Add(P);
                }
            }

            return PM;
        }
        public List<TeamMaster> GetTeamMasters()
        {
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_Master", CommandType.StoredProcedure);
            dB.addIn("@Type", "GetTeam");
            dt = dB.ExecuteDataTable();
            List<TeamMaster> TM = new List<TeamMaster>();
            if (dt.Rows.Count > 0)
            {

                foreach (DataRow dr in dt.Rows)
                {
                    TeamMaster P = new TeamMaster();
                    P.Id = Convert.ToInt32(dr["Id"].ToString());
                    P.TeamName = dr["TeamName"].ToString();
                    TM.Add(P);
                }
            }

            return TM;
        }
        public List<Consultant> GetConsultant()
        {
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_Master", CommandType.StoredProcedure);
            dB.addIn("@Type", "GetConsultant");
            dt = dB.ExecuteDataTable();
            List<Consultant> L = new List<Consultant>();
            if (dt.Rows.Count > 0)
            {

                foreach (DataRow dr in dt.Rows)
                {
                    Consultant P = new Consultant();
                    P.Id = Guid.Parse(dr["Id"].ToString());
                    P.Name = dr["Name"].ToString();
                    L.Add(P);
                }
            }

            return L;
        }
        public List<StatusMaster> GetStatus()
        {
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_Master", CommandType.StoredProcedure);
            dB.addIn("@Type", "GetStatus");
            dt = dB.ExecuteDataTable();
            List<StatusMaster> L = new List<StatusMaster>();
            if (dt.Rows.Count > 0)
            {

                foreach (DataRow dr in dt.Rows)
                {
                    StatusMaster P = new StatusMaster();
                    P.Id = Convert.ToInt32(dr["Id"].ToString());
                    P.StatusName = dr["StatusName"].ToString();
                    L.Add(P);
                }
            }

            return L;
        }

        #endregion



        #region Other



        public void CreateIfMissing(string path)
        {
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
        }



        public void SendExcepToDB(string ExceptionMsg,string ExceptionType,string ExceptionURL,string ExceptionSource)
        {
            DBHelper dB = new DBHelper("Sp_ExceptionLogging", CommandType.StoredProcedure);
            dB.addIn("@ExceptionMsg", ExceptionMsg);
            dB.addIn("@ExceptionType", ExceptionType);
            dB.addIn("@ExceptionURL", ExceptionURL);
            dB.addIn("@ExceptionSource", ExceptionSource);
            dB.ExecuteScalar();
        }


        public List<ProjectMonitorModel> Sp_GetProjectMonitor(Guid InstanceId)
        {
            DataTable dt = new DataTable();
            DBHelper dB = new DBHelper("SP_ProjectMonitor", CommandType.StoredProcedure);
            dB.addIn("@Type", "GetData");
            //dB.addIn("@InstanceId", InstanceId);
            dt = dB.ExecuteDataTable();
            List<ProjectMonitorModel> PM = new List<ProjectMonitorModel>();
            if (dt.Rows.Count > 0)
            {
                int count = 1;
                var myLocalDateTime = DateTime.Now;
                foreach (DataRow dr in dt.Rows)
                {
                    
                    ProjectMonitorModel P = new ProjectMonitorModel();
                    P.LocalID = count++;
                    P.Instance = InstanceId;
                    P.PhaseId= Convert.ToInt32(dr["PhaseId"].ToString());
                    P.Task = dr["Activity"].ToString();
                    P.Task_Other_Environment = false;
                    P.Dependency = false;
                    P.PendingId = 0;
                    P.Delay_occurred = false;
                    P.TeamID = 0;
                    //P.ConsultantID=
                    P.StatusId = 0;
                    P.EST_hours = 0;
                    P.Actual_St_hours = 0;
                    //P.Planed__St_Date = TimeZone.CurrentTimeZone.ToUniversalTime(myLocalDateTime);
                    //P.Actual_St_Date = TimeZone.CurrentTimeZone.ToUniversalTime(myLocalDateTime);
                    //P.Planed__En_Date = TimeZone.CurrentTimeZone.ToUniversalTime(myLocalDateTime);
                    //P.Actual_En_Date = TimeZone.CurrentTimeZone.ToUniversalTime(myLocalDateTime);
                    P.Notes = "";




                    //P.ID = Convert.ToInt32(dr["Id"].ToString());
                    //P.PictureName = dr["PictureName"].ToString();
                    //P.GivenName = dr["GivenName"].ToString();
                    PM.Add(P);
                }
            }
           
            return PM;
        }
        #endregion



        #region Extra

        //private string User_ID = HttpContext.Current.Session["UserName"].ToString();
        //private string InstanceId = HttpContext.Current.Session["UserName"].ToString();
        //Graph ReadinessReport



        //public Boolean AddInstance(string ProjectID, string InstaceName, Guid Instance_ID)
        //{
        //    Boolean status = false;

        //    Guid Project_ID = Guid.Parse(ProjectID);
        //    DBHelper dB = new DBHelper("SP_Instance", CommandType.StoredProcedure);
        //    dB.addIn("@Type", "AddInstance");
        //    dB.addIn("@Id", Instance_ID);
        //    dB.addIn("@InstaceName", InstaceName);
        //    dB.addIn("@CustProjconfigID", Project_ID);
        //    dB.addIn("@Cre_By", userID);
        //    dB.ExecuteScalar();
        //    status = false;
        //    return status;
        //}

             //public bool AddInstance(string IDInstance)
        //{
        //    bool status = false;
        //    //InstanceId = Guid.Parse(IDInstance);
        //    Guid ProjectID = Guid.Empty;
        //    Guid IDInstanceID = Guid.Parse(IDInstance);
        //    Instance_Name = db.ProjectInstanceConfigs.FirstOrDefault(x => x.Id == IDInstanceID).InstaceName;
        //    ProjectID = db.ProjectInstanceConfigs.FirstOrDefault(x => x.Id == IDInstanceID).CustProjconfigID;
        //    Project_Name = db.CustomerProjectConfigs.FirstOrDefault(x => x.Id == ProjectID).ProjectName;
        //    return status;
        //}
        #endregion



        //private string Empty = "";
        //private string Error = "Picture@5C\\QInconsistency at level error@";
        //private string Warning = "Picture@5D\\QInconsistency at level warning@";
        //private string NotApplicable = "Picture@00\\QNot Applicable@";
        //private string Success = "Picture@5B\\QNo potential inconsistency@";

        //private string RE_Empty = "Not Applicable";
        //private string RE_Error = "Error";
        //private string RE_Warning = "Warning";
        //private string RE_NotApplicable = "Not Applicable";
        //private string RE_Success = "Success";


    }
}