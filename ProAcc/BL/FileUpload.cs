﻿using ClosedXML.Excel;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;

namespace ProAcc.BL
{
    public class FileUpload
    {
        Base _Base = new Base();

        public Boolean Process_Activities(string FilePath, string fileName, Guid Instance_ID)
        {
            Boolean Status = false;

            using (XLWorkbook workbook = new XLWorkbook(FilePath))
            {
                var workSheet = workbook.Worksheet(1);
                var firstRowUsed = workSheet.FirstRowUsed();
                var firstPossibleAddress = workSheet.Row(firstRowUsed.RowNumber()).FirstCell().Address;
                var lastPossibleAddress = workSheet.LastCellUsed().Address;
                var range = workSheet.Range(firstPossibleAddress, lastPossibleAddress).AsRange(); //.RangeUsed();
                                                                                                  // Treat the range as a table (to be able to use the column names)
                var table = range.AsTable();
                //Specify what are all the Columns you need to get from Excel
                var dataList = new List<string[]>
                 {
                    table.DataRange.Rows().Select(tableRow =>tableRow.Field("Related Simplification Items").GetString()).ToArray(),
                    table.DataRange.Rows().Select(tableRow => tableRow.Field("Activities").GetString()).ToArray(),
                    table.DataRange.Rows().Select(tableRow => tableRow.Field("Phase").GetString()).ToArray(),
                    table.DataRange.Rows().Select(tableRow => tableRow.Field("Condition").GetString()).ToArray(),
                    table.DataRange.Rows().Select(tableRow => tableRow.Field("Additional Information").GetString()).ToArray()
                 };
                //Convert List to DataTable
                DataTable dataTable = ConvertListToDataTable_Activities(dataList);
                Status = _Base.Upload_Activities(dataTable, fileName, Instance_ID);
                //To get unique column values, to avoid duplication
                //var uniqueCols = dataTable.DefaultView.ToTable(true, "Solution Number");

                ////Remove Empty Rows or any specify rows as per your requirement
                //for (var i = uniqueCols.Rows.Count - 1; i >= 0; i--)
                //{
                //    var dr = uniqueCols.Rows[i];
                //    if (dr != null && ((string)dr["Solution Number"] == "None" || (string)dr["Title"] == ""))
                //        dr.Delete();
                //}
                //Console.WriteLine("Total number of unique solution number in Excel : " + uniqueCols.Rows.Count);
            }


            return Status;
        }
        private static DataTable ConvertListToDataTable_Activities(IReadOnlyList<string[]> list)
        {
            var table = new DataTable("Activities");
            var rows = list.Select(array => array.Length).Concat(new[] { 0 }).Max();

            table.Columns.Add("Related Simplification Items");
            table.Columns.Add("Activities");
            table.Columns.Add("Phase");
            table.Columns.Add("Condition");
            table.Columns.Add("Additional Information");

            for (var j = 0; j < rows; j++)
            {
                var row = table.NewRow();
                row["Related Simplification Items"] = list[0][j];
                row["Activities"] = list[1][j];
                row["Phase"] = list[2][j];
                row["Condition"] = list[3][j];
                row["Additional Information"] = list[4][j];
                table.Rows.Add(row);
            }
            return table;
        }

        public Boolean Process_Bwextractors(string FilePath, string fileName, Guid Instance_ID)
        {
            Boolean Status = false;

            using (XLWorkbook workbook = new XLWorkbook(FilePath))
            {
                var workSheet = workbook.Worksheet(1);
                var firstRowUsed = workSheet.FirstRowUsed();
                var firstPossibleAddress = workSheet.Row(firstRowUsed.RowNumber()).FirstCell().Address;
                var lastPossibleAddress = workSheet.LastCellUsed().Address;
                var range = workSheet.Range(firstPossibleAddress, lastPossibleAddress).AsRange(); //.RangeUsed();
                                                                                                  // Treat the range as a table (to be able to use the column names)
                var table = range.AsTable();
                //Specify what are all the Columns you need to get from Excel
                var dataList = new List<string[]>
                 {
                     table.DataRange.Rows().Select(tableRow =>tableRow.Field("Extractor Name").GetString()).ToArray(),
                     table.DataRange.Rows().Select(tableRow => tableRow.Field("Application Area").GetString()).ToArray(),
                     table.DataRange.Rows().Select(tableRow => tableRow.Field("Related Simplification Items").GetString()).ToArray(),
                    table.DataRange.Rows().Select(tableRow => tableRow.Field("Additional Information").GetString()).ToArray(),
                    //table.DataRange.Rows().Select(tableRow => tableRow.Field("Additional Information").GetString()).ToArray()
                 };
                //Convert List to DataTable
                DataTable dataTable = ConvertListToDataTable_Bwextractors(dataList);
                Status = _Base.Upload_CustomCode(dataTable, fileName, Instance_ID);
                //To get unique column values, to avoid duplication
                //var uniqueCols = dataTable.DefaultView.ToTable(true, "Solution Number");

                ////Remove Empty Rows or any specify rows as per your requirement
                //for (var i = uniqueCols.Rows.Count - 1; i >= 0; i--)
                //{
                //    var dr = uniqueCols.Rows[i];
                //    if (dr != null && ((string)dr["Solution Number"] == "None" || (string)dr["Title"] == ""))
                //        dr.Delete();
                //}
                //Console.WriteLine("Total number of unique solution number in Excel : " + uniqueCols.Rows.Count);
            }


            return Status;
        }
        private static DataTable ConvertListToDataTable_Bwextractors(IReadOnlyList<string[]> list)
        {
            var table = new DataTable("Bwextractors");
            var rows = list.Select(array => array.Length).Concat(new[] { 0 }).Max();

            table.Columns.Add("Extractor Name");
            table.Columns.Add("Application Area");
            table.Columns.Add("Related Simplification Items");
            table.Columns.Add("Additional Information");
            //table.Columns.Add("Additional Information");

            for (var j = 0; j < rows; j++)
            {
                var row = table.NewRow();
                row["Extractor Name"] = list[0][j];
                row["Application Area"] = list[1][j];
                row["Related Simplification Items"] = list[2][j];
                row["Additional Information"] = list[3][j];
                //row["Additional Information"] = list[4][j];
                table.Rows.Add(row);
            }
            return table;
        }


        public Boolean Process_CustomCode(string FilePath, string fileName, Guid Instance_ID)
        {
            Boolean Status = false;

            using (XLWorkbook workbook = new XLWorkbook(FilePath))
            {
                var workSheet = workbook.Worksheet(1);
                var firstRowUsed = workSheet.FirstRowUsed();
                var firstPossibleAddress = workSheet.Row(firstRowUsed.RowNumber()).FirstCell().Address;
                var lastPossibleAddress = workSheet.LastCellUsed().Address;
                var range = workSheet.Range(firstPossibleAddress, lastPossibleAddress).AsRange(); //.RangeUsed();
                                                                                                  // Treat the range as a table (to be able to use the column names)
                var table = range.AsTable();
                //Specify what are all the Columns you need to get from Excel
                var dataList = new List<string[]>
                 {
                     table.DataRange.Rows().Select(tableRow =>tableRow.Field("Custom Code Topic").GetString()).ToArray(),
                     table.DataRange.Rows().Select(tableRow => tableRow.Field("Status").GetString()).ToArray(),
                     table.DataRange.Rows().Select(tableRow => tableRow.Field("Application Component").GetString()).ToArray(),
                    table.DataRange.Rows().Select(tableRow => tableRow.Field("Custom Code Note").GetString()).ToArray(),
                    //table.DataRange.Rows().Select(tableRow => tableRow.Field("Additional Information").GetString()).ToArray()
                 };
                //Convert List to DataTable
                DataTable dataTable = ConvertListToDataTable_CustomCode(dataList);
                Status = _Base.Upload_CustomCode(dataTable, fileName, Instance_ID);
                //To get unique column values, to avoid duplication
                //var uniqueCols = dataTable.DefaultView.ToTable(true, "Solution Number");

                ////Remove Empty Rows or any specify rows as per your requirement
                //for (var i = uniqueCols.Rows.Count - 1; i >= 0; i--)
                //{
                //    var dr = uniqueCols.Rows[i];
                //    if (dr != null && ((string)dr["Solution Number"] == "None" || (string)dr["Title"] == ""))
                //        dr.Delete();
                //}
                //Console.WriteLine("Total number of unique solution number in Excel : " + uniqueCols.Rows.Count);
            }


            return Status;
        }
        private static DataTable ConvertListToDataTable_CustomCode(IReadOnlyList<string[]> list)
        {
            var table = new DataTable("CustomCode");
            var rows = list.Select(array => array.Length).Concat(new[] { 0 }).Max();

            table.Columns.Add("Custom Code Topic");
            table.Columns.Add("Status");
            table.Columns.Add("Application Component");
            table.Columns.Add("Custom Code Note");
            //table.Columns.Add("Additional Information");

            for (var j = 0; j < rows; j++)
            {
                var row = table.NewRow();
                row["Custom Code Topic"] = list[0][j];
                row["Status"] = list[1][j];
                row["Application Component"] = list[2][j];
                row["Custom Code Note"] = list[3][j];
                //row["Additional Information"] = list[4][j];
                table.Rows.Add(row);
            }
            return table;
        }

        //
        public Boolean Process_FioriApps(string FilePath, string fileName, Guid Instance_ID)
        {
            Boolean Status = false;

            using (XLWorkbook workbook = new XLWorkbook(FilePath))
            {
                var workSheet = workbook.Worksheet(1);
                var firstRowUsed = workSheet.FirstRowUsed();
                var firstPossibleAddress = workSheet.Row(firstRowUsed.RowNumber()).FirstCell().Address;
                var lastPossibleAddress = workSheet.LastCellUsed().Address;
                var range = workSheet.Range(firstPossibleAddress, lastPossibleAddress).AsRange(); //.RangeUsed();
                                                                                                  // Treat the range as a table (to be able to use the column names)
                var table = range.AsTable();
                //Specify what are all the Columns you need to get from Excel
                var dataList = new List<string[]>
                 {
                     table.DataRange.Rows().Select(tableRow =>tableRow.Field("Role").GetString()).ToArray(),
                     table.DataRange.Rows().Select(tableRow => tableRow.Field("Name").GetString()).ToArray(),
                     table.DataRange.Rows().Select(tableRow => tableRow.Field("Application Area").GetString()).ToArray(),
                    table.DataRange.Rows().Select(tableRow => tableRow.Field("Description").GetString()).ToArray(),
                    //table.DataRange.Rows().Select(tableRow => tableRow.Field("Additional Information").GetString()).ToArray()
                 };
                //Convert List to DataTable
                DataTable dataTable = ConvertListToDataTable_FioriApps(dataList);
                Status = _Base.Upload_FioriApps(dataTable, fileName, Instance_ID);
                //To get unique column values, to avoid duplication
                //var uniqueCols = dataTable.DefaultView.ToTable(true, "Solution Number");

                ////Remove Empty Rows or any specify rows as per your requirement
                //for (var i = uniqueCols.Rows.Count - 1; i >= 0; i--)
                //{
                //    var dr = uniqueCols.Rows[i];
                //    if (dr != null && ((string)dr["Solution Number"] == "None" || (string)dr["Title"] == ""))
                //        dr.Delete();
                //}
                //Console.WriteLine("Total number of unique solution number in Excel : " + uniqueCols.Rows.Count);
            }


            return Status;
        }
        private static DataTable ConvertListToDataTable_FioriApps(IReadOnlyList<string[]> list)
        {
            var table = new DataTable("FioriApps");
            var rows = list.Select(array => array.Length).Concat(new[] { 0 }).Max();

            table.Columns.Add("Role");
            table.Columns.Add("Name");
            table.Columns.Add("Application Area");
            table.Columns.Add("Description");
            //table.Columns.Add("Additional Information");

            for (var j = 0; j < rows; j++)
            {
                var row = table.NewRow();
                row["Role"] = list[0][j];
                row["Name"] = list[1][j];
                row["Application Area"] = list[2][j];
                row["Description"] = list[3][j];
                //row["Additional Information"] = list[4][j];
                table.Rows.Add(row);
            }
            return table;
        }


        //
        public Boolean Process_Simplification(string FilePath, string fileName, Guid Instance_ID)
        {
            Boolean Status = false;

            using (XLWorkbook workbook = new XLWorkbook(FilePath))
            {
                var workSheet = workbook.Worksheet(1);
                var firstRowUsed = workSheet.FirstRowUsed();
                var firstPossibleAddress = workSheet.Row(firstRowUsed.RowNumber()).FirstCell().Address;
                var lastPossibleAddress = workSheet.LastCellUsed().Address;
                var range = workSheet.Range(firstPossibleAddress, lastPossibleAddress).AsRange(); //.RangeUsed();
                                                                                                  // Treat the range as a table (to be able to use the column names)
                var table = range.AsTable();
                //Specify what are all the Columns you need to get from Excel
                var dataList = new List<string[]>
                 {
                     table.DataRange.Rows().Select(tableRow =>tableRow.Field("Title").GetString()).ToArray(),
                     table.DataRange.Rows().Select(tableRow => tableRow.Field("Category").GetString()).ToArray(),
                     table.DataRange.Rows().Select(tableRow => tableRow.Field("Relevance").GetString()).ToArray(),
                    table.DataRange.Rows().Select(tableRow => tableRow.Field("LoB/Technology").GetString()).ToArray(),

                    table.DataRange.Rows().Select(tableRow =>tableRow.Field("Business Area").GetString()).ToArray(),
                    table.DataRange.Rows().Select(tableRow =>tableRow.Field("Consistency Status").GetString()).ToArray(),
                    table.DataRange.Rows().Select(tableRow =>tableRow.Field("Manual Status").GetString()).ToArray(),
                    table.DataRange.Rows().Select(tableRow =>tableRow.Field("SAP Notes").GetString()).ToArray(),
                    table.DataRange.Rows().Select(tableRow =>tableRow.Field("Relevance Summary").GetString()).ToArray(),
                    //table.DataRange.Rows().Select(tableRow => tableRow.Field("Additional Information").GetString()).ToArray()
                 };
                //Convert List to DataTable
                DataTable dataTable = ConvertListToDataTable_Simplification(dataList);
                Status = _Base.Upload_Simplification(dataTable, fileName, Instance_ID);
                //To get unique column values, to avoid duplication
                //var uniqueCols = dataTable.DefaultView.ToTable(true, "Solution Number");

                ////Remove Empty Rows or any specify rows as per your requirement
                //for (var i = uniqueCols.Rows.Count - 1; i >= 0; i--)
                //{
                //    var dr = uniqueCols.Rows[i];
                //    if (dr != null && ((string)dr["Solution Number"] == "None" || (string)dr["Title"] == ""))
                //        dr.Delete();
                //}
                //Console.WriteLine("Total number of unique solution number in Excel : " + uniqueCols.Rows.Count);
            }


            return Status;
        }
        private static DataTable ConvertListToDataTable_Simplification(IReadOnlyList<string[]> list)
        {
            var table = new DataTable("Simplification");
            var rows = list.Select(array => array.Length).Concat(new[] { 0 }).Max();

            table.Columns.Add("Title");
            table.Columns.Add("Category");
            table.Columns.Add("Relevance");
            table.Columns.Add("LoB/Technology");
            table.Columns.Add("Business Area");
            table.Columns.Add("Consistency Status");
            table.Columns.Add("Manual Status");
            table.Columns.Add("SAP Notes");
            table.Columns.Add("Relevance Summary");


            for (var j = 0; j < rows; j++)
            {
                var row = table.NewRow();
                row["Title"] = list[0][j];
                row["Category"] = list[1][j];
                row["Relevance"] = list[2][j];
                row["LoB/Technology"] = list[3][j];
                row["Business Area"] = list[4][j];
                row["Consistency Status"] = list[5][j];
                row["Manual Status"] = list[6][j];
                row["SAP Notes"] = list[7][j];
                row["Relevance Summary"] = list[8][j];

                table.Rows.Add(row);
            }
            return table;
        }
    }
}