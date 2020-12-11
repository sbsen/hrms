using MTSEntBlocks.DataBlock;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{
    public class ITDeclaration
    {
        public DataTable getFinancialYearDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("MTS_GET_IT_DECLARATION_EMPLOYEES", parameterValues);
        }
        public Int64 ITDeclarationofEmployee(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("INSERT_UPDATE_IT_DECLARATION_HEADER", parameterValues);

        }
        public DataTable getFinancialYear(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("MTS_GET_IT_DECLARATION_FINANCIAL_YEAR", parameterValues);
        }

        public DataSet getITLiablity(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("MTS_GET_IT_DECLARATION_ITLIABLITY", parameterValues);

        }

        public Int64 SubmitITLiablity(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("MTS_INSERT_UPDATE_IT_DECLARATION_PAYROLL", parameterValues);

        }

        public DataTable getAssignedEmployees()
        {
            return DataAccess.ExecuteDataTable("MTS_IT_DECLARATION_EMP_IDS", null);
        }

        public DataSet getSectionDescriptionDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("MTS_GET_IT_DECLARATION_SECTION_SUBSECTION_DETAILS", parameterValues);
        }
        public DataSet getEmployeeDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("VIEW_EMPLOYEEDETAILS", parameterValues);
        }

        public DataSet getSummaryTabDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("MTS_GET_IT_DECLARATION_SUMMARY", parameterValues);
        }
        public DataTable getOtherSourceIncomeDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("MTS_GET_IT_DECLARATION_OTHER_SOURCE_INCOME", parameterValues);
        }
        public DataSet getHomeLoanDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("MTS_GET_IT_DECLARATION_HOUSE_LOAN_DETAILS", parameterValues);
        }
        public DataSet gethomeRentDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("MTS_GET_IT_DECLARATION_HOUSE_RENT_DETAILS", parameterValues);
        }

        public Int32 saveITFormDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("MTS_INSERT_IT_DECLARELATION_SECTIONS", parameterValues);
        }

        public Int32 addOtherSourceIncomeDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("MTS_INSERT_UPDATE_IT_DECLARATION_OTHER_SOURCE_INCOME", parameterValues);
        }

        public Int32 FinalSubmitITDeclaration(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("MTS_UPDATE_IT_DECLARATION_FINAL_SUBMIT", parameterValues);
        }
        public Int32 AddHomeRentDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("MTS_INSERT_UPDATE_IT_DECLARATION_HOUSE_RENT_DETAILS", parameterValues);
        }
        public Int32 AddHouseLoanDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("MTS_INSERT_UPDATE_IT_DECLARATION_HOUSE_LOAN_DETAILS", parameterValues);
        }

    }
}
