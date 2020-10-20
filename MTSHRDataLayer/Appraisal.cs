using MTSEntBlocks.DataBlock;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{
    public class Appraisal
    {

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
            catch(Exception e)
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
