using MTSEntBlocks.DataBlock;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{

    public class PerformanceAppraisal
    {
        public DataSet GetSelfAppraisalTabNameAndData(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("Get_SelfAppraisal_TabName", parameterValues);
        }

        public DataSet GetModeratorUnderEmployeesList(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("[GET_FINAL_EVALUATOR_UNDER_EMPLOYEES_SELF_APPRAISAL_LIST]", parameterValues);
        }
        public DataSet GetManagerUnderEmployeesList(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("GET_MANAGER_UNDER_EMPLOYEES_SELF_APPRAISAL_LIST", parameterValues);
        }

        public Int32 AddKra_SkillWeightage(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("ADD_KRA_SKILL_WEIGHTAGE_VALUE_SELF_APPRAISAL", parameterValues);
        }

        public Int32 AddEmployeeFeedbackDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("ADD_APPRAISAL_MANAGERS_FEEDBACK_DETAILS", parameterValues);
        }

        public Int32 SkipManagersToEmployee(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("SKIPPING_MANAGERS_TO_EMPLOYEE_APPRAISAL_PROCESS", parameterValues);
        }
        public Int32 AddEmployeeSummaryDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("ADD_APPRAISAL_EMPLOYEE_SUMMARY_DETAILS", parameterValues);
        }

        public DataSet GetPendingDetailsBeforePublishing(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("CHECKING_PENDING_DETAILS_BEFORE_APPRAISAL_PUBLISHING", parameterValues);
        }



        public DataSet getAppraisalProcessDetails()
        {
            return DataAccess.ExecuteDataset("GET_APPRAISAL_PROCESS_DETAILS");
        }
        public DataSet Get_Appraisal_Mapping_Table_Details_By_ProcessId(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("GET_APPRAISAL_MAPPING_TABLE_DETAILS_APPRAISALMAPPINGID", parameterValues);
        }
        public DataSet Get_Emp_Ratings(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("Get_Employee_Ratings", parameterValues);
        }

        public DataTable GetEmployeeBasicDetails()
        {
            return DataAccess.ExecuteDataTable("Get_Employees");
        }
        public DataTable getFeedbackComments(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_APPRAISAL_MANAGERS_FEEDBACK_DETAILS", parameterValues);
        }

        public long AssignFinalModeratorToEmployee(params object[] parameterValues)
        {
            int result = 0;
            try
            {
                result = DataAccess.ExecuteNonQuery("UPDATE_FINAL_MODERATOR_TO_EMPLOYEE_APPRAISAL_PROCESS", parameterValues);
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }
            return result;
        }



        public DataSet GetIndividualMappingDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("GET_EMPLOYEE_MAPPING_DETAILS", parameterValues);
        }
        public DataSet Get_Skill_KRA_Details()
        {
            return DataAccess.ExecuteDataSet("Read_Appraisal_SkillKRAMapping");

        }

        public DataSet Get_Appraisal_Count(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("Get_Appraisal_Count", parameterValues);

        }
        public Int64 RemoveAppraisalEmployeeMapping(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("Delete_Employee_Appraisal_Mapping", parameterValues);
        }

        public Int32 RemoveEmployeeMappingDetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("Edit_Delete_Appraisal_Employee_Mapping", parameterValues);
        }

        public Int32 ClosingAppraisalProcess(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("CLOSING_APPRAISAL_PROCESS_DETAILS_PERIOD", parameterValues);
        }
        public Int32 PublishingAppraisalProcess(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("PUBLISHING_APPRAISAL_PROCESS_DETAILS_PERIOD", parameterValues);
        }
        public Int32 AssignManagerToEmployee(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("UPDATE_ASSIGNED_MANAGER_TO_EMPLOYEE_APPRAISAL_PROCESS", parameterValues);
        }
        public Int32 Add_Appraisal_Designation_Mapping_For_Individual(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("ADD_APPRAISAL_DESIGNATION_MAPPING_DETAILS_FOR_INDIVIDUAL", parameterValues);
        }
        public Int32 Add_Appraisal_Designation_Mapping(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("ADD_APPRAISAL_DESIGNATION_MAPPING_DETAILS", parameterValues);
        }
        public Int32 AddAppraisalProcessDetails(params object[] parameterValues)
        {
            return Convert.ToInt32(DataAccess.ExecuteScalar("ADD_APPRAISAL_PROCESS_DETAILS", parameterValues));
        }

        public DataSet Get_Appraisal_Mapping_Table_Details(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataSet("GET_APPRAISAL_MAPPING_TABLE_DETAILS");
        }
        //public DataSet Get_Appraisal_Process_Details(params object[] parameterValues)
        //{
        //    return DataAccess.ExecuteDataSet("GET_APPRAISAL_PROCESS_DETAILS");
        //}
        public DataSet GetEvaluatorsList()
        {
            DataSet ds = null;
            try
            {
                ds = DataAccess.ExecuteDataSet("GET_EVALUATORS_LIST");
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return ds;
        }
        public DataTable GetManagersList(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("Get_Employee_Reporting_Managers", parameterValues);
        }


    }

}
