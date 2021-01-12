/****** Object:  StoredProcedure [dbo].[ACTIVATEACCOUNT]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[ACTIVATEACCOUNT]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[ACTIVATEACCOUNT]
GO
/****** Object:  StoredProcedure [dbo].[ADD_APPRAISAL_DESIGNATION_MAPPING_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[ADD_APPRAISAL_DESIGNATION_MAPPING_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[ADD_APPRAISAL_DESIGNATION_MAPPING_DETAILS]
GO
/****** Object:  StoredProcedure [dbo].[ADD_APPRAISAL_DESIGNATION_MAPPING_DETAILS_FOR_INDIVIDUAL]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[ADD_APPRAISAL_DESIGNATION_MAPPING_DETAILS_FOR_INDIVIDUAL]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[ADD_APPRAISAL_DESIGNATION_MAPPING_DETAILS_FOR_INDIVIDUAL]
GO
/****** Object:  StoredProcedure [dbo].[ADD_APPRAISAL_EMPLOYEE_SUMMARY_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[ADD_APPRAISAL_EMPLOYEE_SUMMARY_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[ADD_APPRAISAL_EMPLOYEE_SUMMARY_DETAILS]
GO

/****** Object:  StoredProcedure [dbo].[ADD_APPRAISAL_MANAGERS_FEEDBACK_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[ADD_APPRAISAL_MANAGERS_FEEDBACK_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[ADD_APPRAISAL_MANAGERS_FEEDBACK_DETAILS]
GO

/****** Object:  StoredProcedure [dbo].[ADD_APPRAISAL_PROCESS_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[ADD_APPRAISAL_PROCESS_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[ADD_APPRAISAL_PROCESS_DETAILS]
GO
/****** Object:  StoredProcedure [dbo].[ADD_EMPLOYEE_LEAVE_BALANCE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[ADD_EMPLOYEE_LEAVE_BALANCE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[ADD_EMPLOYEE_LEAVE_BALANCE]
GO

/****** Object:  StoredProcedure [dbo].[ADD_EMPLOYEE_LEAVE_DETAILS]    Script Date: 12/17/2020 4:16:50 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[ADD_EMPLOYEE_LEAVE_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[ADD_EMPLOYEE_LEAVE_DETAILS]
GO

/****** Object:  StoredProcedure [dbo].[ADD_EMPLOYEE_LEAVE_DETAILS_ADJUSTMENT_LEAVE_AGAINST]    Script Date: 12/17/2020 4:17:14 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[ADD_EMPLOYEE_LEAVE_DETAILS_ADJUSTMENT_LEAVE_AGAINST]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[ADD_EMPLOYEE_LEAVE_DETAILS_ADJUSTMENT_LEAVE_AGAINST]
GO

/****** Object:  StoredProcedure [dbo].[ADD_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[ADD_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[ADD_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL]
GO

/****** Object:  StoredProcedure [dbo].[ADD_KRA_SKILL_WEIGHTAGE_VALUE_SELF_APPRAISAL]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[ADD_KRA_SKILL_WEIGHTAGE_VALUE_SELF_APPRAISAL]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[ADD_KRA_SKILL_WEIGHTAGE_VALUE_SELF_APPRAISAL]
GO

/****** Object:  StoredProcedure [dbo].[ADD_EMPLOYEE_PAYROLL_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[ADD_EMPLOYEE_PAYROLL_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[ADD_EMPLOYEE_PAYROLL_DETAILS]
GO

/****** Object:  StoredProcedure [dbo].[ADD_LEAVE_POLICY]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[ADD_LEAVE_POLICY]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[ADD_LEAVE_POLICY]
GO


/****** Object:  StoredProcedure [dbo].[ADD_OR_IGNORE_EMPLOYEE_LOP_DAYS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[ADD_OR_IGNORE_EMPLOYEE_LOP_DAYS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[ADD_OR_IGNORE_EMPLOYEE_LOP_DAYS]
GO

/****** Object:  StoredProcedure [dbo].[ALLEMPLOYEESINPAYSLIPTABLE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[ALLEMPLOYEESINPAYSLIPTABLE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[ALLEMPLOYEESINPAYSLIPTABLE]
GO
/****** Object:  StoredProcedure [dbo].[ASSIGN_EMPLOYEE_REPORTING_MANAGER]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[ASSIGN_EMPLOYEE_REPORTING_MANAGER]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[ASSIGN_EMPLOYEE_REPORTING_MANAGER]
GO


/****** Object:  StoredProcedure [dbo].[CHECK_PAYROLL_CLOSE_MONTH]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_PAYROLL_CLOSE_MONTH]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CHECK_PAYROLL_CLOSE_MONTH]
GO
/****** Object:  StoredProcedure [dbo].[CHECKACCESSURL]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CHECKACCESSURL]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CHECKACCESSURL]
GO
/****** Object:  StoredProcedure [dbo].[CHECKING_PENDING_DETAILS_BEFORE_APPRAISAL_PUBLISHING]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CHECKING_PENDING_DETAILS_BEFORE_APPRAISAL_PUBLISHING]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CHECKING_PENDING_DETAILS_BEFORE_APPRAISAL_PUBLISHING]
GO
/****** Object:  StoredProcedure [dbo].[CHECKUSERID]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CHECKUSERID]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CHECKUSERID]
GO
/****** Object:  StoredProcedure [dbo].[CLOSING_APPRAISAL_PROCESS_DETAILS_PERIOD]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CLOSING_APPRAISAL_PROCESS_DETAILS_PERIOD]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CLOSING_APPRAISAL_PROCESS_DETAILS_PERIOD]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_AMC/INSURANCE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_AMC/INSURANCE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_AMC/INSURANCE]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_AMC_INSURANCE_FILES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_AMC_INSURANCE_FILES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_AMC_INSURANCE_FILES]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_AMC_OR_ASSET_INSURANCE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_AMC_OR_ASSET_INSURANCE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_AMC_OR_ASSET_INSURANCE]
GO
/****** Object:  StoredProcedure [dbo].[create_asset]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[create_asset]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[create_asset]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_ASSET_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_ASSET_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_ASSET_DETAILS]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_ASSET_MAINTENANCE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_ASSET_MAINTENANCE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_ASSET_MAINTENANCE]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_ASSET_NAME]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_ASSET_NAME]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_ASSET_NAME]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_ASSET_Sale]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_ASSET_Sale]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_ASSET_Sale]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_ASSIGN_ASSET]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_ASSIGN_ASSET]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_ASSIGN_ASSET]
GO 
/****** Object:  StoredProcedure [dbo].[CREATE_ASSETDETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_ASSETDETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].CREATE_ASSETDETAILS
GO
/****** Object:  StoredProcedure [dbo].[CREATE_BLOODGROUP]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_BLOODGROUP]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_BLOODGROUP]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_DEPARTMENT]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_DEPARTMENT]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_DEPARTMENT]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_DESIGNATION]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_DESIGNATION]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_DESIGNATION]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_EMPLOYEE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_EMPLOYEE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_EMPLOYEE]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_EMPLOYEE_DOCUMENTS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_EMPLOYEE_DOCUMENTS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_EMPLOYEE_DOCUMENTS]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_EMPLOYEE_IMAGE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_EMPLOYEE_IMAGE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_EMPLOYEE_IMAGE]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_GOVERNMENT_ID]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_GOVERNMENT_ID]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_GOVERNMENT_ID]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_HOLIDAYS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_HOLIDAYS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_HOLIDAYS]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_INVOICE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_INVOICE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_INVOICE]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_LANGUAGES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_LANGUAGES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_LANGUAGES]
GO
/****** Object:  StoredProcedure [dbo].[Create_Leave_Report]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Create_Leave_Report]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[Create_Leave_Report]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_LEAVESESSION]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_LEAVESESSION]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_LEAVESESSION]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_LEAVETYPE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_LEAVETYPE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_LEAVETYPE]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_LOCATION]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_LOCATION]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_LOCATION]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_MARITAL_STATUS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_MARITAL_STATUS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_MARITAL_STATUS]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_MESSAGES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_MESSAGES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_MESSAGES]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_MTS_HOLIDAYSLIST]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_MTS_HOLIDAYSLIST]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_MTS_HOLIDAYSLIST]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_NATIONALITY]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_NATIONALITY]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_NATIONALITY]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_POLICY]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_POLICY]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_POLICY]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_QUALIFICATION]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_QUALIFICATION]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_QUALIFICATION]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_RELATIONSHIP]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_RELATIONSHIP]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_RELATIONSHIP]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_SKILLS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_SKILLS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_SKILLS]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_USER_CONTACTS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_USER_CONTACTS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_USER_CONTACTS]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_USER_DEPENDENTS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_USER_DEPENDENTS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_USER_DEPENDENTS]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_USER_SKILLS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_USER_SKILLS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_USER_SKILLS]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_VENDORDETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_VENDORDETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATE_VENDORDETAILS]
GO
/****** Object:  StoredProcedure [dbo].[CREATESALARYDETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATESALARYDETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATESALARYDETAILS]
GO
/****** Object:  StoredProcedure [dbo].[CREATEUPDATE_BANKDETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[CREATEUPDATE_BANKDETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[CREATEUPDATE_BANKDETAILS]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Employee_Appraisal_Mapping]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Delete_Employee_Appraisal_Mapping]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[Delete_Employee_Appraisal_Mapping]
GO
/****** Object:  StoredProcedure [dbo].[DELETE_EMPLOYEE_LEAVE_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[DELETE_EMPLOYEE_LEAVE_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[DELETE_EMPLOYEE_LEAVE_DETAILS]
GO
/****** Object:  StoredProcedure [dbo].[DISPLAY_ALL_MESSAGES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[DISPLAY_ALL_MESSAGES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[DISPLAY_ALL_MESSAGES]
GO
/****** Object:  StoredProcedure [dbo].[Display_New_Joiners]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Display_New_Joiners]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[Display_New_Joiners]
GO
/****** Object:  StoredProcedure [dbo].[Edit_Delete_Appraisal_Employee_Mapping]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Edit_Delete_Appraisal_Employee_Mapping]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[Edit_Delete_Appraisal_Employee_Mapping]
GO
/****** Object:  StoredProcedure [dbo].[EMPLOYEE_LEAVEAPPLY]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE_LEAVEAPPLY]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[EMPLOYEE_LEAVEAPPLY]
GO
/****** Object:  StoredProcedure [dbo].[EMPLOYEE_LEAVECANCEL]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE_LEAVECANCEL]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[EMPLOYEE_LEAVECANCEL]
GO
/****** Object:  StoredProcedure [dbo].[Experienced]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Experienced]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[Experienced]
GO
/****** Object:  StoredProcedure [dbo].[FILTER_ASSETS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[FILTER_ASSETS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[FILTER_ASSETS]
GO
/****** Object:  StoredProcedure [dbo].[FILTER_BANKDETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[FILTER_BANKDETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[FILTER_BANKDETAILS]
GO
/****** Object:  StoredProcedure [dbo].[FILTER_EMPLOYEEDETAILSONDOJ]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[FILTER_EMPLOYEEDETAILSONDOJ]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[FILTER_EMPLOYEEDETAILSONDOJ]
GO
/****** Object:  StoredProcedure [dbo].[FILTERED_ON_PURCHASED_DATE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[FILTERED_ON_PURCHASED_DATE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[FILTERED_ON_PURCHASED_DATE]
GO
/****** Object:  StoredProcedure [dbo].[GET_ACTIVE_EMPLOYEE_FOR_PAYROLL]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GET_ACTIVE_EMPLOYEE_FOR_PAYROLL]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[GET_ACTIVE_EMPLOYEE_FOR_PAYROLL]
GO
/****** Object:  StoredProcedure [dbo].[Get_Appraisal_Count]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Get_Appraisal_Count]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[Get_Appraisal_Count]
GO
/****** Object:  StoredProcedure [dbo].[GET_APPRAISAL_MAPPING_TABLE_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GET_APPRAISAL_MAPPING_TABLE_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[GET_APPRAISAL_MAPPING_TABLE_DETAILS]
GO
/****** Object:  StoredProcedure [dbo].[GET_APPRAISAL_MAPPING_TABLE_DETAILS_APPRAISALMAPPINGID]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GET_APPRAISAL_MAPPING_TABLE_DETAILS_APPRAISALMAPPINGID]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[GET_APPRAISAL_MAPPING_TABLE_DETAILS_APPRAISALMAPPINGID]
GO
/****** Object:  StoredProcedure [dbo].[GET_APPRAISAL_PROCESS_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GET_APPRAISAL_PROCESS_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[GET_APPRAISAL_PROCESS_DETAILS]
GO
/****** Object:  StoredProcedure [dbo].[Get_Approvers_Initiators]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Get_Approvers_Initiators]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[Get_Approvers_Initiators]
GO
/****** Object:  StoredProcedure [dbo].[Get_Employee]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Get_Employee]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[Get_Employee]
GO
/****** Object:  StoredProcedure [dbo].[GET_EMPLOYEE_MAPPING_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GET_EMPLOYEE_MAPPING_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[GET_EMPLOYEE_MAPPING_DETAILS]
GO
/****** Object:  StoredProcedure [dbo].[GET_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GET_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[GET_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL]
GO
/****** Object:  StoredProcedure [dbo].[GET_EMPLOYEE_PAYROLL_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GET_EMPLOYEE_PAYROLL_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].GET_EMPLOYEE_PAYROLL_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[GET_EMPLOYEE_PF_ESI_PROFESSIONAL_TAX_PAYROLL]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GET_EMPLOYEE_PF_ESI_PROFESSIONAL_TAX_PAYROLL]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].GET_EMPLOYEE_PF_ESI_PROFESSIONAL_TAX_PAYROLL
GO
/****** Object:  StoredProcedure [dbo].[Get_Employee_Ratings]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Get_Employee_Ratings]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].Get_Employee_Ratings
GO
/****** Object:  StoredProcedure [dbo].[Get_Employee_Reporting_Managers]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Get_Employee_Reporting_Managers]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].Get_Employee_Reporting_Managers
GO
/****** Object:  StoredProcedure [dbo].[GET_EMPLOYEEID]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GET_EMPLOYEEID]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].GET_EMPLOYEEID
GO
/****** Object:  StoredProcedure [dbo].[Get_Employees]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Get_Employees]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].Get_Employees
GO
/****** Object:  StoredProcedure [dbo].[GET_EVALUATORS_LIST]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GET_EVALUATORS_LIST]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].GET_EVALUATORS_LIST
GO
/****** Object:  StoredProcedure [dbo].[GET_FINAL_EVALUATOR_UNDER_EMPLOYEES_SELF_APPRAISAL_LIST]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GET_FINAL_EVALUATOR_UNDER_EMPLOYEES_SELF_APPRAISAL_LIST]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].GET_FINAL_EVALUATOR_UNDER_EMPLOYEES_SELF_APPRAISAL_LIST
GO
/****** Object:  StoredProcedure [dbo].[GET_MANAGER_UNDER_EMPLOYEES_SELF_APPRAISAL_LIST]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GET_MANAGER_UNDER_EMPLOYEES_SELF_APPRAISAL_LIST]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].GET_MANAGER_UNDER_EMPLOYEES_SELF_APPRAISAL_LIST
GO
/****** Object:  StoredProcedure [dbo].[Get_Messages_Count]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Get_Messages_Count]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].Get_Messages_Count
GO
/****** Object:  StoredProcedure [dbo].[Get_SelfAppraisal_TabName]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Get_SelfAppraisal_TabName]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].Get_SelfAppraisal_TabName
GO
/****** Object:  StoredProcedure [dbo].[GETLASTEMPLOYEEID]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GETLASTEMPLOYEEID]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].GETLASTEMPLOYEEID
GO
/****** Object:  StoredProcedure [dbo].[GETLEAVETYPEBYLEAVECODE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GETLEAVETYPEBYLEAVECODE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].GETLEAVETYPEBYLEAVECODE
GO
/****** Object:  StoredProcedure [dbo].[GETNUMBEROFDAYS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GETNUMBEROFDAYS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].GETNUMBEROFDAYS
GO
/****** Object:  StoredProcedure [dbo].[GETPENDINGLEAVES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GETPENDINGLEAVES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].GETPENDINGLEAVES
GO
/****** Object:  StoredProcedure [dbo].[GETUSERID]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[GETUSERID]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].GETUSERID
GO
/****** Object:  StoredProcedure [dbo].[ID_NAME]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[ID_NAME]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].ID_NAME
GO
/****** Object:  StoredProcedure [dbo].[INSERT_APPROVAL_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[INSERT_APPROVAL_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].INSERT_APPROVAL_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[INSERT_UPDATE_IT_DECLARATION_HEADER]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[INSERT_UPDATE_IT_DECLARATION_HEADER]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].INSERT_UPDATE_IT_DECLARATION_HEADER
GO
/****** Object:  StoredProcedure [dbo].[LEAVE_APPROVE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[LEAVE_APPROVE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].LEAVE_APPROVE
GO
/****** Object:  StoredProcedure [dbo].[LEAVETYPE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[LEAVETYPE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].LEAVETYPE
GO
/****** Object:  StoredProcedure [dbo].[MANAGER_LEAVECANCEL]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MANAGER_LEAVECANCEL]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MANAGER_LEAVECANCEL
GO
/****** Object:  StoredProcedure [dbo].[MTS_ADDAUDIT]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_ADDAUDIT]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_ADDAUDIT
GO
/****** Object:  StoredProcedure [dbo].[MTS_ADDEMAILMASTERENTRY]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_ADDEMAILMASTERENTRY]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_ADDEMAILMASTERENTRY
GO
/****** Object:  StoredProcedure [dbo].[MTS_ADDQA]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_ADDQA]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_ADDQA
GO
/****** Object:  StoredProcedure [dbo].[MTS_ADDUSER]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_ADDUSER]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_ADDUSER
GO
/****** Object:  StoredProcedure [dbo].[MTS_CALCULATE_INDIVUDUAL_EARNEDLEAVEBALANCE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_CALCULATE_INDIVUDUAL_EARNEDLEAVEBALANCE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_CALCULATE_INDIVUDUAL_EARNEDLEAVEBALANCE
GO
/****** Object:  StoredProcedure [dbo].[MTS_CALCULATELEAVE_ALLEMPLOYEE_YEARLYONCE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_CALCULATELEAVE_ALLEMPLOYEE_YEARLYONCE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_CALCULATELEAVE_ALLEMPLOYEE_YEARLYONCE
GO
/****** Object:  StoredProcedure [dbo].[MTS_CALCULATELEAVE_ATJOIN]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_CALCULATELEAVE_ATJOIN]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_CALCULATELEAVE_ATJOIN
GO
/****** Object:  StoredProcedure [dbo].[MTS_CALCULATELEAVE_ATJOIN_MULTIPLE_EMPLOYEES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_CALCULATELEAVE_ATJOIN_MULTIPLE_EMPLOYEES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_CALCULATELEAVE_ATJOIN_MULTIPLE_EMPLOYEES
GO
/****** Object:  StoredProcedure [dbo].[MTS_CALCULATELEAVE_EARNED_FOR_EMPLOYEE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_CALCULATELEAVE_EARNED_FOR_EMPLOYEE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_CALCULATELEAVE_EARNED_FOR_EMPLOYEE
GO
/****** Object:  StoredProcedure [dbo].[MTS_CALCULATELEAVE_EARNEDMONTHLY]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_CALCULATELEAVE_EARNEDMONTHLY]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_CALCULATELEAVE_EARNEDMONTHLY
GO
/****** Object:  StoredProcedure [dbo].[MTS_CALCULATELEAVE_EMPLOYEE_YEARLYONCE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_CALCULATELEAVE_EMPLOYEE_YEARLYONCE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_CALCULATELEAVE_EMPLOYEE_YEARLYONCE
GO
/****** Object:  StoredProcedure [dbo].[MTS_CALCULATELEAVE_MONTHLY]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_CALCULATELEAVE_MONTHLY]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_CALCULATELEAVE_MONTHLY
GO
/****** Object:  StoredProcedure [dbo].[MTS_CHECK_EXISTS_USEREMAIL]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_CHECK_EXISTS_USEREMAIL]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_CHECK_EXISTS_USEREMAIL
GO
/****** Object:  StoredProcedure [dbo].[MTS_CHECK_EXISTS_USERNAME]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_CHECK_EXISTS_USERNAME]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_CHECK_EXISTS_USERNAME
GO
/****** Object:  StoredProcedure [dbo].[MTS_CREATE_NEWPOLICY]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_CREATE_NEWPOLICY]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_CREATE_NEWPOLICY
GO
/****** Object:  StoredProcedure [dbo].[MTS_EDITROLE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_EDITROLE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_EDITROLE
GO
/****** Object:  StoredProcedure [dbo].[MTS_FORGOTPASSWORD]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_FORGOTPASSWORD]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_FORGOTPASSWORD
GO
/****** Object:  StoredProcedure [dbo].[MTS_GET_IT_DECLARATION_EMPLOYEES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GET_IT_DECLARATION_EMPLOYEES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GET_IT_DECLARATION_EMPLOYEES
GO
/****** Object:  StoredProcedure [dbo].[MTS_GET_IT_DECLARATION_FINANCIAL_YEAR]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GET_IT_DECLARATION_FINANCIAL_YEAR]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GET_IT_DECLARATION_FINANCIAL_YEAR
GO
/****** Object:  StoredProcedure [dbo].[MTS_GET_IT_DECLARATION_HOUSE_LOAN_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GET_IT_DECLARATION_HOUSE_LOAN_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GET_IT_DECLARATION_HOUSE_LOAN_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[MTS_GET_IT_DECLARATION_HOUSE_RENT_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GET_IT_DECLARATION_HOUSE_RENT_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GET_IT_DECLARATION_HOUSE_RENT_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[MTS_GET_IT_DECLARATION_OTHER_SOURCE_INCOME]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GET_IT_DECLARATION_OTHER_SOURCE_INCOME]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GET_IT_DECLARATION_OTHER_SOURCE_INCOME
GO
/****** Object:  StoredProcedure [dbo].[MTS_GET_IT_DECLARATION_SECTION_SUBSECTION_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GET_IT_DECLARATION_SECTION_SUBSECTION_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GET_IT_DECLARATION_SECTION_SUBSECTION_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[MTS_GET_IT_DECLARATION_SUMMARY]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GET_IT_DECLARATION_SUMMARY]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GET_IT_DECLARATION_SUMMARY
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETACTIVESECURITYQUESTIONS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETACTIVESECURITYQUESTIONS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETACTIVESECURITYQUESTIONS
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETAPPCONFIG]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETAPPCONFIG]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETAPPCONFIG
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETCREATEUSER]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETCREATEUSER]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETCREATEUSER
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETDETAILVIEW]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETDETAILVIEW]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETDETAILVIEW
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETEMAILSCHEDULE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETEMAILSCHEDULE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETEMAILSCHEDULE
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETEMAILSCHEDULEFORTIMESCHEDULER]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETEMAILSCHEDULEFORTIMESCHEDULER]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETEMAILSCHEDULEFORTIMESCHEDULER
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETEMAILSWAITINGTOBESEND]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETEMAILSWAITINGTOBESEND]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETEMAILSWAITINGTOBESEND
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETEMAILTEMPLATE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETEMAILTEMPLATE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETEMAILTEMPLATE
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETEMPLOYEEROLE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETEMPLOYEEROLE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETEMPLOYEEROLE
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETPASSWORDHISTORY]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETPASSWORDHISTORY]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETPASSWORDHISTORY
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETPASSWORDPOLICY]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETPASSWORDPOLICY]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETPASSWORDPOLICY
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETQA]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETQA]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETQA
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETQABASEDONID]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETQABASEDONID]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETQABASEDONID
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETROLE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETROLE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETROLE
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETSECURITYQUESTIONS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETSECURITYQUESTIONS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETSECURITYQUESTIONS
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETSERVICECONFIG]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETSERVICECONFIG]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETSERVICECONFIG
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETSERVICECONFIGFORSERVICE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETSERVICECONFIGFORSERVICE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETSERVICECONFIGFORSERVICE
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETSTMPDETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETSTMPDETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETSTMPDETAILS
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETTEMPLATEIDFROMSCHEDULEID]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETTEMPLATEIDFROMSCHEDULEID]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETTEMPLATEIDFROMSCHEDULEID
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETUSER]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETUSER]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETUSER
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETUSERDETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETUSERDETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETUSERDETAILS
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETUSERLIST]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETUSERLIST]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETUSERLIST
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETUSERS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_GETUSERS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_GETUSERS
GO
/****** Object:  StoredProcedure [dbo].[MTS_INSERT_IT_DECLARELATION_SECTIONS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_INSERT_IT_DECLARELATION_SECTIONS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_INSERT_IT_DECLARELATION_SECTIONS
GO
/****** Object:  StoredProcedure [dbo].[MTS_INSERT_UPDATE_IT_DECLARATION_HOUSE_LOAN_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_INSERT_UPDATE_IT_DECLARATION_HOUSE_LOAN_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_INSERT_UPDATE_IT_DECLARATION_HOUSE_LOAN_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[MTS_INSERT_UPDATE_IT_DECLARATION_HOUSE_RENT_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_INSERT_UPDATE_IT_DECLARATION_HOUSE_RENT_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_INSERT_UPDATE_IT_DECLARATION_HOUSE_RENT_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[MTS_INSERT_UPDATE_IT_DECLARATION_OTHER_SOURCE_INCOME]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_INSERT_UPDATE_IT_DECLARATION_OTHER_SOURCE_INCOME]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_INSERT_UPDATE_IT_DECLARATION_OTHER_SOURCE_INCOME
GO
/****** Object:  StoredProcedure [dbo].[MTS_IT_DECLARATION_EMP_IDS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_IT_DECLARATION_EMP_IDS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_IT_DECLARATION_EMP_IDS
GO
/****** Object:  StoredProcedure [dbo].[MTS_PAYROLL_AUDIT]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_PAYROLL_AUDIT]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_PAYROLL_AUDIT
GO
/****** Object:  StoredProcedure [dbo].[MTS_PAYROLL_CONSOLIDATE_SALARY_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_PAYROLL_CONSOLIDATE_SALARY_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_PAYROLL_CONSOLIDATE_SALARY_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[MTS_PAYROLL_GET_FROM_MONTH]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_PAYROLL_GET_FROM_MONTH]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_PAYROLL_GET_FROM_MONTH
GO
/****** Object:  StoredProcedure [dbo].[MTS_PAYROLL_GET_PAYROLL_MONTH]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_PAYROLL_GET_PAYROLL_MONTH]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_PAYROLL_GET_PAYROLL_MONTH
GO
/****** Object:  StoredProcedure [dbo].[MTS_PAYROLL_GET_PREVIOUS_BONUSMONTH]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_PAYROLL_GET_PREVIOUS_BONUSMONTH]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_PAYROLL_GET_PREVIOUS_BONUSMONTH
GO
/****** Object:  StoredProcedure [dbo].[MTS_PAYROLL_GET_TO_MONTH]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_PAYROLL_GET_TO_MONTH]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_PAYROLL_GET_TO_MONTH
GO
/****** Object:  StoredProcedure [dbo].[MTS_PAYROLL_PREPROCESS_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_PAYROLL_PREPROCESS_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_PAYROLL_PREPROCESS_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[MTS_PAYROLLBANK_SHEET_REPORT]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_PAYROLLBANK_SHEET_REPORT]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_PAYROLLBANK_SHEET_REPORT
GO
/****** Object:  StoredProcedure [dbo].[MTS_READ_ALLPOLICIES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_READ_ALLPOLICIES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_READ_ALLPOLICIES
GO
/****** Object:  StoredProcedure [dbo].[MTS_READ_PAYROLL_LOP_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_READ_PAYROLL_LOP_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_READ_PAYROLL_LOP_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[MTS_READROLES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_READROLES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_READROLES
GO
/****** Object:  StoredProcedure [dbo].[MTS_RESETPASSWORD]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_RESETPASSWORD]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_RESETPASSWORD
GO
/****** Object:  StoredProcedure [dbo].[MTS_SMTPDETAIL]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_SMTPDETAIL]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_SMTPDETAIL
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATE_HRPOLICIES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_UPDATE_HRPOLICIES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_UPDATE_HRPOLICIES
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATE_IT_DECLARATION_FINAL_SUBMIT]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_UPDATE_IT_DECLARATION_FINAL_SUBMIT]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_UPDATE_IT_DECLARATION_FINAL_SUBMIT
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATE_PAYROLL_DETAILS_FOR_EMPLOYEE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_UPDATE_PAYROLL_DETAILS_FOR_EMPLOYEE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_UPDATE_PAYROLL_DETAILS_FOR_EMPLOYEE
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATEANONYMSATTEMPTS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_UPDATEANONYMSATTEMPTS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_UPDATEANONYMSATTEMPTS
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATEDETAILVIEW]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_UPDATEDETAILVIEW]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_UPDATEDETAILVIEW
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATEEMAILSTATUS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_UPDATEEMAILSTATUS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_UPDATEEMAILSTATUS
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATELASTPWDCHANGE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_UPDATELASTPWDCHANGE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_UPDATELASTPWDCHANGE
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATELOCKUSER]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_UPDATELOCKUSER]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_UPDATELOCKUSER
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATEPASSWORD]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_UPDATEPASSWORD]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_UPDATEPASSWORD
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATEQA]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_UPDATEQA]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_UPDATEQA
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATESECURITYQUESTION]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_UPDATESECURITYQUESTION]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_UPDATESECURITYQUESTION
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATESERVICECONFIG]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_UPDATESERVICECONFIG]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_UPDATESERVICECONFIG
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATESERVICESTATUS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_UPDATESERVICESTATUS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_UPDATESERVICESTATUS
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATESTATUS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_UPDATESTATUS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_UPDATESTATUS
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATEUSER]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_UPDATEUSER]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_UPDATEUSER
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATEUSERATTEMPTS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_UPDATEUSERATTEMPTS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_UPDATEUSERATTEMPTS
GO
/****** Object:  StoredProcedure [dbo].[MTS_USERPASSWORDEMAIL]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_USERPASSWORDEMAIL]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].MTS_USERPASSWORDEMAIL
GO
/****** Object:  StoredProcedure [dbo].[PUBLISHING_APPRAISAL_PROCESS_DETAILS_PERIOD]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[PUBLISHING_APPRAISAL_PROCESS_DETAILS_PERIOD]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].PUBLISHING_APPRAISAL_PROCESS_DETAILS_PERIOD
GO
/****** Object:  StoredProcedure [dbo].[READ_ACTIVE_EMPLOYEE_NAMES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ACTIVE_EMPLOYEE_NAMES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ACTIVE_EMPLOYEE_NAMES
GO
/****** Object:  StoredProcedure [dbo].[READ_ALL_DisableHOLIDAYDATES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ALL_DisableHOLIDAYDATES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ALL_DisableHOLIDAYDATES
GO
/****** Object:  StoredProcedure [dbo].[READ_ALL_DisableHOLIDAYDATES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ALL_DisableHOLIDAYDATES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ALL_DisableHOLIDAYDATES
GO
/****** Object:  StoredProcedure [dbo].[READ_ALL_HOLIDAYDATES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ALL_HOLIDAYDATES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ALL_HOLIDAYDATES
GO
/****** Object:  StoredProcedure [dbo].[READ_ALL_HOLIDAYSLIST]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ALL_HOLIDAYSLIST]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ALL_HOLIDAYSLIST
GO
/****** Object:  StoredProcedure [dbo].[READ_ALL_MESSAGES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ALL_MESSAGES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ALL_MESSAGES
GO
/****** Object:  StoredProcedure [dbo].[READ_ALL_MTS_HOLIDAYSLIST]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ALL_MTS_HOLIDAYSLIST]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ALL_MTS_HOLIDAYSLIST
GO
/****** Object:  StoredProcedure [dbo].[READ_ALLASSETCATEGORIES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ALLASSETCATEGORIES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ALLASSETCATEGORIES
GO
/****** Object:  StoredProcedure [dbo].[READ_ALLASSETENTRIES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ALLASSETENTRIES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ALLASSETENTRIES
GO
/****** Object:  StoredProcedure [dbo].[READ_ALLASSETNAMES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ALLASSETNAMES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ALLASSETNAMES
GO
/****** Object:  StoredProcedure [dbo].[READ_ALLEMPLOYEELEAVELIST]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ALLEMPLOYEELEAVELIST]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ALLEMPLOYEELEAVELIST
GO
/****** Object:  StoredProcedure [dbo].[READ_ALLEMPLOYEENAMES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ALLEMPLOYEENAMES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ALLEMPLOYEENAMES
GO
/****** Object:  StoredProcedure [dbo].[READ_AMC_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_AMC_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_AMC_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[READ_Amc_IMAGES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_Amc_IMAGES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_Amc_IMAGES
GO
/****** Object:  StoredProcedure [dbo].[READ_AMC_INSURANCE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_AMC_INSURANCE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_AMC_INSURANCE
GO
/****** Object:  StoredProcedure [dbo].[READ_AMC_OR_ASSET_INSURANCE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_AMC_OR_ASSET_INSURANCE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_AMC_OR_ASSET_INSURANCE
GO
/****** Object:  StoredProcedure [dbo].[READ_APPRAISAL_MANAGERS_FEEDBACK_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_APPRAISAL_MANAGERS_FEEDBACK_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_APPRAISAL_MANAGERS_FEEDBACK_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[Read_Appraisal_SkillKRAMapping]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Read_Appraisal_SkillKRAMapping]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].Read_Appraisal_SkillKRAMapping
GO
/****** Object:  StoredProcedure [dbo].[READ_APPROVAL_ACTION_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_APPROVAL_ACTION_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_APPROVAL_ACTION_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[READ_APPROVAL_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_APPROVAL_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_APPROVAL_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[READ_APPROVEDLEAVELIST]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_APPROVEDLEAVELIST]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_APPROVEDLEAVELIST
GO
/****** Object:  StoredProcedure [dbo].[READ_APPROVEDLEAVELISTFOREXPORT]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_APPROVEDLEAVELISTFOREXPORT]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_APPROVEDLEAVELISTFOREXPORT
GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_CLASSIFICATION_COUNT]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ASSET_CLASSIFICATION_COUNT]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ASSET_CLASSIFICATION_COUNT
GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_DASHBOARD_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ASSET_DASHBOARD_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ASSET_DASHBOARD_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_DASHBOARD_TABLE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ASSET_DASHBOARD_TABLE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ASSET_DASHBOARD_TABLE
GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_MAINTENANCDE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ASSET_MAINTENANCDE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ASSET_MAINTENANCDE
GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_MAINTENANCE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ASSET_MAINTENANCE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ASSET_MAINTENANCE
GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_MAINTENANCE_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ASSET_MAINTENANCE_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ASSET_MAINTENANCE_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_MASTER]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ASSET_MASTER]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ASSET_MASTER
GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_REPORT]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ASSET_REPORT]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ASSET_REPORT
GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_SALE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ASSET_SALE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ASSET_SALE
GO
/****** Object:  StoredProcedure [dbo].[READ_ASSETCATEGORY_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ASSETCATEGORY_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ASSETCATEGORY_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[READ_ASSETDETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ASSETDETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ASSETDETAILS
GO
/****** Object:  StoredProcedure [dbo].[READ_ASSETDETAILSBYID]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ASSETDETAILSBYID]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ASSETDETAILSBYID
GO
/****** Object:  StoredProcedure [dbo].[READ_ASSETS_ASSIGNED_TO_EMPLOYEE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ASSETS_ASSIGNED_TO_EMPLOYEE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ASSETS_ASSIGNED_TO_EMPLOYEE
GO
/****** Object:  StoredProcedure [dbo].[READ_ASSETS_ASSIGNED_TO_EMPLOYEE_COUNTS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ASSETS_ASSIGNED_TO_EMPLOYEE_COUNTS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ASSETS_ASSIGNED_TO_EMPLOYEE_COUNTS
GO
/****** Object:  StoredProcedure [dbo].[READ_ASSIGN_ASSET]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ASSIGN_ASSET]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ASSIGN_ASSET
GO
/****** Object:  StoredProcedure [dbo].[READ_AUTHORIZATION]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_AUTHORIZATION]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_AUTHORIZATION
GO
/****** Object:  StoredProcedure [dbo].[READ_BANKDETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_BANKDETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_BANKDETAILS
GO
/****** Object:  StoredProcedure [dbo].[READ_BIRTHDAYS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_BIRTHDAYS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_BIRTHDAYS
GO
/****** Object:  StoredProcedure [dbo].[READ_BLOODGROUP]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_BLOODGROUP]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_BLOODGROUP
GO
/****** Object:  StoredProcedure [dbo].[READ_CURRENTLY_ASSIGNED_EMPLOYEE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_CURRENTLY_ASSIGNED_EMPLOYEE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_CURRENTLY_ASSIGNED_EMPLOYEE
GO
/****** Object:  StoredProcedure [dbo].[READ_DEPARTMENT]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_DEPARTMENT]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_DEPARTMENT
GO
/****** Object:  StoredProcedure [dbo].[READ_DESIGNATION]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_DESIGNATION]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_DESIGNATION
GO
/****** Object:  StoredProcedure [dbo].[READ_DETAILED_EMPLOYEE_LEAVE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_DETAILED_EMPLOYEE_LEAVE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_DETAILED_EMPLOYEE_LEAVE
GO
/****** Object:  StoredProcedure [dbo].[Read_Document_Images]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Read_Document_Images]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].Read_Document_Images
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEE
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_APPRORED_LEAVES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEE_APPRORED_LEAVES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEE_APPRORED_LEAVES
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_ASSIGNED_MANAGERS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEE_ASSIGNED_MANAGERS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEE_ASSIGNED_MANAGERS
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_ENTRY_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEE_ENTRY_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEE_ENTRY_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_ID]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEE_ID]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEE_ID
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_IMAGE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEE_IMAGE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEE_IMAGE
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_LEAVE_DETAILS_BETWEEN_YEAR]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEE_LEAVE_DETAILS_BETWEEN_YEAR]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEE_LEAVE_DETAILS_BETWEEN_YEAR
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_LEAVEBALANCE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEE_LEAVEBALANCE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEE_LEAVEBALANCE
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_LEAVES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEE_LEAVES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEE_LEAVES
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_LEAVES_FOR_EMP_LEAVETYPE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEE_LEAVES_FOR_EMP_LEAVETYPE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEE_LEAVES_FOR_EMP_LEAVETYPE
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_MONTHLY_LOP_DAYS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEE_MONTHLY_LOP_DAYS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEE_MONTHLY_LOP_DAYS
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEEALLLEAVEBALANCE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEEALLLEAVEBALANCE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEEALLLEAVEBALANCE
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEEDETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEEDETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEEDETAILS
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEEDOCUMENTS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEEDOCUMENTS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEEDOCUMENTS
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEELEAVELIST_BETWEEN_DATE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEELEAVELIST_BETWEEN_DATE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEELEAVELIST_BETWEEN_DATE
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEELEAVELIST_BETWEEN_DATE_WITHOUT_LeaveType]    Script Date: 1/5/2021 3:30:03 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEELEAVELIST_BETWEEN_DATE_WITHOUT_LeaveType]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEELEAVELIST_BETWEEN_DATE_WITHOUT_LeaveType
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEELEAVELIST_BETWEEN_DATE_WITHOUT_LeaveType_OLD]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEELEAVELIST_BETWEEN_DATE_WITHOUT_LeaveType_OLD]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEELEAVELIST_BETWEEN_DATE_WITHOUT_LeaveType_OLD
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEEROLE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_EMPLOYEEROLE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_EMPLOYEEROLE
GO
/****** Object:  StoredProcedure [dbo].[Read_Employees]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Read_Employees]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].Read_Employees
GO
/****** Object:  StoredProcedure [dbo].[READ_FILTERED_ASSET_NAME]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_FILTERED_ASSET_NAME]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_FILTERED_ASSET_NAME
GO
/****** Object:  StoredProcedure [dbo].[Read_Filtered_LeaveType]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Read_Filtered_LeaveType]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].Read_Filtered_LeaveType
GO
/****** Object:  StoredProcedure [dbo].[READ_FUNCTIONALROLE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_FUNCTIONALROLE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_FUNCTIONALROLE
GO
/****** Object:  StoredProcedure [dbo].[READ_GOVERNMENT_ID]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_GOVERNMENT_ID]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_GOVERNMENT_ID
GO
/****** Object:  StoredProcedure [dbo].[READ_INVOICE_IMAGES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_INVOICE_IMAGES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_INVOICE_IMAGES
GO
/****** Object:  StoredProcedure [dbo].[READ_ITEMCODE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ITEMCODE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ITEMCODE
GO
/****** Object:  StoredProcedure [dbo].[READ_ITEMCODE_AMCINSURANCE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_ITEMCODE_AMCINSURANCE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_ITEMCODE_AMCINSURANCE
GO
/****** Object:  StoredProcedure [dbo].[READ_LANGUAGES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_LANGUAGES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_LANGUAGES
GO
/****** Object:  StoredProcedure [dbo].[READ_LASTINVOICEID]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_LASTINVOICEID]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_LASTINVOICEID
GO
/****** Object:  StoredProcedure [dbo].[READ_LEAVE_POLICY]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_LEAVE_POLICY]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_LEAVE_POLICY
GO
/****** Object:  StoredProcedure [dbo].[READ_LEAVE_TYPE_FOR_EMPLOYEE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_LEAVE_TYPE_FOR_EMPLOYEE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_LEAVE_TYPE_FOR_EMPLOYEE
GO
/****** Object:  StoredProcedure [dbo].[READ_LEAVESESSION]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_LEAVESESSION]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_LEAVESESSION
GO
/****** Object:  StoredProcedure [dbo].[READ_LEAVETYPE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_LEAVETYPE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_LEAVETYPE
GO
/****** Object:  StoredProcedure [dbo].[READ_LEAVETYPENAME]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_LEAVETYPENAME]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_LEAVETYPENAME
GO
/****** Object:  StoredProcedure [dbo].[READ_LOCATION]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_LOCATION]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_LOCATION
GO
/****** Object:  StoredProcedure [dbo].[READ_LOCATION_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_LOCATION_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_LOCATION_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[READ_MANAGERNAMES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_MANAGERNAMES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_MANAGERNAMES
GO
/****** Object:  StoredProcedure [dbo].[READ_MARITAL_STATUS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_MARITAL_STATUS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_MARITAL_STATUS
GO
/****** Object:  StoredProcedure [dbo].[READ_MONTHLY_ATTENDANCE_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_MONTHLY_ATTENDANCE_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_MONTHLY_ATTENDANCE_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[READ_MONTHLY_ATTENDANCE_LOG]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_MONTHLY_ATTENDANCE_LOG]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_MONTHLY_ATTENDANCE_LOG
GO
/****** Object:  StoredProcedure [dbo].[READ_MTS_ASSET]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_MTS_ASSET]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_MTS_ASSET
GO
/****** Object:  StoredProcedure [dbo].[READ_MTS_LeavePolicy_LeaveType]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_MTS_LeavePolicy_LeaveType]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_MTS_LeavePolicy_LeaveType
GO
/****** Object:  StoredProcedure [dbo].[READ_NATIONALITY]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_NATIONALITY]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_NATIONALITY
GO
/****** Object:  StoredProcedure [dbo].[READ_PAYROLL_EMPLOYEE_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_PAYROLL_EMPLOYEE_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_PAYROLL_EMPLOYEE_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[READ_PAYROLL_REPORT_SUMMARY]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_PAYROLL_REPORT_SUMMARY]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_PAYROLL_REPORT_SUMMARY
GO
/****** Object:  StoredProcedure [dbo].[Read_Payslip]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[Read_Payslip]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].Read_Payslip
GO
/****** Object:  StoredProcedure [dbo].[READ_PENDINGLEAVELIST]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_PENDINGLEAVELIST]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_PENDINGLEAVELIST
GO
/****** Object:  StoredProcedure [dbo].[READ_POLICYIMAGES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_POLICYIMAGES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_POLICYIMAGES
GO
/****** Object:  StoredProcedure [dbo].[READ_QUALIFICATION]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_QUALIFICATION]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_QUALIFICATION
GO
/****** Object:  StoredProcedure [dbo].[READ_REJECTED_APPROVAL_MODULE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_REJECTED_APPROVAL_MODULE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_REJECTED_APPROVAL_MODULE
GO
/****** Object:  StoredProcedure [dbo].[READ_RELATIONSHIP]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_RELATIONSHIP]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_RELATIONSHIP
GO
/****** Object:  StoredProcedure [dbo].[READ_SELECTED_ASSET_ITEM_CODE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_SELECTED_ASSET_ITEM_CODE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_SELECTED_ASSET_ITEM_CODE
GO
/****** Object:  StoredProcedure [dbo].[READ_SELECTED_ITEM_DESCRIPTION]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_SELECTED_ITEM_DESCRIPTION]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_SELECTED_ITEM_DESCRIPTION
GO
/****** Object:  StoredProcedure [dbo].[READ_SKILLS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_SKILLS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_SKILLS
GO
/****** Object:  StoredProcedure [dbo].[READ_SPECIFIC_ASSET_NAME]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_SPECIFIC_ASSET_NAME]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_SPECIFIC_ASSET_NAME
GO
/****** Object:  StoredProcedure [dbo].[READ_UPCOMMING_HOLIDAYSLIST]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_UPCOMMING_HOLIDAYSLIST]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_UPCOMMING_HOLIDAYSLIST
GO
/****** Object:  StoredProcedure [dbo].[READ_VENDOR_NAME]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_VENDOR_NAME]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_VENDOR_NAME
GO
/****** Object:  StoredProcedure [dbo].[READ_VENDORNAMES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READ_VENDORNAMES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READ_VENDORNAMES
GO
/****** Object:  StoredProcedure [dbo].[READEMPLOYEE_PANNUMBER]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[READEMPLOYEE_PANNUMBER]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].READEMPLOYEE_PANNUMBER
GO
/****** Object:  StoredProcedure [dbo].[RESTRICT_EMPLOYEELEAVES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[RESTRICT_EMPLOYEELEAVES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].RESTRICT_EMPLOYEELEAVES
GO
/****** Object:  StoredProcedure [dbo].[REVISE_EMPLOYEE_PAYROLL_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[REVISE_EMPLOYEE_PAYROLL_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].REVISE_EMPLOYEE_PAYROLL_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[SESSIONEMPID]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SESSIONEMPID]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].SESSIONEMPID
GO
/****** Object:  StoredProcedure [dbo].[SKIPPING_MANAGERS_TO_EMPLOYEE_APPRAISAL_PROCESS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[SKIPPING_MANAGERS_TO_EMPLOYEE_APPRAISAL_PROCESS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].SKIPPING_MANAGERS_TO_EMPLOYEE_APPRAISAL_PROCESS
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_ANNOUNCEMENTS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_ANNOUNCEMENTS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_ANNOUNCEMENTS
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_ASSET]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_ASSET]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_ASSET
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_ASSET_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_ASSET_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_ASSET_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_ASSIGNED_MANAGER_TO_EMPLOYEE_APPRAISAL_PROCESS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_ASSIGNED_MANAGER_TO_EMPLOYEE_APPRAISAL_PROCESS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_ASSIGNED_MANAGER_TO_EMPLOYEE_APPRAISAL_PROCESS
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_BANKDETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_BANKDETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_BANKDETAILS
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_BLOODGROUP]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_BLOODGROUP]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_BLOODGROUP
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_DEPARTMENT]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_DEPARTMENT]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_DEPARTMENT
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_DESIGNATION]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_DESIGNATION]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_DESIGNATION
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_EMPLOYEE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_EMPLOYEE
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEE_DEPARTMENT_LEAVEPOLICY]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_EMPLOYEE_DEPARTMENT_LEAVEPOLICY]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_EMPLOYEE_DEPARTMENT_LEAVEPOLICY
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEE_EDUCATIONS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_EMPLOYEE_EDUCATIONS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_EMPLOYEE_EDUCATIONS
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEE_LEAVE_BALANCE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_EMPLOYEE_LEAVE_BALANCE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_EMPLOYEE_LEAVE_BALANCE
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEEADDRESS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_EMPLOYEEADDRESS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_EMPLOYEEADDRESS
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEEDETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_EMPLOYEEDETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_EMPLOYEEDETAILS
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_FINAL_MODERATOR_TO_EMPLOYEE_APPRAISAL_PROCESS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_FINAL_MODERATOR_TO_EMPLOYEE_APPRAISAL_PROCESS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_FINAL_MODERATOR_TO_EMPLOYEE_APPRAISAL_PROCESS
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_GOVERNMENT_ID]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_GOVERNMENT_ID]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_GOVERNMENT_ID
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_HOLIDAYS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_HOLIDAYS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_HOLIDAYS
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_LANGUAGES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_LANGUAGES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_LANGUAGES
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_LEAVE_POLICY]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_LEAVE_POLICY]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_LEAVE_POLICY
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_LEAVETYPE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_LEAVETYPE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_LEAVETYPE
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_LOCATION]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_LOCATION]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_LOCATION
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_MARITAL_STATUS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_MARITAL_STATUS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_MARITAL_STATUS
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_MESSAGE_STATUS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_MESSAGE_STATUS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_MESSAGE_STATUS
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_MESSAGES]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_MESSAGES]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_MESSAGES
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_NATIONALITY]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_NATIONALITY]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_NATIONALITY
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_PAYROLL_CLOSE_MONTH]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_PAYROLL_CLOSE_MONTH]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_PAYROLL_CLOSE_MONTH
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_PREV_BOUNS_DATE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_PREV_BOUNS_DATE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_PREV_BOUNS_DATE
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_QUALIFICATION]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_QUALIFICATION]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_QUALIFICATION
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_RELATIONSHIP]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_RELATIONSHIP]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_RELATIONSHIP
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_SESSION]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_SESSION]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_SESSION
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_SKILLS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_SKILLS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_SKILLS
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_UNASSIGN_ASSET]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_UNASSIGN_ASSET]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATE_UNASSIGN_ASSET
GO
/****** Object:  StoredProcedure [dbo].[UPDATELOPDAYS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPDATELOPDAYS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPDATELOPDAYS
GO
/****** Object:  StoredProcedure [dbo].[UPLOAD_ATTENDANCE_DATA]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[UPLOAD_ATTENDANCE_DATA]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].UPLOAD_ATTENDANCE_DATA
GO
/****** Object:  StoredProcedure [dbo].[VALIDATE_APPROVAL_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[VALIDATE_APPROVAL_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].VALIDATE_APPROVAL_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[VIEW_ASSETDETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[VIEW_ASSETDETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].VIEW_ASSETDETAILS
GO
/****** Object:  StoredProcedure [dbo].[VIEW_EACH_EMPLOYEE_ATTENDANCE_DETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[VIEW_EACH_EMPLOYEE_ATTENDANCE_DETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].VIEW_EACH_EMPLOYEE_ATTENDANCE_DETAILS
GO
/****** Object:  StoredProcedure [dbo].[VIEW_EMPLOYEEDETAILS]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[VIEW_EMPLOYEEDETAILS]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].VIEW_EMPLOYEEDETAILS
GO
/****** Object:  StoredProcedure [dbo].[VIEW_EMPLOYEELEAVELIST]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[VIEW_EMPLOYEELEAVELIST]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].VIEW_EMPLOYEELEAVELIST
GO
/****** Object:  StoredProcedure [dbo].[VIEW_MODULE_PAGE]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[VIEW_MODULE_PAGE]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].VIEW_MODULE_PAGE
GO
/****** Object:  StoredProcedure [dbo].[XC_REPORT_TENANT_WISE_INVOICE_COUNT]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[XC_REPORT_TENANT_WISE_INVOICE_COUNT]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].XC_REPORT_TENANT_WISE_INVOICE_COUNT
GO
/****** Object:  StoredProcedure [dbo].[MTS_CALCULATELEAVE_EMPID_YEAR]    Script Date: 4/21/2018 4:07:37 PM ******/
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[MTS_CALCULATELEAVE_EMPID_YEAR]')
			AND type IN (
				N'P'
				,N'PC'
				)
		)
	DROP PROCEDURE [dbo].[MTS_CALCULATELEAVE_EMPID_YEAR]
GO
/****** Object:  StoredProcedure [dbo].[ACTIVATEACCOUNT]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ACTIVATEACCOUNT] (
	@id BIGINT
	,@active BIT
	,@inactivedate DATE
	)
AS
BEGIN
	IF (@active = 0)
	BEGIN
		UPDATE MTS_LOGIN
		SET STATUS = 8
			,Active = 0
			,ResignedOn = @inactivedate
		WHERE USERID = @id

		SELECT 0
	END
	ELSE IF (@active = 1)
	BEGIN
		UPDATE MTS_LOGIN
		SET STATUS = 2
			,Active = 1
			,ResignedOn = NULL
		WHERE USERID = @id

		SELECT 1
	END
END
GO

/****** Object:  StoredProcedure [dbo].[ADD_APPRAISAL_DESIGNATION_MAPPING_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_APPRAISAL_DESIGNATION_MAPPING_DETAILS] (
	@TYPE BIGINT
	,@DESCRIPTION BIGINT
	,@WEIGHTAGE DECIMAL
	,@DESIGNATION BIGINT
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM MTS_Appraisal_Designation_Mapping WITH (NOLOCK)
			WHERE [Designation] = @DESIGNATION
				AND PerformanceTypeID = @TYPE
				AND [Description] = @DESCRIPTION
			)
	BEGIN
		INSERT INTO MTS_Appraisal_Designation_Mapping (
			PerformanceTypeID
			,[Description]
			,[Weightage]
			,[Designation]
			)
		VALUES (
			@TYPE
			,@DESCRIPTION
			,@WEIGHTAGE
			,@DESIGNATION
			)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[ADD_APPRAISAL_DESIGNATION_MAPPING_DETAILS_FOR_INDIVIDUAL]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_APPRAISAL_DESIGNATION_MAPPING_DETAILS_FOR_INDIVIDUAL] (
	@TYPE BIGINT
	,@DESCRIPTION BIGINT
	,@WEIGHTAGE DECIMAL
	,@EMP_ID BIGINT
	,@PROCESS_DETAILS_ID BIGINT
	)
AS
BEGIN
	DECLARE @Performance_TypeID BIGINT
		,@designation BIGINT

	SELECT @Performance_TypeID = PerformanceTypeID
	FROM MTS_Appraisal_SkillKRAMapping WITH (NOLOCK)
	WHERE Id = @DESCRIPTION

	SELECT @designation = Designation
	FROM Employee WITH (NOLOCK)
	WHERE id = @EMP_ID

	IF NOT EXISTS (
			SELECT *
			FROM MTS_Appraisal_Employee_Mapping WITH (NOLOCK)
			WHERE [Description] = @DESCRIPTION
				AND Employee_Id = @EMP_ID
				AND Appraisal_Process_Period_Id = @PROCESS_DETAILS_ID
			)
	BEGIN
		INSERT INTO MTS_Appraisal_Employee_Mapping (
			[Employee_Id]
			,PerformanceTypeID
			,[Description]
			,[Weightage]
			,[Designation]
			,EmployeeWeightage
			,ManagerWeightage
			,ManagerId
			,EmployeeSubmitted_On
			,ManagerModified_On
			,FinalRating
			,RatingTablePeriod
			,Appraisal_Process_Period_Id
			,FinalEvaluatorWeightage
			,PERFORMANCE_RATING
			,POTENTIAL_RATING
			)
		VALUES (
			@EMP_ID
			,@Performance_TypeID
			,@DESCRIPTION
			,@WEIGHTAGE
			,@designation
			,NULL
			,NULL
			,NULL
			,NULL
			,NULL
			,NULL
			,0
			,@PROCESS_DETAILS_ID
			,NULL
			,NULL
			,NULL
			)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[ADD_APPRAISAL_EMPLOYEE_SUMMARY_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_APPRAISAL_EMPLOYEE_SUMMARY_DETAILS] (
	@EMP_ID BIGINT
	,@EMPLOYE_SUMMARY VARCHAR(MAX)
	,@EMPLOYEE_MAPPING_ID BIGINT
	,@STATUS BIGINT
	,@FEEDBACK_CATAGORY BIGINT
	,@MANAGER_ID BIGINT
	,@CREATED_DATE DATETIME
	,@APPRAISAL_PROCESS_ID BIGINT
	)
AS
BEGIN
	DECLARE @roleid BIGINT

	SELECT @roleid = ROLEID
	FROM MTS_AUTHORITY ma WITH (NOLOCK)
	WHERE ma.USERID = @EMP_ID

	IF (@MANAGER_ID = 0)
	BEGIN
		SELECT @MANAGER_ID = Manager_Id
		FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
		WHERE Employee_Id = @EMP_ID
			AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
	END

	IF (@STATUS = 1)
	BEGIN
		IF NOT EXISTS (
				SELECT *
				FROM MTS_APPRAISAL_EMPLOYEE_MANAGER_SUMMARY WITH (NOLOCK)
				WHERE Employee_Id = @EMP_ID
					AND Employee_Mapping_Id = @EMPLOYEE_MAPPING_ID
				)
		BEGIN
			INSERT INTO MTS_APPRAISAL_EMPLOYEE_MANAGER_SUMMARY (
				Employee_Id
				,Manager_Id
				,Self_Summary
				,Manager_Summary
				,Employee_Mapping_Id
				,Created_Date
				,FinalEvaluator_Id
				,FinalEvaluator_Summary
				)
			VALUES (
				@EMP_ID
				,@MANAGER_ID
				,@EMPLOYE_SUMMARY
				,NULL
				,@EMPLOYEE_MAPPING_ID
				,@CREATED_DATE
				,NULL
				,NULL
				)

			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET Staging = CASE 
					WHEN Manager_Id = 0
						THEN 2
					ELSE 1
					END
				,Self_Rating_Completion = getdate()
			WHERE Employee_Id = @EMP_ID
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID

			SELECT 1
		END
		ELSE
		BEGIN
			SELECT 0
		END
	END

	IF (@STATUS = 2)
	BEGIN
		UPDATE MTS_APPRAISAL_EMPLOYEE_MANAGER_SUMMARY
		SET Manager_Summary = @EMPLOYE_SUMMARY
			,Manager_Id = @MANAGER_ID
			,Created_Date = @CREATED_DATE
		WHERE Employee_Id = @EMP_ID
			AND Employee_Mapping_Id = @EMPLOYEE_MAPPING_ID

		UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
		SET Staging = @STATUS
			,FEEDBACK_CATEGORY = ISNULL(@FEEDBACK_CATAGORY, 0)
			,Evaluator_Rating_Completion = getdate()
		WHERE Employee_Id = @EMP_ID
			AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END

	IF (@STATUS = 3)
	BEGIN
		UPDATE MTS_APPRAISAL_EMPLOYEE_MANAGER_SUMMARY
		SET FinalEvaluator_Summary = @EMPLOYE_SUMMARY
			,FinalEvaluator_Id = @MANAGER_ID
			,Created_Date = @CREATED_DATE
		WHERE Employee_Id = @EMP_ID
			AND Employee_Mapping_Id = @EMPLOYEE_MAPPING_ID

		UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
		SET Staging = @STATUS
			,FEEDBACK_CATEGORY = ISNULL(@FEEDBACK_CATAGORY, 0)
			,Final_Rating_Completion = getdate()
		WHERE Employee_Id = @EMP_ID
			AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[ADD_APPRAISAL_MANAGERS_FEEDBACK_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ADD_APPRAISAL_MANAGERS_FEEDBACK_DETAILS] (
	@EMP_ID BIGINT
	,@MANAGER_ID BIGINT
	,@FEEDBACK VARCHAR(MAX)
	,@APPRAISAL_ID BIGINT
	)
AS
BEGIN
	IF EXISTS (
			SELECT *
			FROM MTS_APPRAISAL_MANAGERS_FEEDBACK WITH (NOLOCK)
			WHERE EMPLOYEE_ID = @EMP_ID
				AND POSTED_USER_ID = @MANAGER_ID
				AND FEEDBACK = @FEEDBACK
			)
	BEGIN
		SELECT 0
	END
	ELSE
	BEGIN
		INSERT INTO MTS_APPRAISAL_MANAGERS_FEEDBACK
		VALUES (
			@EMP_ID
			,@MANAGER_ID
			,@FEEDBACK
			,GETDATE()
			,@APPRAISAL_ID
			)

		SELECT 1
	END
END
GO

/****** Object:  StoredProcedure [dbo].[ADD_APPRAISAL_PROCESS_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_APPRAISAL_PROCESS_DETAILS] (
	@APPRAISAL_PERIOD VARCHAR(30)
	,@FROM_DATE DATE = NULL
	,@TO_DATE DATE = NULL
	,@UNTIL_DATE DATE = NULL
	,@EVALUATOR BIGINT
	,@MAX_RATING INT
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM MTS_APPRAISAL_PROCESS_DETAILS WITH (NOLOCK)
			WHERE Appraisal_Process_Period = @APPRAISAL_PERIOD
			)
	BEGIN
		DECLARE @Emp_Count BIGINT

		IF ISNULL(@UNTIL_DATE, '') <> ''
		BEGIN
			SELECT @Emp_Count = count(*)
			FROM Employee E WITH (NOLOCK)
			INNER JOIN MTS_LOGIN ML WITH (NOLOCK) ON E.id = ML.USERID
				AND E.id NOT IN (
					SELECT AER.Employee_Id
					FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE AER WITH (NOLOCK)
					LEFT JOIN MTS_APPRAISAL_PROCESS_DETAILS APD WITH (NOLOCK) ON APD.Id = AER.Appraisal_Process_Period_Id
					WHERE APD.Active IN (
							1
							,2
							)
					)
			WHERE Dateofjoin <= @UNTIL_DATE
				AND ML.ACTIVE = 1
		END
		ELSE
		BEGIN
			SELECT @Emp_Count = count(*)
			FROM Employee E WITH (NOLOCK)
			INNER JOIN MTS_LOGIN ML WITH (NOLOCK) ON E.id = ML.USERID
				AND E.id NOT IN (
					SELECT AER.Employee_Id
					FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE AER WITH (NOLOCK)
					LEFT JOIN MTS_APPRAISAL_PROCESS_DETAILS APD WITH (NOLOCK) ON APD.Id = AER.Appraisal_Process_Period_Id
					WHERE APD.Active IN (
							1
							,2
							)
					)
			WHERE Dateofjoin BETWEEN @FROM_DATE
					AND @TO_DATE
				AND ML.ACTIVE = 1
		END

		IF ISNULL(@Emp_Count, 0) > 0
		BEGIN
			INSERT INTO MTS_APPRAISAL_PROCESS_DETAILS (
				Appraisal_Process_Period
				,From_Date
				,To_Date
				,Until
				,Evaluator
				,Maximum_Rating
				,Active
				)
			VALUES (
				@APPRAISAL_PERIOD
				,@FROM_DATE
				,@TO_DATE
				,@UNTIL_DATE
				,@EVALUATOR
				,@MAX_RATING
				,1
				)

			SELECT 1

			DECLARE @PROCESS_DETAILS_ID BIGINT
				,@Emp_Designation BIGINT
				,@Designation_Mappingloyee_Id BIGINT
				,@Designation_Appraisal_Mapping_Count BIGINT

			SELECT @PROCESS_DETAILS_ID = Scope_Identity()

			DECLARE @empid BIGINT

			IF ISNULL(@UNTIL_DATE, '') <> ''
			BEGIN
				SELECT @empid = min(id)
				FROM Employee E WITH (NOLOCK)
				INNER JOIN MTS_LOGIN ML WITH (NOLOCK) ON E.id = ML.USERID
				WHERE Dateofjoin <= @UNTIL_DATE
					AND ML.ACTIVE = 1
			END
			ELSE
			BEGIN
				SELECT @empid = min(id)
				FROM Employee E WITH (NOLOCK)
				INNER JOIN MTS_LOGIN ML WITH (NOLOCK) ON E.id = ML.USERID
				WHERE Dateofjoin BETWEEN @FROM_DATE
						AND @TO_DATE
					AND ML.ACTIVE = 1
			END

			WHILE @empid IS NOT NULL
			BEGIN
				DECLARE @mgrCount BIGINT = 0
					,@mgrId BIGINT = 0
					,@Exising_Emp_appraisal BIGINT

				SELECT @mgrCount = Count(*)
				FROM Employee_Reporting_Managers WITH (NOLOCK)
				WHERE EmployeeId = @empid

				IF (@mgrCount = 1)
				BEGIN
					SELECT @mgrId = ManagerId
					FROM Employee_Reporting_Managers WITH (NOLOCK)
					WHERE EmployeeId = @empid
				END

				SELECT @Emp_Designation = ISNULL(FunctionalRole, 0)
				FROM Employee WITH (NOLOCK)
				WHERE id = @empid

				SELECT @Exising_Emp_appraisal = Count(*)
				FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE AER WITH (NOLOCK)
				INNER JOIN MTS_APPRAISAL_PROCESS_DETAILS APD WITH (NOLOCK) ON APD.Id = AER.Appraisal_Process_Period_Id
				WHERE Employee_Id = @empid
					AND APD.Active <> 3

				SELECT @Designation_Appraisal_Mapping_Count = COUNT(*)
				FROM MTS_Appraisal_Designation_Mapping WITH (NOLOCK)
				WHERE Designation = @Emp_Designation

				IF (
						@Designation_Appraisal_Mapping_Count >= 0
						AND @Exising_Emp_appraisal = 0
						)
				BEGIN
					DECLARE @MANAGER_COUNT INT, @MANAGER_ID BIGINT

					SELECT  @MANAGER_COUNT =Count(*) from Employee_Reporting_Managers where EmployeeId=@empid

					IF(@MANAGER_COUNT = 1)
					BEGIN
						SELECT  @MANAGER_ID = ManagerId from Employee_Reporting_Managers where EmployeeId=@empid
					END

					INSERT INTO MTS_APPRAISAL_EMPLOYEE_RATING_TABLE (
						Employee_Id
						,Appraisal_Process_Period_Id
						,Manager_Id
						,Staging
						,Final_Evaluator_Id
						,Self_KRA_Rating
						,Evaluator_KRA_Rating
						,Self_Skill_Rating
						,Evaluator_Skill_Rating
						,PERFORMANCE_RATING
						,POTENTIAL_RATING
						,Self_Rating_Completion
						,Evaluator_Rating_Completion
						,Final_Rating_Completion
						,FEEDBACK_CATEGORY
						)
					VALUES (
						@empid
						,@PROCESS_DETAILS_ID
						,@MANAGER_ID
						,NULL
						,@EVALUATOR
						,NULL
						,NULL
						,NULL
						,NULL
						,NULL
						,NULL
						,NULL
						,NULL
						,NULL
						,NULL
						)
				END

				SELECT @Designation_Mappingloyee_Id = min(id)
				FROM MTS_Appraisal_Designation_Mapping WITH (NOLOCK)
				WHERE Designation = @Emp_Designation

				WHILE @Designation_Mappingloyee_Id IS NOT NULL
				BEGIN
					DECLARE @Performance_TypeID BIGINT
						,@description BIGINT
						,@weightage FLOAT

					SELECT @Performance_TypeID = PerformanceTypeID
						,@description = Description
						,@weightage = Weightage
					FROM MTS_Appraisal_Designation_Mapping WITH (NOLOCK)
					WHERE id = @Designation_Mappingloyee_Id
						AND Designation = @Emp_Designation

					INSERT INTO MTS_Appraisal_Employee_Mapping (
						[Employee_Id]
						,PerformanceTypeID
						,[Description]
						,[Weightage]
						,[Designation]
						,EmployeeWeightage
						,ManagerWeightage
						,ManagerId
						,EmployeeSubmitted_On
						,ManagerModified_On
						,FinalRating
						,RatingTablePeriod
						,Appraisal_Process_Period_Id
						,FinalEvaluatorWeightage
						,PERFORMANCE_RATING
						,POTENTIAL_RATING
						)
					VALUES (
						@empid
						,@Performance_TypeID
						,@description
						,@weightage
						,@Emp_Designation
						,NULL
						,NULL
						,NULL
						,NULL
						,NULL
						,NULL
						,0
						,@PROCESS_DETAILS_ID
						,NULL
						,NULL
						,NULL
						)

					SELECT @Designation_Mappingloyee_Id = min(id)
					FROM MTS_Appraisal_Designation_Mapping WITH (NOLOCK)
					WHERE id > @Designation_Mappingloyee_Id
						AND Designation = @Emp_Designation
				END

				IF ISNULL(@UNTIL_DATE, '') <> ''
				BEGIN
					SELECT @empid = min(id)
					FROM Employee E WITH (NOLOCK)
					INNER JOIN MTS_LOGIN ML WITH (NOLOCK) ON E.id = ML.USERID
					WHERE Dateofjoin <= @UNTIL_DATE
						AND id > @empid
						AND ML.ACTIVE = 1
				END
				ELSE
				BEGIN
					SELECT @empid = min(id)
					FROM Employee E WITH (NOLOCK)
					INNER JOIN MTS_LOGIN ML WITH (NOLOCK) ON E.id = ML.USERID
					WHERE Dateofjoin BETWEEN @FROM_DATE
							AND @TO_DATE
						AND id > @empid
						AND ML.ACTIVE = 1
				END
			END
		END
		ELSE
		BEGIN
			SELECT 0
		END
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[ADD_EMPLOYEE_LEAVE_BALANCE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_EMPLOYEE_LEAVE_BALANCE] (
	@Employee_Id BIGINT
	,@Leavebalance BIGINT
	,@AdvanceCredit BIGINT
	,@AdvanceAvailed BIGINT
	,@LeaveType BIGINT
	)
AS
BEGIN
	DECLARE @YEAR INT = DATEPART(YEAR, GETDATE())

	IF NOT EXISTS (
			SELECT *
			FROM EmployeeLeaveBalance WITH (NOLOCK)
			WHERE Employee_Id = @Employee_Id
				AND LeaveType = @LeaveType
			)
	BEGIN
		INSERT INTO EmployeeLeaveBalance (
			Employee_Id
			,LeaveType
			,Leavebalance
			,AdvanceCredit
			,AdvanceAvailed
			,Year
			)
		VALUES (
			@Employee_Id
			,@LeaveType
			,@Leavebalance
			,@AdvanceCredit
			,@AdvanceAvailed
			,@YEAR
			)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[ADD_EMPLOYEE_LEAVE_DETAILS]    Script Date: 12/17/2020 4:16:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

  
CREATE PROCEDURE [dbo].[ADD_EMPLOYEE_LEAVE_DETAILS] @LEAVE_ID BIGINT  
 ,@APPLIED_LEAVE_TYPE BIGINT  
 ,@islop bit  
AS  
BEGIN  
 DECLARE @INCLUDE_HOLIDAY BIT,@FROM_DATE DATE ,@TO_DATE DATE ,@DATE DATE ,@LEAVE_FROM_SESSION INT, @LEAVE_TO_SESSION INT
  
 SELECT @FROM_DATE = EL.FromDate ,@TO_DATE = EL.ToDate  , @LEAVE_FROM_SESSION = LeaveFromSession, @LEAVE_TO_SESSION = LeaveToSession
 FROM Employee_Leave EL WITH (NOLOCK)  
 WHERE EL.id = @LEAVE_ID  
  
 SELECT @INCLUDE_HOLIDAY = HolidayAsLeave  
 FROM MTS_LeaveType MLT WITH (NOLOCK)  
 WHERE MLT.id = @APPLIED_LEAVE_TYPE  
  
 SET @DATE = @FROM_DATE  
  
 WHILE @DATE <= @TO_DATE  
 BEGIN  
  IF @INCLUDE_HOLIDAY = 1  
   OR (DATEPART(DW, @DATE) <> 1 AND DATEPART(DW, @DATE) <> 7  
    AND @DATE NOT IN ( SELECT DateOfHoliday  FROM HolidaysList WITH (NOLOCK) WHERE YearOfHoliday = DATEPART(YEAR, @DATE)))  
  BEGIN  
   INSERT INTO EMPLOYEE_LEAVE_DETAILS  
			([LeaveId]
           ,[Employee_Id]
           ,[LeaveType]
           ,[FromDate]
           ,[LeaveFromSession]
           ,[ToDate]
           ,[LeaveToSession]
           ,[Reason]
           ,[Approval]
           ,[ApprovedBy]
           ,[AppliedDate]
           ,[ApprovedDate]
           ,[Managerid]
           ,[CanceledBy]
           ,[CanceledDate]
           ,[Numberofdays]
           ,[Leavebalance]
           ,[isLOP]
           ,[AppliedLeaveType]
           ,[AdvanceCredit])
   SELECT @LEAVE_ID  
    ,Employee_Id  
    ,LeaveType  
    ,@DATE  
    ,CASE
     WHEN @DATE = @FROM_DATE AND ((@LEAVE_FROM_SESSION = 1 AND @FROM_DATE<>@TO_DATE) OR (@LEAVE_FROM_SESSION = 3))
      THEN @LEAVE_FROM_SESSION 
     WHEN @DATE = @TO_DATE AND @LEAVE_TO_SESSION = 2
      THEN @LEAVE_TO_SESSION
     ELSE 1  
     END  
    ,@DATE  
    ,CASE
     WHEN @DATE = @FROM_DATE AND ((@LEAVE_FROM_SESSION = 1 AND @FROM_DATE<>@TO_DATE) OR (@LEAVE_FROM_SESSION = 3))
      THEN @LEAVE_FROM_SESSION 
     WHEN @DATE = @TO_DATE AND @LEAVE_TO_SESSION = 2
      THEN @LEAVE_TO_SESSION
     ELSE 1  
     END  
    ,Reason  
    ,Approval  
    ,ApprovedBy  
    ,AppliedDate  
    ,ApprovedDate  
    ,Managerid  
    ,CanceledBy  
    ,CanceledDate  
    ,CASE  
     WHEN @FROM_DATE = @TO_DATE  
      AND LeaveFromSession <> 1  
      THEN 0.5  
     WHEN @DATE = @FROM_DATE  
      AND LeaveFromSession <> 1  
      THEN 0.5  
     WHEN @DATE = @TO_DATE  
      AND LeaveToSession <> 1  
      THEN 0.5  
     ELSE 1  
     END  
    ,NULL  
    ,@islop  
    ,@APPLIED_LEAVE_TYPE  
    ,NULL  
   FROM Employee_Leave WITH (NOLOCK)  
   WHERE id = @LEAVE_ID  
  END  
  
  SET @DATE = DATEADD(DAY, 1, @DATE)  
 END  
END 
GO

/****** Object:  StoredProcedure [dbo].[ADD_EMPLOYEE_LEAVE_DETAILS_ADJUSTMENT_LEAVE_AGAINST]    Script Date: 12/17/2020 4:17:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

  
CREATE PROCEDURE [dbo].[ADD_EMPLOYEE_LEAVE_DETAILS_ADJUSTMENT_LEAVE_AGAINST] (  
  @empid BIGINT  
  ,@leaveCode VARCHAR(255)  
  ,@leaveName VARCHAR(255)  
  ,@leaveTypeId BIGINT  
  ,@appliedLeaveTypeID BIGINT  
  ,@availableLeaveCount FLOAT  
  ,@isLOP BIT  
  ,@fromSession BIGINT  
  ,@toSession BIGINT  
  ,@LeaveID BIGINT  
  ,@fromDate DATE  
  ,@toDate DATE)  
AS  
BEGIN  
 DECLARE @INCLUDE_HOLIDAY BIT  
  ,@FROM_DATE DATE  
  ,@TO_DATE DATE  
  ,@DATE DATE  
  
 SET @FROM_DATE = @fromDate  
 SET @TO_DATE = @toDate  
  
 SELECT @INCLUDE_HOLIDAY = HolidayAsLeave  
 FROM MTS_LeaveType MLT WITH (NOLOCK)  
 WHERE MLT.id = @appliedLeaveTypeID  
  
 SET @DATE = @FROM_DATE  
 WHILE @DATE <= @TO_DATE  
 BEGIN  
   IF @INCLUDE_HOLIDAY = 1  
   OR (  
    DATEPART(DW, @DATE) <> 1  
    AND DATEPART(DW, @DATE) <> 7  
    AND @DATE NOT IN (  
     SELECT DateOfHoliday  
     FROM HolidaysList WITH (NOLOCK)  
     WHERE YearOfHoliday = DATEPART(YEAR, @DATE)  
     )  
    )  
  BEGIN  
    
   IF(@fromSession = 1)  
   BEGIN  
    SET @fromSession = 2  
   END  
   IF(@toSession = 1)  
   BEGIN  
    SET @toSession = 3  
   END  
  
   INSERT INTO EMPLOYEE_LEAVE_DETAILS   
			([LeaveId]
           ,[Employee_Id]
           ,[LeaveType]
           ,[FromDate]
           ,[LeaveFromSession]
           ,[ToDate]
           ,[LeaveToSession]
           ,[Reason]
           ,[Approval]
           ,[ApprovedBy]
           ,[AppliedDate]
           ,[ApprovedDate]
           ,[Managerid]
           ,[CanceledBy]
           ,[CanceledDate]
           ,[Numberofdays]
           ,[Leavebalance]
           ,[isLOP]
           ,[AppliedLeaveType]
           ,[AdvanceCredit])
   SELECT @LeaveID  
    ,Employee_Id  
    ,@leaveTypeId  
    ,@DATE  
    ,CASE   
     WHEN (@FROM_DATE = @TO_DATE OR  @DATE = @FROM_DATE) AND @fromSession <> 1   
      THEN @fromSession  
     WHEN @DATE = @TO_DATE AND @toSession = 3  
      THEN 2  
     WHEN @DATE = @TO_DATE AND @toSession <> 1  
      THEN @toSession  
     ELSE 2  
     END  
    ,@DATE  
    ,CASE   
     WHEN @FROM_DATE = @TO_DATE AND @fromSession = 2 AND @toSession = 3  
      THEN @toSession  
     WHEN @FROM_DATE = @TO_DATE AND @fromSession = 2  
      THEN 2  
     WHEN (@FROM_DATE <> @TO_DATE AND @TO_DATE = @DATE AND @fromSession = 2)  
      THEN 2  
     WHEN (@FROM_DATE = @TO_DATE OR @FROM_DATE = @DATE) AND @fromSession = 2  
      THEN 3  
     WHEN (@FROM_DATE = @TO_DATE OR @DATE = @TO_DATE) AND @toSession <> 1  
      THEN @toSession  
     WHEN @DATE = @FROM_DATE AND @fromSession <> 1   
      THEN @fromSession  
     ELSE 3  
     END  
    ,Reason  
    ,Approval  
    ,ApprovedBy  
    ,AppliedDate  
    ,ApprovedDate  
    ,Managerid  
    ,CanceledBy  
    ,CanceledDate  
    ,CASE   
     WHEN @FROM_DATE = @TO_DATE  AND @fromSession = 2 AND @toSession = 2  
      THEN 0.5  
     WHEN @FROM_DATE = @TO_DATE  AND @fromSession = 3 AND @toSession = 2  
      THEN 1.0  
     WHEN (@FROM_DATE = @TO_DATE OR @FROM_DATE = @DATE)  
      AND @fromSession = 2  
      THEN 1.0  
     WHEN (@FROM_DATE = @TO_DATE OR @FROM_DATE = @DATE)  
      AND @fromSession = 3  
      THEN 0.5  
     WHEN (@FROM_DATE <> @TO_DATE AND  @TO_DATE = @DATE AND @fromSession = 2 AND @toSession = 2)  
      THEN 0.5 
     WHEN (@FROM_DATE <> @TO_DATE AND  @TO_DATE = @DATE)  
      AND @toSession = 2  
      THEN 0.5  
     WHEN (@FROM_DATE <> @TO_DATE AND  @TO_DATE = @DATE)  
      AND @toSession = 2  
      THEN 1.0  
     WHEN (@FROM_DATE = @TO_DATE OR  @TO_DATE = @DATE)  
      AND (@fromSession = 2 AND @toSession = 2 ) OR (@fromSession = 3 AND @toSession = 3 )  
      THEN 1.0  
     ELSE 1  
     END  
    ,NULL  
    ,@isLOP  
    ,@appliedLeaveTypeID  
    ,NULL  
   FROM Employee_Leave WITH (NOLOCK)  
   WHERE id = @LeaveID  
  END  
  
  SET @DATE = DATEADD(DAY, 1, @DATE)  
  SELECT 1  
 END  
  
END  
GO

/****** Object:  StoredProcedure [dbo].[ADD_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL] (
	@EMP_ID BIGINT
	,@TYPE BIGINT
	,@DESCRIPTION VARCHAR(20)
	,@AMOUNT DECIMAL
	,@EFFECTIVE_MONTH DATE
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM MTS_PAYROLL_EMPLOYEE_MONTHLY_VARIANCE WITH (NOLOCK)
			WHERE EMP_ID = @EMP_ID
				AND [TYPE] = @TYPE
				AND [DESCRIPTION] = @DESCRIPTION
				AND EFFECTIVE_MONTH = @EFFECTIVE_MONTH
			)
	BEGIN
		INSERT INTO MTS_PAYROLL_EMPLOYEE_MONTHLY_VARIANCE (
			EMP_ID
			,[TYPE]
			,[DESCRIPTION]
			,AMOUNT
			,EFFECTIVE_MONTH
			)
		VALUES (
			@EMP_ID
			,@TYPE
			,@DESCRIPTION
			,@AMOUNT
			,@EFFECTIVE_MONTH
			)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[ADD_EMPLOYEE_PAYROLL_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_EMPLOYEE_PAYROLL_DETAILS] (
	@EMP_ID BIGINT
	,@BASIC_PAY FLOAT
	,@HOUSE_RENT_ALLOWANCE FLOAT
	,@SPECIAL_ALLOWANCE FLOAT
	,@MEDICAL_ALLOWANCE FLOAT
	,@CONVEYANCE FLOAT
	,@FOOD_ALLOWANCE FLOAT
	,@MONTHLY_GROSS FLOAT
	,@PF_AMOUNT FLOAT
	,@PROFESSIONAL_TAX FLOAT
	,@ESI_AMOUNT FLOAT
	,@SUDEXO_PASS FLOAT
	,@OTHERS FLOAT
	,@TOTAL_DEDUCTION_AMOUNT FLOAT
	,@NET_SALARY FLOAT
	,@EFFECTIVE_SINCE DATE
	,@IS_PF_RESTRICTION_APPLICABLE BIT
	,@PAYROLL_ID BIGINT
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM MTS_PAYROLL_EMPLOYEE_EARNINGS WITH (NOLOCK)
			WHERE EMP_ID = @EMP_ID
			)
	BEGIN
		INSERT INTO MTS_PAYROLL_EMPLOYEE_EARNINGS (
			EMP_ID
			,BASIC_PAY
			,HOUSE_RENT_ALLOWANCE
			,SPECIAL_ALLOWANCE
			,MEDICAL_ALLOWANCE
			,CONVEYANCE
			,FOOD_ALLOWANCE
			,MONTHLY_GROSS
			,OTHERS_EARNINGS
			,EFFECTIVE_SINCE
			,EFFECTIVE_TO
			,ACTIVE
			,REVISED
			,IS_APPROVED
			)
		VALUES (
			@EMP_ID
			,@BASIC_PAY
			,@HOUSE_RENT_ALLOWANCE
			,@SPECIAL_ALLOWANCE
			,@MEDICAL_ALLOWANCE
			,@CONVEYANCE
			,@FOOD_ALLOWANCE
			,@MONTHLY_GROSS
			,@OTHERS
			,@EFFECTIVE_SINCE
			,NULL
			,0
			,0
			,0
			)

		SELECT 1
	END
	ELSE IF EXISTS (
			SELECT TOP 1 *
			FROM MTS_PAYROLL_EMPLOYEE_EARNINGS WITH (NOLOCK)
			WHERE EMP_ID = @EMP_ID
				AND REVISED = 1
			ORDER BY ID DESC
			)
	BEGIN
		INSERT INTO MTS_PAYROLL_EMPLOYEE_EARNINGS (
			EMP_ID
			,BASIC_PAY
			,HOUSE_RENT_ALLOWANCE
			,SPECIAL_ALLOWANCE
			,MEDICAL_ALLOWANCE
			,CONVEYANCE
			,FOOD_ALLOWANCE
			,MONTHLY_GROSS
			,OTHERS_EARNINGS
			,EFFECTIVE_SINCE
			,EFFECTIVE_TO
			,ACTIVE
			,REVISED
			,IS_APPROVED
			)
		VALUES (
			@EMP_ID
			,@BASIC_PAY
			,@HOUSE_RENT_ALLOWANCE
			,@SPECIAL_ALLOWANCE
			,@MEDICAL_ALLOWANCE
			,@CONVEYANCE
			,@FOOD_ALLOWANCE
			,@MONTHLY_GROSS
			,@OTHERS
			,@EFFECTIVE_SINCE
			,NULL
			,0
			,0
			,0
			)

		SELECT 2
	END
	ELSE
	BEGIN
		UPDATE MTS_PAYROLL_EMPLOYEE_EARNINGS
		SET BASIC_PAY = @BASIC_PAY
			,HOUSE_RENT_ALLOWANCE = @HOUSE_RENT_ALLOWANCE
			,SPECIAL_ALLOWANCE = @SPECIAL_ALLOWANCE
			,CONVEYANCE = @CONVEYANCE
			,FOOD_ALLOWANCE = @FOOD_ALLOWANCE
			,MONTHLY_GROSS = @MONTHLY_GROSS
			,OTHERS_EARNINGS = @OTHERS
			,EFFECTIVE_SINCE = @EFFECTIVE_SINCE
		WHERE EMP_ID = @EMP_ID
			AND ID = @PAYROLL_ID

		SELECT 1
	END

	--	PAYROLL DEDUCTIONS
	IF NOT EXISTS (
			SELECT *
			FROM MTS_PAYROLL_EMPLOYEE_DEDUCTIONS WITH (NOLOCK)
			WHERE EMP_ID = @EMP_ID
			)
	BEGIN
		INSERT INTO MTS_PAYROLL_EMPLOYEE_DEDUCTIONS (
			EMP_ID
			,PF_AMOUNT
			,PROFESSIONAL_TAX
			,ESI_AMOUNT
			,SUDEXO_PASS
			,OTHERS_DEDUCTIONS
			,EFFECTIVE_SINCE
			,EFFECTIVE_TO
			,ACTIVE
			,REVISED
			,IS_APPROVED
			)
		VALUES (
			@EMP_ID
			,@PF_AMOUNT
			,@PROFESSIONAL_TAX
			,@ESI_AMOUNT
			,@SUDEXO_PASS
			,@OTHERS
			,@EFFECTIVE_SINCE
			,NULL
			,0
			,0
			,0
			)

		SELECT 1
	END
	ELSE IF EXISTS (
			SELECT TOP 1 *
			FROM MTS_PAYROLL_EMPLOYEE_DEDUCTIONS WITH (NOLOCK)
			WHERE EMP_ID = @EMP_ID
				AND REVISED = 1
			ORDER BY ID DESC
			)
	BEGIN
		INSERT INTO MTS_PAYROLL_EMPLOYEE_DEDUCTIONS (
			EMP_ID
			,PF_AMOUNT
			,PROFESSIONAL_TAX
			,ESI_AMOUNT
			,SUDEXO_PASS
			,OTHERS_DEDUCTIONS
			,EFFECTIVE_SINCE
			,EFFECTIVE_TO
			,ACTIVE
			,REVISED
			,IS_APPROVED
			)
		VALUES (
			@EMP_ID
			,@PF_AMOUNT
			,@PROFESSIONAL_TAX
			,@ESI_AMOUNT
			,@SUDEXO_PASS
			,@OTHERS
			,@EFFECTIVE_SINCE
			,NULL
			,0
			,0
			,0
			)

		SELECT 2
	END
	ELSE
	BEGIN
		UPDATE MTS_PAYROLL_EMPLOYEE_DEDUCTIONS
		SET PF_AMOUNT = @PF_AMOUNT
			,PROFESSIONAL_TAX = @PROFESSIONAL_TAX
			,ESI_AMOUNT = @ESI_AMOUNT
			,SUDEXO_PASS = @SUDEXO_PASS
			,OTHERS_DEDUCTIONS = @OTHERS
			,EFFECTIVE_SINCE = @EFFECTIVE_SINCE
		WHERE EMP_ID = @EMP_ID
			AND ID = @PAYROLL_ID

		SELECT 1
	END

	BEGIN
		UPDATE Employee
		SET [IS_PF_RESTRICTION_APPLICABLE] = @IS_PF_RESTRICTION_APPLICABLE
		WHERE id = @EMP_ID
	END
END
GO

/****** Object:  StoredProcedure [dbo].[ADD_KRA_SKILL_WEIGHTAGE_VALUE_SELF_APPRAISAL]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ADD_KRA_SKILL_WEIGHTAGE_VALUE_SELF_APPRAISAL] (
	@ID BIGINT
	,@VALUE FLOAT
	,@STATUS BIGINT
	,@TabName VARCHAR(20)
	,@FinalRating FLOAT
	,@employee_id BIGINT
	,@APPRAISAL_PROCESS_ID BIGINT
	)
AS
BEGIN
	DECLARE @Performance_Rating BIGINT
	DECLARE @Potential_Rating BIGINT
	DECLARE @Overall_Rating BIGINT
	DECLARE @submit_time DATETIME

	IF (@STATUS = 1)
	BEGIN
		SELECT @submit_time = isnull(Self_Rating_Completion, 0)
		FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
		WHERE Employee_Id = @employee_id
			AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
	END

	IF (@STATUS = 2)
	BEGIN
		SELECT @submit_time = isnull(Evaluator_Rating_Completion, 0)
		FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
		WHERE Employee_Id = @employee_id
			AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
	END

	IF (@STATUS = 3)
	BEGIN
		SELECT @submit_time = isnull(Final_Rating_Completion, 0)
		FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
		WHERE Employee_Id = @employee_id
			AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
	END

	IF (
			@STATUS = 1
			AND @submit_time = 0
			)
	BEGIN
		UPDATE MTS_Appraisal_Employee_Mapping
		SET EmployeeWeightage = @VALUE
		WHERE Id = @ID

		IF (@TabName = 'KRA')
		BEGIN
			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET Self_KRA_Rating = convert(DECIMAL(10, 2), @FinalRating)
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID

			SELECT @Performance_Rating = ID
			FROM MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION WITH (NOLOCK)
			WHERE TYPEID = 1
				AND @FinalRating BETWEEN RANGE_FROM
					AND RANGE_TO

			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET PERFORMANCE_RATING = @Performance_Rating
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID

			SELECT @Overall_Rating = OPPR.ID
			FROM MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK)
			WHERE PERFORMANCE_ID = (
					SELECT PERFORMANCE_RATING
					FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
					WHERE Employee_id = @employee_id
						AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
					)
				AND POTENTIAL_ID = (
					SELECT POTENTIAL_RATING
					FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
					WHERE Employee_id = @employee_id
						AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
					)

			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET OVERALL_RATING = ISNULL(@Overall_Rating, NULL)
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
		END

		IF (@TabName = 'Skills')
		BEGIN
			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET Self_Skill_Rating = convert(DECIMAL(10, 2), @FinalRating)
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID

			SELECT @Potential_Rating = ID
			FROM MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION WITH (NOLOCK)
			WHERE TYPEID = 2
				AND @FinalRating BETWEEN RANGE_FROM
					AND RANGE_TO

			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET POTENTIAL_RATING = @Potential_Rating
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID

			SELECT @Overall_Rating = OPPR.ID
			FROM MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK)
			WHERE PERFORMANCE_ID = (
					SELECT PERFORMANCE_RATING
					FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
					WHERE Employee_id = @employee_id
						AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
					)
				AND POTENTIAL_ID = (
					SELECT POTENTIAL_RATING
					FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
					WHERE Employee_id = @employee_id
						AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
					)

			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET OVERALL_RATING = ISNULL(@Overall_Rating, NULL)
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
		END
	END

	IF (
			@STATUS = 2
			AND @submit_time = 0
			)
	BEGIN
		UPDATE MTS_Appraisal_Employee_Mapping
		SET ManagerWeightage = @VALUE
		WHERE Id = @ID

		IF (@TabName = 'KRA')
		BEGIN
			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET Evaluator_KRA_Rating = convert(DECIMAL(10, 2), @FinalRating)
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID

			SELECT @Performance_Rating = ID
			FROM MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION WITH (NOLOCK)
			WHERE TYPEID = 1
				AND @FinalRating BETWEEN RANGE_FROM
					AND RANGE_TO

			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET PERFORMANCE_RATING = @Performance_Rating
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID

			SELECT @Overall_Rating = OPPR.ID
			FROM MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK)
			WHERE PERFORMANCE_ID = (
					SELECT PERFORMANCE_RATING
					FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
					WHERE Employee_id = @employee_id
						AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
					)
				AND POTENTIAL_ID = (
					SELECT POTENTIAL_RATING
					FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
					WHERE Employee_id = @employee_id
						AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
					)

			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET OVERALL_RATING = ISNULL(@Overall_Rating, NULL)
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
		END

		IF (@TabName = 'Skills')
		BEGIN
			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET Evaluator_Skill_Rating = convert(DECIMAL(10, 2), @FinalRating)
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID

			SELECT @Potential_Rating = ID
			FROM MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION WITH (NOLOCK)
			WHERE TYPEID = 2
				AND @FinalRating BETWEEN RANGE_FROM
					AND RANGE_TO

			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET POTENTIAL_RATING = @Potential_Rating
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID

			SELECT @Overall_Rating = OPPR.ID
			FROM MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK)
			WHERE PERFORMANCE_ID = (
					SELECT PERFORMANCE_RATING
					FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
					WHERE Employee_id = @employee_id
						AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
					)
				AND POTENTIAL_ID = (
					SELECT POTENTIAL_RATING
					FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
					WHERE Employee_id = @employee_id
						AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
					)

			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET OVERALL_RATING = ISNULL(@Overall_Rating, NULL)
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
		END
	END

	IF (
			@STATUS = 3
			AND @submit_time = 0
			)
	BEGIN
		UPDATE MTS_Appraisal_Employee_Mapping
		SET FinalEvaluatorWeightage = @VALUE
		WHERE Id = @ID

		IF (@TabName = 'KRA')
		BEGIN
			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET Final_Evaluator_KRA_Rating = convert(DECIMAL(10, 2), @FinalRating)
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID

			SELECT @Performance_Rating = ID
			FROM MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION WITH (NOLOCK)
			WHERE TYPEID = 1
				AND @FinalRating BETWEEN RANGE_FROM
					AND RANGE_TO

			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET PERFORMANCE_RATING = @Performance_Rating
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID

			SELECT @Overall_Rating = OPPR.ID
			FROM MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK)
			WHERE PERFORMANCE_ID = (
					SELECT PERFORMANCE_RATING
					FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
					WHERE Employee_id = @employee_id
						AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
					)
				AND POTENTIAL_ID = (
					SELECT POTENTIAL_RATING
					FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
					WHERE Employee_id = @employee_id
						AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
					)

			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET OVERALL_RATING = ISNULL(@Overall_Rating, NULL)
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
		END

		IF (@TabName = 'Skills')
		BEGIN
			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET Final_Evaluator_Skill_Rating = convert(DECIMAL(10, 2), @FinalRating)
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID

			SELECT @Potential_Rating = ID
			FROM MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION WITH (NOLOCK)
			WHERE TYPEID = 2
				AND @FinalRating BETWEEN RANGE_FROM
					AND RANGE_TO

			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET POTENTIAL_RATING = @Potential_Rating
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID

			SELECT @Overall_Rating = OPPR.ID
			FROM MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK)
			WHERE PERFORMANCE_ID = (
					SELECT PERFORMANCE_RATING
					FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
					WHERE Employee_id = @employee_id
						AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
					)
				AND POTENTIAL_ID = (
					SELECT POTENTIAL_RATING
					FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
					WHERE Employee_id = @employee_id
						AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
					)

			UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
			SET OVERALL_RATING = ISNULL(@Overall_Rating, NULL)
			WHERE Employee_id = @employee_id
				AND Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[ADD_LEAVE_POLICY]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ADD_LEAVE_POLICY] (
	@LEAVETYPE VARCHAR(50)
	,@LEAVECODE VARCHAR(5)
	,@ASSIGNEDAFTER BIGINT
	,@APPLICABLEFOR BIGINT
	,@MARITALSTATUS BIGINT
	,@ACCURAL BIT
	,@MAXALLOWEDBALANCE BIGINT
	,@CONSECUTIVELEAVES BIGINT
	,@ADJUSTMENTLEAVE VARCHAR(150)
	,@LEAVE_CANNOT_TAKETOGETHER VARCHAR(150)
	,@ENABLEUPLOADFOREXCEEDEDDAYS BIGINT
	,@PRO_RATA BIGINT
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT LEAVE_CODE
			FROM MTS_LeavePolicy WITH (NOLOCK)
			WHERE LEAVE_CODE = @LEAVECODE
			)
	BEGIN
		INSERT INTO MTS_LeavePolicy (
			LEAVE_TYPE
			,LEAVE_CODE
			,ASSIGNED_AFTER
			,APPLICABLE_FOR
			,MARITAL_STATUS
			,ACCURAL
			,MAX_ALLOWED_BALANCE
			,CONSECUTIVE_LEAVES
			,ADJUSTMENT_LEAVE_AGAINST
			,LEAVE_CANNOT_TAKE_TOGETHER
			,ENABLE_UPLOAD_DOC_FOR_EXCEEDED_DAYS
			,PRORATA
			)
		VALUES (
			@LEAVETYPE
			,@LEAVECODE
			,@ASSIGNEDAFTER
			,@APPLICABLEFOR
			,@MARITALSTATUS
			,@ACCURAL
			,@MAXALLOWEDBALANCE
			,@CONSECUTIVELEAVES
			,@ADJUSTMENTLEAVE
			,@LEAVE_CANNOT_TAKETOGETHER
			,@ENABLEUPLOADFOREXCEEDEDDAYS
			,@PRO_RATA
			)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[ADD_OR_IGNORE_EMPLOYEE_LOP_DAYS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ADD_OR_IGNORE_EMPLOYEE_LOP_DAYS] @EMPLOYEE_ID BIGINT
	,@MONTH VARCHAR(2)
	,@YEAR VARCHAR(4)
	,@LEAVE_FROM DATE
	,@LEAVE_TO DATE
	,@LOP_DAYS FLOAT
	,@REASON VARCHAR(255)
	,@AUTO_LOP BIT
	,@ADD_OR_IGNORE_FLAG BIGINT
	,@USER_ID BIGINT
AS
BEGIN
	DECLARE @ID BIGINT

	IF @ADD_OR_IGNORE_FLAG = 1
	BEGIN
		--INSERT MANUAL LOP DAYS
		IF NOT EXISTS (
				SELECT 1
				FROM MTS_PAYROLL_EMPLOYEE_LOP WITH (NOLOCK)
				WHERE EMP_ID = @EMPLOYEE_ID
					AND (
						LEAVE_FROM BETWEEN @LEAVE_FROM
							AND @LEAVE_TO
						OR LEAVE_TO BETWEEN @LEAVE_FROM
							AND @LEAVE_TO
						OR @LEAVE_FROM BETWEEN LEAVE_FROM
							AND LEAVE_TO
						OR @LEAVE_TO BETWEEN LEAVE_FROM
							AND LEAVE_TO
						)
					AND AUTO_LOP = 0
				)
			AND NOT EXISTS (
				SELECT 1
				FROM EMPLOYEE_LEAVE_DETAILS WITH (NOLOCK)
				WHERE Employee_Id = @EMPLOYEE_ID
					AND (
						FromDate BETWEEN @LEAVE_FROM
							AND @LEAVE_TO
						OR ToDate BETWEEN @LEAVE_FROM
							AND @LEAVE_TO
						OR @LEAVE_FROM BETWEEN FromDate
							AND ToDate
						OR @LEAVE_TO BETWEEN FromDate
							AND ToDate
						)
					AND isLOP = 1
					AND Approval = 2
				)
		BEGIN
			INSERT INTO MTS_PAYROLL_EMPLOYEE_LOP (
				EMP_ID
				,PAYROLL_MONTH
				,LEAVE_FROM
				,LEAVE_TO
				,LOP_DAYS
				,REASON
				,AUTO_LOP
				,[STATUS]
				)
			VALUES (
				@EMPLOYEE_ID
				,EOMONTH(CAST(@YEAR + @MONTH + '01' AS DATE))
				,@LEAVE_FROM
				,@LEAVE_TO
				,@LOP_DAYS
				,@REASON
				,0
				,1
				)

			SELECT @ID = @@IDENTITY

			EXEC MTS_PAYROLL_AUDIT 2
				,@ID
				,@USER_ID

			SELECT 1
		END
		ELSE
		BEGIN
			SELECT 2
		END
	END
	ELSE IF @ADD_OR_IGNORE_FLAG = 2
	BEGIN
		SELECT TOP 1 @ID = ID
		FROM MTS_PAYROLL_EMPLOYEE_LOP WITH (NOLOCK)
		WHERE EMP_ID = @EMPLOYEE_ID
			AND LEAVE_FROM = @LEAVE_FROM
			AND LEAVE_TO = @LEAVE_TO
			AND LOP_DAYS = @LOP_DAYS
			AND AUTO_LOP = 0
			AND DATEPART(MONTH, PAYROLL_MONTH) = @MONTH
			AND DATEPART(YEAR, PAYROLL_MONTH) = @YEAR

		EXEC MTS_PAYROLL_AUDIT 2
			,@ID
			,@USER_ID

		--DELETE MANUAL LOP DAY(IGNORE)
		DELETE
		FROM MTS_PAYROLL_EMPLOYEE_LOP
		WHERE EMP_ID = @EMPLOYEE_ID
			AND LEAVE_FROM = @LEAVE_FROM
			AND LEAVE_TO = @LEAVE_TO
			AND LOP_DAYS = @LOP_DAYS
			AND AUTO_LOP = 0
			AND DATEPART(MONTH, PAYROLL_MONTH) = @MONTH
			AND DATEPART(YEAR, PAYROLL_MONTH) = @YEAR

		SELECT 1
	END
	ELSE IF @ADD_OR_IGNORE_FLAG = 3
	BEGIN
		--IGNORE AUTO LOP DAYS(INSERT NEGATIVE LOP DAY TO TALLY)
		INSERT INTO MTS_PAYROLL_EMPLOYEE_LOP (
			EMP_ID
			,PAYROLL_MONTH
			,LEAVE_FROM
			,LEAVE_TO
			,LOP_DAYS
			,REASON
			,AUTO_LOP
			,[STATUS]
			)
		VALUES (
			@EMPLOYEE_ID
			,EOMONTH(CAST(@YEAR + @MONTH + '01' AS DATE))
			,@LEAVE_FROM
			,@LEAVE_TO
			,- 1 * @LOP_DAYS
			,@REASON
			,1
			,1
			)

		SELECT @ID = @@IDENTITY

		EXEC MTS_PAYROLL_AUDIT 2
			,@ID
			,@USER_ID

		SELECT 1
	END
	ELSE IF @ADD_OR_IGNORE_FLAG = 4
	BEGIN
		SELECT TOP 1 @ID = ID
		FROM MTS_PAYROLL_EMPLOYEE_LOP WITH (NOLOCK)
		WHERE EMP_ID = @EMPLOYEE_ID
			AND LEAVE_FROM = @LEAVE_FROM
			AND LEAVE_TO = @LEAVE_TO
			AND LOP_DAYS = @LOP_DAYS
			AND AUTO_LOP = 1
			AND DATEPART(MONTH, PAYROLL_MONTH) = @MONTH
			AND DATEPART(YEAR, PAYROLL_MONTH) = @YEAR

		EXEC MTS_PAYROLL_AUDIT 2
			,@ID
			,@USER_ID

		--ADD THE IGNORED AUTO LOP DAYS(DELETE THE NEGATIVE LOP DAYS)
		DELETE
		FROM MTS_PAYROLL_EMPLOYEE_LOP
		WHERE EMP_ID = @EMPLOYEE_ID
			AND LEAVE_FROM = @LEAVE_FROM
			AND LEAVE_TO = @LEAVE_TO
			AND LOP_DAYS = @LOP_DAYS
			AND AUTO_LOP = 1
			AND DATEPART(MONTH, PAYROLL_MONTH) = @MONTH
			AND DATEPART(YEAR, PAYROLL_MONTH) = @YEAR

		SELECT 1
	END
END
GO

/****** Object:  StoredProcedure [dbo].[ALLEMPLOYEESINPAYSLIPTABLE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ALLEMPLOYEESINPAYSLIPTABLE] (
	@year BIGINT
	,@month VARCHAR(255)
	)
AS
BEGIN
	SELECT D.Designation
		,md.Department
		,format(Dateofjoin, 'dd/MMM/yyyy') Dateofjoin
		,E.Pancard
		,ISNULL(E.PF_AccountNumber, 'Nil') AS PF_AccountNumber
		,ISNULL(E.PF_UAN, 0) AS PF_UAN
		,ISNULL(E.ESI_Number, 0) AS ESI_Number
		,ISNULL(EB.Bankname, 'Nil') Bankname
		,ISNULL(EB.Accountnumber, 0) Accountnumber
		,EP.Emp_No
		,E.Firstname + ' ' + E.Lastname AS Employee_Name
		,EP.Month
		,EP.Year
		,EP.HRA
		,Ep.Basic
		,ISNULL(EP.Income_Tax, 0) Income_Tax
		,EP.Paid_Days
		,EP.PF
		,ISNULL(EP.Prof_Dev, 0) Prof_Dev
		,EP.Special_Allowance
		,Ep.Medical_Allowance
		,Ep.Conveyance
		,ISNULL(Ep.Food_Allowance, 0) Food_Allowance
		,ISNULL(Ep.Communication_Allowance, 0) Communication_Allowance
		,ISNULL(Ep.Petrol_Allowance, 0) Petrol_Allowance
		,ISNULL(Ep.Driver_Allowance, 0) Driver_Allowance
		,ISNULL(Ep.Education_Allowance, 0) Education_Allowance
		,Ep.Gross_Earnings
		,Ep.Professional_Tax
		,ISNULL(Ep.Meal_Pass, 0) Meal_Pass
		,Ep.ESI
		,ISNULL(Ep.Others, 0) Others
		,Ep.Total_Deduction
		,Ep.Net_Salary
		,Ep.Reimbursement
	FROM Employee_Payslip EP WITH (NOLOCK)
	FULL OUTER JOIN Employee E WITH (NOLOCK) ON EP.Emp_No = E.Employee_Id
	FULL OUTER JOIN Employee_BankDetails EB WITH (NOLOCK) ON E.id = EB.Employee_Id
	FULL OUTER JOIN MTS_Designation D WITH (NOLOCK) ON D.id = E.Designation
	FULL OUTER JOIN MTS_Department md WITH (NOLOCK) ON md.id = E.DepartmentId
	WHERE EP.Month = @month
		AND EP.Year = @year
END
GO

/****** Object:  StoredProcedure [dbo].[ASSIGN_EMPLOYEE_REPORTING_MANAGER]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ASSIGN_EMPLOYEE_REPORTING_MANAGER] @EmployeeId BIGINT
	,@ManagerId BIGINT
	,@Active BIGINT
AS
BEGIN
	IF EXISTS (
			SELECT *
			FROM Employee_Reporting_Managers WITH (NOLOCK)
			WHERE EmployeeId = @EmployeeId
				AND ManagerId = @ManagerId
			)
		AND @Active = 0
	BEGIN
		DELETE
		FROM Employee_Reporting_Managers
		WHERE EmployeeId = @EmployeeId
			AND ManagerId = @ManagerId
	END

	IF NOT EXISTS (
			SELECT *
			FROM Employee_Reporting_Managers WITH (NOLOCK)
			WHERE EmployeeId = @EmployeeId
				AND ManagerId = @ManagerId
			)
		AND @Active = 1
	BEGIN
		INSERT INTO Employee_Reporting_Managers
		VALUES (
			@EmployeeId
			,@ManagerId
			)
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CHECK_PAYROLL_CLOSE_MONTH]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CHECK_PAYROLL_CLOSE_MONTH] (
	@MONTH VARCHAR(2)
	,@YEAR VARCHAR(4)
	,@FLAG BIGINT
	)
AS
BEGIN
	IF @FLAG = 0
	BEGIN
		IF NOT EXISTS (
				SELECT 1
				FROM MTS_PAYROLL_CLOSING_PERIOD WITH (NOLOCK)
				WHERE MONTH(PAYROLL_MONTH) = @MONTH
					AND YEAR(PAYROLL_MONTH) = @YEAR
					AND CLOSED_STATUS = 1
				)
		BEGIN
			SELECT 0
		END
		ELSE
		BEGIN
			SELECT 1
		END
	END

	IF @FLAG = 1
	BEGIN
		DECLARE @PREVDATE DATE = (
				SELECT EOMONTH(DATEADD(MONTH, - 1, CAST(@MONTH + '-01-' + @YEAR AS DATE)))
				)

		IF NOT EXISTS (
				SELECT 1
				FROM MTS_PAYROLL_CLOSING_PERIOD WITH (NOLOCK)
				WHERE MONTH(PAYROLL_MONTH) = MONTH(@PREVDATE)
					AND YEAR(PAYROLL_MONTH) = YEAR(@PREVDATE)
					AND CLOSED_STATUS = 1
				)
		BEGIN
			SELECT 0
		END
		ELSE
		BEGIN
			SELECT 1
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CHECKACCESSURL]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CHECKACCESSURL] (
	@roleid BIGINT
	,@url VARCHAR(255)
	,@userid BIGINT
	)
AS
BEGIN
	IF @roleid = 1
	BEGIN
		SELECT 1
	END
	ELSE IF EXISTS (
			SELECT USERID
			FROM RoleAccessURL WITH (NOLOCK)
			WHERE USERID = @userid
				AND AccessUrl = @url
			)
	BEGIN
		SELECT 1
	END
	ELSE
	BEGIN
		IF EXISTS (
				SELECT 1
				FROM RoleAccessURL WITH (NOLOCK)
				WHERE RoleID = @roleid
					AND AccessUrl = @url
				)
		BEGIN
			SELECT 1
		END
		ELSE
		BEGIN
			IF EXISTS (
					SELECT 1
					FROM RoleAccessURL WITH (NOLOCK)
					WHERE AccessUrl = @url
					)
			BEGIN
				SELECT 0
			END
			ELSE
			BEGIN
				SELECT 1
			END
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CHECKING_PENDING_DETAILS_BEFORE_APPRAISAL_PUBLISHING]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[CHECKING_PENDING_DETAILS_BEFORE_APPRAISAL_PUBLISHING] (@APPRAISAL_ID BIGINT)
AS
BEGIN
	SELECT SUM(CASE 
				WHEN rt.Manager_Id IS NULL
					THEN 1
				ELSE 0
				END) AS Manager_Assign_Pending
		,SUM(CASE 
				WHEN rt.Final_Evaluator_Id = 0
					THEN 1
				ELSE 0
				END) AS Moderator_Assign_Pending
	FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt WITH (NOLOCK)
	WHERE rt.Appraisal_Process_Period_Id = @APPRAISAL_ID

	SELECT count(Employee_Id) AS KRA_SKILL_PENDING
	FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
	WHERE Appraisal_Process_Period_Id = @APPRAISAL_ID
		AND Employee_Id NOT IN (
			SELECT Employee_Id
			FROM MTS_Appraisal_Employee_Mapping WITH (NOLOCK)
			)
END
GO

/****** Object:  StoredProcedure [dbo].[CHECKUSERID]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CHECKUSERID] (@userid BIGINT)
AS
BEGIN
	IF EXISTS (
			SELECT *
			FROM SecuredAuthorization WITH (NOLOCK)
			WHERE Employee_Id = @userid
			)
	BEGIN
		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CLOSING_APPRAISAL_PROCESS_DETAILS_PERIOD]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[CLOSING_APPRAISAL_PROCESS_DETAILS_PERIOD] (@appraisal_process_period_id BIGINT)
AS
BEGIN
	UPDATE MTS_APPRAISAL_PROCESS_DETAILS
	SET Active = 3
	WHERE Id = @appraisal_process_period_id
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_AMC/INSURANCE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_AMC/INSURANCE] (
	@file VARBINARY(MAX)
	,@file_name VARCHAR(255)
	)
AS
BEGIN
	INSERT INTO AMC_OR_INSURANCE_DETAILS
	VALUES (
		@file
		,@file_name
		)

	SELECT 1
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_AMC_INSURANCE_FILES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_AMC_INSURANCE_FILES] (
	@file VARBINARY(MAX)
	,@file_name VARCHAR(255)
	)
AS
BEGIN
	INSERT INTO AMC_OR_INSURANCE_DETAILS
	VALUES (
		@file
		,@file_name
		)

	BEGIN
		SELECT SCOPE_IDENTITY()
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_AMC_OR_ASSET_INSURANCE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_AMC_OR_ASSET_INSURANCE] (
	@assettypeid BIGINT
	,@assetname VARCHAR(255)
	,@category BIGINT
	,@vendor VARCHAR(255)
	,@amctype BIGINT
	,@insurancetype BIGINT
	,@amccharges MONEY
	,@premiumcharges MONEY
	,@paymenttype VARCHAR(255)
	,@paymentrefdate DATE
	,@paymentrefnumber BIGINT
	,@fromdate DATE
	,@todate DATE
	,@contactperson VARCHAR(255)
	,@contactphone BIGINT
	,@Notes VARCHAR(255)
	,@item_code BIGINT
	,@amc_invoice BIGINT
	)
AS
BEGIN
	INSERT INTO AMC_OR_ASSET_INSURANCE (
		AssetTypeId
		,AssetName
		,Category
		,Vendor
		,Amctype
		,Insurancetype
		,AmcCharges
		,PremiumCharges
		,PaymentType
		,PaymentRefDate
		,PaymentRefNumber
		,FromDate
		,ToDate
		,ContactPerson
		,ContactPhone
		,Notes
		,Item_code
		,Amc_document_id
		)
	VALUES (
		@assettypeid
		,@assetname
		,@category
		,@vendor
		,@amctype
		,@insurancetype
		,@amccharges
		,@premiumcharges
		,@paymenttype
		,@paymentrefdate
		,@paymentrefnumber
		,@fromdate
		,@todate
		,@contactperson
		,@contactphone
		,@Notes
		,@item_code
		,@amc_invoice
		)

	SELECT 1
END
GO

/****** Object:  StoredProcedure [dbo].[create_asset]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[create_asset] (
	@assettype BIGINT
	,@assetname VARCHAR(100)
	,@depreciation DECIMAL(4, 2)
	,@expectedlife BIGINT
	,@salvagevalue BIGINT
	)
AS
BEGIN
	INSERT INTO MTS_ASSETS
	VALUES (
		@assettype
		,@assetname
		,@depreciation
		,@expectedlife
		,@salvagevalue
		)

	SELECT 1
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_ASSET_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_ASSET_DETAILS] (
	@id BIGINT
	,@vendorid BIGINT
	,@purchaseordernumber VARCHAR(255)
	,@purchasedon DATE
	,@billnumber VARCHAR(255)
	,@billdate DATE
	,@assettypeid BIGINT
	,@assetnameid BIGINT
	,@assetdescription VARCHAR(255)
	,@costinrs DECIMAL(18, 2)
	,@costtype INT
	,@make VARCHAR(255)
	,@model VARCHAR(255)
	,@serialnumber VARCHAR(255)
	,@identificationcode VARCHAR(255)
	,@warrantymonths BIGINT
	,@warrantystartdate DATE
	,@warrantyenddate DATE
	,@invoiceid BIGINT
	,@assettype_id BIGINT
	,@assetname_id BIGINT
	,@inuse BIGINT
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM ASSET_DETAILS WITH (NOLOCK)
			WHERE IDENTIFICATION_CODE = @identificationcode
			)
	BEGIN
		IF NOT EXISTS (
				SELECT *
				FROM ASSET_DETAILS WITH (NOLOCK)
				WHERE ID = @id
				)
		BEGIN
			INSERT INTO ASSET_DETAILS (
				VENDOR_ID
				,PURCHASE_ORDER_NUMBER
				,PURCHASED_ON
				,BILL_NUMBER
				,BILL_DATE
				,ASSET_TYPEID
				,ASSET_NAMEID
				,ASSET_DESCRIPTION
				,COST
				,COST_TYPE
				,MAKE
				,MODEL
				,SERIAL_NUMBER
				,IDENTIFICATION_CODE
				,WARRANTY_MONTHS
				,WARRANTY_STARTDATE
				,WARRANTY_ENDDATE
				,INVOICE_ID
				,ASSETTYPE_ID
				,ASSETNAME_ID
				,IN_USE
				)
			VALUES (
				@vendorid
				,@purchaseordernumber
				,@purchasedon
				,@billnumber
				,@billdate
				,@assettypeid
				,@assetnameid
				,@assetdescription
				,@costinrs
				,@costtype
				,@make
				,@model
				,@serialnumber
				,@identificationcode
				,@warrantymonths
				,@warrantystartdate
				,@warrantyenddate
				,@invoiceid
				,@assettype_id
				,@assetname_id
				,@inuse
				)
		END

		BEGIN
			SELECT 1
		END
	END
	ELSE
	BEGIN
		SELECT 2
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_ASSET_MAINTENANCE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_ASSET_MAINTENANCE] (
	@assettypeid INT
	,@assetname VARCHAR(255)
	,@dateofpurchase DATE
	,@vendor VARCHAR(255)
	,@maintenancecarried_out VARCHAR(255)
	,@cost MONEY
	,@notes VARCHAR(255)
	,@item_code BIGINT
	)
AS
BEGIN
	INSERT INTO Asset_Maintenance (
		AssettypeId
		,Assetname
		,Dateofpurchase
		,Vendor
		,MaintenanceCarried_out
		,Cost
		,Notes
		,Item_code
		)
	VALUES (
		@assettypeid
		,@assetname
		,@dateofpurchase
		,@vendor
		,@maintenancecarried_out
		,@cost
		,@notes
		,@item_code
		)

	SELECT 1
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_ASSET_NAME]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_ASSET_NAME] (@assetname VARCHAR(100))
AS
BEGIN
	INSERT INTO MTS_ASSET_NAME
	VALUES (@assetname)

	SELECT 1
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_ASSET_Sale]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_ASSET_Sale] (
	@dateofsale DATE
	,@typeofsale VARCHAR(255)
	,@saleprice MONEY
	,@soldto VARCHAR(255)
	,@apporveddate DATE
	,@apporvedref VARCHAR(255)
	,@apporvedby VARCHAR(255)
	,@notes VARCHAR(255)
	,@item_code BIGINT
	,@asset_type BIGINT
	,@asset_name BIGINT
	)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN TRANSALE

		UPDATE ASSET_DETAILS
		SET [active] = 0
		WHERE id = @item_code

		INSERT INTO ASSET_SALE 
		VALUES (
			@dateofsale
			,@typeofsale
			,@saleprice
			,@soldto
			,@apporveddate
			,@apporvedref
			,@apporvedby
			,@notes
			,@item_code
			,@asset_type
			,@asset_name
			)

		COMMIT

		SELECT 1
	END TRY

	BEGIN CATCH
		SELECT 0

		ROLLBACK TRAN TRANSALE
	END CATCH
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_ASSETDETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_ASSETDETAILS] (
	@name VARCHAR(255)
	,@product VARCHAR(255)
	,@categoryid BIGINT
	,@make VARCHAR(255)
	,@model VARCHAR(255)
	,@serialNumber VARCHAR(255)
	,@purchasedOn DATETIME
	,@locationId BIGINT
	,@assignedTo BIGINT
	,@discardedOn DATETIME
	,@notes VARCHAR(max)
	,@billDate DATETIME
	,@billNumber VARCHAR(255)
	,@saleCompany VARCHAR(255)
	,@inUse BIT
	)
AS
BEGIN
	INSERT INTO MTS_AssetDetails
	VALUES (
		@name
		,@product
		,@categoryid
		,@make
		,@model
		,@serialNumber
		,@purchasedOn
		,@locationId
		,@assignedTo
		,@discardedOn
		,@notes
		,@billDate
		,@billNumber
		,@saleCompany
		,@inUse
		)
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_ASSIGN_ASSET]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_ASSIGN_ASSET] (
	@ASSETTYPEID BIGINT
	,@ASSETNAMEID BIGINT
	,@ITEMCODE VARCHAR(MAX)
	,@EMPLOYEEID BIGINT
	,@DEPARTMENTID BIGINT
	,@LOCATIONID BIGINT
	,@LOCATIONDETAILSID BIGINT
	,@ACTIONDATE DATE
	,@NOTES VARCHAR(MAX)
	,@ASSIGNTYPEID BIGINT
	)
AS
BEGIN
	BEGIN
		UPDATE ASSIGN_ASSET
		SET UNASSIGNED_DATE = @ACTIONDATE
		WHERE ASSET_TYPEID = @ASSETTYPEID
			AND ASSET_NAMEID = @ASSETNAMEID
			AND ITEM_CODE = @ITEMCODE
			AND UNASSIGNED_DATE IS NULL
	END

	BEGIN
		INSERT INTO ASSIGN_ASSET
		VALUES (
			@ASSETTYPEID
			,@ASSETNAMEID
			,@ITEMCODE
			,@EMPLOYEEID
			,@DEPARTMENTID
			,@LOCATIONID
			,@LOCATIONDETAILSID
			,@ACTIONDATE
			,@NOTES
			,@ASSIGNTYPEID
			,NULL
			)
	END

	BEGIN
		UPDATE ASSET_DETAILS
		SET CURRENTLY_ASSIGNED_TO = @EMPLOYEEID
		WHERE ID = @ITEMCODE
	END

	SELECT 1
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_BLOODGROUP]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_BLOODGROUP] (@bloodgroup VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT BloodGroup
			FROM MTS_BloodGroup WITH (NOLOCK)
			WHERE BloodGroup = @bloodgroup
			)
	BEGIN
		INSERT INTO MTS_BloodGroup
		VALUES (@bloodgroup)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_DEPARTMENT]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_DEPARTMENT] (@department VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT Department
			FROM Mts_Department WITH (NOLOCK)
			WHERE Department = @department
			)
	BEGIN
		INSERT INTO Mts_Department
		VALUES (@department)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_DESIGNATION]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_DESIGNATION] (@designation VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT Designation
			FROM Mts_Designation WITH (NOLOCK)
			WHERE Designation = @designation
			)
	BEGIN
		INSERT INTO Mts_Designation
		VALUES (@designation)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_EMPLOYEE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_EMPLOYEE] (
	@aadhar BIGINT
	,@dateofbirth DATE
	,@dateofjoin DATE
	,@designation BIGINT
	,@email VARCHAR(255)
	,@empid VARCHAR(255)
	,@fathername VARCHAR(255)
	,@firstname VARCHAR(255)
	,@gender INT
	,@lastname VARCHAR(255)
	,@maritalstatus BIGINT
	,@mobile VARCHAR(15)
	,@nationality BIGINT
	,@pancard VARCHAR(255)
	,@spousename VARCHAR(255)
	,@pfaccount VARCHAR(255)
	,@pfuan BIGINT
	,@esinum BIGINT
	,@departmentid BIGINT
	,@functionalRole BIGINT
	)
AS
BEGIN
	DECLARE @userid BIGINT

	SELECT @userid = USERID
	FROM MTS_LOGIN WITH (NOLOCK)
	WHERE USERNAME = @email

	INSERT INTO Employee (
		id
		,Employee_Id
		,Firstname
		,Lastname
		,Dateofbirth
		,Dateofjoin
		,Fathername
		,Maritalstatus
		,Spousename
		,Email
		,Mobile
		,Aadhar
		,Pancard
		,Designation
		,Gender
		,Nationality
		,PF_AccountNumber
		,PF_UAN
		,ESI_Number
		,Createdtime
		,DepartmentId
		,FunctionalRole
		)
	VALUES (
		@userid
		,@empid
		,@firstname
		,@lastname
		,@dateofbirth
		,@dateofjoin
		,@fathername
		,@maritalstatus
		,@spousename
		,@email
		,@mobile
		,@aadhar
		,@pancard
		,@designation
		,@gender
		,@nationality
		,@pfaccount
		,@pfuan
		,@esinum
		,getdate()
		,@departmentid
		,@functionalRole
		)

	EXECUTE MTS_CALCULATELEAVE_ATJOIN @userid
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_EMPLOYEE_DOCUMENTS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_EMPLOYEE_DOCUMENTS] (
	@empid BIGINT
	,@documentid BIGINT
	,@documentimage VARBINARY(max)
	,@documentname VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT 1
			FROM Employee_documents WITH (NOLOCK)
			WHERE DocumentId = @documentid
				AND Employee_Id = @empid
			)
	BEGIN
		INSERT INTO Employee_documents
		VALUES (
			@empid
			,@documentid
			,@documentimage
			,@documentname
			)
	END
	ELSE
	BEGIN
		UPDATE Employee_documents
		SET DocumentImage = @documentimage
			,DocumentName = @documentname
		WHERE Employee_Id = @empid
			AND DocumentId = @documentid
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_EMPLOYEE_IMAGE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_EMPLOYEE_IMAGE] (
	@empid BIGINT
	,@image VARBINARY(max)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM EmployeeImage WITH (NOLOCK)
			WHERE Employee_Id = @empid
			)
	BEGIN
		INSERT INTO EmployeeImage (
			Employee_ID
			,IMAGE
			)
		VALUES (
			@empid
			,@image
			)
	END
	ELSE IF EXISTS (
			SELECT Employee_Id
			FROM EmployeeImage WITH (NOLOCK)
			WHERE Employee_Id = @empid
			)
	BEGIN
		UPDATE EmployeeImage
		SET IMAGE = @image
		WHERE Employee_Id = @empid
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_GOVERNMENT_ID]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_GOVERNMENT_ID] (@idname VARCHAR(max))
AS
BEGIN
	IF NOT EXISTS (
			SELECT IdName
			FROM Mts_Government_Id WITH (NOLOCK)
			WHERE IdName = @idname
			)
	BEGIN
		INSERT INTO MTS_Government_Id
		VALUES (@idname)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_HOLIDAYS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[CREATE_HOLIDAYS] (
	@yearofholiday VARCHAR(255)
	,@holidayreason VARCHAR(255)
	,@dateofholiday DATE
	,@dayname VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT YearOfHoliday
				,HolidayReason
				,DateOfHoliday
			FROM HolidaysList WITH (NOLOCK)
			WHERE YearOfHoliday = @yearofholiday
				AND HolidayReason = @holidayreason
				AND DateOfHoliday = @dateofholiday
			)
	BEGIN
		INSERT INTO HolidaysList (
			YearOfHoliday
			,HolidayReason
			,DateOfHoliday
			,DayNameofDate
			)
		VALUES (
			@yearofholiday
			,@holidayreason
			,@dateofholiday
			,@dayname
			)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_INVOICE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_INVOICE] (
	@invoice VARBINARY(MAX)
	,@invoice_name VARCHAR(255)
	)
AS
BEGIN
	INSERT INTO ASSET_INVOICE_DETAILS
	VALUES (
		@invoice
		,@invoice_name
		)

	BEGIN
		SELECT SCOPE_IDENTITY()
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_LANGUAGES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_LANGUAGES] (@languagename VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT Languagename
			FROM MTS_Languages WITH (NOLOCK)
			WHERE Languagename = @languagename
			)
	BEGIN
		INSERT INTO MTS_Languages
		VALUES (@languagename)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[Create_Leave_Report]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Create_Leave_Report] (
	@status INT
	,@leavetype BIGINT
	,@empid BIGINT
	,@year VARCHAR(255)
	,@month VARCHAR(255)
	,@leavebalance FLOAT
	,@numofdays FLOAT
	)
AS
BEGIN
	DECLARE @Nextmonthleavebalance FLOAT = 0
	DECLARE @lopDays FLOAT = 0;

	SELECT @lopDays = @numofdays;

	IF EXISTS (
			SELECT *
			FROM LeaveReport WITH (NOLOCK)
			WHERE Month = @month
				AND year = @year
				AND Employee_Id = @empid
				AND LeaveType = @leavetype
			)
	BEGIN
		DECLARE @sumofdays FLOAT = @numofdays + (
				SELECT Numberofdays
				FROM LeaveReport WITH (NOLOCK)
				WHERE Month = @month
					AND year = @year
					AND Employee_Id = @empid
					AND LeaveType = @leavetype
				)
		DECLARE @totalLOPDays FLOAT = 0

		IF (
				@leavebalance < 0
				AND @status <> 3
				)
		BEGIN
			SELECT @lopDays = (- 1 * @leavebalance)

			SELECT @totalLOPDays = @lopDays + (
					SELECT LOPDays
					FROM LeaveReport WITH (NOLOCK)
					WHERE Month = @month
						AND year = @year
						AND Employee_Id = @empid
						AND LeaveType = @leavetype
					)

			UPDATE LeaveReport
			SET Numberofdays = @sumofdays
				,LOPDays = @totalLOPDays
				,Modifieddate = getdate()
			WHERE Month = @month
				AND year = @year
				AND LeaveType = @leavetype
				AND Employee_Id = @empid
		END
		ELSE IF (@status <> 3)
		BEGIN
			UPDATE LeaveReport
			SET Numberofdays = @sumofdays
				,Modifieddate = getdate()
			WHERE Month = @month
				AND year = @year
				AND LeaveType = @leavetype
				AND Employee_Id = @empid
		END
		ELSE
		BEGIN
			SELECT @totalLOPDays = @numofdays + (
					SELECT LOPDays
					FROM LeaveReport WITH (NOLOCK)
					WHERE Month = @month
						AND year = @year
						AND Employee_Id = @empid
						AND LeaveType = @leavetype
					)

			UPDATE LeaveReport
			SET Numberofdays = @sumofdays
				,LOPDays = @totalLOPDays
				,Modifieddate = getdate()
			WHERE Month = @month
				AND year = @year
				AND LeaveType = @leavetype
				AND Employee_Id = @empid
		END
	END
	ELSE
	BEGIN
		IF (
				@leavebalance < 0
				AND @status <> 3
				)
		BEGIN
			SELECT @lopDays = (- 1 * @leavebalance)

			INSERT INTO LeaveReport
			VALUES (
				@empid
				,@year
				,@month
				,@leavetype
				,@lopDays
				,@numofdays
				,getdate()
				,getdate()
				,NULL
				)
		END
		ELSE IF (@status <> 3)
		BEGIN
			INSERT INTO LeaveReport
			VALUES (
				@empid
				,@year
				,@month
				,@leavetype
				,0
				,@numofdays
				,getdate()
				,getdate()
				,NULL
				)
		END
		ELSE
		BEGIN
			SELECT @lopDays = @numofdays

			INSERT INTO LeaveReport
			VALUES (
				@empid
				,@year
				,@month
				,@leavetype
				,@lopDays
				,@numofdays
				,getdate()
				,getdate()
				,NULL
				)
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_LEAVESESSION]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_LEAVESESSION] (@session VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT Session
			FROM Mts_Session WITH (NOLOCK)
			WHERE Session = @session
			)
	BEGIN
		INSERT INTO Mts_Session
		VALUES (@session)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_LEAVETYPE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_LEAVETYPE] (
	@leavetype VARCHAR(255)
	,@numberofdays BIGINT
	,@department BIGINT
	,@HolidayAsLeave BIT
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM MTS_LeaveType WITH (NOLOCK)
			WHERE Leavetype = @leavetype
				AND DepartmentId = @department
			)
	BEGIN
		INSERT INTO MTS_LeaveType
		VALUES (
			@leavetype
			,@numberofdays
			,@department
			,@HolidayAsLeave
			)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_LOCATION]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_LOCATION] (@location VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT LocationName
			FROM Mts_Location WITH (NOLOCK)
			WHERE LocationName = @location
			)
	BEGIN
		INSERT INTO Mts_Location
		VALUES (@location)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_MARITAL_STATUS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_MARITAL_STATUS] (@marital_status VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM Mts_Marital_status WITH (NOLOCK)
			WHERE Marital_status = @marital_status
			)
	BEGIN
		INSERT INTO Mts_Marital_status
		VALUES (@marital_status)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_MESSAGES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[CREATE_MESSAGES] (
	@employeeid BIGINT
	,@fromdate DATETIME
	,@todate DATETIME
	,@messageheader VARCHAR(255)
	,@messagetitle VARCHAR(255)
	,@message NVARCHAR(MAX)
	,@roleid BIGINT
	,@messagestatus BIGINT
	,@postedby BIGINT
	,@templatetype BIGINT
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT Employee_ID
				,FromDate
				,ToDate
				,MessageHeader
				,MessageTitle
				,Message AS [Message]
				,Role_id
				,MessageStatus
				,TemplateId
			FROM MTS_MESSAGES WITH (NOLOCK)
			WHERE Employee_Id = @employeeid
				AND FromDate = @fromdate
				AND ToDate = @todate
				AND MessageHeader = @messageheader
				AND MessageTitle = @messagetitle
				AND [Message] = @message
				AND Role_id = @roleid
			)
	BEGIN
		INSERT INTO MTS_MESSAGES (
			Employee_Id
			,FromDate
			,ToDate
			,MessageHeader
			,MessageTitle
			,[Message]
			,Role_id
			,MessageStatus
			,PostedDate
			,PostedBy
			,TemplateId
			,[Status]
			)
		VALUES (
			@employeeid
			,@fromdate
			,@todate
			,@messageheader
			,@messagetitle
			,@message
			,@roleid
			,@messagestatus
			,GETDATE()
			,@postedby
			,@templatetype
			,1
			)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_MTS_HOLIDAYSLIST]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_MTS_HOLIDAYSLIST] (@holidayName VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT Holidays
			FROM MTS_HOLIDAYSLIST WITH (NOLOCK)
			WHERE Holidays = @holidayName
			)
	BEGIN
		INSERT INTO MTS_HOLIDAYSLIST
		VALUES (@holidayName)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_NATIONALITY]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_NATIONALITY] (@nationality VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM MTS_Nationality WITH (NOLOCK)
			WHERE Nationality = @nationality
			)
	BEGIN
		INSERT INTO MTS_Nationality
		VALUES (@nationality)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_POLICY]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_POLICY] (
	@documentid BIGINT
	,@documentimage VARBINARY(max)
	,@documentname VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT 1
			FROM HR_POLICYDOCUMENTS WITH (NOLOCK)
			WHERE DocumentId = @documentid
			)
	BEGIN
		INSERT INTO HR_POLICYDOCUMENTS
		VALUES (
			@documentid
			,@documentimage
			,@documentname
			)
	END
	ELSE
	BEGIN
		UPDATE HR_POLICYDOCUMENTS
		SET DocumentImage = @documentimage
			,DocumentName = @documentname
		WHERE DocumentId = @documentid
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_QUALIFICATION]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_QUALIFICATION] (@qualification VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT Qualification
			FROM MTS_Qualification WITH (NOLOCK)
			WHERE Qualification = @qualification
			)
	BEGIN
		INSERT INTO MTS_Qualification
		VALUES (@qualification)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_RELATIONSHIP]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_RELATIONSHIP] (@relationship VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT Relationship
			FROM Mts_Relationship WITH (NOLOCK)
			WHERE Relationship = @relationship
			)
	BEGIN
		INSERT INTO Mts_Relationship
		VALUES (@relationship)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_SKILLS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_SKILLS] (@skills VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT Skills
			FROM MTS_Skills WITH (NOLOCK)
			WHERE Skills = @skills
			)
	BEGIN
		INSERT INTO MTS_Skills
		VALUES (@skills)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_USER_CONTACTS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_USER_CONTACTS] (
	@employeeid VARCHAR(max)
	,@alternatemobile VARCHAR(max)
	,@personalmail VARCHAR(max)
	,@contactname VARCHAR(max)
	,@contactnumber VARCHAR(max)
	,@relationship BIGINT
	)
AS
BEGIN
	IF EXISTS (
			SELECT 1
			FROM Employee_Contacts WITH (NOLOCK)
			WHERE Employee_Id = @employeeid
				AND Employee_Alternate_Mobile = @alternatemobile
				AND Personal_MailId = @personalmail
				AND Emergency_ContactName = @contactname
				AND Emergency_ContactNumber = @contactnumber
				AND Contact_Relationship = @relationship
			)
	BEGIN
		SELECT 0
	END
	ELSE IF EXISTS (
			SELECT 1
			FROM Employee_Contacts WITH (NOLOCK)
			WHERE Employee_Id = @employeeid
			)
	BEGIN
		UPDATE Employee_Contacts
		SET Employee_Id = @employeeid
			,Employee_Alternate_Mobile = @alternatemobile
			,Personal_MailId = @personalmail
			,Emergency_ContactName = @contactname
			,Emergency_ContactNumber = @contactnumber
			,Contact_Relationship = @relationship
		WHERE Employee_Id = @employeeid

		SELECT 1
	END
	ELSE
	BEGIN
		INSERT INTO Employee_Contacts (
			Employee_Id
			,Employee_Alternate_Mobile
			,Personal_MailId
			,Emergency_ContactName
			,Emergency_ContactNumber
			,Contact_Relationship
			)
		VALUES (
			@employeeid
			,@alternatemobile
			,@personalmail
			,@contactname
			,@contactnumber
			,@relationship
			)

		SELECT 1
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_USER_DEPENDENTS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_USER_DEPENDENTS] (
	@employeeid BIGINT
	,@dependentname VARCHAR(255)
	,@relationship BIGINT
	,@dateofbirth DATE
	)
AS
BEGIN
	IF EXISTS (
			SELECT 1
			FROM Employee_Dependents WITH (NOLOCK)
			WHERE Employee_Id = @employeeid
				AND Dependentname = @dependentname
				AND Relationship = @relationship
				AND Dateofbirth = @dateofbirth
			)
	BEGIN
		SELECT 0
	END
	ELSE IF EXISTS (
			SELECT 1
			FROM Employee_Dependents
			WHERE Employee_Id = @employeeid
			)
	BEGIN
		UPDATE Employee_Dependents
		SET Employee_Id = @employeeid
			,Dependentname = @dependentname
			,Relationship = @relationship
			,Dateofbirth = @dateofbirth

		SELECT 1
	END
	ELSE
	BEGIN
		INSERT INTO Employee_Dependents (
			Employee_Id
			,Dependentname
			,Relationship
			,Dateofbirth
			)
		VALUES (
			@employeeid
			,@dependentname
			,@relationship
			,@dateofbirth
			)

		SELECT 1
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_USER_SKILLS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_USER_SKILLS] (
	@employeeid BIGINT
	,@skill VARCHAR(255)
	,@certificatename VARCHAR(255)
	)
AS
BEGIN
	IF EXISTS (
			SELECT 1
			FROM Employee_Skills WITH (NOLOCK)
			WHERE Employee_Id = @employeeid
				AND Skill = @skill
				AND Certificationname = @certificatename
			)
	BEGIN
		SELECT 0
	END
	ELSE IF EXISTS (
			SELECT 1
			FROM Employee_Skills WITH (NOLOCK)
			WHERE Employee_Id = @employeeid
			)
	BEGIN
		UPDATE Employee_Skills
		SET Employee_Id = @employeeid
			,Skill = @skill
			,Certificationname = @certificatename
		WHERE Employee_Id = @employeeid

		SELECT 1
	END
	ELSE
	BEGIN
		INSERT INTO Employee_Skills (
			Employee_Id
			,Skill
			,Certificationname
			)
		VALUES (
			@employeeid
			,@skill
			,@certificatename
			)

		SELECT 1
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATE_VENDORDETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_VENDORDETAILS] (
	@vendor_Type INT
	,@name VARCHAR(255)
	,@vendor_Address VARCHAR(max)
	,@phone VARCHAR(255)
	,@contact_Person VARCHAR(max)
	,@mobile_No VARCHAR(max)
	,@email VARCHAR(max)
	)
AS
BEGIN
	INSERT INTO MTS_VENDORS (
		VENDOR_TYPE
		,NAME
		,VENDOR_ADDRESS
		,PHONE
		,CONTACT_PERSON
		,MOBILE_NO
		,EMAIL
		)
	VALUES (
		@vendor_Type
		,@name
		,@vendor_Address
		,@phone
		,@contact_Person
		,@mobile_No
		,@email
		)

	BEGIN
		SELECT 1
	END
END
GO

/****** Object:  StoredProcedure [dbo].[CREATESALARYDETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATESALARYDETAILS] (@Details Payslip READONLY)
AS
BEGIN
	MERGE Employee_Payslip AS TARGET
	USING @Details AS SOURCE
		ON (
				TARGET.Emp_No = SOURCE.Emp_No
				AND TARGET.Month = SOURCE.Month
				AND TARGET.Year = SOURCE.Year
				)
	WHEN NOT MATCHED BY TARGET
		THEN
			INSERT (
				Emp_No
				,Employee_Name
				,Month
				,Year
				,Basic
				,HRA
				,Special_Allowance
				,Prof_Dev
				,Medical_Allowance
				,Conveyance
				,Food_Allowance
				,Communication_Allowance
				,Petrol_Allowance
				,Driver_Allowance
				,Education_Allowance
				,Gross_Earnings
				,PF
				,Income_Tax
				,Professional_Tax
				,Meal_Pass
				,ESI
				,Others
				,Total_Deduction
				,Net_Salary
				,Reimbursement
				,Paid_Days
				)
			VALUES (
				Source.Emp_No
				,Source.Employee_Name
				,Source.Month
				,Source.Year
				,Source.Basic
				,Source.HRA
				,Source.Special_Allowance
				,Source.Prof_Dev
				,Source.Medical_Allowance
				,Source.Conveyance
				,Source.Food_Allowance
				,Source.Communication_Allowance
				,Source.Petrol_Allowance
				,Source.Driver_Allowance
				,Source.Education_Allowance
				,Source.Gross_Earnings
				,Source.PF
				,Source.Income_Tax
				,Source.Professional_Tax
				,Source.Meal_Pass
				,Source.ESI
				,Source.Others
				,Source.Total_Deduction
				,Source.Net_Salary
				,Source.Reimbursement
				,Source.Paid_Days
				)
	OUTPUT 1;
END
GO

/****** Object:  StoredProcedure [dbo].[CREATEUPDATE_BANKDETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATEUPDATE_BANKDETAILS] (
	@accountnum VARCHAR(255)
	,@bankname VARCHAR(255)
	,@branchname VARCHAR(255)
	,@empid BIGINT
	,@flag BIT
	,@ifsc VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM Employee_BankDetails WITH (NOLOCK)
			WHERE Employee_Id = @empid
			)
	BEGIN
		INSERT INTO Employee_BankDetails (
			Accountnumber
			,Bankname
			,Branchname
			,Employee_Id
			,Ifsc
			)
		VALUES (
			@accountnum
			,@bankname
			,@branchname
			,@empid
			,@ifsc
			)

		SELECT 1
	END
	ELSE IF (@flag != 1)
	BEGIN
		IF EXISTS (
				SELECT Accountnumber
					,Bankname
					,Branchname
					,Employee_Id
					,Ifsc
				FROM Employee_BankDetails WITH (NOLOCK)
				WHERE Employee_Id = @empid
				)
		BEGIN
			UPDATE Employee_BankDetails
			SET Accountnumber = @accountnum
				,Bankname = @bankname
				,Branchname = @branchname
				,Employee_Id = @empid
				,Ifsc = @ifsc
			WHERE Employee_Id = @empid

			SELECT 2
		END
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[Delete_Employee_Appraisal_Mapping]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Delete_Employee_Appraisal_Mapping] (
	@EMP_ID BIGINT
	,@Appraisal_Process_id BIGINT
	)
AS
BEGIN
	DELETE
	FROM MTS_Appraisal_Employee_Mapping
	WHERE Employee_Id = @EMP_ID
		AND Appraisal_Process_Period_Id = @Appraisal_Process_id

	DELETE
	FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
	WHERE Employee_Id = @EMP_ID
		AND Appraisal_Process_Period_Id = @Appraisal_Process_id

	SELECT 1
END
GO

/****** Object:  StoredProcedure [dbo].[DELETE_EMPLOYEE_LEAVE_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DELETE_EMPLOYEE_LEAVE_DETAILS] (@LeaveId BIGINT)
AS
BEGIN
	IF EXISTS (
			SELECT *
			FROM EMPLOYEE_LEAVE_DETAILS WITH (NOLOCK)
			WHERE LeaveId = @LeaveId
			)
	BEGIN
		DELETE EMPLOYEE_LEAVE_DETAILS
		WHERE LeaveId = @LeaveId

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[DISPLAY_ALL_MESSAGES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DISPLAY_ALL_MESSAGES] (@messageStatus BIGINT)
AS
BEGIN
	SELECT TOP 15 MSG.id
		,R.ROLE_NAME
		,FromDate
		,ToDate
		,MessageHeader
		,MessageTitle
		,Message AS [Message]
		,STATUS AS [Status]
		,convert(VARCHAR(20), MSG.PostedDate, 100) AS PostedDate
		,EI.IMAGE AS [Image]
		,CONCAT (
			E.Firstname
			,' '
			,E.Lastname
			) AS Firstname
		,E.Gender
		,TemplateId
	FROM MTS_MESSAGES MSG WITH (NOLOCK)
	LEFT JOIN Employee E WITH (NOLOCK) ON E.id = MSG.Employee_Id
	LEFT JOIN EmployeeImage EI WITH (NOLOCK) ON EI.Employee_Id = E.id
	LEFT JOIN MTS_ROLES R WITH (NOLOCK) ON R.ROLEID = MSG.Role_id
	WHERE CAST(GETDATE() AS DATE) BETWEEN Fromdate
			AND ToDate
		AND STATUS = 1 --and @messageStatus = MSG.MessageStatus
	GROUP BY R.ROLE_NAME
		,MSG.MessageStatus
		,MSG.id
		,FromDate
		,ToDate
		,MessageHeader
		,MessageTitle
		,MessageTitle
		,Message
		,STATUS
		,PostedDate
		,EI.IMAGE
		,E.Firstname
		,E.Lastname
		,E.Gender
		,TemplateId
	ORDER BY MSG.PostedDate DESC
END
GO

/****** Object:  StoredProcedure [dbo].[Display_New_Joiners]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Display_New_Joiners]
AS
BEGIN
	SELECT Employee.id
		,Gender
		,UPPER(CONCAT (
				Employee.Firstname
				,' '
				,Employee.Lastname
				)) AS Name
		,CONCAT (
			MD.Designation
			,'  (DOJ: '
			,CONVERT(VARCHAR(10), Dateofjoin, 103)
			,')'
			) AS Designation
		,Email
		,CONVERT(VARCHAR(10), Dateofjoin, 103) AS Dateofjoin
		,EI.IMAGE AS [Image]
	FROM Employee WITH (NOLOCK)
	LEFT JOIN MTS_Designation MD WITH (NOLOCK) ON MD.id = Employee.Designation
	LEFT JOIN EmployeeImage EI WITH (NOLOCK) ON EI.Employee_Id = Employee.id
	INNER JOIN MTS_LOGIN ML WITH (NOLOCK) ON ML.USERID = Employee.id
	WHERE Dateofjoin > DATEADD(month, - 1, GETDATE())
		AND ML.ACTIVE = 1
END
GO

/****** Object:  StoredProcedure [dbo].[Edit_Delete_Appraisal_Employee_Mapping]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Edit_Delete_Appraisal_Employee_Mapping] (
	@status BIGINT
	,@weightage BIGINT
	,@rowid BIGINT
	)
AS
BEGIN
	IF (@status = 1)
	BEGIN
		UPDATE MTS_Appraisal_Employee_Mapping
		SET Weightage = @weightage
		WHERE id = @rowid
	END

	IF (@status = 2)
	BEGIN
		DELETE
		FROM MTS_Appraisal_Employee_Mapping
		WHERE id = @rowid
	END
END
GO

/****** Object:  StoredProcedure [dbo].[EMPLOYEE_LEAVEAPPLY]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EMPLOYEE_LEAVEAPPLY] (
	@empid BIGINT
	,@leavetype BIGINT
	,@fromdate DATE
	,@fromsession BIGINT
	,@todate DATE
	,@tosession BIGINT
	,@reason VARCHAR(255)
	,@managerid BIGINT
	,@numberofdays FLOAT
	,@islop BIT
	,@APPLY_LEAVE_TYPE BIGINT
	,@isEmployeeLeaveDetailsInsert BIT
	)
AS
BEGIN
	DECLARE @TEMPLATEID BIGINT = (
			SELECT TemplateID
			FROM MTS_EmailTemplate WITH (NOLOCK)
			WHERE TemplateName = 'EMAIL_REQUEST_LEAVE'
			)
	DECLARE @manageremail VARCHAR(255) = (
			SELECT Email
			FROM Employee WITH (NOLOCK)
			WHERE id = @managerid
			)
	DECLARE @empemail VARCHAR(255) = (
			SELECT Email
			FROM Employee WITH (NOLOCK)
			WHERE id = @empid
			)
	DECLARE @employeeid VARCHAR(255) = (
			SELECT Employee_Id
			FROM Employee WITH (NOLOCK)
			WHERE id = @empid
			)
	DECLARE @empname VARCHAR(255) = (
			SELECT Firstname + ' ' + Lastname AS EmployeeName
			FROM Employee WITH (NOLOCK)
			WHERE id = @empid
			)
	DECLARE @dateofjoin DATE = (
			SELECT DateofJoin
			FROM Employee WITH (NOLOCK)
			WHERE id = @empid
			)
	DECLARE @EMAILSP VARCHAR(255) = cast(@manageremail AS VARCHAR(255)) + ',' + cast(@empemail AS VARCHAR(255)) + ',' + cast(@employeeid AS VARCHAR(255)) + ',' + cast(@empname AS VARCHAR(255)) + ',' + cast(@dateofjoin AS VARCHAR(255)) + ',' + cast(@fromdate AS VARCHAR(255)) + ',' + cast(@todate AS VARCHAR(255)) + ',' + cast(@numberofdays AS VARCHAR(255)) + ',' + cast(@reason AS VARCHAR(255))

	BEGIN
		IF EXISTS (
				SELECT *
				FROM Employee_Leave WITH (NOLOCK)
				WHERE Approval <> 3
					AND Approval <> 4
					AND (
						(
							@fromdate BETWEEN FromDate
								AND ToDate
							AND Employee_Id = @empid
							)
						OR (
							@todate BETWEEN FromDate
								AND ToDate
							AND Employee_Id = @empid
							)
						)
					AND (
						@fromsession = LeaveFromSession
						AND FromDate = @fromdate
						AND Employee_Id = @empid
						)
					AND (
						@tosession = LeaveToSession
						AND ToDate = @todate
						AND Employee_Id = @empid
						)
				)
		BEGIN
			SELECT 0
		END
		ELSE
		BEGIN
			INSERT INTO Employee_Leave (
				Employee_Id
				,LeaveType
				,FromDate
				,LeaveFromSession
				,ToDate
				,LeaveToSession
				,Reason
				,Approval
				,Managerid
				,Numberofdays
				,isLOP
				)
			VALUES (
				@empid
				,@leavetype
				,@fromdate
				,@fromsession
				,@todate
				,@tosession
				,@reason
				,1
				,@managerid
				,@numberofdays
				,@islop
				)

			DECLARE @LEAVE_ID BIGINT = SCOPE_IDENTITY()

			IF @isEmployeeLeaveDetailsInsert = 0
			BEGIN
				EXEC ADD_EMPLOYEE_LEAVE_DETAILS @LEAVE_ID
					,@APPLY_LEAVE_TYPE
					,@islop
			END

			EXEC MTS_ADDEMAILMASTERENTRY @TEMPLATEID
				,@EMAILSP

			SELECT @LEAVE_ID
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[EMPLOYEE_LEAVECANCEL]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EMPLOYEE_LEAVECANCEL] (
	@id BIGINT
	,@approval BIGINT
	,@empid BIGINT
	)
AS
BEGIN
	UPDATE Employee_Leave
	SET CanceledBy = @empid
		,Approval = @approval
		,CanceledDate = getdate()
	WHERE Employee_Id = @empid
		AND id = @id

	UPDATE EMPLOYEE_LEAVE_DETAILS
	SET CanceledBy = @empid
		,Approval = @approval
		,CanceledDate = getdate()
	WHERE Employee_Id = @empid
		AND LeaveId = @id

	SELECT 1
END
GO

/****** Object:  StoredProcedure [dbo].[Experienced]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Experienced] (@empid VARCHAR)
AS
BEGIN
	IF EXISTS (
			SELECT Dateofjoin
			FROM Employee WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND Dateofjoin >= DATEADD(day, - 365, GETDATE())
			)
	BEGIN
		SELECT lev.*
			,dep.Department
		FROM MTS_Department AS dep WITH (NOLOCK)
		INNER JOIN MTS_LeaveType lev WITH (NOLOCK) ON dep.id = lev.DepartmentId
		WHERE NOT lev.Leavetype = ('Earned');

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT lev.*
			,dep.Department
		FROM MTS_Department AS dep WITH (NOLOCK)
		INNER JOIN MTS_LeaveType lev WITH (NOLOCK) ON dep.id = lev.DepartmentId;

		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[FILTER_ASSETS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FILTER_ASSETS] (
	@FROMDATE DATE
	,@TODATE DATE
	)
AS
BEGIN
	SELECT AD.ID
		,VENDOR_ID
		,MTSV.NAME AS VENDOR_NAME
		,PURCHASE_ORDER_NUMBER
		,PURCHASED_ON
		,BILL_NUMBER
		--,BILL_DATE
		,format(BILL_DATE, 'MM/dd/yyyy') AS BILL_DATE
		,ACAT.CATEGORYNAME AS ASSET_TYPE
		,AST.ASSETNAME AS ASSET_NAME
		,ASSET_DESCRIPTION
		,COST
		,COST_TYPE
		,MAKE
		,MODEL
		,SERIAL_NUMBER
		,IDENTIFICATION_CODE
		,WARRANTY_MONTHS
		,WARRANTY_STARTDATE
		,WARRANTY_ENDDATE
		,INVOICE_ID
		,ASSETTYPE_ID
		,ASSETNAME_ID
	FROM ASSET_DETAILS AD WITH (NOLOCK)
	LEFT JOIN MTS_ASSET_NAME AST WITH (NOLOCK) ON AD.ASSET_NAMEID = AST.ID
	LEFT JOIN MTS_ASSETCATEGORIES ACAT WITH (NOLOCK) ON AD.ASSET_TYPEID = ACAT.CATEGORYID
	LEFT JOIN MTS_VENDORS MTSV WITH (NOLOCK) ON MTSV.ID = AD.VENDOR_ID
	WHERE BILL_DATE BETWEEN @FROMDATE
			AND @TODATE
		AND active = 1
END
GO

/****** Object:  StoredProcedure [dbo].[FILTER_BANKDETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FILTER_BANKDETAILS] (
	@fromdate DATE
	,@todate DATE
	)
AS
BEGIN
	SELECT eb.id
		,eb.Employee_Id
		,ISNULL(eb.Bankname, 'Nil') AS Bankname
		,ISNULL(eb.Branchname, 'Nil') AS Branchname
		,ISNULL(eb.Accountnumber, 0) AS Accountnumber
		,ISNULL(eb.Ifsc, 'Nil') AS Ifsc
		,e.Firstname + ' ' + e.Lastname Name
		,e.Pancard
		,MTLOG.ACTIVE
	FROM Employee AS e WITH (NOLOCK)
	INNER JOIN Employee_BankDetails eb WITH (NOLOCK) ON e.id = eb.Employee_Id
	INNER JOIN MTS_LOGIN MTLOG WITH (NOLOCK) ON e.id = MTLOG.USERID
	WHERE e.Dateofjoin BETWEEN @fromdate
			AND @todate
END
GO

/****** Object:  StoredProcedure [dbo].[FILTER_EMPLOYEEDETAILSONDOJ]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FILTER_EMPLOYEEDETAILSONDOJ] (
	@fromdate DATE
	,@todate DATE
	)
AS
BEGIN
	SELECT E.id
		,E.Employee_Id
		,E.Firstname
		,E.Lastname
		,E.Gender
		,CASE E.Gender
			WHEN 0
				THEN 'Male'
			WHEN 2
				THEN 'Female'
			ELSE 'transgender'
			END AS Gender_Name
		,E.Fathername
		,CAST(Convert(VARCHAR(255), E.Dateofbirth, 110) AS VARCHAR(255)) AS 'Dateofbirth'
		,E.DepartmentId
		,Dt.Department
		,E.PF_AccountNumber
		,E.Aadhar
		,E.PF_UAN
		,E.Pancard
		,CAST(Convert(VARCHAR(255), E.Dateofjoin, 110) AS VARCHAR(255)) AS 'Dateofjoin'
		,CAST(Convert(VARCHAR(255), MTLOG.ResignedOn, 110) AS VARCHAR(255)) AS 'ResignedOn'
		,CASE 
			WHEN MTLOG.Active = 1
				THEN convert(VARCHAR(3), DATEDIFF(MONTH, E.Dateofjoin, GETDATE()) / 12) + ' y ' + convert(VARCHAR(2), DATEDIFF(MONTH, E.Dateofjoin, GETDATE()) % 12) + ' m'
			WHEN MTLOG.Active = 0
				THEN convert(VARCHAR(3), DATEDIFF(MONTH, E.Dateofjoin, MTLOG.ResignedOn) / 12) + ' y ' + convert(VARCHAR(2), DATEDIFF(MONTH, E.Dateofjoin, MTLOG.ResignedOn) % 12) + ' m'
			END AS Experience
		,D.Designation
		,MA.ROLEID
		,MTLOG.Active
		,STUFF((
				SELECT ', ' + ml.Languagename
				FROM EmployeeDetails AS Em
				INNER JOIN MTS_Languages ml ON Employee_Id = E.id
				WHERE ml.id IN (
						SELECT cast(dropdowndata AS BIGINT)
						FROM function_string_to_table(Em.Languagename, ',') AS Languages
						)
				FOR XML PATH('')
				), 1, 1, '') AS Languages
		,STUFF((
				SELECT DISTINCT ', ' + ms.Skills
				FROM Employee_Skills AS Es WITH (NOLOCK)
				INNER JOIN MTS_Skills ms ON Es.Employee_Id = E.id
				WHERE ms.id IN (
						SELECT cast(dropdowndata AS BIGINT)
						FROM function_string_to_table(Es.Skill, ',') AS Skills
						)
				FOR XML PATH('')
				), 1, 1, '') AS Skills
		,BD.Bankname
		,STUFF((
				SELECT ', ' + (E1.Firstname + ' ' + E1.Lastname)
				FROM Employee_Reporting_Managers TA WITH (NOLOCK)
				LEFT JOIN EMPLOYEE E1 WITH (NOLOCK) ON TA.ManagerId = E1.id
				INNER JOIN MTS_AUTHORITY MA WITH (NOLOCK) ON MA.USERID = TA.ManagerId
					AND (
						MA.ROLEID = 3
						OR MA.ROLEID = 1
						)
				INNER JOIN MTS_LOGIN ML WITH (NOLOCK) ON ML.USERID = E1.id
					AND ML.ACTIVE = 1
				WHERE TA.EmployeeId = E.id
				ORDER BY E1.Firstname
				FOR XML PATH('')
				), 1, 2, '') AS AssignedManagers
	FROM Employee AS E WITH (NOLOCK)
	INNER JOIN MTS_Designation D WITH (NOLOCK) ON D.id = E.Designation
	INNER JOIN MTS_Department Dt WITH (NOLOCK) ON Dt.id = E.DepartmentId
	INNER JOIN MTS_AUTHORITY MA WITH (NOLOCK) ON E.id = MA.USERID
	INNER JOIN MTS_LOGIN MTLOG WITH (NOLOCK) ON MTLOG.USERID = E.id
	LEFT JOIN Employee_BankDetails BD WITH (NOLOCK) ON BD.Employee_Id = E.id
	WHERE Dateofjoin BETWEEN @fromdate
			AND @todate
END
GO

/****** Object:  StoredProcedure [dbo].[FILTERED_ON_PURCHASED_DATE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FILTERED_ON_PURCHASED_DATE] (
	@fromdate DATE
	,@todate DATE
	)
AS
BEGIN
	WITH total
	AS (
		SELECT Item_code AS ID
			,sum(cost) AS totalcost
		FROM asset_maintenance WITH (NOLOCK)
		GROUP BY Item_code
		)
	SELECT Ass.ID
		,Ass.ASSET_TYPEID
		,Ass.IDENTIFICATION_CODE
		,name.Id AS AssetnameId
		,cat.CategoryName AS AssetType
		,name.Assetname AS AssetName
		,Ass.ASSET_DESCRIPTION
		,format(Ass.BILL_DATE, 'yyyy') AS Purchased_year
		,t.totalcost
		,Ass.MAKE
		,emp.Firstname + emp.Lastname AS AssignedTo
		,Ass.SERIAL_NUMBER
		,STUFF((
				SELECT ',' + CAST(AAS.Category AS VARCHAR)
				FROM AMC_OR_ASSET_INSURANCE AAS WITH (NOLOCK)
				WHERE AAS.Item_code = Ass.ID
					AND AAS.ToDate >= cast(GETDATE() AS DATE)
				GROUP BY AAS.Item_code
					,AAS.Category
				FOR XML PATH('')
				), 1, 1, '') AS Category
	FROM ASSET_DETAILS Ass WITH (NOLOCK)
	INNER JOIN MTS_ASSET_NAME name WITH (NOLOCK) ON Ass.ASSET_NAMEID = name.id
	INNER JOIN MTS_AssetCategories cat WITH (NOLOCK) ON Ass.ASSET_TYPEID = cat.CategoryId
	LEFT JOIN Employee emp WITH (NOLOCK) ON Ass.CURRENTLY_ASSIGNED_TO = emp.id
	LEFT JOIN total t ON Ass.ID = t.ID
	WHERE Ass.BILL_DATE BETWEEN @fromdate
			AND @todate
		AND Ass.active = 1
	GROUP BY Ass.ID
		,Ass.ASSET_TYPEID
		,Ass.IDENTIFICATION_CODE
		,name.Id
		,cat.CategoryName
		,name.Assetname
		,Ass.ASSET_DESCRIPTION
		,Ass.BILL_DATE
		,t.totalcost
		,Ass.MAKE
		,emp.Firstname
		,emp.Lastname
		,Ass.SERIAL_NUMBER
END
GO

/****** Object:  StoredProcedure [dbo].[GET_ACTIVE_EMPLOYEE_FOR_PAYROLL]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GET_ACTIVE_EMPLOYEE_FOR_PAYROLL]
AS
BEGIN
	DECLARE @LAST_ATTANDANCE_TO_DATE DATE
		,@LAST_ATTANDANCE_FROM_DATE DATE
	DECLARE @MAX_PAYROLL DATE = (
			SELECT MAX(PAYROLL_MONTH)
			FROM MTS_PAYROLL_CLOSING_PERIOD WITH (NOLOCK)
			WHERE CLOSED_STATUS = 1
			)

	SELECT @LAST_ATTANDANCE_FROM_DATE = ATTENDANCE_DATE_FROM
		,@LAST_ATTANDANCE_TO_DATE = ATTENDANCE_DATE_TO
	FROM MTS_PAYROLL_CLOSING_PERIOD WITH (NOLOCK)
	WHERE PAYROLL_MONTH = @MAX_PAYROLL

	SELECT E.id
		,E.Employee_Id
		,E.Firstname
		,E.Lastname
	FROM Employee AS E WITH (NOLOCK)
	INNER JOIN MTS_LOGIN AS MTLOG WITH (NOLOCK) ON MTLOG.USERID = E.id
	WHERE MTLOG.ACTIVE = 1
		OR (
			MTLOG.ACTIVE = 0
			AND MTLOG.ResignedOn BETWEEN @LAST_ATTANDANCE_FROM_DATE
				AND @LAST_ATTANDANCE_TO_DATE
			)
	ORDER BY E.Firstname
END
GO

/****** Object:  StoredProcedure [dbo].[Get_Appraisal_Count]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Appraisal_Count] (@USERID BIGINT)
AS
BEGIN
	DECLARE @roleid BIGINT
		,@APPRAISAL_ACTIVE_STAGE BIGINT = 0

	SELECT @roleid = ROLEID
	FROM MTS_AUTHORITY ma
	WHERE ma.USERID = @USERID

	SELECT @APPRAISAL_ACTIVE_STAGE = ISNULL(APD.Active, 0)
	FROM MTS_APPRAISAL_PROCESS_DETAILS APD WITH (NOLOCK)
	INNER JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE RT WITH (NOLOCK) ON RT.Appraisal_Process_Period_Id = APD.Id
	WHERE RT.Employee_Id = @USERID
		AND APD.Active = 2

	IF @roleid = 1
	BEGIN
		SELECT rt.Appraisal_Process_Period_Id
			,SUM(CASE 
					WHEN ISNULL(rt.Staging, 0) = 2
						THEN 1
					ELSE 0
					END) AS Pending
		FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt WITH (NOLOCK)
		WHERE rt.Final_Evaluator_Id = @USERID
			AND rt.Appraisal_Process_Period_Id IN (
				SELECT id
				FROM MTS_APPRAISAL_PROCESS_DETAILS WITH (NOLOCK)
				WHERE Active = 2
				)
		GROUP BY rt.Appraisal_Process_Period_Id

		SELECT rt.Appraisal_Process_Period_Id
			,SUM(CASE 
					WHEN ISNULL(rt.Staging, 0) = 1
						THEN 1
					ELSE 0
					END) AS Pending
		FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt WITH (NOLOCK)
		WHERE rt.Manager_Id = @USERID
			AND rt.Appraisal_Process_Period_Id IN (
				SELECT id
				FROM MTS_APPRAISAL_PROCESS_DETAILS WITH (NOLOCK)
				WHERE Active = 2
				)
		GROUP BY rt.Appraisal_Process_Period_Id

		SELECT rt.Appraisal_Process_Period_Id
			,@APPRAISAL_ACTIVE_STAGE AS APPRAISAL_ACTIVE_STAGE
			,SUM(CASE 
					WHEN ISNULL(rt.Staging, 0) = 0
						THEN 1
					ELSE 0
					END) AS Pending
		FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt WITH (NOLOCK)
		WHERE rt.Employee_Id = @USERID
			AND rt.Appraisal_Process_Period_Id IN (
				SELECT id
				FROM MTS_APPRAISAL_PROCESS_DETAILS WITH (NOLOCK)
				WHERE Active = 2
				)
		GROUP BY rt.Appraisal_Process_Period_Id
	END
	ELSE IF @roleid = 3
	BEGIN
		SELECT 0 AS Appraisal_Process_Period_Id
			,0 AS Pending

		SELECT rt.Appraisal_Process_Period_Id
			,SUM(CASE 
					WHEN ISNULL(rt.Staging, 0) = 1
						THEN 1
					ELSE 0
					END) AS Pending
		FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt WITH (NOLOCK)
		WHERE rt.Manager_Id = @USERID
			AND rt.Appraisal_Process_Period_Id IN (
				SELECT id
				FROM MTS_APPRAISAL_PROCESS_DETAILS WITH (NOLOCK)
				WHERE Active = 2
				)
		GROUP BY rt.Appraisal_Process_Period_Id

		SELECT rt.Appraisal_Process_Period_Id
			,@APPRAISAL_ACTIVE_STAGE AS APPRAISAL_ACTIVE_STAGE
			,SUM(CASE 
					WHEN ISNULL(rt.Staging, 0) = 0
						THEN 1
					ELSE 0
					END) AS Pending
		FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt WITH (NOLOCK)
		WHERE rt.Employee_Id = @USERID
			AND rt.Appraisal_Process_Period_Id IN (
				SELECT id
				FROM MTS_APPRAISAL_PROCESS_DETAILS WITH (NOLOCK)
				WHERE Active = 2
				)
		GROUP BY rt.Appraisal_Process_Period_Id
	END
	ELSE IF @Roleid <> 1
		AND @roleid <> 3
	BEGIN
		SELECT 0 AS Appraisal_Process_Period_Id
			,0 AS Pending

		SELECT 0 AS Appraisal_Process_Period_Id
			,0 AS Pending

		SELECT rt.Appraisal_Process_Period_Id
			,@APPRAISAL_ACTIVE_STAGE AS APPRAISAL_ACTIVE_STAGE
			,SUM(CASE 
					WHEN ISNULL(rt.Staging, 0) = 0
						THEN 1
					ELSE 0
					END) AS Pending
		FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt WITH (NOLOCK)
		WHERE rt.Employee_Id = @USERID
			AND rt.Appraisal_Process_Period_Id IN (
				SELECT id
				FROM MTS_APPRAISAL_PROCESS_DETAILS WITH (NOLOCK)
				WHERE Active = 2
				)
		GROUP BY rt.Appraisal_Process_Period_Id
	END
END
GO

/****** Object:  StoredProcedure [dbo].[GET_APPRAISAL_MAPPING_TABLE_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_APPRAISAL_MAPPING_TABLE_DETAILS]
AS
BEGIN
	SELECT pt.PerformanceType AS [TYPE]
		,skm.Description AS [DESCRIPTION]
		,dm.Weightage AS [WEIGHTAGE]
		,mts_desg.Role_Name AS [DESIGNATION]
	FROM MTS_Appraisal_PerformanceType pt WITH (NOLOCK)
	INNER JOIN MTS_Appraisal_Designation_Mapping dm WITH (NOLOCK) ON dm.PerformanceTypeID = pt.Id
	LEFT JOIN MTS_Appraisal_SkillKRAMapping skm WITH (NOLOCK) ON skm.Id = dm.Description
	LEFT JOIN MTS_FunctionalRole mts_desg WITH (NOLOCK) ON mts_desg.id = dm.Designation

	SELECT emp.Employee_Id AS EMP_CODE
		,AEM.Employee_Id AS EMP_ID
		,emp.Firstname + ' ' + emp.Lastname AS EMP_NAME
		,mts_desg.Role_Name AS DESIGNATION
	FROM MTS_Appraisal_Employee_Mapping AEM WITH (NOLOCK)
	INNER JOIN Employee emp WITH (NOLOCK) ON emp.id = AEM.Employee_Id
	INNER JOIN MTS_FunctionalRole mts_desg WITH (NOLOCK) ON mts_desg.id = emp.FunctionalRole
	GROUP BY emp.Employee_Id
		,AEM.Employee_Id
		,emp.Firstname
		,emp.Lastname
		,mts_desg.Role_Name
END
GO

/****** Object:  StoredProcedure [dbo].[GET_APPRAISAL_MAPPING_TABLE_DETAILS_APPRAISALMAPPINGID]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_APPRAISAL_MAPPING_TABLE_DETAILS_APPRAISALMAPPINGID] (@AppraisalProcessId BIGINT)
AS
BEGIN
	SELECT emp.Employee_Id AS EMP_CODE
		,rt.Employee_Id AS EMP_ID
		,emp.Firstname + ' ' + emp.Lastname AS EMP_NAME
		,mts_desg.Role_Name AS DESIGNATION
		,emp.Dateofjoin AS DOJ
		,rt.Manager_Id AS ASSIGNED_MANAGER_ID
		,M.Firstname + ' ' + M.Lastname AS ASSIGNED_MANAGER_NAME
		,rt.Final_Evaluator_Id AS ASSIGNED_MODERATOR_ID
		,MN.Firstname + ' ' + MN.Lastname AS ASSIGNED_MODERATOR_NAME
		,rt.Staging AS [Status]
		,rt.Final_Evaluator_KRA_Rating AS FINAL_KRA_RATING
		,rt.Final_Evaluator_Skill_Rating AS FINAL_SKILL_RATING
		,PPR.RANK_DESCRIPTION AS Performance
		,PPR1.RANK_DESCRIPTION AS Potential
		,OPPR.RANK_DESCRIPTION AS Overall_Rating
		,SFC.FEEDBACK_CATEGORY
	FROM Employee emp WITH (NOLOCK)
	INNER JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt WITH (NOLOCK) ON rt.Employee_Id = emp.id
	LEFT JOIN MTS_FunctionalRole mts_desg WITH (NOLOCK) ON mts_desg.id = emp.FunctionalRole
	LEFT JOIN Employee M WITH (NOLOCK) ON M.id = rt.Manager_Id
	LEFT JOIN Employee MN WITH (NOLOCK) ON MN.id = rt.Final_Evaluator_Id
	LEFT JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR WITH (NOLOCK) ON rt.PERFORMANCE_RATING = PPR.ID
	LEFT JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR1 WITH (NOLOCK) ON rt.POTENTIAL_RATING = PPR1.ID
	LEFT JOIN MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK) ON rt.OVERALL_RATING = OPPR.ID
	LEFT JOIN MTS_APPRAISAL_SUMMARY_FEEDBACK_CATEGORY SFC WITH (NOLOCK) ON SFC.FEEDBACK_CATEGORY_ID = rt.FEEDBACK_CATEGORY
	WHERE rt.Appraisal_Process_Period_Id = @AppraisalProcessId
	GROUP BY emp.Employee_Id
		,rt.Employee_Id
		,emp.Firstname
		,emp.Lastname
		,mts_desg.Role_Name
		,emp.Dateofjoin
		,rt.Manager_Id
		,M.Firstname
		,M.Lastname
		,rt.Final_Evaluator_Id
		,MN.Firstname
		,MN.Lastname
		,rt.Staging
		,rt.Final_Evaluator_KRA_Rating
		,rt.Final_Evaluator_Skill_Rating
		,PPR.RANK_DESCRIPTION
		,PPR1.RANK_DESCRIPTION
		,OPPR.RANK_DESCRIPTION
		,SFC.FEEDBACK_CATEGORY
END
GO

/****** Object:  StoredProcedure [dbo].[GET_APPRAISAL_PROCESS_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_APPRAISAL_PROCESS_DETAILS]
AS
BEGIN
	WITH Reporting_Table
	AS (
		SELECT rt.Appraisal_Process_Period_Id
			,count(rt.id) Total_Employees
			,SUM(CASE 
					WHEN rt.Staging IS NULL
						OR Staging = 0
						THEN 1
					ELSE 0
					END) AS Pending
			,SUM(CASE 
					WHEN rt.Staging = 1
						OR (
							rt.Staging = 2
							AND rt.Manager_Id = 0
							)
						THEN 1
					ELSE 0
					END) AS Self_Apprisal_comp
			,SUM(CASE 
					WHEN rt.Staging = 2
						AND rt.Manager_Id <> 0
						THEN 1
					ELSE 0
					END) AS Manager_Rating_Comp
			,SUM(CASE 
					WHEN rt.Staging = 3
						THEN 1
					ELSE 0
					END) AS Final_Rating_Comp
		FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt WITH (NOLOCK)
		GROUP BY rt.Appraisal_Process_Period_Id
		)
	SELECT pd.*
		,pd.Appraisal_Process_Period AS Appraisal_Process_Period_Name
		,emp.Firstname + ' ' + emp.Lastname AS [EMP_NAME]
		,rt.*
	FROM MTS_APPRAISAL_PROCESS_DETAILS pd WITH (NOLOCK)
	LEFT JOIN Employee emp WITH (NOLOCK) ON emp.id = pd.Evaluator
	LEFT JOIN Reporting_Table rt WITH (NOLOCK) ON rt.Appraisal_Process_Period_Id = pd.Id
END
GO

/****** Object:  StoredProcedure [dbo].[Get_Approvers_Initiators]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Approvers_Initiators] (@USERID BIGINT)
AS
BEGIN
	SELECT Approval_flag
		,ID AS UserId
		,Employee_Id AS EmpId
		,Firstname + ' ' + Lastname AS [Initiator]
	FROM Employee WITH (NOLOCK)
	WHERE Approval_flag = 0

	SELECT Approval_flag
		,ID AS UserId
		,Employee_Id AS EmpId
		,Firstname + ' ' + Lastname AS Approver
	FROM Employee WITH (NOLOCK)
	WHERE Approval_flag = 1

	SELECT Approval_flag
		,ID AS UserId
		,Employee_Id AS EmpId
		,Firstname + ' ' + Lastname AS Approver_Initiator
	FROM Employee WITH (NOLOCK)
	WHERE Approval_flag = 2

	SELECT Approval_flag
		,ID AS UserId
		,Employee_Id AS EmpId
		,Firstname + ' ' + Lastname AS NAME
	FROM Employee WITH (NOLOCK)
	WHERE ID = @USERID
		AND (
			Approval_flag = 0
			OR Approval_flag = 1
			OR Approval_flag = 2
			)
END
GO

/****** Object:  StoredProcedure [dbo].[Get_Employee]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Employee]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Employee_Id
		,Firstname
		,Lastname
		,Dateofjoin
		,Fathername
		,Maritalstatus
		,Spousename
		,Email
		,Mobile
		,Aadhar
		,Pancard
		,Designation
		,Gender
		,Dateofbirth
		,Nationality
		,Createdtime
		,PF_AccountNumber
		,PF_UAN
		,ESI_Number
		,DepartmentId
	FROM Employee WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[GET_EMPLOYEE_MAPPING_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_EMPLOYEE_MAPPING_DETAILS] (
	@EmpId BIGINT
	,@Appraisal_Process_id BIGINT
	)
AS
BEGIN
	SELECT em.id AS [ROW_ID]
		,emp.Employee_Id AS [EMP_CODE]
		,emp.id AS Employee_Id
		,emp.Firstname + ' ' + emp.Lastname AS [EMP_NAME]
		,pt.PerformanceType AS [TYPE]
		,skm.Description AS [DESCRIPTION]
		,em.Weightage AS [WEIGHTAGE]
		,mts_desg.Role_Name AS [DESIGNATION]
	FROM MTS_Appraisal_Employee_Mapping em
	INNER JOIN [MTS_Appraisal_PerformanceType] pt WITH (NOLOCK) ON pt.id = em.PerformanceTypeID
	INNER JOIN [MTS_Appraisal_SkillKRAMapping] skm WITH (NOLOCK) ON skm.Id = em.Description
	LEFT JOIN MTS_FunctionalRole mts_desg WITH (NOLOCK) ON mts_desg.id = em.Designation
	INNER JOIN Employee emp WITH (NOLOCK) ON emp.id = em.Employee_id
	WHERE emp.id = @EmpId
		AND em.Appraisal_Process_Period_Id = @Appraisal_Process_id

	SELECT em.Employee_Id AS [EMP_CODE]
		,mts_desg.Designation AS [DESIGNATION]
		,em.Firstname + ' ' + em.Lastname AS [EMP_NAME]
	FROM Employee em WITH (NOLOCK)
	LEFT JOIN MTS_Designation mts_desg WITH (NOLOCK) ON mts_desg.id = em.Designation
	WHERE em.Id = @EmpId
END
GO

/****** Object:  StoredProcedure [dbo].[GET_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL] (
	@EmpId BIGINT
	,@type BIGINT
	,@description VARCHAR(20)
	)
AS
BEGIN
	SELECT EMP_ID
		,TYPE
		,DESCRIPTION
		,COUNT(EFFECTIVE_MONTH) AS TOTAL_NO_OF_EFFECTIVE_MONTH
		,sum(AMOUNT) AS TOTAL_AMOUNT
	FROM MTS_PAYROLL_EMPLOYEE_MONTHLY_VARIANCE WITH (NOLOCK)
	WHERE EMP_ID = @EmpId
	GROUP BY EMP_ID
		,TYPE
		,DESCRIPTION

	SELECT *
	FROM MTS_PAYROLL_EMPLOYEE_MONTHLY_VARIANCE WITH (NOLOCK)
	WHERE EMP_ID = @EmpId
		AND [TYPE] = @type
		AND [DESCRIPTION] = @description
END
GO

/****** Object:  StoredProcedure [dbo].[GET_EMPLOYEE_PAYROLL_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_EMPLOYEE_PAYROLL_DETAILS] (@EMP_ID BIGINT)
AS
BEGIN
	SELECT TOP 1 *
	FROM MTS_PAYROLL_EMPLOYEE_EARNINGS WITH (NOLOCK)
	WHERE EMP_ID = @EMP_ID
	ORDER BY ID DESC

	SELECT TOP 1 ded.*
		,ISNULL(emp.IS_PF_RESTRICTION_APPLICABLE, 0) AS IS_PF_RESTRICTION_APPLICABLE
	FROM MTS_PAYROLL_EMPLOYEE_DEDUCTIONS ded WITH (NOLOCK)
	JOIN Employee emp WITH (NOLOCK) ON emp.Id = ded.EMP_ID
	WHERE EMP_ID = @EMP_ID
	ORDER BY ded.ID DESC
END
GO

/****** Object:  StoredProcedure [dbo].[GET_EMPLOYEE_PF_ESI_PROFESSIONAL_TAX_PAYROLL]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_EMPLOYEE_PF_ESI_PROFESSIONAL_TAX_PAYROLL]
AS
BEGIN
	SELECT *
	FROM MTS_PAYROLL_EPF_MASTER WITH (NOLOCK)

	SELECT *
	FROM MTS_PAYROLL_ESI_MASTER WITH (NOLOCK)

	SELECT *
	FROM MTS_PAYROLL_PROFESSIONAL_TAX_DETAIL WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[Get_Employee_Ratings]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Get_Employee_Ratings] (
	@Empid BIGINT
	,@Appraisal_ID BIGINT
	,@isSelfDirectAppraisalPage BIT
	,@ViewStatus BIGINT
	)
AS
BEGIN
	DECLARE @ROLEID BIGINT

	SELECT @ROLEID = ISNULL(ROLEID, 0)
	FROM MTS_Authority WITH (NOLOCK)
	WHERE USERID = @Empid

	DECLARE @appraisal_process_period_id BIGINT
		,@STATUS BIGINT
		,@CURRDATE DATETIME = getdate();

	IF ISNULL(@Appraisal_ID, 0) = 0
	BEGIN
		SELECT @appraisal_process_period_id = APD.Id
			,@STATUS = ISNULL(RT.Staging, 0)
		FROM MTS_APPRAISAL_PROCESS_DETAILS APD WITH (NOLOCK)
		INNER JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE RT WITH (NOLOCK) ON RT.Appraisal_Process_Period_Id = APD.Id
		WHERE APD.Active = 2
			AND RT.Employee_Id = @Empid
	END
	ELSE
	BEGIN
		SELECT @appraisal_process_period_id = @Appraisal_ID
	END

	IF @isSelfDirectAppraisalPage = 1
	BEGIN
		IF @STATUS = 0 
		BEGIN
			SELECT MAERT.Id
				,MAERT.Employee_Id
				,MAERT.Appraisal_Process_Period_Id
				,Manager_Id
				,Self_KRA_Rating
				,Self_Skill_Rating
				,Self_Rating_Completion
				,ISNULL(MAERT.Staging, 0) AS Staging1
			FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE MAERT WITH (NOLOCK)
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR WITH (NOLOCK) ON MAERT.PERFORMANCE_RATING = PPR.ID
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR1 WITH (NOLOCK) ON MAERT.POTENTIAL_RATING = PPR1.ID
			INNER JOIN MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK) ON MAERT.OVERALL_RATING = OPPR.ID
			WHERE Employee_Id = @Empid
				AND MAERT.Appraisal_Process_Period_Id = @appraisal_process_period_id
		END

		IF @STATUS <> 0
			AND @STATUS <> 3
		BEGIN
			SELECT MAERT.Id
				,MAERT.Employee_Id
				,MAERT.Appraisal_Process_Period_Id
				,MAERT.Manager_Id
				,MAERT.Self_KRA_Rating
				,MAERT.Self_Skill_Rating
				,MAERT.Self_Rating_Completion
				,ISNULL(MAERT.Staging, 0) AS Staging1
			FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE MAERT WITH (NOLOCK)
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR WITH (NOLOCK) ON MAERT.PERFORMANCE_RATING = PPR.ID
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR1 WITH (NOLOCK) ON MAERT.POTENTIAL_RATING = PPR1.ID
			INNER JOIN MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK) ON MAERT.OVERALL_RATING = OPPR.ID
			WHERE MAERT.Employee_Id = @Empid
				AND MAERT.Appraisal_Process_Period_Id = @appraisal_process_period_id
		END

		IF @STATUS = 3
			AND @ROLEID <> 2
			AND @ROLEID <> 4
		BEGIN
			SELECT MAERT.Id
				,MAERT.Employee_Id
				,MAERT.Appraisal_Process_Period_Id
				,MAERT.Manager_Id
				,MAERT.Final_Evaluator_Id
				,MAERT.Self_KRA_Rating
				,MAERT.Self_Skill_Rating
				,MAERT.Final_Evaluator_KRA_Rating
				,MAERT.Final_Evaluator_Skill_Rating
				,MAERT.OVERALL_RATING
				,MAERT.Self_Rating_Completion
				,ISNULL(MAERT.Staging, 0) AS Staging1
				,ISNULL(PPR.RANK_DESCRIPTION, 0) AS Performance
				,ISNULL(PPR1.RANK_DESCRIPTION, 0) AS Potential
				,ISNULL(OPPR.RANK_DESCRIPTION, 0) AS Overall_Rating
			FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE MAERT WITH (NOLOCK)
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR WITH (NOLOCK) ON MAERT.PERFORMANCE_RATING = PPR.ID
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR1 WITH (NOLOCK) ON MAERT.POTENTIAL_RATING = PPR1.ID
			INNER JOIN MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK) ON MAERT.OVERALL_RATING = OPPR.ID
			WHERE Employee_Id = @Empid
				AND MAERT.Appraisal_Process_Period_Id = @appraisal_process_period_id
		END

		IF @STATUS = 3
			AND @ROLEID <> 1
			AND @ROLEID <> 3
		BEGIN
			SELECT MAERT.Id
				,MAERT.Employee_Id
				,MAERT.Appraisal_Process_Period_Id
				,MAERT.Manager_Id
				,MAERT.Final_Evaluator_Id
				,MAERT.Self_KRA_Rating
				,MAERT.Self_Skill_Rating
				,MAERT.Final_Evaluator_KRA_Rating
				,MAERT.Final_Evaluator_Skill_Rating
				,MAERT.OVERALL_RATING
				,MAERT.Self_Rating_Completion
				,ISNULL(MAERT.Staging, 0) AS Staging1
				,ISNULL(OPPR.RANK_DESCRIPTION, 0) AS Overall_Rating
			FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE MAERT WITH (NOLOCK)
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR WITH (NOLOCK) ON MAERT.PERFORMANCE_RATING = PPR.ID
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR1 WITH (NOLOCK) ON MAERT.POTENTIAL_RATING = PPR1.ID
			INNER JOIN MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK) ON MAERT.OVERALL_RATING = OPPR.ID
			WHERE Employee_Id = @Empid
				AND MAERT.Appraisal_Process_Period_Id = @appraisal_process_period_id
		END
	END

	IF @isSelfDirectAppraisalPage = 0
	BEGIN
		IF @STATUS > 2
			AND @ViewStatus = 1
		BEGIN
			SELECT MAERT.Id
				,MAERT.Employee_Id
				,MAERT.Appraisal_Process_Period_Id
				,MAERT.Manager_Id
				,MAERT.Final_Evaluator_Id
				,MAERT.Self_KRA_Rating
				,MAERT.Evaluator_KRA_Rating
				,MAERT.Self_Skill_Rating
				,MAERT.Evaluator_Skill_Rating
				,MAERT.Final_Evaluator_KRA_Rating
				,MAERT.Final_Evaluator_Skill_Rating
				,MAERT.PERFORMANCE_RATING
				,MAERT.POTENTIAL_RATING
				,MAERT.OVERALL_RATING
				,MAERT.Self_Rating_Completion
				,MAERT.Evaluator_Rating_Completion
				,MAERT.Final_Rating_Completion
				,MAERT.FEEDBACK_CATEGORY
				,ISNULL(MAERT.Staging, 0) AS Staging1
				,ISNULL(PPR.RANK_DESCRIPTION, 0) AS Performance
				,ISNULL(PPR1.RANK_DESCRIPTION, 0) AS Potential
				,ISNULL(OPPR.RANK_DESCRIPTION, 0) AS Overall_Rating
			FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE MAERT WITH (NOLOCK)
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR WITH (NOLOCK) ON MAERT.PERFORMANCE_RATING = PPR.ID
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR1 WITH (NOLOCK) ON MAERT.POTENTIAL_RATING = PPR1.ID
			INNER JOIN MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK) ON MAERT.OVERALL_RATING = OPPR.ID
			WHERE Employee_Id = @Empid
				AND MAERT.Appraisal_Process_Period_Id = @appraisal_process_period_id
				AND @CURRDATE BETWEEN ISNULL(MAERT.FINAL_RATING_COMPLETION, @CURRDATE)
					AND DATEADD(MONTH, 1, ISNULL(MAERT.FINAL_RATING_COMPLETION, @CURRDATE))
		END

		IF @STATUS > 2
			AND @ViewStatus = 2
		BEGIN
			SELECT MAERT.Id
				,MAERT.Employee_Id
				,MAERT.Appraisal_Process_Period_Id
				,MAERT.Manager_Id
				,MAERT.Final_Evaluator_Id
				,MAERT.Self_KRA_Rating
				,MAERT.Evaluator_KRA_Rating
				,MAERT.Self_Skill_Rating
				,MAERT.Evaluator_Skill_Rating
				,MAERT.Final_Evaluator_KRA_Rating
				,MAERT.Final_Evaluator_Skill_Rating
				,MAERT.PERFORMANCE_RATING
				,MAERT.POTENTIAL_RATING
				,MAERT.OVERALL_RATING
				,MAERT.Self_Rating_Completion
				,MAERT.Evaluator_Rating_Completion
				,MAERT.Final_Rating_Completion
				,MAERT.FEEDBACK_CATEGORY
				,ISNULL(MAERT.Staging, 0) AS Staging1
				,ISNULL(PPR.RANK_DESCRIPTION, 0) AS Performance
				,ISNULL(PPR1.RANK_DESCRIPTION, 0) AS Potential
				,ISNULL(OPPR.RANK_DESCRIPTION, 0) AS Overall_Rating
			FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE MAERT WITH (NOLOCK)
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR WITH (NOLOCK) ON MAERT.PERFORMANCE_RATING = PPR.ID
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR1 WITH (NOLOCK) ON MAERT.POTENTIAL_RATING = PPR1.ID
			INNER JOIN MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK) ON MAERT.OVERALL_RATING = OPPR.ID
			WHERE Employee_Id = @Empid
				AND MAERT.Appraisal_Process_Period_Id = @appraisal_process_period_id
		END

		IF @ViewStatus = 2
		BEGIN
			SELECT MAERT.Id
				,MAERT.Employee_Id
				,MAERT.Appraisal_Process_Period_Id
				,MAERT.Manager_Id
				,MAERT.Final_Evaluator_Id
				,MAERT.Self_KRA_Rating
				,MAERT.Evaluator_KRA_Rating
				,MAERT.Self_Skill_Rating
				,MAERT.Evaluator_Skill_Rating
				,MAERT.Final_Evaluator_KRA_Rating
				,MAERT.Final_Evaluator_Skill_Rating
				,MAERT.PERFORMANCE_RATING
				,MAERT.POTENTIAL_RATING
				,MAERT.OVERALL_RATING
				,MAERT.Self_Rating_Completion
				,MAERT.Evaluator_Rating_Completion
				,MAERT.Final_Rating_Completion
				,MAERT.FEEDBACK_CATEGORY
				,ISNULL(MAERT.Staging, 0) AS Staging1
				,ISNULL(PPR.RANK_DESCRIPTION, 0) AS Performance
				,ISNULL(PPR1.RANK_DESCRIPTION, 0) AS Potential
				,ISNULL(OPPR.RANK_DESCRIPTION, 0) AS Overall_Rating
			FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE MAERT WITH (NOLOCK)
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR WITH (NOLOCK) ON MAERT.PERFORMANCE_RATING = PPR.ID
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR1 WITH (NOLOCK) ON MAERT.POTENTIAL_RATING = PPR1.ID
			INNER JOIN MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK) ON MAERT.OVERALL_RATING = OPPR.ID
			WHERE Employee_Id = @Empid
				AND MAERT.Appraisal_Process_Period_Id = @appraisal_process_period_id
		END

		IF @ViewStatus = 1
		BEGIN
			SELECT MAERT.Id
				,MAERT.Employee_Id
				,MAERT.Appraisal_Process_Period_Id
				,MAERT.Manager_Id
				,MAERT.Final_Evaluator_Id
				,MAERT.Self_KRA_Rating
				,MAERT.Evaluator_KRA_Rating
				,MAERT.Self_Skill_Rating
				,MAERT.Evaluator_Skill_Rating
				,NULL AS PERFORMANCE_RATING
				,NULL AS POTENTIAL_RATING
				,NULL AS OVERALL_RATING
				,MAERT.Self_Rating_Completion
				,MAERT.Evaluator_Rating_Completion
				,MAERT.FEEDBACK_CATEGORY
				,ISNULL(MAERT.Staging, 0) AS Staging1
				,ISNULL(PPR.RANK_DESCRIPTION, 0) AS Performance
				,ISNULL(PPR1.RANK_DESCRIPTION, 0) AS Potential
				,ISNULL(OPPR.RANK_DESCRIPTION, 0) AS Overall_Rating
			FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE MAERT WITH (NOLOCK)
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR WITH (NOLOCK) ON MAERT.PERFORMANCE_RATING = PPR.ID
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR1 WITH (NOLOCK) ON MAERT.POTENTIAL_RATING = PPR1.ID
			INNER JOIN MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK) ON MAERT.OVERALL_RATING = OPPR.ID
			WHERE Employee_Id = @Empid
				AND MAERT.Appraisal_Process_Period_Id = @appraisal_process_period_id
				AND @CURRDATE BETWEEN ISNULL(MAERT.FINAL_RATING_COMPLETION, @CURRDATE)
					AND DATEADD(MONTH, 1, ISNULL(MAERT.FINAL_RATING_COMPLETION, @CURRDATE))
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[Get_Employee_Reporting_Managers]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Employee_Reporting_Managers] @EmployeeId BIGINT
AS
BEGIN
	SELECT emp.id
		,emp.Firstname
		,emp.Lastname
	FROM Employee_Reporting_Managers erm WITH (NOLOCK)
	INNER JOIN Employee emp WITH (NOLOCK) ON emp.id = erm.ManagerId
	WHERE EmployeeId = @EmployeeId
END
GO

/****** Object:  StoredProcedure [dbo].[GET_EMPLOYEEID]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GET_EMPLOYEEID] (
	@empid VARCHAR(255)
	,@email VARCHAR(255)
	)
AS
BEGIN
	DECLARE @value VARCHAR(255)
		,@value2 VARCHAR(255)

	SELECT @value = Employee_Id
	FROM Employee WITH (NOLOCK)
	WHERE Employee_Id = @empid

	SELECT @value2 = Email
	FROM Employee WITH (NOLOCK)
	WHERE Email = @email

	IF (
			@value IS NOT NULL
			OR @value != ''
			OR @value2 IS NOT NULL
			OR @value2 != ''
			)
	BEGIN
		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[Get_Employees]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Employees]
AS
BEGIN
	SELECT id
		,Employee_Id
		,Firstname
		,Lastname
		,Dateofjoin
		,Fathername
		,Maritalstatus
		,Spousename
		,Email
		,Mobile
		,Aadhar
		,Pancard
		,Designation
		,Gender
		,Dateofbirth
		,Nationality
		,Createdtime
		,PF_AccountNumber
		,PF_UAN
		,ESI_Number
		,ResignedOn
		,DepartmentId
	FROM Employee WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[GET_EVALUATORS_LIST]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_EVALUATORS_LIST]
AS
BEGIN
	SELECT emp.id AS ID
		,emp.Firstname + ' ' + emp.Lastname AS Evaluator_Name
		,desg.Designation AS [Designation]
	FROM Employee emp WITH (NOLOCK)
	LEFT JOIN MTS_Designation desg WITH (NOLOCK) ON desg.id = emp.Designation 
	LEFT JOIN MTS_AUTHORITY auth WITH (NOLOCK) ON auth.USERID = emp.id
	WHERE auth.ROLEID = 1 -- // 1 -> admin as Final Evaluator
	ORDER BY emp.Firstname + ' ' + emp.Lastname

	SELECT emp.id AS ID
		,emp.Firstname + ' ' + emp.Lastname AS Manager_Name
		,desg.Designation AS [Designation]
	FROM Employee emp WITH (NOLOCK)
	LEFT JOIN MTS_Designation desg WITH (NOLOCK) ON desg.id = emp.Designation
	LEFT JOIN MTS_AUTHORITY auth WITH (NOLOCK) ON auth.USERID = emp.id
	WHERE auth.ROLEID <> 2
		AND auth.ROLEID <> 4
	ORDER BY emp.Firstname + ' ' + emp.Lastname
END
GO

/****** Object:  StoredProcedure [dbo].[GET_FINAL_EVALUATOR_UNDER_EMPLOYEES_SELF_APPRAISAL_LIST]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GET_FINAL_EVALUATOR_UNDER_EMPLOYEES_SELF_APPRAISAL_LIST] (@MANAGER_ID BIGINT)
AS
BEGIN
	DECLARE @roleid BIGINT
		,@appraisal_process_period_id BIGINT

	SELECT @roleid = ROLEID
	FROM MTS_AUTHORITY ma WITH (NOLOCK)
	WHERE ma.USERID = @MANAGER_ID

	SELECT @appraisal_process_period_id = APD.Id
	FROM MTS_APPRAISAL_PROCESS_DETAILS APD WITH (NOLOCK)
	INNER JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE RT WITH (NOLOCK) ON RT.Appraisal_Process_Period_Id = APD.Id
	WHERE APD.Active = 2
		AND RT.Employee_Id = @MANAGER_ID

	SELECT emp.Id AS EMP_ID
		,emp.Employee_Id AS EMP_CODE
		,emp.Firstname + ' ' + emp.Lastname AS EMP_NAME
		,rt.Staging AS STAGING
		,desgn.Designation AS EMP_DESIGNATION
		,emp.Dateofjoin AS DOJ
		,rt.Self_KRA_Rating AS SELF_RATING
		,apd.Active
		,apd.Appraisal_Process_Period
		,apd.Id AS APPRAISAL_ID
		,rt.Manager_Id AS RATING_MANAGER_ID
	FROM Employee emp WITH (NOLOCK)
	LEFT JOIN Employee_Reporting_Managers erm WITH (NOLOCK) ON emp.id = erm.EmployeeId
	INNER JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt WITH (NOLOCK) ON rt.Employee_Id = emp.id
	INNER JOIN MTS_Designation desgn WITH (NOLOCK) ON desgn.id = emp.Designation
	INNER JOIN MTS_APPRAISAL_PROCESS_DETAILS apd WITH (NOLOCK) ON apd.Id = rt.Appraisal_Process_Period_Id
	WHERE rt.Final_Evaluator_Id = @MANAGER_ID
		AND apd.Active = 2
	GROUP BY emp.Id
		,emp.Employee_Id
		,emp.Firstname + ' ' + emp.Lastname
		,desgn.Designation
		,rt.Staging
		,emp.Dateofjoin
		,rt.Self_KRA_Rating
		,apd.Active
		,apd.Appraisal_Process_Period
		,apd.Id
		,rt.Manager_Id
END
GO

/****** Object:  StoredProcedure [dbo].[GET_MANAGER_UNDER_EMPLOYEES_SELF_APPRAISAL_LIST]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_MANAGER_UNDER_EMPLOYEES_SELF_APPRAISAL_LIST] (@MANAGER_ID BIGINT)
AS
BEGIN
	DECLARE @roleid BIGINT
		,@appraisal_process_period_id BIGINT

	SELECT @roleid = ROLEID
	FROM MTS_AUTHORITY ma WITH (NOLOCK)
	WHERE ma.USERID = @MANAGER_ID

	SELECT @appraisal_process_period_id = Id
	FROM MTS_APPRAISAL_PROCESS_DETAILS WITH (NOLOCK)
	WHERE Active = 2

	SELECT emp.Id AS EMP_ID
		,emp.Employee_Id AS EMP_CODE
		,emp.Firstname + ' ' + emp.Lastname AS EMP_NAME
		,rt.Staging AS STAGING
		,desgn.Designation AS EMP_DESIGNATION
		,emp.Dateofjoin AS DOJ
		,rt.Self_KRA_Rating AS SELF_RATING
		,apd.Active
		,apd.Appraisal_Process_Period
		,apd.Id AS APPRAISAL_ID
		,rt.Manager_Id AS RATING_MANAGER_ID
	FROM Employee_Reporting_Managers erm WITH (NOLOCK)
	RIGHT JOIN Employee emp WITH (NOLOCK) ON emp.id = erm.EmployeeId
	INNER JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt WITH (NOLOCK) ON rt.Employee_Id = emp.id
	INNER JOIN MTS_Designation desgn WITH (NOLOCK) ON desgn.id = emp.Designation
	INNER JOIN MTS_APPRAISAL_PROCESS_DETAILS apd WITH (NOLOCK) ON apd.Id = rt.Appraisal_Process_Period_Id
	WHERE (
			erm.ManagerId = @MANAGER_ID
			)
		AND apd.Active = 2
	GROUP BY emp.Id
		,emp.Employee_Id
		,emp.Firstname + ' ' + emp.Lastname
		,desgn.Designation
		,rt.Staging
		,emp.Dateofjoin
		,rt.Self_KRA_Rating
		,apd.Active
		,apd.Appraisal_Process_Period
		,apd.Id
		,rt.Manager_Id
END
GO

/****** Object:  StoredProcedure [dbo].[Get_Messages_Count]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Messages_Count]
AS
BEGIN
	--For Announcement
	SELECT COUNT(id) AS MessageCount
	FROM MTS_MESSAGES WITH (NOLOCK)
	WHERE CAST(GETDATE() AS DATE) BETWEEN Fromdate
			AND ToDate
		AND MTS_MESSAGES.[Status] = 1
		AND MTS_MESSAGES.MessageStatus = 1

	--For TeamAnnouncement
	SELECT COUNT(id) AS TeamMessageCount
	FROM MTS_MESSAGES WITH (NOLOCK)
	WHERE CAST(GETDATE() AS DATE) BETWEEN Fromdate
			AND ToDate
		AND MTS_MESSAGES.[Status] = 1
		AND MTS_MESSAGES.MessageStatus = 2

	--For NewJoiners
	SELECT COUNT(Employee.id) AS NewJoinersCount
	FROM Employee WITH (NOLOCK)
	INNER JOIN MTS_LOGIN ML WITH (NOLOCK) ON ML.USERID = Employee.id
	WHERE Dateofjoin > DATEADD(month, - 1, GETDATE())
		AND ML.ACTIVE = 1
END
GO

/****** Object:  StoredProcedure [dbo].[Get_SelfAppraisal_TabName]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_SelfAppraisal_TabName] (
	@emp_id BIGINT
	,@isSelfDirectAppraisalPage BIT
	,@viewStatus BIGINT
	,@APPRAISAL_ID BIGINT
	)
AS
BEGIN
	DECLARE @EMP_NAME VARCHAR(255)
		,@EMP_CODE VARCHAR(20)
		,@EMP_DESIGNATION VARCHAR(30)
		,@APPRAISAL_DESCRIPTION VARCHAR(30)
	DECLARE @appraisal_process_period_id BIGINT
		,@CURRDATE DATETIME = getdate();

	IF ISNULL(@APPRAISAL_ID, 0) = 0
	BEGIN
		SELECT @appraisal_process_period_id = APD.Id
		FROM MTS_APPRAISAL_PROCESS_DETAILS APD WITH (NOLOCK)
		INNER JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE RT WITH (NOLOCK) ON RT.Appraisal_Process_Period_Id = APD.Id
		WHERE APD.Active = 2
			AND RT.Employee_Id = @emp_id
	END
	ELSE
	BEGIN
		SELECT @appraisal_process_period_id = @APPRAISAL_ID
	END

	SELECT @EMP_CODE = emp.Employee_Id
		,@EMP_NAME = emp.Firstname + ' ' + emp.Lastname
		,@EMP_DESIGNATION = mts_desg.Designation
		,@APPRAISAL_DESCRIPTION = APD.Appraisal_Process_Period
	FROM Employee emp
	INNER JOIN MTS_Designation mts_desg WITH (NOLOCK) ON mts_desg.id = emp.Designation
	INNER JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE RT WITH (NOLOCK) ON RT.Employee_Id = emp.Id
	INNER JOIN MTS_APPRAISAL_PROCESS_DETAILS APD WITH (NOLOCK) ON APD.Id = RT.Appraisal_Process_Period_Id
	WHERE emp.id = @emp_id
		AND RT.Appraisal_Process_Period_Id = @appraisal_process_period_id

	SELECT @EMP_NAME AS [EMP_NAME]
		,@EMP_CODE AS EMP_CODE
		,@EMP_DESIGNATION AS EMP_DESIGNATION
		,@APPRAISAL_DESCRIPTION AS [APPRAISAL_DESCRIPTION]
		,AEP.[Employee_Id]
		,AEP.[PerformanceTypeID]
		,APT.[PerformanceType]
	FROM MTS_Appraisal_Employee_Mapping AEP WITH (NOLOCK)
	INNER JOIN MTS_Appraisal_PerformanceType APT WITH (NOLOCK) ON AEP.PerformanceTypeID = APT.Id
	WHERE AEP.[Employee_Id] = @emp_id
	GROUP BY AEP.[Employee_Id]
		,AEP.[PerformanceTypeID]
		,APT.[PerformanceType]
	ORDER BY AEP.[PerformanceTypeID]

	DECLARE @employee_Id VARCHAR(50)
		,@performanceTypeID BIGINT
		,@performanceType VARCHAR(50)
	DECLARE @roleid BIGINT
		,@manager_id BIGINT
		,@status BIGINT
		,@moderator_id BIGINT

	SELECT @employee_Id = AEP.[Employee_Id]
		,@performanceTypeID = AEP.[PerformanceTypeID]
		,@performanceType = APT.[PerformanceType]
	FROM MTS_Appraisal_Employee_Mapping AEP WITH (NOLOCK)
	INNER JOIN MTS_Appraisal_PerformanceType APT WITH (NOLOCK) ON AEP.PerformanceTypeID = APT.Id
	WHERE AEP.[Employee_Id] = @emp_id
	GROUP BY AEP.[Employee_Id]
		,AEP.[PerformanceTypeID]
		,APT.[PerformanceType]
	ORDER BY AEP.[PerformanceTypeID]

	SELECT @status = ISNULL(Staging, 0)
	FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE WITH (NOLOCK)
	WHERE Employee_Id = @emp_id

	IF @isSelfDirectAppraisalPage = 1
	BEGIN
		IF (
				@status = 0
				OR @status <= 2
				)
			SELECT AEM.Id
				,AEM.[Employee_Id]
				,AEM.[PerformanceTypeID]
				,AEM.[Description] AS DescriptionID
				,ASM.Description
				,AEM.[Weightage]
				,AEM.[EmployeeWeightage]
				,SUMM.Self_Summary
				,rt.Staging
				,SUMM.Created_Date
				,rt.Self_Rating_Completion
				,rt.Appraisal_Process_Period_Id
			FROM MTS_Appraisal_Employee_Mapping AEM WITH (NOLOCK)
			INNER JOIN MTS_Appraisal_SkillKRAMapping ASM WITH (NOLOCK) ON AEM.Description = ASM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_MANAGER_SUMMARY SUMM WITH (NOLOCK) ON SUMM.Employee_Id = AEM.Employee_Id
				AND SUMM.Employee_Mapping_Id = AEM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt WITH (NOLOCK) ON rt.Employee_Id = AEM.Employee_Id
				AND rt.Appraisal_Process_Period_Id = AEM.Appraisal_Process_Period_Id
			WHERE AEM.[Employee_Id] = @emp_id
				AND @CURRDATE BETWEEN ISNULL(RT.FINAL_RATING_COMPLETION, @CURRDATE)
					AND DATEADD(MONTH, 1, ISNULL(RT.FINAL_RATING_COMPLETION, @CURRDATE))
				AND AEM.Appraisal_Process_Period_Id = @appraisal_process_period_id
			ORDER BY ASM.id
				,AEM.Id

		IF (@status = 3)
			SELECT AEM.Id
				,AEM.[Employee_Id]
				,AEM.[PerformanceTypeID]
				,AEM.[Description] AS DescriptionID
				,ASM.Description
				,AEM.[Weightage]
				,AEM.[EmployeeWeightage]
				,AEM.[ManagerWeightage]
				,AEM.FinalEvaluatorWeightage
				,rt.Manager_Id
				,rt.Final_Evaluator_Id
				,SUMM.Self_Summary
				,SUMM.Manager_Summary
				,SUMM.FinalEvaluator_Summary
				,rt.Staging
				,SUMM.Created_Date
				,rt.Self_Rating_Completion
				,rt.Appraisal_Process_Period_Id
			FROM MTS_Appraisal_Employee_Mapping AEM WITH (NOLOCK)
			INNER JOIN MTS_Appraisal_SkillKRAMapping ASM WITH (NOLOCK) ON AEM.Description = ASM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_MANAGER_SUMMARY SUMM WITH (NOLOCK) ON SUMM.Employee_Id = AEM.Employee_Id
				AND SUMM.Employee_Mapping_Id = AEM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt WITH (NOLOCK) ON rt.Employee_Id = AEM.Employee_Id
				AND rt.Appraisal_Process_Period_Id = AEM.Appraisal_Process_Period_Id
			WHERE AEM.[Employee_Id] = @emp_id
				AND AEM.Appraisal_Process_Period_Id = @appraisal_process_period_id
				AND @CURRDATE BETWEEN ISNULL(RT.FINAL_RATING_COMPLETION, @CURRDATE)
					AND DATEADD(MONTH, 1, ISNULL(RT.FINAL_RATING_COMPLETION, @CURRDATE))
			ORDER BY ASM.id
				,AEM.Id
	END

	IF @isSelfDirectAppraisalPage = 0
	BEGIN
		IF (@viewStatus = 1)
		BEGIN
			SELECT @roleid = 3;
		END

		IF (@viewStatus = 2)
		BEGIN
			SELECT @roleid = 1;
		END

		IF @roleid = 1
			SELECT AEM.Id
				,AEM.[Employee_Id]
				,AEM.[PerformanceTypeID]
				,AEM.[Description] AS DescriptionID
				,ASM.Description
				,AEM.[Weightage]
				,AEM.[EmployeeWeightage]
				,AEM.[ManagerWeightage]
				,AEM.FinalEvaluatorWeightage
				,rt.Manager_Id
				,rt.Final_Evaluator_Id
				,SUMM.Self_Summary
				,SUMM.Manager_Summary
				,SUMM.FinalEvaluator_Summary
				,rt.Staging
				,SUMM.Created_Date
				,rt.Evaluator_Rating_Completion
				,rt.Final_Rating_Completion
				,rt.Appraisal_Process_Period_Id
				,ISNULL(LOWER(SFC.FEEDBACK_CATEGORY), '') AS FEEDBACK_CATEGORY
			FROM MTS_Appraisal_Employee_Mapping AEM WITH (NOLOCK)
			INNER JOIN MTS_Appraisal_SkillKRAMapping ASM WITH (NOLOCK) ON AEM.Description = ASM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_MANAGER_SUMMARY SUMM WITH (NOLOCK) ON SUMM.Employee_Id = AEM.Employee_Id
				AND SUMM.Employee_Mapping_Id = AEM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt WITH (NOLOCK) ON rt.Employee_Id = AEM.Employee_Id
				AND rt.Appraisal_Process_Period_Id = AEM.Appraisal_Process_Period_Id
			LEFT JOIN MTS_APPRAISAL_SUMMARY_FEEDBACK_CATEGORY SFC WITH (NOLOCK) ON rt.FEEDBACK_CATEGORY = SFC.FEEDBACK_CATEGORY_ID
			WHERE AEM.[Employee_Id] = @emp_id
				AND AEM.Appraisal_Process_Period_Id = @appraisal_process_period_id
			ORDER BY ASM.id
				,AEM.Id

		IF @roleid = 3
			AND @status <= 2
			SELECT AEM.Id
				,AEM.[Employee_Id]
				,AEM.[PerformanceTypeID]
				,AEM.[Description] AS DescriptionID
				,ASM.Description
				,AEM.[Weightage]
				,AEM.[EmployeeWeightage]
				,AEM.[ManagerWeightage]
				,rt.Manager_Id
				,SUMM.Self_Summary
				,SUMM.Manager_Summary
				,rt.Staging
				,SUMM.Created_Date
				,rt.Evaluator_Rating_Completion
				,rt.Appraisal_Process_Period_Id
				,ISNULL(LOWER(SFC.FEEDBACK_CATEGORY), '') AS FEEDBACK_CATEGORY
			FROM MTS_Appraisal_Employee_Mapping AEM WITH (NOLOCK)
			INNER JOIN MTS_Appraisal_SkillKRAMapping ASM WITH (NOLOCK) ON AEM.Description = ASM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_MANAGER_SUMMARY SUMM WITH (NOLOCK) ON SUMM.Employee_Id = AEM.Employee_Id
				AND SUMM.Employee_Mapping_Id = AEM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt WITH (NOLOCK) ON rt.Employee_Id = AEM.Employee_Id
				AND rt.Appraisal_Process_Period_Id = AEM.Appraisal_Process_Period_Id
			LEFT JOIN MTS_APPRAISAL_SUMMARY_FEEDBACK_CATEGORY SFC WITH (NOLOCK) ON rt.FEEDBACK_CATEGORY = SFC.FEEDBACK_CATEGORY_ID
			WHERE AEM.[Employee_Id] = @emp_id
				AND AEM.Appraisal_Process_Period_Id = @appraisal_process_period_id
				AND @CURRDATE BETWEEN ISNULL(RT.FINAL_RATING_COMPLETION, @CURRDATE)
					AND DATEADD(MONTH, 1, ISNULL(RT.FINAL_RATING_COMPLETION, @CURRDATE))
			ORDER BY ASM.id
				,AEM.Id

		IF @roleid = 3
			AND @status = 3
			SELECT AEM.Id
				,AEM.[Employee_Id]
				,AEM.[PerformanceTypeID]
				,AEM.[Description] AS DescriptionID
				,ASM.Description
				,AEM.[Weightage]
				,AEM.[EmployeeWeightage]
				,AEM.[ManagerWeightage]
				,AEM.FinalEvaluatorWeightage
				,rt.Manager_Id
				,rt.Final_Evaluator_Id
				,SUMM.Self_Summary
				,SUMM.Manager_Summary
				,SUMM.FinalEvaluator_Summary
				,rt.Staging
				,SUMM.Created_Date
				,rt.Evaluator_Rating_Completion
				,rt.Appraisal_Process_Period_Id
				,ISNULL(LOWER(SFC.FEEDBACK_CATEGORY), '') AS FEEDBACK_CATEGORY
			FROM MTS_Appraisal_Employee_Mapping AEM WITH (NOLOCK)
			INNER JOIN MTS_Appraisal_SkillKRAMapping ASM WITH (NOLOCK) ON AEM.Description = ASM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_MANAGER_SUMMARY SUMM WITH (NOLOCK) ON SUMM.Employee_Id = AEM.Employee_Id
				AND SUMM.Employee_Mapping_Id = AEM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt WITH (NOLOCK) ON rt.Employee_Id = AEM.Employee_Id
				AND rt.Appraisal_Process_Period_Id = AEM.Appraisal_Process_Period_Id
			LEFT JOIN MTS_APPRAISAL_SUMMARY_FEEDBACK_CATEGORY SFC WITH (NOLOCK) ON rt.FEEDBACK_CATEGORY = SFC.FEEDBACK_CATEGORY_ID
			WHERE AEM.[Employee_Id] = @emp_id
				AND AEM.Appraisal_Process_Period_Id = @appraisal_process_period_id
				AND @CURRDATE BETWEEN ISNULL(RT.FINAL_RATING_COMPLETION, @CURRDATE)
					AND DATEADD(MONTH, 1, ISNULL(RT.FINAL_RATING_COMPLETION, @CURRDATE))
			ORDER BY ASM.id
				,AEM.Id
	END
END
GO

/****** Object:  StoredProcedure [dbo].[GETLASTEMPLOYEEID]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GETLASTEMPLOYEEID]
AS
BEGIN
	SELECT TOP 1 Employee_Id
	FROM Employee WITH (NOLOCK)
	ORDER BY Employee_Id DESC
END
GO

/****** Object:  StoredProcedure [dbo].[GETLEAVETYPEBYLEAVECODE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GETLEAVETYPEBYLEAVECODE] (
	@leaveCode VARCHAR(100)
	,@departmentid BIGINT
	)
AS
BEGIN
	SELECT *
	FROM MTS_LeaveType WITH (NOLOCK)
	WHERE Leavetype = @leaveCode
		AND DepartmentId = @departmentid
END
GO

/****** Object:  StoredProcedure [dbo].[GETNUMBEROFDAYS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GETNUMBEROFDAYS] (
	@leavefromdate DATETIME
	,@leavetodate DATETIME
	,@fromsession VARCHAR(255)
	,@tosession VARCHAR(255)
	)
AS
BEGIN
	SELECT dbo.NumberOfDays(@leavefromdate, @leavetodate, @fromsession, @tosession)
END
GO

/****** Object:  StoredProcedure [dbo].[GETPENDINGLEAVES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GETPENDINGLEAVES] (
	@empid BIGINT
	,@leavetype BIGINT
	,@approval BIGINT
	)
AS
BEGIN
	DECLARE @NumberOfDays BIGINT = (
			SELECT sum(numberofdays)
			FROM Employee_Leave WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND LeaveType = @leavetype
				AND Approval = @approval
			)

	SELECT ISNULL(@NumberOfDays, 0)
END
GO

/****** Object:  StoredProcedure [dbo].[GETUSERID]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GETUSERID] (@empid VARCHAR(255))
AS
BEGIN
	SELECT id
	FROM Employee WITH (NOLOCK)
	WHERE Employee_Id = @empid
END
GO

/****** Object:  StoredProcedure [dbo].[ID_NAME]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ID_NAME] (@email VARCHAR(255))
AS
BEGIN
	SELECT e.Employee_Id
	FROM Employee AS e WITH (NOLOCK)
	WHERE (e.Email = @email)

	SELECT *
	FROM MTS_Session WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[INSERT_APPROVAL_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[INSERT_APPROVAL_DETAILS] (
	@MODULE BIGINT
	,@STATUS BIGINT
	,@FROM_USERID BIGINT
	,@TO_USERID BIGINT
	,@PARAMETERS VARCHAR(MAX)
	,@REMARKS VARCHAR(MAX)
	,@EmployeeID BIGINT
	)
AS
BEGIN
	DECLARE @TO_INBOX BIT = 1
	DECLARE @NOT_TO_INBOX BIT = 0

	IF NOT EXISTS (
			SELECT *
			FROM MTS_APPROVAL_HEADER WITH (NOLOCK)
			WHERE MODULE = @MODULE
				AND [PARAMETERS] = @PARAMETERS
			)
	BEGIN
		INSERT INTO MTS_APPROVAL_HEADER
		VALUES (
			@MODULE
			,@STATUS
			,GETDATE()
			,@PARAMETERS
			,@FROM_USERID
			,@EmployeeID
			)
	END
	ELSE
	BEGIN
		IF @STATUS = 2
			OR @STATUS = 3
			OR @STATUS = 0
		BEGIN
			UPDATE MTS_APPROVAL_HEADER
			SET [STATUS] = @STATUS
				,[DATE] = GETDATE()
				,MODIFIED_USER_ID = @FROM_USERID
			WHERE MODULE = @MODULE
				AND [PARAMETERS] = @PARAMETERS
		END
	END

	IF EXISTS (
			SELECT *
			FROM MTS_APPROVAL_HEADER WITH (NOLOCK)
			WHERE MODULE = @MODULE
				AND [PARAMETERS] = @PARAMETERS
			)
	BEGIN
		IF EXISTS (
				SELECT *
				FROM MTS_APPROVAL_DETAILS WITH (NOLOCK)
				WHERE MODULE = @MODULE
					AND [PARAMETERS] = @PARAMETERS
				)
		BEGIN
			UPDATE MTS_APPROVAL_DETAILS
			SET TO_INBOX_FLAG = @NOT_TO_INBOX
			WHERE MODULE = @MODULE
				AND [PARAMETERS] = @PARAMETERS
		END

		INSERT INTO MTS_APPROVAL_DETAILS
		VALUES (
			@MODULE
			,(
				SELECT ACTIVITY_ID
				FROM MTS_APPROVAL_HEADER WITH (NOLOCK)
				WHERE MODULE = @MODULE
					AND [PARAMETERS] = @PARAMETERS
				)
			,@STATUS
			,@FROM_USERID
			,@TO_USERID
			,GETDATE()
			,@PARAMETERS
			,@REMARKS
			,@TO_INBOX
			)
	END

	-- Module 1
	IF @MODULE = 1
		AND @STATUS = 2
	BEGIN
		DECLARE @ID VARCHAR(MAX)
		DECLARE @DATE VARCHAR(MAX)
		DECLARE @EFF_MONTH VARCHAR(MAX)
		DECLARE @EFF_YEAR VARCHAR(MAX)

		-- Get ID from @parameters
		SELECT TOP 1 @ID = VALUE
		FROM STRING_SPLIT(@PARAMETERS, ',')

		-- Get Effective_since from @parameters
		SELECT TOP 1 @DATE = VALUE
		FROM STRING_SPLIT(@PARAMETERS, ',')
		ORDER BY VALUE DESC

		-- Get month from Effective_since
		SELECT TOP 1 @EFF_MONTH = VALUE
		FROM STRING_SPLIT(@DATE, '-')
		ORDER BY VALUE DESC

		-- Get year from Effective_since
		SELECT TOP 1 @EFF_YEAR = VALUE
		FROM STRING_SPLIT(@DATE, '-')
		ORDER BY VALUE

		IF EXISTS (
				SELECT *
				FROM MTS_PAYROLL_EMPLOYEE_EARNINGS WITH (NOLOCK)
				WHERE CAST(EMP_ID AS VARCHAR(MAX)) = @ID
					AND MONTH(EFFECTIVE_SINCE) = MONTH(@EFF_MONTH + @EFF_YEAR)
					AND YEAR(EFFECTIVE_SINCE) = YEAR(@EFF_MONTH + @EFF_YEAR)
				)
		BEGIN
			UPDATE MTS_PAYROLL_EMPLOYEE_EARNINGS
			SET ACTIVE = 0
			WHERE CAST(EMP_ID AS VARCHAR(MAX)) = @ID

			UPDATE MTS_PAYROLL_EMPLOYEE_EARNINGS
			SET IS_APPROVED = 1
				,ACTIVE = 1
			WHERE ID = (
					SELECT TOP 1 ID
					FROM MTS_PAYROLL_EMPLOYEE_EARNINGS
					WHERE CAST(EMP_ID AS VARCHAR(MAX)) = @ID
						AND MONTH(EFFECTIVE_SINCE) = MONTH(@EFF_MONTH + @EFF_YEAR)
						AND YEAR(EFFECTIVE_SINCE) = YEAR(@EFF_MONTH + @EFF_YEAR)
					ORDER BY ID DESC
					)
		END

		IF EXISTS (
				SELECT *
				FROM MTS_PAYROLL_EMPLOYEE_DEDUCTIONS WITH (NOLOCK)
				WHERE CAST(EMP_ID AS VARCHAR(MAX)) = @ID
					AND MONTH(EFFECTIVE_SINCE) = MONTH(@EFF_MONTH + @EFF_YEAR)
					AND YEAR(EFFECTIVE_SINCE) = YEAR(@EFF_MONTH + @EFF_YEAR)
				)
		BEGIN
			UPDATE MTS_PAYROLL_EMPLOYEE_DEDUCTIONS
			SET ACTIVE = 0
			WHERE CAST(EMP_ID AS VARCHAR(MAX)) = @ID

			UPDATE MTS_PAYROLL_EMPLOYEE_DEDUCTIONS
			SET IS_APPROVED = 1
				,ACTIVE = 1
			WHERE ID = (
					SELECT TOP 1 ID
					FROM MTS_PAYROLL_EMPLOYEE_EARNINGS
					WHERE CAST(EMP_ID AS VARCHAR(MAX)) = @ID
						AND MONTH(EFFECTIVE_SINCE) = MONTH(@EFF_MONTH + @EFF_YEAR)
						AND YEAR(EFFECTIVE_SINCE) = YEAR(@EFF_MONTH + @EFF_YEAR)
					ORDER BY ID DESC
					)
		END
	END

	--Module 2
	IF EXISTS (
			SELECT *
			FROM MTS_APPROVAL_DETAILS WITH (NOLOCK)
			WHERE MODULE = 2
				AND STATUS = 2
				AND @STATUS = 2
			)
	BEGIN
		DECLARE @MONTH VARCHAR(50)
			,@YEAR VARCHAR(4)
		DECLARE @APPROVE_ID BIGINT = (
				SELECT TOP 1 ID
				FROM MTS_APPROVAL_DETAILS
				WHERE MODULE = 2
					AND @MODULE = 2
					AND @MODULE = MODULE
					AND STATUS = 2
				ORDER BY ID DESC
				)

		SET @MONTH = (
				SELECT TOP 1 value AS name
				FROM MTS_APPROVAL_DETAILS WITH (NOLOCK)
				CROSS APPLY STRING_SPLIT(PARAMETERS, '-')
				WHERE ID = @APPROVE_ID
				ORDER BY 1 DESC
				)
		SET @YEAR = (
				SELECT TOP 1 value AS name
				FROM MTS_APPROVAL_DETAILS WITH (NOLOCK)
				CROSS APPLY STRING_SPLIT(PARAMETERS, '-')
				WHERE ID = @APPROVE_ID
				ORDER BY 1 ASC
				)
		SET @MONTH = DATEPART(MM, CONCAT (
					@MONTH
					,' '
					,@YEAR
					))

		EXEC UPDATE_PAYROLL_CLOSE_MONTH @MONTH
			,@YEAR
	END
END
GO

/****** Object:  StoredProcedure [dbo].[INSERT_UPDATE_IT_DECLARATION_HEADER]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[INSERT_UPDATE_IT_DECLARATION_HEADER] (
	@Employee_id BIGINT
	,@Financial_Year BIGINT
	,@IT_Declaration_Enabled BIT
	,@payable_tax DECIMAL(18, 2)
	)
AS
BEGIN
	IF EXISTS (
			SELECT 1
			FROM MTS_IT_DECLARATION_EMPLOYEE_DETAILS WITH (NOLOCK)
			WHERE Employee_id = @Employee_Id
				AND Financial_Year = @Financial_Year
			)
	BEGIN
		UPDATE MTS_IT_DECLARATION_EMPLOYEE_DETAILS
		SET Employee_id = @Employee_Id
			,Financial_Year = @Financial_Year
			,IT_Declaration_Enabled = @IT_Declaration_Enabled
			,payable_tax = @payable_tax
	END
	ELSE
	BEGIN
		INSERT INTO MTS_IT_DECLARATION_EMPLOYEE_DETAILS (
			Employee_id
			,Financial_Year
			,IT_Declaration_Enabled
			,payable_tax
			)
		VALUES (
			@Employee_id
			,@Financial_Year
			,@IT_Declaration_Enabled
			,@payable_tax
			)
	END
END
GO

/****** Object:  StoredProcedure [dbo].[LEAVE_APPROVE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LEAVE_APPROVE] (
	@status BIGINT
	,@primaryid BIGINT
	,@approvedby BIGINT
	,@approval BIGINT
	,@empid BIGINT
	,@fromdate DATE
	,@todate DATE
	,@leavetype BIGINT
	,@reason VARCHAR(255)
	,@Numberofdays FLOAT
	,@year VARCHAR(255)
	,@month VARCHAR(255)
	,@leave_availed_advance FLOAT
	,@EmployeeLeaveBalanceyear VARCHAR(255)
	)
AS
BEGIN
	DECLARE @Leave_Type BIGINT
	DECLARE @TEMPLATEID BIGINT = (
			SELECT TemplateID
			FROM MTS_EmailTemplate WITH (NOLOCK)
			WHERE TemplateName = 'EMAIL_LEAVE_APPROVE'
			)
	DECLARE @dateofjoin DATE = (
			SELECT DateofJoin
			FROM Employee WITH (NOLOCK)
			WHERE id = @empid
			)
	DECLARE @empemail VARCHAR(255) = (
			SELECT Email
			FROM Employee WITH (NOLOCK)
			WHERE id = @empid
			)
	DECLARE @employeeid VARCHAR(255) = (
			SELECT Employee_Id
			FROM Employee WITH (NOLOCK)
			WHERE id = @empid
			)
	DECLARE @managerid VARCHAR(255) = (
			SELECT Employee_Id
			FROM Employee WITH (NOLOCK)
			WHERE id = @approvedby
			)
	DECLARE @empname VARCHAR(255) = (
			SELECT Firstname + ' ' + Lastname AS EmployeeName
			FROM Employee WITH (NOLOCK)
			WHERE id = @empid
			)
	DECLARE @managername VARCHAR(255) = (
			SELECT Firstname + ' ' + Lastname AS EmployeeName
			FROM Employee WITH (NOLOCK)
			WHERE id = @approvedby
			)
	DECLARE @EMAILSP VARCHAR(max) = cast(@empemail AS VARCHAR(255)) + ',' + cast(@employeeid AS VARCHAR(255)) + ',' + cast(@empname AS VARCHAR(255)) + ',' + cast(@dateofjoin AS VARCHAR(255)) + ',' + cast(@fromdate AS VARCHAR(255)) + ',' + cast(@todate AS VARCHAR(255)) + ',' + cast(@leavetype AS VARCHAR(255)) + ',' + cast(@reason AS VARCHAR(255)) + ',' + cast(@approval AS VARCHAR(255)) + ',' + cast(@managerid AS VARCHAR(255)) + ',' + cast(@managername AS VARCHAR(255))
	DECLARE @leavebalance DECIMAL(10, 1)
	DECLARE @NumberLeaveApprored DECIMAL(10, 1)
	DECLARE @NumberLeaves DECIMAL(10, 1)

	IF (
			@status = 1
			OR @status = 3
			OR @status = 2
			)
	BEGIN
		DECLARE @NumberofAvailableLeave DECIMAL(10, 1)
		DECLARE @NumberLeaveTaken DECIMAL(10, 1)
		DECLARE @leave_balance DECIMAL(10, 1)

		SELECT @NumberLeaves = (
				SELECT leavebalance
				FROM Employeeleavebalance WITH (NOLOCK)
				WHERE Employee_Id = @empid
					AND LeaveType = @leavetype
					AND Year = year(@fromdate)
				)

		IF (year(@fromdate) > 2019)
		BEGIN
			SELECT @NumberLeaveApprored = isnull(Sum(Numberofdays), 0)
			FROM Employee_leave WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND Approval IN (2)
				AND LeaveType = @leavetype
				AND YEAR(FromDate) = year(@fromdate)
		END
		ELSE
		BEGIN
			SELECT @NumberLeaveApprored = isnull(Sum(Numberofdays), 0)
			FROM EMPLOYEE_LEAVE_DETAILS WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND Approval IN (2)
				AND LeaveType = @leavetype
				AND YEAR(FromDate) = year(@fromdate)
		END

		SELECT @leavebalance = isnull(@NumberLeaves - @NumberLeaveApprored, 0)

		EXEC Create_Leave_Report @status
			,@leavetype
			,@empid
			,@year
			,@month
			,@leavebalance
			,@Numberofdays

		UPDATE Employee_Leave
		SET ApprovedBy = @approvedby
			,Approval = @approval
			,ApprovedDate = getdate()
		WHERE Employee_Id = @empid
			AND id = @primaryid

		DECLARE @LEAVE_ID BIGINT
			,@ADVANCE_CREDIT DECIMAL(10, 1)

		SELECT @ADVANCE_CREDIT = (ISNULL(AdvanceCredit, 0) - isnull(AdvanceAvailed, 0))
		FROM EmployeeLeaveBalance WITH (NOLOCK)
		WHERE Employee_Id = @empid
			AND LeaveType = @leavetype
			AND Year = year(@fromdate)

		DECLARE Cur_LeaveId CURSOR STATIC
		FOR
		SELECT Id
		FROM EMPLOYEE_LEAVE_DETAILS
		WHERE LeaveId = @primaryid

		OPEN Cur_LeaveId

		IF @@CURSOR_ROWS > 0
		BEGIN
			FETCH NEXT
			FROM Cur_LeaveId
			INTO @LEAVE_ID

			WHILE @@FETCH_STATUS = 0
			BEGIN
				IF @leavebalance >= 0
				BEGIN
					UPDATE EMPLOYEE_LEAVE_DETAILS
					SET ApprovedBy = @approvedby
						,Approval = @approval
						,ApprovedDate = getdate()
						,AdvanceCredit = 0
					WHERE Employee_Id = @empid
						AND LeaveId = @primaryid
						AND Id = @LEAVE_ID
				END
				ELSE IF (@leavebalance + @ADVANCE_CREDIT) >= 0
				BEGIN
					UPDATE EMPLOYEE_LEAVE_DETAILS
					SET ApprovedBy = @approvedby
						,Approval = @approval
						,ApprovedDate = getdate()
						,AdvanceCredit = 1
					WHERE Employee_Id = @empid
						AND LeaveId = @primaryid
						AND Id = @LEAVE_ID
				END
				ELSE
				BEGIN
					UPDATE EMPLOYEE_LEAVE_DETAILS
					SET ApprovedBy = @approvedby
						,Approval = @approval
						,ApprovedDate = getdate()
						,AdvanceCredit = 0
					WHERE Employee_Id = @empid
						AND LeaveId = @primaryid
						AND Id = @LEAVE_ID
				END

				FETCH NEXT
				FROM Cur_LeaveId
				INTO @LEAVE_ID
			END
		END

		DEALLOCATE Cur_LeaveId

		IF (@leave_availed_advance > 0)
		BEGIN
			UPDATE EmployeeLeavebalance
			SET AdvanceAvailed = @leave_availed_advance
			WHERE Employee_Id = @empid
				AND LeaveType = @leavetype
				AND Year = year(@fromdate)
		END
	END

	EXEC MTS_ADDEMAILMASTERENTRY @TEMPLATEID
		,@EMAILSP

	IF (year(@fromdate) <> @EmployeeLeaveBalanceyear)
	BEGIN
		DECLARE @PREVIOUSLEAVEBALANCE INT = 0
		DECLARE @TAKENLEAVE INT = 0
		DECLARE @AVAILABLELEAVEBALANCE INT = 0
		DECLARE @CARRYFORWARDLEAVECOUNT INT = 0
		DECLARE @EmployeeLeave_ApproredLeaveType INT = 2
		DECLARE @ADVANCEAVAILED INT
		DECLARE @NOD_LEAVE INT
		DECLARE @EMP_DEPARTMENT INT
		DECLARE @LeaveCode VARCHAR(20)
		DECLARE @Max_Allowed_Balance INT = 0

		SELECT @EMP_DEPARTMENT = DepartmentId
		FROM Employee
		WHERE id = @empid

		DECLARE ACCURAL_LEAVECALC_CURSOR CURSOR
		FOR
		SELECT LeaveType
		FROM EmployeeLeaveBalance
		WHERE Employee_Id = @empid
			AND LeaveType IN (
				SELECT ID
				FROM MTS_LeaveType
				WHERE Leavetype IN (
						SELECT LEAVE_CODE
						FROM MTS_LeavePolicy
						WHERE ACCURAL = 1
						)
					AND DepartmentId = @EMP_DEPARTMENT
				)
			AND Year = (year(GETDATE()) - 1)

		OPEN ACCURAL_LEAVECALC_CURSOR

		FETCH NEXT
		FROM ACCURAL_LEAVECALC_CURSOR
		INTO @Leave_Type

		WHILE @@FETCH_STATUS = 0
		BEGIN
			SELECT @NOD_LEAVE = Numberofdays
			FROM MTS_LeaveType
			WHERE id = @Leave_Type
				AND DepartmentId = @EMP_DEPARTMENT

			SELECT @PREVIOUSLEAVEBALANCE = Leavebalance
			FROM EmployeeLeaveBalance
			WHERE Employee_Id = @empid
				AND LeaveType = @Leave_Type
				AND Year = (year(GETDATE()) - 1)

			IF (YEAR(getdate()) < 2020)
			BEGIN
				SELECT @TAKENLEAVE = SUM(Numberofdays)
				FROM Employee_leave
				WHERE Employee_Id = @empid
					AND Approval = @EmployeeLeave_ApproredLeaveType
					AND isLOP = 0
					AND LeaveType = @Leave_Type
					AND year(FromDate) = (year(GETDATE()) - 1)
			END
			ELSE
			BEGIN
				SELECT @TAKENLEAVE = SUM(Numberofdays)
				FROM EMPLOYEE_LEAVE_DETAILS
				WHERE Employee_Id = @empid
					AND Approval = @EmployeeLeave_ApproredLeaveType
					AND isLOP = 0
					AND LeaveType = @Leave_Type
					AND year(FromDate) = (year(GETDATE()) - 1)
			END

			SELECT @LeaveCode = Leavetype
			FROM MTS_LeaveType
			WHERE id = @Leave_Type

			SELECT @Max_Allowed_Balance = MAX_ALLOWED_BALANCE
			FROM MTS_LeavePolicy
			WHERE LEAVE_CODE = @LeaveCode

			IF (@PREVIOUSLEAVEBALANCE - @TAKENLEAVE > 0)
			BEGIN
				SET @AVAILABLELEAVEBALANCE = @PREVIOUSLEAVEBALANCE - @TAKENLEAVE

				IF (@AVAILABLELEAVEBALANCE < @Max_Allowed_Balance)
				BEGIN
					SET @CARRYFORWARDLEAVECOUNT = @AVAILABLELEAVEBALANCE
				END
				ELSE
				BEGIN
					SET @CARRYFORWARDLEAVECOUNT = @Max_Allowed_Balance
				END
			END

			SELECT @ADVANCEAVAILED = AdvanceAvailed
			FROM EmployeeLeaveBalance
			WHERE Employee_Id = @empid
				AND LeaveType = @Leave_Type
				AND Year = (year(GETDATE()) - 1)

			IF @ADVANCEAVAILED IS NULL
			BEGIN
				SET @ADVANCEAVAILED = 0;
			END

			IF @NOD_LEAVE IS NULL
			BEGIN
				SET @NOD_LEAVE = 0;
			END

			IF @CARRYFORWARDLEAVECOUNT IS NULL
			BEGIN
				SET @CARRYFORWARDLEAVECOUNT = 0;
			END

			PRINT (@Leave_Type)

			IF EXISTS (
					SELECT *
					FROM EmployeeLeaveBalance
					WHERE Employee_Id = @empid
						AND LeaveType = @Leave_Type
						AND Year = year(GETDATE())
					)
			BEGIN
				UPDATE EmployeeLeaveBalance
				SET Leavebalance = @CARRYFORWARDLEAVECOUNT + @NOD_LEAVE - @ADVANCEAVAILED
					,AdvanceCredit = 0
					,AdvanceAvailed = 0
				WHERE Employee_Id = @empid
					AND LeaveType = @Leave_Type
					AND Year = year(GETDATE())
			END

			FETCH NEXT
			FROM ACCURAL_LEAVECALC_CURSOR
			INTO @Leave_Type
		END

		CLOSE ACCURAL_LEAVECALC_CURSOR

		DEALLOCATE ACCURAL_LEAVECALC_CURSOR
	END

	SELECT 1
END
GO

/****** Object:  StoredProcedure [dbo].[LEAVETYPE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LEAVETYPE]
AS
BEGIN
	SELECT Id
		,LeaveType
	FROM MTS_LeaveType WITH (NOLOCK)

	SELECT *
	FROM MTS_Session WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[MANAGER_LEAVECANCEL]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MANAGER_LEAVECANCEL] (
	@canceledby BIGINT
	,@approval BIGINT
	,@empid BIGINT
	,@fromdate DATE
	,@todate DATE
	,@leavetype BIGINT
	,@reason VARCHAR(255)
	)
AS
BEGIN
	DECLARE @TEMPLATEID BIGINT = (
			SELECT TemplateID
			FROM MTS_EmailTemplate WITH (NOLOCK)
			WHERE TemplateName = 'EMAIL_LEAVE_CANCEL'
			)
	DECLARE @dateofjoin DATE = (
			SELECT DateofJoin
			FROM Employee WITH (NOLOCK)
			WHERE id = @empid
			)
	DECLARE @employeeid VARCHAR(255) = (
			SELECT Employee_Id
			FROM Employee WITH (NOLOCK)
			WHERE id = @empid
			)
	DECLARE @empname VARCHAR(255) = (
			SELECT Firstname + ' ' + Lastname AS EmployeeName
			FROM Employee WITH (NOLOCK)
			WHERE id = @empid
			)
	DECLARE @empemail VARCHAR(255) = (
			SELECT Email
			FROM Employee WITH (NOLOCK)
			WHERE id = @empid
			)
	DECLARE @managerid VARCHAR(255) = (
			SELECT Employee_Id
			FROM Employee WITH (NOLOCK)
			WHERE id = @canceledby
			)
	DECLARE @managername VARCHAR(255) = (
			SELECT Firstname + ' ' + Lastname AS EmployeeName
			FROM Employee WITH (NOLOCK)
			WHERE id = @canceledby
			)
	DECLARE @EMAILSP VARCHAR(max) = cast(@empemail AS VARCHAR(255)) + ',' + cast(@employeeid AS VARCHAR(255)) + ',' + cast(@empname AS VARCHAR(255)) + ',' + cast(@dateofjoin AS VARCHAR(255)) + ',' + cast(@fromdate AS VARCHAR(255)) + ',' + cast(@todate AS VARCHAR(255)) + ',' + cast(@leavetype AS VARCHAR(255)) + ',' + cast(@reason AS VARCHAR(255)) + ',' + cast(@approval AS VARCHAR(255)) + ',' + cast(@managerid AS VARCHAR(255)) + ',' + cast(@managername AS VARCHAR(255))
	DECLARE @LEAVE_ID BIGINT = (
			SELECT TOP 1 id
			FROM Employee_Leave WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND FromDate = @fromdate
				AND ToDate = @todate
				AND Reason = @reason
				AND LeaveType = @leavetype
			)

	UPDATE Employee_Leave
	SET CanceledBy = @canceledby
		,Approval = @approval
		,CanceledDate = getdate()
	WHERE Employee_Id = @empid
		AND FromDate = @fromdate
		AND ToDate = @todate
		AND Reason = @reason
		AND LeaveType = @leavetype

	UPDATE EMPLOYEE_LEAVE_DETAILS
	SET CanceledBy = @canceledby
		,Approval = @approval
		,CanceledDate = getdate()
	WHERE LeaveId = @LEAVE_ID

	EXEC MTS_ADDEMAILMASTERENTRY @TEMPLATEID
		,@EMAILSP

	SELECT 1
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_ADDAUDIT]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_ADDAUDIT] (
	@USERID BIGINT
	,@AUDIT_INFO VARCHAR(255)
	)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRAN

	INSERT INTO [MTS_AUDIT] (
		[USERID]
		,[AUDIT_DATETIME]
		,[AUDIT_INFO]
		)
	VALUES (
		@USERID
		,GETDATE()
		,@AUDIT_INFO
		)

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN

		RETURN - 1
	END

	COMMIT

	RETURN 1
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_ADDEMAILMASTERENTRY]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_ADDEMAILMASTERENTRY] @TEMPLATEID BIGINT
	,@EMAILSP VARCHAR(200)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO MTS_EMAILMASTER (
		TEMPLATEID
		,EMAILSP
		,REQUESTTIME
		,STATUS
		)
	VALUES (
		@TEMPLATEID
		,@EMAILSP
		,GETDATE()
		,0
		)
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_ADDQA]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_ADDQA]
	@QUESTION VARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRAN

	IF NOT EXISTS (
			SELECT 1
			FROM MTS_Q_A WITH (NOLOCK)
			WHERE QUESTION = @QUESTION
			)
	BEGIN
		INSERT INTO MTS_Q_A (
			QUESTION
			,BUSINESSID
			,CLIENTID
			,LOCATIONID
			,COMPANYID
			,DEPARTMENTID
			)
		VALUES (
			@QUESTION
			,1
			,1
			,1
			,1
			,1
			)

		IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRAN

			RETURN - 1
		END
	END
	ELSE
	BEGIN
		COMMIT

		RETURN 1
	END

	COMMIT

	RETURN 0
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_ADDUSER]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_ADDUSER] @USERNAME VARCHAR(30)
	,@PASSWORD VARCHAR(50)
	,@FIRSTNAME VARCHAR(30)
	,@LASTNAME VARCHAR(30)
	,@EMAIL VARCHAR(50)
	,@ROLE BIGINT
	,@ACTIVE BIT
	,@STATUS TINYINT
	,@LOCKED BIT
AS
DECLARE @KEYID BIGINT
DECLARE @CONTACTID BIGINT
DECLARE @HASHPASSWORD VARCHAR(50)

BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION

	IF NOT EXISTS (
			SELECT 1
			FROM MTS_LOGIN WITH (NOLOCK)
			WHERE USERNAME = @USERNAME
			)
	BEGIN
		SET @PASSWORD = @PASSWORD + CAST(IDENT_CURRENT('MTS_LOGIN') + 1 AS VARCHAR(50))
		SET @HASHPASSWORD = SUBSTRING(SYS.FN_VARBINTOHEXSTR(HASHBYTES('SHA1', @PASSWORD)), 3, 50)

		INSERT INTO MTS_LOGIN (
			USERNAME
			,PASSWORD
			,STATUS
			,LOCKED
			,NO_OF_ATTEMPTS
			,ACTIVE
			,FIRSTNAME
			,LASTNAME
			)
		VALUES (
			@USERNAME
			,@HASHPASSWORD
			,@STATUS
			,@LOCKED
			,0
			,@ACTIVE
			,@FIRSTNAME
			,@LASTNAME
			)

		IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION

			RETURN - 1
		END
		ELSE
		BEGIN
			SET @KEYID = @@IDENTITY
		END

		--INSERT IN MTS_USERCONTACTS
		INSERT INTO MTS_USERCONTACTS (
			EMAIL
			,USERID
			)
		VALUES (
			@EMAIL
			,@KEYID
			)

		IF @@ERROR <> 0
		BEGIN
			--RAISERROR 50000 'USER CONTACT INSERTION FAILED.'
			ROLLBACK TRANSACTION

			RETURN - 1
		END
		ELSE
		BEGIN
			SET @CONTACTID = @@IDENTITY
		END

		INSERT INTO MTS_AUTHORITY (
			USERID
			,ROLEID
			)
		VALUES (
			@KEYID
			,@ROLE
			)

		IF @@ERROR <> 0
		BEGIN
			--RAISERROR 50000 'AUTHORITY INSERTION FAILED.'
			ROLLBACK TRANSACTION

			RETURN - 1
		END
	END
	ELSE
	BEGIN
		COMMIT

		RETURN 1
	END

	COMMIT

	RETURN 0
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_CALCULATE_INDIVUDUAL_EARNEDLEAVEBALANCE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_CALCULATE_INDIVUDUAL_EARNEDLEAVEBALANCE] (@empId BIGINT)
AS
BEGIN
	EXEC MTS_CALCULATELEAVE_EARNED_FOR_EMPLOYEE @empId
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_CALCULATELEAVE_ALLEMPLOYEE_YEARLYONCE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_CALCULATELEAVE_ALLEMPLOYEE_YEARLYONCE]
AS
BEGIN
	DECLARE @LEAVE_CODE VARCHAR(5)
		,@ASSIGNED_AFTER BIGINT
		,@APPLICABLE_FOR BIGINT
		,@MARITAL_STATUS BIGINT
		,@ACCURAL BIT
		,@MAX_ALLOWED_BALANCE BIGINT
		,@PRO_RATA BIT
	DECLARE @EMPLOYEEID BIGINT
		,@EMP_JOINDATE DATE
		,@EMP_DEPARTMENT BIGINT
		,@EMP_GENDER BIGINT
		,@EMP_MARITALSTATUS BIGINT
		,@EMPLOYEE_GENDER BIGINT
		,@EMPLOYEETOTALMONTH BIGINT
	DECLARE @NumberOfMthPerYear BIGINT = 12
	DECLARE @APPLICABLE_FOR_BOTH_GENDER INT = 3
	DECLARE @APPLICABLE_FOR_BOTH_STATUS INT = 3
	DECLARE @CARRYFORWARD BIT = 1
	DECLARE @EmployeeLeave_ApproredLeaveType INT = 2
	DECLARE @CurrentYear INT = YEAR(getdate())
	DECLARE @PreviousYear INT = YEAR(getdate()) - 1

	DECLARE EMPLOYEE_CURSOR CURSOR
	FOR
	SELECT id
		,Dateofjoin
		,DepartmentId
		,Gender
		,MaritalStatus
	FROM Employee  WITH (NOLOCK)

	OPEN EMPLOYEE_CURSOR

	FETCH NEXT
	FROM EMPLOYEE_CURSOR
	INTO @EMPLOYEEID
		,@EMP_JOINDATE
		,@EMP_DEPARTMENT
		,@EMP_GENDER
		,@EMP_MARITALSTATUS

	WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE LEAVECALC_CURSOR CURSOR
		FOR
		SELECT LEAVE_CODE
			,ASSIGNED_AFTER
			,APPLICABLE_FOR
			,MARITAL_STATUS
			,ACCURAL
			,MAX_ALLOWED_BALANCE
			,PRORATA
		FROM MTS_LeavePolicy WITH (NOLOCK)

		OPEN LEAVECALC_CURSOR

		FETCH NEXT
		FROM LEAVECALC_CURSOR
		INTO @LEAVE_CODE
			,@ASSIGNED_AFTER
			,@APPLICABLE_FOR
			,@MARITAL_STATUS
			,@ACCURAL
			,@MAX_ALLOWED_BALANCE
			,@PRO_RATA

		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF (YEAR(@EMP_JOINDATE) != YEAR(getdate()))
			BEGIN
				SET @EMPLOYEE_GENDER = CASE 
						WHEN @EMP_GENDER = 0
							THEN 1
						WHEN @EMP_GENDER = 1
							THEN 2
						ELSE 3
						END

				IF (
						@APPLICABLE_FOR = @EMPLOYEE_GENDER
						OR @APPLICABLE_FOR = @APPLICABLE_FOR_BOTH_GENDER
						)
				BEGIN
					IF (
							@MARITAL_STATUS = @EMP_MARITALSTATUS
							OR @MARITAL_STATUS = @APPLICABLE_FOR_BOTH_STATUS
							)
					BEGIN
						DECLARE @LT_ID INT
						DECLARE @NOD_LEAVE INT

						SELECT @LT_ID = ID
							,@NOD_LEAVE = Numberofdays
						FROM MTS_LeaveType WITH (NOLOCK)
						WHERE Leavetype = @LEAVE_CODE
							AND DepartmentId = @EMP_DEPARTMENT

						IF @NOD_LEAVE IS NULL
						BEGIN
							SET @NOD_LEAVE = 0;
						END

						IF (DATEDIFF(MONTH, @EMP_JOINDATE, GETDATE()) > @ASSIGNED_AFTER)
						BEGIN
							IF NOT EXISTS (
									SELECT *
									FROM EmployeeLeaveBalance WITH (NOLOCK)
									WHERE Employee_Id = @EMPLOYEEID
										AND LeaveType = @LT_ID
										AND Year = @PreviousYear
									)
							BEGIN
								IF NOT EXISTS (
										SELECT *
										FROM EmployeeLeaveBalance WITH (NOLOCK)
										WHERE Employee_Id = @EMPLOYEEID
											AND LeaveType = @LT_ID
											AND Year = @CurrentYear
										)
								BEGIN
									INSERT INTO EmployeeLeaveBalance (Employee_Id, LeaveType, Leavebalance, AdvanceCredit, AdvanceAvailed, Year)
									VALUES (
										@EMPLOYEEID
										,@LT_ID
										,@NOD_LEAVE
										,0
										,0
										,@CurrentYear
										)
								END
								ELSE
								BEGIN
									UPDATE EmployeeLeaveBalance
									SET Leavebalance = @NOD_LEAVE
									WHERE Employee_Id = @EMPLOYEEID
										AND LeaveType = @LT_ID
										AND Year = @CurrentYear
								END
							END
							ELSE
							BEGIN
								DECLARE @ADVANCEAVAILED FLOAT

								SELECT @ADVANCEAVAILED = AdvanceAvailed
								FROM EmployeeLeaveBalance WITH (NOLOCK)
								WHERE Employee_Id = @EMPLOYEEID
									AND LeaveType = @LT_ID
									AND Year = @PreviousYear

								IF @ADVANCEAVAILED IS NULL
								BEGIN
									SET @ADVANCEAVAILED = 0;
								END

								IF @NOD_LEAVE IS NULL
								BEGIN
									SET @NOD_LEAVE = 0;
								END

								IF (@ACCURAL = @CARRYFORWARD)
								BEGIN
									DECLARE @PREVIOUSLEAVEBALANCE FLOAT = 0
									DECLARE @TAKENLEAVE FLOAT = 0
									DECLARE @AVAILABLELEAVEBALANCE FLOAT = 0
									DECLARE @CARRYFORWARDLEAVECOUNT FLOAT = 0

									PRINT (@LT_ID)

									SELECT @PREVIOUSLEAVEBALANCE = Leavebalance
									FROM EmployeeLeaveBalance WITH (NOLOCK)
									WHERE Employee_Id = @EMPLOYEEID
										AND LeaveType = @LT_ID
										AND Year = @PreviousYear

									IF (YEAR(getdate()) < 2020)
									BEGIN
										SELECT @TAKENLEAVE = SUM(Numberofdays)
										FROM Employee_leave WITH (NOLOCK)
										WHERE Employee_Id = @EMPLOYEEID
											AND Approval = @EmployeeLeave_ApproredLeaveType
											AND isLOP = 0
											AND LeaveType = @LT_ID
											AND year(FromDate) = @PreviousYear
									END
									ELSE
									BEGIN
										SELECT @TAKENLEAVE = SUM(Numberofdays)
										FROM EMPLOYEE_LEAVE_DETAILS WITH (NOLOCK)
										WHERE Employee_Id = @EMPLOYEEID
											AND Approval = @EmployeeLeave_ApproredLeaveType
											AND isLOP = 0
											AND LeaveType = @LT_ID
											AND year(FromDate) = @PreviousYear
									END

									IF @TAKENLEAVE IS NULL
									BEGIN
										SET @TAKENLEAVE = 0;
									END

									PRINT (@PREVIOUSLEAVEBALANCE)
									PRINT (@TAKENLEAVE)

									IF (@PREVIOUSLEAVEBALANCE - @TAKENLEAVE > 0)
									BEGIN
										SET @AVAILABLELEAVEBALANCE = @PREVIOUSLEAVEBALANCE - @TAKENLEAVE

										IF (@AVAILABLELEAVEBALANCE < @MAX_ALLOWED_BALANCE)
										BEGIN
											SET @CARRYFORWARDLEAVECOUNT = @AVAILABLELEAVEBALANCE
										END
										ELSE
										BEGIN
											SET @CARRYFORWARDLEAVECOUNT = @MAX_ALLOWED_BALANCE
										END
									END

									PRINT (@CARRYFORWARDLEAVECOUNT)
									PRINT (@NOD_LEAVE)
									PRINT (@ADVANCEAVAILED)

									IF NOT EXISTS (
											SELECT *
											FROM EmployeeLeaveBalance WITH (NOLOCK)
											WHERE Employee_Id = @EMPLOYEEID
												AND LeaveType = @LT_ID
												AND Year = @CurrentYear
											)
									BEGIN
										INSERT INTO EmployeeLeaveBalance (Employee_Id, LeaveType, Leavebalance, AdvanceCredit, AdvanceAvailed, Year)
										VALUES (
											@EMPLOYEEID
											,@LT_ID
											,@CARRYFORWARDLEAVECOUNT + @NOD_LEAVE - @ADVANCEAVAILED
											,0
											,0
											,@CurrentYear
											)
									END
									ELSE
									BEGIN
										UPDATE EmployeeLeaveBalance
										SET Leavebalance = @CARRYFORWARDLEAVECOUNT + @NOD_LEAVE - @ADVANCEAVAILED
											,AdvanceCredit = 0
											,AdvanceAvailed = 0
										WHERE Employee_Id = @EMPLOYEEID
											AND LeaveType = @LT_ID
											AND Year = @CurrentYear
									END
								END
								ELSE
								BEGIN
									IF NOT EXISTS (
											SELECT *
											FROM EmployeeLeaveBalance WITH (NOLOCK)
											WHERE Employee_Id = @EMPLOYEEID
												AND LeaveType = @LT_ID
												AND Year = @CurrentYear
											)
									BEGIN
										INSERT INTO EmployeeLeaveBalance (Employee_Id, LeaveType, Leavebalance, AdvanceCredit, AdvanceAvailed, Year)
										VALUES (
											@EMPLOYEEID
											,@LT_ID
											,@NOD_LEAVE - @ADVANCEAVAILED
											,0
											,0
											,@CurrentYear
											)
									END
									ELSE
									BEGIN
										UPDATE EmployeeLeaveBalance
										SET Leavebalance = @NOD_LEAVE - @ADVANCEAVAILED
											,AdvanceCredit = 0
											,AdvanceAvailed = 0
										WHERE Employee_Id = @EMPLOYEEID
											AND LeaveType = @LT_ID
											AND Year = @CurrentYear
									END
								END
							END
						END
					END
				END
			END

			FETCH NEXT
			FROM LEAVECALC_CURSOR
			INTO @LEAVE_CODE
				,@ASSIGNED_AFTER
				,@APPLICABLE_FOR
				,@MARITAL_STATUS
				,@ACCURAL
				,@MAX_ALLOWED_BALANCE
				,@PRO_RATA
		END

		CLOSE LEAVECALC_CURSOR

		DEALLOCATE LEAVECALC_CURSOR

		FETCH NEXT
		FROM EMPLOYEE_CURSOR
		INTO @EMPLOYEEID
			,@EMP_JOINDATE
			,@EMP_DEPARTMENT
			,@EMP_GENDER
			,@EMP_MARITALSTATUS
	END

	CLOSE EMPLOYEE_CURSOR

	DEALLOCATE EMPLOYEE_CURSOR
END
GO
/****** Object:  StoredProcedure [dbo].[MTS_CALCULATELEAVE_ATJOIN]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_CALCULATELEAVE_ATJOIN] (@EMPLOYEEID BIGINT)  
AS  
BEGIN  
 DECLARE @LEAVE_CODE VARCHAR(5)  
  ,@ASSIGNED_AFTER BIGINT  
  ,@APPLICABLE_FOR BIGINT  
  ,@MARITAL_STATUS BIGINT 
  ,@EMP_JOINDATE DATE  
  ,@EMP_DEPARTMENT BIGINT  
  ,@EMP_GENDER BIGINT  
  ,@EMP_MARITALSTATUS BIGINT  
  ,@PRO_RATA BIT 
  ,@NumberOfMthPerYear BIGINT = 12
  ,@APPLICABLE_FOR_BOTH_GENDER INT = 3
  ,@APPLICABLE_FOR_BOTH_STATUS INT = 3
  
 SELECT @EMP_JOINDATE = Dateofjoin  
  ,@EMP_DEPARTMENT = DepartmentId  
  ,@EMP_GENDER = (  
   CASE   
    WHEN Gender = 0  
     THEN 1  
    WHEN Gender = 1  
     THEN 2  
    ELSE 3  
    END  
   )  
  ,@EMP_MARITALSTATUS = MaritalStatus  
 FROM Employee WITH (NOLOCK)  
 WHERE id = @EMPLOYEEID  
  
 DECLARE LEAVECALC_CURSOR CURSOR  
 FOR  
 SELECT LEAVE_CODE  
  ,ASSIGNED_AFTER  
  ,APPLICABLE_FOR  
  ,MARITAL_STATUS  
  ,PRORATA  
 FROM MTS_LeavePolicy WITH (NOLOCK)  
  
 OPEN LEAVECALC_CURSOR  
  
 FETCH NEXT  
 FROM LEAVECALC_CURSOR  
 INTO @LEAVE_CODE  
  ,@ASSIGNED_AFTER  
  ,@APPLICABLE_FOR  
  ,@MARITAL_STATUS  
  ,@PRO_RATA  
  
 WHILE @@FETCH_STATUS = 0  
 BEGIN
 IF EXISTS (  
    SELECT *  
    FROM MTS_LeaveType WITH (NOLOCK)  
    WHERE Leavetype = @LEAVE_CODE  
     AND DepartmentId = @EMP_DEPARTMENT  
    )  
  BEGIN  
	IF (@APPLICABLE_FOR = @EMP_GENDER OR @APPLICABLE_FOR = @APPLICABLE_FOR_BOTH_GENDER)  
    BEGIN  
     IF (@MARITAL_STATUS = @EMP_MARITALSTATUS OR @MARITAL_STATUS = @APPLICABLE_FOR_BOTH_STATUS)  
     BEGIN 
		 DECLARE @LT_ID INT, @NOD_LEAVE INT  
  
		  SELECT @LT_ID = ID ,@NOD_LEAVE = Numberofdays  
		  FROM MTS_LeaveType WITH (NOLOCK)  
		  WHERE Leavetype = @LEAVE_CODE AND DepartmentId = @EMP_DEPARTMENT
		  
			IF (@PRO_RATA = 1)  
			BEGIN
				IF (@ASSIGNED_AFTER <= (DATEDIFF(MONTH, @EMP_JOINDATE, getdate())))  
				BEGIN 
					IF NOT EXISTS ( SELECT *  
					   FROM EmployeeLeaveBalance WITH (NOLOCK)  
					   WHERE Employee_Id = @EMPLOYEEID  AND LeaveType = @LT_ID  AND Year = YEAR(@EMP_JOINDATE)  
					   )  
					BEGIN 
						DECLARE @TOTALNOD FLOAT

						SET @TOTALNOD = ROUND(((CONVERT(DECIMAL(18, 2), @NOD_LEAVE) / @NumberOfMthPerYear) * (@NumberOfMthPerYear - ((MONTH(@EMP_JOINDATE))-1))), 1) 

						INSERT INTO EmployeeLeaveBalance (Employee_Id, LeaveType, Leavebalance, AdvanceCredit, AdvanceAvailed, Year)  
						VALUES ( @EMPLOYEEID ,@LT_ID ,@TOTALNOD ,0 ,0 ,YEAR(@EMP_JOINDATE)) 
					END
				END
			END
			ELSE
			BEGIN			
				IF (@ASSIGNED_AFTER <= (DATEDIFF(MONTH, @EMP_JOINDATE, getdate())))  
				BEGIN 
					INSERT INTO EmployeeLeaveBalance (Employee_Id, LeaveType, Leavebalance, AdvanceCredit, AdvanceAvailed, Year)  
					VALUES ( @EMPLOYEEID ,@LT_ID ,@NOD_LEAVE ,0 ,0 ,YEAR(@EMP_JOINDATE)) 
				END
			END
		END
	END
  END
  FETCH NEXT  
  FROM LEAVECALC_CURSOR  
  INTO @LEAVE_CODE  
   ,@ASSIGNED_AFTER  
   ,@APPLICABLE_FOR  
   ,@MARITAL_STATUS  
   ,@PRO_RATA  
 END  
  
 CLOSE LEAVECALC_CURSOR  
  
 DEALLOCATE LEAVECALC_CURSOR  
END  
GO

/****** Object:  StoredProcedure [dbo].[MTS_CALCULATELEAVE_ATJOIN_MULTIPLE_EMPLOYEES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_CALCULATELEAVE_ATJOIN_MULTIPLE_EMPLOYEES] (@EMPLOYEEIDS NVARCHAR(MAX))
AS
BEGIN
	DECLARE @EMPLOYEEID BIGINT

	DECLARE EMPLOYEE_DETAILS_CUR CURSOR
	FOR
	SELECT ID
	FROM Employee WITH (NOLOCK)
	WHERE id IN (
			SELECT Cast(value AS BIGINT)
			FROM string_split(@EMPLOYEEIDS, ',')
			)

	OPEN EMPLOYEE_DETAILS_CUR

	FETCH NEXT
	FROM EMPLOYEE_DETAILS_CUR
	INTO @EMPLOYEEID

	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC MTS_CALCULATELEAVE_ATJOIN @EMPLOYEEID

		FETCH NEXT
		FROM EMPLOYEE_DETAILS_CUR
		INTO @EMPLOYEEID
	END

	CLOSE EMPLOYEE_DETAILS_CUR

	DEALLOCATE EMPLOYEE_DETAILS_CUR
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_CALCULATELEAVE_EARNED_FOR_EMPLOYEE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_CALCULATELEAVE_EARNED_FOR_EMPLOYEE] (@EMPLOYEEID BIGINT)
AS
BEGIN
	DECLARE @JOINDATE DATE
		,@DEPARTMENT BIGINT
	DECLARE @LEAVETYPES TABLE (
		LEAVETYPE VARCHAR(50)
		,NUMBEROFDAYS BIGINT
		)

	SELECT @JOINDATE = Dateofjoin
		,@DEPARTMENT = DepartmentId
	FROM Employee WITH (NOLOCK)
	WHERE id = @EMPLOYEEID

	IF EXISTS (
			SELECT *
			FROM EmployeeLeaveBalance WITH (NOLOCK)
			WHERE Employee_Id = @EMPLOYEEID
			)
	BEGIN
		IF EXISTS (
				SELECT *
				FROM EmployeeLeaveBalance WITH (NOLOCK)
				WHERE LeaveType IN (
						SELECT id
						FROM MTS_LeaveType WITH (NOLOCK)
						WHERE DepartmentId = @DEPARTMENT
							AND UPPER(Leavetype) = 'EARNED'
						)
					AND Employee_Id = @EMPLOYEEID
				)
		BEGIN
			IF NOT EXISTS (
					SELECT *
					FROM Employee_leave WITH (NOLOCK)
					WHERE Employee_Id = @EMPLOYEEID
						AND LeaveType IN (
							SELECT id
							FROM MTS_LeaveType WITH (NOLOCK)
							WHERE DepartmentId = @DEPARTMENT
								AND UPPER(Leavetype) = 'EARNED'
							)
						AND DATEPART(YEAR, FromDate) = DATEPART(YEAR, GETDATE())
						AND Approval = 2
					)
			BEGIN
				UPDATE EmployeeLeaveBalance
				SET Leavebalance = CEILING(ISNULL(CASE 
								WHEN (
										DATEPART(MONTH, GETDATE()) - 1 = 0
										AND (UPPER(LT.Leavetype) = 'EARNED')
										AND DATEDIFF(MONTH, @JOINDATE, GETDATE()) >= 12
										AND Leavebalance = 0
										)
									THEN 12
								WHEN (
										DATEPART(MONTH, GETDATE()) - 1 <> 0
										AND (UPPER(LT.Leavetype) = 'EARNED')
										AND DATEDIFF(MONTH, @JOINDATE, GETDATE()) >= 12
										AND Leavebalance = 0
										AND DATEPART(YEAR, CAST(DATEADD(MONTH, 12, @JOINDATE) AS DATE)) = DATEPART(YEAR, GETDATE())
										)
									THEN ((CONVERT(DECIMAL(18, 2), LT.Numberofdays) / 12) * (12 - (DATEPART(MONTH, CAST(DATEADD(MONTH, 12, @JOINDATE) AS DATE)))))
								ELSE EmployeeLeaveBalance.Leavebalance
								END, 0))
				FROM MTS_LeaveType LT
				WHERE Employee_Id = @EMPLOYEEID
					AND EmployeeLeaveBalance.LeaveType = LT.id
					AND LT.DepartmentId = @DEPARTMENT
					AND UPPER(LT.Leavetype) = 'EARNED'
			END
		END
		ELSE
		BEGIN
			INSERT INTO @LEAVETYPES
			SELECT id
				,CASE 
					WHEN DATEPART(MONTH, GETDATE()) - 1 = 0
						AND (UPPER(LT.Leavetype) = 'EARNED')
						AND DATEDIFF(MONTH, @JOINDATE, GETDATE()) >= 12
						THEN 12
					WHEN (DATEPART(MONTH, GETDATE()) - 1 <> 0)
						AND (UPPER(LT.Leavetype) = 'EARNED')
						AND DATEDIFF(MONTH, @JOINDATE, GETDATE()) >= 12
						THEN ((CONVERT(DECIMAL(18, 2), LT.Numberofdays) / 12) * (12 - (DATEPART(MONTH, @JOINDATE) - 1)))
					END AS NUMBEROFDAYS
			FROM MTS_LeaveType LT
			WHERE DEPARTMENTID = @DEPARTMENT
				AND UPPER(LT.Leavetype) = 'EARNED'

			INSERT INTO EmployeeLeaveBalance
			SELECT @EMPLOYEEID
				,LEAVETYPE
				,NUMBEROFDAYS
				,NULL
				,NULL
				,NULL
			FROM @LEAVETYPES

			DELETE
			FROM @LEAVETYPES
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_CALCULATELEAVE_EARNEDMONTHLY]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_CALCULATELEAVE_EARNEDMONTHLY]
AS
BEGIN
	DECLARE @EMPLOYEEID BIGINT
		,@JOINDATE DATE
		,@DEPARTMENT BIGINT
	DECLARE @LEAVETYPES TABLE (
		LEAVETYPE VARCHAR(50)
		,NUMBEROFDAYS BIGINT
		)

	DECLARE LEAVECALC_CURSOR CURSOR
	FOR
	SELECT id
		,Dateofjoin
		,DepartmentId
	FROM Employee WITH (NOLOCK)

	OPEN LEAVECALC_CURSOR

	FETCH NEXT
	FROM LEAVECALC_CURSOR
	INTO @EMPLOYEEID
		,@JOINDATE
		,@DEPARTMENT

	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF EXISTS (
				SELECT *
				FROM EmployeeLeaveBalance WITH (NOLOCK)
				WHERE Employee_Id = @EMPLOYEEID
				)
		BEGIN
			IF EXISTS (
					SELECT *
					FROM EmployeeLeaveBalance WITH (NOLOCK)
					WHERE LeaveType IN (
							SELECT id
							FROM MTS_LeaveType WITH (NOLOCK)
							WHERE DepartmentId = @DEPARTMENT
								AND UPPER(Leavetype) = 'EARNED'
							)
						AND Employee_Id = @EMPLOYEEID
					)
			BEGIN
				IF NOT EXISTS (
						SELECT *
						FROM Employee_leave WITH (NOLOCK)
						WHERE Employee_Id = @EMPLOYEEID
							AND LeaveType IN (
								SELECT id
								FROM MTS_LeaveType WITH (NOLOCK)
								WHERE DepartmentId = @DEPARTMENT
									AND UPPER(Leavetype) = 'EARNED'
								)
							AND DATEPART(YEAR, FromDate) = DATEPART(YEAR, GETDATE())
						)
				BEGIN
					UPDATE EmployeeLeaveBalance
					SET Leavebalance = CEILING(ISNULL(CASE 
									WHEN (
											DATEPART(MONTH, GETDATE()) - 1 = 0
											AND (UPPER(LT.Leavetype) = 'EARNED')
											AND DATEDIFF(MONTH, @JOINDATE, GETDATE()) >= 12
											AND Leavebalance = 0
											)
										THEN 12
									WHEN (
											DATEPART(MONTH, GETDATE()) - 1 <> 0
											AND (UPPER(LT.Leavetype) = 'EARNED')
											AND DATEDIFF(MONTH, @JOINDATE, GETDATE()) >= 12
											AND Leavebalance = 0
											AND DATEPART(YEAR, CAST(DATEADD(MONTH, 12, @JOINDATE) AS DATE)) = DATEPART(YEAR, GETDATE())
											)
										THEN ((CONVERT(DECIMAL(18, 2), LT.Numberofdays) / 12) * (12 - (DATEPART(MONTH, CAST(DATEADD(MONTH, 12, @JOINDATE) AS DATE)))))
									ELSE EmployeeLeaveBalance.Leavebalance
									END, 0))
					FROM MTS_LeaveType LT
					WHERE Employee_Id = @EMPLOYEEID
						AND EmployeeLeaveBalance.LeaveType = LT.id
						AND LT.DepartmentId = @DEPARTMENT
						AND UPPER(LT.Leavetype) = 'EARNED'
				END
			END
			ELSE
			BEGIN
				INSERT INTO @LEAVETYPES
				SELECT id
					,CASE 
						WHEN DATEPART(MONTH, GETDATE()) - 1 = 0
							AND (UPPER(LT.Leavetype) = 'EARNED')
							AND DATEDIFF(MONTH, @JOINDATE, GETDATE()) >= 12
							THEN 12
						WHEN (DATEPART(MONTH, GETDATE()) - 1 <> 0)
							AND (UPPER(LT.Leavetype) = 'EARNED')
							AND DATEDIFF(MONTH, @JOINDATE, GETDATE()) >= 12
							THEN ((CONVERT(DECIMAL(18, 2), LT.Numberofdays) / 12) * (12 - (DATEPART(MONTH, @JOINDATE) - 1)))
						END AS NUMBEROFDAYS
				FROM MTS_LeaveType LT
				WHERE DEPARTMENTID = @DEPARTMENT
					AND LT.Leavetype = 'EARNED'

				INSERT INTO EmployeeLeaveBalance
				SELECT @EMPLOYEEID
					,LEAVETYPE
					,NUMBEROFDAYS
					,NULL
					,NULL
					,NULL
				FROM @LEAVETYPES

				DELETE
				FROM @LEAVETYPES
			END
		END

		FETCH NEXT
		FROM LEAVECALC_CURSOR
		INTO @EMPLOYEEID
			,@JOINDATE
			,@DEPARTMENT
	END

	CLOSE LEAVECALC_CURSOR

	DEALLOCATE LEAVECALC_CURSOR
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_CALCULATELEAVE_EMPLOYEE_YEARLYONCE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_CALCULATELEAVE_EMPLOYEE_YEARLYONCE] (
	@EMPLOYEE_ID BIGINT
	,@NextYear INT
	)
AS
BEGIN
	DECLARE @LEAVE_CODE VARCHAR(5)
		,@ASSIGNED_AFTER BIGINT
		,@APPLICABLE_FOR BIGINT
		,@MARITAL_STATUS BIGINT
		,@ACCURAL BIT
		,@MAX_ALLOWED_BALANCE BIGINT
		,@PRO_RATA BIT
	DECLARE @EMPLOYEEID BIGINT
		,@EMP_JOINDATE DATE
		,@EMP_DEPARTMENT BIGINT
		,@EMP_GENDER BIGINT
		,@EMP_MARITALSTATUS BIGINT
		,@EMPLOYEE_GENDER BIGINT
		,@EMPLOYEETOTALMONTH BIGINT
	DECLARE @NumberOfMthPerYear BIGINT = 12
	DECLARE @APPLICABLE_FOR_BOTH_GENDER INT = 3
	DECLARE @APPLICABLE_FOR_BOTH_STATUS INT = 3
	DECLARE @CARRYFORWARD BIT = 1
	DECLARE @EmployeeLeave_ApproredLeaveType INT = 2
	DECLARE @PreviousYear INT = @NextYear - 1

	DECLARE EMPLOYEE_CURSOR CURSOR
	FOR
	SELECT id
		,Dateofjoin
		,DepartmentId
		,Gender
		,MaritalStatus
	FROM Employee
	WHERE id = @EMPLOYEE_ID

	OPEN EMPLOYEE_CURSOR

	FETCH NEXT
	FROM EMPLOYEE_CURSOR
	INTO @EMPLOYEEID
		,@EMP_JOINDATE
		,@EMP_DEPARTMENT
		,@EMP_GENDER
		,@EMP_MARITALSTATUS

	WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE LEAVECALC_CURSOR CURSOR
		FOR
		SELECT LEAVE_CODE
			,ASSIGNED_AFTER
			,APPLICABLE_FOR
			,MARITAL_STATUS
			,ACCURAL
			,MAX_ALLOWED_BALANCE
			,PRORATA
		FROM MTS_LeavePolicy

		OPEN LEAVECALC_CURSOR

		FETCH NEXT
		FROM LEAVECALC_CURSOR
		INTO @LEAVE_CODE
			,@ASSIGNED_AFTER
			,@APPLICABLE_FOR
			,@MARITAL_STATUS
			,@ACCURAL
			,@MAX_ALLOWED_BALANCE
			,@PRO_RATA

		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF (YEAR(@EMP_JOINDATE) != @NextYear)
			BEGIN
				SET @EMPLOYEE_GENDER = CASE 
						WHEN @EMP_GENDER = 0
							THEN 1
						WHEN @EMP_GENDER = 1
							THEN 2
						ELSE 3
						END

				IF (
						@APPLICABLE_FOR = @EMPLOYEE_GENDER
						OR @APPLICABLE_FOR = @APPLICABLE_FOR_BOTH_GENDER
						)
				BEGIN
					IF (
							@MARITAL_STATUS = @EMP_MARITALSTATUS
							OR @MARITAL_STATUS = @APPLICABLE_FOR_BOTH_STATUS
							)
					BEGIN
						DECLARE @LT_ID INT
						DECLARE @NOD_LEAVE INT

						SELECT @LT_ID = ID
							,@NOD_LEAVE = Numberofdays
						FROM MTS_LeaveType WITH (NOLOCK)
						WHERE Leavetype = @LEAVE_CODE
							AND DepartmentId = @EMP_DEPARTMENT

						IF @NOD_LEAVE IS NULL
						BEGIN
							SET @NOD_LEAVE = 0;
						END

						IF (DATEDIFF(MONTH, @EMP_JOINDATE, GETDATE()) > @ASSIGNED_AFTER)
						BEGIN
							IF NOT EXISTS (
									SELECT *
									FROM EmployeeLeaveBalance WITH (NOLOCK)
									WHERE Employee_Id = @EMPLOYEEID
										AND LeaveType = @LT_ID
										AND Year = @PreviousYear
									)
							BEGIN
								IF NOT EXISTS (
										SELECT *
										FROM EmployeeLeaveBalance WITH (NOLOCK)
										WHERE Employee_Id = @EMPLOYEEID
											AND LeaveType = @LT_ID
											AND Year = @NextYear
										)
								BEGIN
									INSERT INTO EmployeeLeaveBalance (Employee_Id, LeaveType, Leavebalance, AdvanceCredit, AdvanceAvailed, Year)
									VALUES ( @EMPLOYEEID ,@LT_ID ,@NOD_LEAVE ,0 ,0 ,@NextYear )
								END
								ELSE
								BEGIN
									UPDATE EmployeeLeaveBalance
									SET Leavebalance = @NOD_LEAVE
									WHERE Employee_Id = @EMPLOYEEID
										AND LeaveType = @LT_ID
										AND Year = @NextYear
								END
							END
							ELSE
							BEGIN
								DECLARE @ADVANCEAVAILED FLOAT

								SELECT @ADVANCEAVAILED = AdvanceAvailed
								FROM EmployeeLeaveBalance WITH (NOLOCK)
								WHERE Employee_Id = @EMPLOYEEID
									AND LeaveType = @LT_ID
									AND Year = @PreviousYear

								IF @ADVANCEAVAILED IS NULL
								BEGIN
									SET @ADVANCEAVAILED = 0;
								END

								IF @NOD_LEAVE IS NULL
								BEGIN
									SET @NOD_LEAVE = 0;
								END

								IF (@ACCURAL = @CARRYFORWARD)
								BEGIN
									DECLARE @PREVIOUSLEAVEBALANCE FLOAT = 0
									DECLARE @TAKENLEAVE FLOAT = 0
									DECLARE @AVAILABLELEAVEBALANCE FLOAT = 0
									DECLARE @CARRYFORWARDLEAVECOUNT FLOAT = 0

									SELECT @PREVIOUSLEAVEBALANCE = Leavebalance
									FROM EmployeeLeaveBalance WITH (NOLOCK)
									WHERE Employee_Id = @EMPLOYEEID
										AND LeaveType = @LT_ID
										AND Year = @PreviousYear

									IF (YEAR(getdate()) < 2020)
									BEGIN
										SELECT @TAKENLEAVE = SUM(Numberofdays)
										FROM Employee_leave WITH (NOLOCK)
										WHERE Employee_Id = @EMPLOYEEID
											AND Approval = @EmployeeLeave_ApproredLeaveType
											AND isLOP = 0
											AND LeaveType = @LT_ID
											AND year(FromDate) = @PreviousYear
									END
									ELSE
									BEGIN
										SELECT @TAKENLEAVE = SUM(Numberofdays)
										FROM EMPLOYEE_LEAVE_DETAILS WITH (NOLOCK)
										WHERE Employee_Id = @EMPLOYEEID
											AND Approval = @EmployeeLeave_ApproredLeaveType
											AND isLOP = 0
											AND LeaveType = @LT_ID
											AND year(FromDate) = @PreviousYear
									END

									IF @TAKENLEAVE IS NULL
									BEGIN
										SET @TAKENLEAVE = 0;
									END

									IF (@PREVIOUSLEAVEBALANCE - @TAKENLEAVE > 0)
									BEGIN
										SET @AVAILABLELEAVEBALANCE = @PREVIOUSLEAVEBALANCE - @TAKENLEAVE

										IF (@AVAILABLELEAVEBALANCE < @MAX_ALLOWED_BALANCE)
										BEGIN
											SET @CARRYFORWARDLEAVECOUNT = @AVAILABLELEAVEBALANCE
										END
										ELSE
										BEGIN
											SET @CARRYFORWARDLEAVECOUNT = @MAX_ALLOWED_BALANCE
										END
									END

									IF NOT EXISTS (
											SELECT *
											FROM EmployeeLeaveBalance WITH (NOLOCK)
											WHERE Employee_Id = @EMPLOYEEID
												AND LeaveType = @LT_ID
												AND Year = @NextYear
											)
									BEGIN
										INSERT INTO EmployeeLeaveBalance (Employee_Id, LeaveType, Leavebalance, AdvanceCredit, AdvanceAvailed, Year)
										VALUES ( @EMPLOYEEID ,@LT_ID ,@CARRYFORWARDLEAVECOUNT + @NOD_LEAVE - @ADVANCEAVAILED ,0 ,0 ,@NextYear)
									END
									ELSE
									BEGIN
										UPDATE EmployeeLeaveBalance
										SET Leavebalance = @CARRYFORWARDLEAVECOUNT + @NOD_LEAVE - @ADVANCEAVAILED
											,AdvanceCredit = 0
											,AdvanceAvailed = 0
										WHERE Employee_Id = @EMPLOYEEID
											AND LeaveType = @LT_ID
											AND Year = @NextYear
									END
								END
								ELSE
								BEGIN
									IF NOT EXISTS (
											SELECT *
											FROM EmployeeLeaveBalance WITH (NOLOCK)
											WHERE Employee_Id = @EMPLOYEEID
												AND LeaveType = @LT_ID
												AND Year = @NextYear
											)
									BEGIN
										INSERT INTO EmployeeLeaveBalance (Employee_Id, LeaveType, Leavebalance, AdvanceCredit, AdvanceAvailed, Year)
										VALUES ( @EMPLOYEEID ,@LT_ID ,@NOD_LEAVE - @ADVANCEAVAILED ,0 ,0 ,@NextYear)
									END
									ELSE
									BEGIN
										UPDATE EmployeeLeaveBalance
										SET Leavebalance = @NOD_LEAVE - @ADVANCEAVAILED
											,AdvanceCredit = 0
											,AdvanceAvailed = 0
										WHERE Employee_Id = @EMPLOYEEID
											AND LeaveType = @LT_ID
											AND Year = @NextYear
									END
								END
							END
						END
					END
				END
			END

			FETCH NEXT
			FROM LEAVECALC_CURSOR
			INTO @LEAVE_CODE
				,@ASSIGNED_AFTER
				,@APPLICABLE_FOR
				,@MARITAL_STATUS
				,@ACCURAL
				,@MAX_ALLOWED_BALANCE
				,@PRO_RATA
		END

		CLOSE LEAVECALC_CURSOR

		DEALLOCATE LEAVECALC_CURSOR

		FETCH NEXT
		FROM EMPLOYEE_CURSOR
		INTO @EMPLOYEEID
			,@EMP_JOINDATE
			,@EMP_DEPARTMENT
			,@EMP_GENDER
			,@EMP_MARITALSTATUS
	END

	CLOSE EMPLOYEE_CURSOR

	DEALLOCATE EMPLOYEE_CURSOR

	SELECT 1
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_CALCULATELEAVE_MONTHLY]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_CALCULATELEAVE_MONTHLY]
AS
BEGIN
	DECLARE @LEAVE_CODE VARCHAR(5)
		,@ASSIGNED_AFTER BIGINT
		,@APPLICABLE_FOR BIGINT
		,@MARITAL_STATUS BIGINT
	DECLARE @EMPLOYEEID BIGINT
		,@EMP_JOINDATE DATE
		,@EMP_DEPARTMENT BIGINT
		,@EMP_GENDER BIGINT
		,@EMP_MARITALSTATUS BIGINT
		,@PRO_RATA BIT
		,@EMPLOYEETOTALMONTH BIGINT
		,@ACCURAL BIT
		,@MAX_ALLOWED_BALANCE BIGINT
	DECLARE @NumberOfMthPerYear BIGINT = 12
	DECLARE @APPLICABLE_FOR_BOTH_GENDER INT = 3
	DECLARE @APPLICABLE_FOR_BOTH_STATUS INT = 3
	DECLARE @CARRYFORWARD BIT = 1
	DECLARE @EmployeeLeave_ApproredLeaveType INT = 2
	DECLARE @CurrentYear INT = YEAR(getdate())
	DECLARE @PreviousYear INT = YEAR(getdate()) - 1

	SELECT @EMPLOYEEID = id
		,@EMP_JOINDATE = Dateofjoin
		,@EMP_DEPARTMENT = DepartmentId
		,@EMP_GENDER = (
			CASE 
				WHEN Gender = 0
					THEN 1
				WHEN Gender = 1
					THEN 2
				ELSE 3
				END
			)
		,@EMP_MARITALSTATUS = MaritalStatus
	FROM Employee WITH (NOLOCK)

	DECLARE LEAVECALC_CURSOR CURSOR
	FOR
	SELECT LEAVE_CODE
		,ASSIGNED_AFTER
		,APPLICABLE_FOR
		,MARITAL_STATUS
		,PRORATA
		,ACCURAL
		,MAX_ALLOWED_BALANCE
	FROM MTS_LeavePolicy WITH (NOLOCK)

	OPEN LEAVECALC_CURSOR

	FETCH NEXT
	FROM LEAVECALC_CURSOR
	INTO @LEAVE_CODE
		,@ASSIGNED_AFTER
		,@APPLICABLE_FOR
		,@MARITAL_STATUS
		,@PRO_RATA
		,@ACCURAL
		,@MAX_ALLOWED_BALANCE

	WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE @EARNED_LEAVE BIGINT = 0

		IF EXISTS (
				SELECT *
				FROM MTS_LeaveType
				WHERE Leavetype = @LEAVE_CODE
					AND DepartmentId = @EMP_DEPARTMENT
				)
		BEGIN
			SET @EMPLOYEETOTALMONTH = DATEDIFF(MONTH, @EMP_JOINDATE, getdate())

			IF (@EMPLOYEETOTALMONTH = @ASSIGNED_AFTER)
			BEGIN
				IF (
						@APPLICABLE_FOR = @EMP_GENDER
						OR @APPLICABLE_FOR = @APPLICABLE_FOR_BOTH_GENDER
						)
				BEGIN
					IF (
							@MARITAL_STATUS = @EMP_MARITALSTATUS
							OR @MARITAL_STATUS = @APPLICABLE_FOR_BOTH_STATUS
							)
					BEGIN
						DECLARE @LT_ID INT
						DECLARE @NOD_LEAVE INT

						SELECT @LT_ID = ID
							,@NOD_LEAVE = Numberofdays
						FROM MTS_LeaveType WITH (NOLOCK)
						WHERE Leavetype = @LEAVE_CODE
							AND DepartmentId = @EMP_DEPARTMENT

						IF @NOD_LEAVE IS NULL
						BEGIN
							SET @NOD_LEAVE = 0;
						END

						IF NOT EXISTS (
								SELECT *
								FROM EmployeeLeaveBalance WITH (NOLOCK)
								WHERE Employee_Id = @EMPLOYEEID
									AND LeaveType = @LT_ID
									AND Year = @PreviousYear
								)
						BEGIN
							IF NOT EXISTS (
									SELECT *
									FROM EmployeeLeaveBalance WITH (NOLOCK)
									WHERE Employee_Id = @EMPLOYEEID
										AND LeaveType = @LT_ID
										AND Year = @CurrentYear
									)
							BEGIN
								IF (@PRO_RATA = 1)
								BEGIN
									INSERT INTO EmployeeLeaveBalance (Employee_Id, LeaveType, Leavebalance, AdvanceCredit, AdvanceAvailed, Year)
									VALUES (
										@EMPLOYEEID
										,@LT_ID
										,ROUND(((CONVERT(DECIMAL(18, 2), @NOD_LEAVE) / @NumberOfMthPerYear) * (@NumberOfMthPerYear - (MONTH(@EMP_JOINDATE) - 1))), 1)
										,0
										,0
										,@CurrentYear
										)
								END
								ELSE
								BEGIN
									INSERT INTO EmployeeLeaveBalance (Employee_Id, LeaveType, Leavebalance, AdvanceCredit, AdvanceAvailed, Year)
									VALUES (
										@EMPLOYEEID
										,@LT_ID
										,@NOD_LEAVE
										,0
										,0
										,@CurrentYear
										)
								END
							END
							ELSE
							BEGIN
								IF (@PRO_RATA = 1)
								BEGIN
									UPDATE EmployeeLeaveBalance
									SET Leavebalance = ROUND(((CONVERT(DECIMAL(18, 2), @NOD_LEAVE) / @NumberOfMthPerYear) * (@NumberOfMthPerYear - (MONTH(@EMP_JOINDATE) - 1))), 1)
										,AdvanceCredit = 0
										,AdvanceAvailed = 0
									WHERE Employee_Id = @EMPLOYEEID
										AND LeaveType = @LT_ID
										AND Year = @CurrentYear
								END
								ELSE
								BEGIN
									UPDATE EmployeeLeaveBalance
									SET Leavebalance = @NOD_LEAVE
										,AdvanceCredit = 0
										,AdvanceAvailed = 0
									WHERE Employee_Id = @EMPLOYEEID
										AND LeaveType = @LT_ID
										AND Year = @CurrentYear
								END
							END
						END
						ELSE
						BEGIN
							DECLARE @PREVIOUSLEAVEBALANCE INT = 0
							DECLARE @TAKENLEAVE INT = 0
							DECLARE @AVAILABLELEAVEBALANCE INT = 0
							DECLARE @CARRYFORWARDLEAVECOUNT INT = 0
							DECLARE @AVAILABLEOPENINGLEAVEBALANCE FLOAT = 0

							IF (@ACCURAL = @CARRYFORWARD)
							BEGIN
								SELECT @PREVIOUSLEAVEBALANCE = Leavebalance
								FROM EmployeeLeaveBalance WITH (NOLOCK)
								WHERE Employee_Id = @EMPLOYEEID
									AND LeaveType = @LT_ID
									AND Year = @PreviousYear

								IF (YEAR(getdate()) < 2020)
								BEGIN
									SELECT @TAKENLEAVE = SUM(Numberofdays)
									FROM Employee_leave WITH (NOLOCK)
									WHERE Employee_Id = @EMPLOYEEID
										AND Approval = @EmployeeLeave_ApproredLeaveType
										AND isLOP = 0
										AND LeaveType = @LT_ID
										AND Year(FromDate) = @PreviousYear
								END
								ELSE
								BEGIN
									SELECT @TAKENLEAVE = SUM(Numberofdays)
									FROM EMPLOYEE_LEAVE_DETAILS WITH (NOLOCK)
									WHERE Employee_Id = @EMPLOYEEID
										AND Approval = @EmployeeLeave_ApproredLeaveType
										AND isLOP = 0
										AND LeaveType = @LT_ID
										AND Year(FromDate) = @PreviousYear
								END

								IF @TAKENLEAVE IS NULL
								BEGIN
									SET @TAKENLEAVE = 0;
								END

								IF @NOD_LEAVE IS NULL
								BEGIN
									SET @NOD_LEAVE = 0;
								END

								IF (@PREVIOUSLEAVEBALANCE - @TAKENLEAVE > 0)
								BEGIN
									SET @AVAILABLELEAVEBALANCE = @PREVIOUSLEAVEBALANCE - @TAKENLEAVE;
									SET @AVAILABLEOPENINGLEAVEBALANCE = @AVAILABLELEAVEBALANCE + @NOD_LEAVE;

									IF (@AVAILABLEOPENINGLEAVEBALANCE < @MAX_ALLOWED_BALANCE)
									BEGIN
										SET @CARRYFORWARDLEAVECOUNT = @AVAILABLEOPENINGLEAVEBALANCE
									END
									ELSE
									BEGIN
										SET @CARRYFORWARDLEAVECOUNT = @MAX_ALLOWED_BALANCE
									END
								END
							END

							DECLARE @ADVANCEAVAILED INT

							SELECT @ADVANCEAVAILED = AdvanceAvailed
							FROM EmployeeLeaveBalance WITH (NOLOCK)
							WHERE Employee_Id = @EMPLOYEEID
								AND LeaveType = @LT_ID
								AND Year = @PreviousYear

							IF @ADVANCEAVAILED IS NULL
							BEGIN
								SET @ADVANCEAVAILED = 0;
							END

							IF NOT EXISTS (
									SELECT *
									FROM EmployeeLeaveBalance WITH (NOLOCK)
									WHERE Employee_Id = @EMPLOYEEID
										AND LeaveType = @LT_ID
										AND Year = @CurrentYear
									)
							BEGIN
								IF (@PRO_RATA = 1)
								BEGIN
									IF (@AVAILABLELEAVEBALANCE + @NOD_LEAVE <= @MAX_ALLOWED_BALANCE)
									BEGIN
										INSERT INTO EmployeeLeaveBalance (Employee_Id, LeaveType, Leavebalance, AdvanceCredit, AdvanceAvailed, Year)
										VALUES (
											@EMPLOYEEID
											,@LT_ID
											,@AVAILABLELEAVEBALANCE + ROUND(((CONVERT(DECIMAL(18, 2), @NOD_LEAVE) / @NumberOfMthPerYear) * (@NumberOfMthPerYear - (MONTH(@EMP_JOINDATE) - 1))), 1)
											,0
											,0
											,@CurrentYear
											)
									END
									ELSE
									BEGIN
										DECLARE @CF_LEAVECOUNT FLOAT = @MAX_ALLOWED_BALANCE - @NOD_LEAVE;

										INSERT INTO EmployeeLeaveBalance (Employee_Id, LeaveType, Leavebalance, AdvanceCredit, AdvanceAvailed, Year)
										VALUES (
											@EMPLOYEEID
											,@LT_ID
											,@CF_LEAVECOUNT + ROUND(((CONVERT(DECIMAL(18, 2), @NOD_LEAVE) / @NumberOfMthPerYear) * (@NumberOfMthPerYear - (MONTH(@EMP_JOINDATE) - 1))), 1)
											,0
											,0
											,@CurrentYear
											)
									END
								END
								ELSE
								BEGIN
									INSERT INTO EmployeeLeaveBalance (Employee_Id, LeaveType, Leavebalance, AdvanceCredit, AdvanceAvailed, Year)
									VALUES (
										@EMPLOYEEID
										,@LT_ID
										,@CARRYFORWARDLEAVECOUNT - @ADVANCEAVAILED
										,0
										,0
										,@CurrentYear
										)
								END
							END
							ELSE
							BEGIN
								IF (@PRO_RATA = 1)
								BEGIN
									IF (@AVAILABLELEAVEBALANCE + @NOD_LEAVE <= @MAX_ALLOWED_BALANCE)
									BEGIN
										UPDATE EmployeeLeaveBalance
										SET Leavebalance = @AVAILABLELEAVEBALANCE + ROUND(((CONVERT(DECIMAL(18, 2), @NOD_LEAVE) / @NumberOfMthPerYear) * (@NumberOfMthPerYear - (MONTH(@EMP_JOINDATE) - 1))), 1) - @ADVANCEAVAILED
											,AdvanceCredit = 0
											,AdvanceAvailed = 0
										WHERE Employee_Id = @EMPLOYEEID
											AND LeaveType = @LT_ID
											AND Year = @CurrentYear
									END
									ELSE
									BEGIN
										DECLARE @CFLEAVECOUNT FLOAT = @MAX_ALLOWED_BALANCE - @NOD_LEAVE;

										UPDATE EmployeeLeaveBalance
										SET Leavebalance = @CFLEAVECOUNT + ROUND(((CONVERT(DECIMAL(18, 2), @NOD_LEAVE) / @NumberOfMthPerYear) * (@NumberOfMthPerYear - (MONTH(@EMP_JOINDATE) - 1))), 1) - @ADVANCEAVAILED
											,AdvanceCredit = 0
											,AdvanceAvailed = 0
										WHERE Employee_Id = @EMPLOYEEID
											AND LeaveType = @LT_ID
											AND Year = @CurrentYear
									END
								END
								ELSE
								BEGIN
									UPDATE EmployeeLeaveBalance
									SET Leavebalance = @CARRYFORWARDLEAVECOUNT - @ADVANCEAVAILED
										,AdvanceCredit = 0
										,AdvanceAvailed = 0
									WHERE Employee_Id = @EMPLOYEEID
										AND LeaveType = @LT_ID
										AND Year = @CurrentYear
								END
							END
						END
					END
				END	
			END
		END

		FETCH NEXT
		FROM LEAVECALC_CURSOR
		INTO @LEAVE_CODE
			,@ASSIGNED_AFTER
			,@APPLICABLE_FOR
			,@MARITAL_STATUS
			,@PRO_RATA
			,@ACCURAL
			,@MAX_ALLOWED_BALANCE
	END

	CLOSE LEAVECALC_CURSOR

	DEALLOCATE LEAVECALC_CURSOR
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_CHECK_EXISTS_USEREMAIL]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_CHECK_EXISTS_USEREMAIL] (
	@EMAIL VARCHAR(100)
	,@USERID BIGINT
	)
AS
BEGIN
	IF EXISTS (
			SELECT 1
			FROM MTS_USERCONTACTS WITH (NOLOCK)
			WHERE EMAIL = @EMAIL
				AND USERID <> @USERID
			)
	BEGIN
		RETURN 1
	END
	ELSE
	BEGIN
		RETURN 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_CHECK_EXISTS_USERNAME]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_CHECK_EXISTS_USERNAME] (@USERNAME VARCHAR(30))
AS
BEGIN
	IF EXISTS (
			SELECT 1
			FROM MTS_LOGIN WITH (NOLOCK)
			WHERE USERNAME = @USERNAME
			)
	BEGIN
		RETURN 1
	END
	ELSE
	BEGIN
		RETURN 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_CREATE_NEWPOLICY]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_CREATE_NEWPOLICY] (@policyname VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT POLICYNAME
			FROM MTS_HRPOLICIES WITH (NOLOCK)
			WHERE POLICYNAME = @policyname
			)
	BEGIN
		INSERT INTO MTS_HRPOLICIES
		VALUES (@policyname)

		BEGIN
			SELECT 1
		END
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_EDITROLE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_EDITROLE] (
	@userid BIGINT
	,@roleid BIGINT
	)
AS
BEGIN
	UPDATE MTS_AUTHORITY
	SET ROLEID = @roleid
	WHERE USERID = @userid

	BEGIN
		SELECT 1
	END
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_FORGOTPASSWORD]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_FORGOTPASSWORD] (
	@USERID BIGINT
	,@PASSWORD VARCHAR(50)
	)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE MTS_LOGIN
	SET PASSWORD = @PASSWORD
		,LAST_PWD_CHANGE = GETDATE()
		,NO_OF_ATTEMPTS = 0
		,LOCKED = 0
	WHERE USERID = @USERID
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GET_IT_DECLARATION_EMPLOYEES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_GET_IT_DECLARATION_EMPLOYEES] (@START_YEAR BIGINT,@END_YEAR BIGINT)            
AS            
BEGIN            
 DECLARE @START_DATE DATE            
  ,@END_DATE DATE            
            
 SET @START_DATE = CAST(CAST(@START_YEAR AS VARCHAR) + '-04-01' AS DATE)      
 SET @END_DATE = EOMONTH(CAST(CAST(@END_YEAR AS VARCHAR) + '-03-01' AS DATE));           
            
 WITH PAYSLIP_DETAILS            
 AS (            
  SELECT Emp_No            
   ,ISNULL(SUM(Gross_Earnings), 0) AS Gross_Earnings            
   ,MAX(CAST(EP.Month + ' 01 ' + CAST(EP.Year AS VARCHAR) AS DATE)) AS Max_date            
  FROM EMPLOYEE_PAYSLIP EP WITH (NOLOCK)            
  WHERE CAST(EP.Month + ' 01 ' + CAST(EP.Year AS VARCHAR) AS DATE) BETWEEN @START_DATE            
    AND @END_DATE            
  GROUP BY Emp_No            
  )            
  ,SALARY_FITMENTS            
 AS (            
  SELECT EE.EMP_ID AS EMP_ID            
   ,CASE             
    WHEN MONTH(Max_date) = MONTH(@END_DATE)            
     AND YEAR(Max_date) = YEAR(@END_DATE)            
     THEN 0            
    ELSE (DATEDIFF(MONTH, Max_date, @END_DATE) * EE.MONTHLY_GROSS)            
    END AS Projected_Annual_gross            
  FROM PAYSLIP_DETAILS PD WITH (NOLOCK)            
  INNER JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = PD.Emp_No            
  INNER JOIN MTS_PAYROLL_EMPLOYEE_EARNINGS EE WITH (NOLOCK) ON EE.EMP_ID = E.ID            
   AND EE.ACTIVE = 1            
  )         
    ,EMPLOYEE_SECTION_DETAILS            
 AS (            
   SELECT EMP_IT_ID, Submitted_on, Proof_Submitted_on, Approved_On,IT_Declaration_Enabled AS IT_Declaration_Enabled, Employee_id
   FROM  MTS_IT_DECLARATION_EMPLOYEE_DETAILS ITDE WITH (NOLOCK) 
   LEFT JOIN MTS_IT_DECLARATION_EMPLOYEE_SECTION_DETAILS SD WITH (NOLOCK) ON SD.EMP_IT_ID = ITDE.ID
   GROUP BY  EMP_IT_ID,Submitted_on, Proof_Submitted_on, Approved_On,IT_Declaration_Enabled,Employee_id
  )     
 SELECT E.id            
  ,E.Employee_Id AS Emp_Code            
  ,E.Firstname + ' ' + E.Lastname AS Emp_Name            
  ,E.Dateofjoin AS Dateofjoin            
  ,D.Department AS Department_Name            
  ,DSG.Designation AS Designation_Name            
  ,PD.Gross_Earnings AS Gross_Earnings            
  ,SF.Projected_Annual_gross AS Projected_Annual_gross            
  ,(PD.Gross_Earnings + SF.Projected_Annual_gross) AS Total_Earnings            
  ,IT_Declaration_Enabled AS IT_Declaration_Enabled            
  ,CASE             
   WHEN Submitted_on IS NULL            
    THEN 'Submission Pending'            
   WHEN Submitted_on IS NOT NULL            
    AND Proof_Submitted_on IS NULL            
    THEN 'Proof Submission Pending'            
   WHEN Submitted_on IS NOT NULL            
    AND Proof_Submitted_on IS NOT NULL            
    AND Approved_On IS NULL            
    THEN 'Approval Pending'            
   ELSE NULL            
   END AS [STATUS]            
 FROM Employee E WITH (NOLOCK)            
 INNER JOIN MTS_LOGIN ML WITH (NOLOCK) ON ML.USERID = E.ID            
 INNER JOIN MTS_Department D WITH (NOLOCK) ON E.DepartmentId = D.id            
 LEFT JOIN MTS_Designation DSG WITH (NOLOCK) ON E.Designation = DSG.id            
 INNER JOIN PAYSLIP_DETAILS PD ON PD.Emp_No = E.Employee_Id            
 INNER JOIN SALARY_FITMENTS SF ON SF.EMP_ID = E.ID            
 LEFT JOIN EMPLOYEE_SECTION_DETAILS ITDS WITH (NOLOCK) ON ITDS.Employee_id = E.ID           
 WHERE (            
   ML.ACTIVE = 1            
   OR (            
    ML.ACTIVE = 0            
    AND ML.ResignedOn > @END_DATE            
    )            
   )            
END 
GO

/****** Object:  StoredProcedure [dbo].[MTS_GET_IT_DECLARATION_FINANCIAL_YEAR]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GET_IT_DECLARATION_FINANCIAL_YEAR]
AS
BEGIN
	SELECT Id
		,Financial_Year
		,STATUS
		,Last_Submission_Date
		,MIN_ANNUAL_AMOUNT AS Min_Annual_Amount
	FROM MTS_IT_DECLARATION_FINANCIAL_YEAR WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GET_IT_DECLARATION_HOUSE_LOAN_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GET_IT_DECLARATION_HOUSE_LOAN_DETAILS] (
	@Employee_Id BIGINT
	,@Financial_Year BIGINT
	)
AS
BEGIN
	SELECT ID
		,EMPLOYEE_ID
		,FINANCIAL_YEAR
		,PRINCIPAL_PAID_ON_LOAN
		,INTEREST_PAID_ON_LOAN
		,NAME_OF_LENDER
		,LENDER_PAN
	FROM MTS_IT_DECLARATION_HOUSE_LOAN_DETAILS WITH (NOLOCK)
	WHERE Employee_Id = @Employee_Id
		AND Financial_Year = @Financial_Year
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GET_IT_DECLARATION_HOUSE_RENT_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GET_IT_DECLARATION_HOUSE_RENT_DETAILS] (
	@Employee_Id BIGINT
	,@Financial_Year BIGINT
	)
AS
BEGIN
	SELECT Id
		,Employee_id
		,Financial_Year
		,Rented_From
		,Rented_To
		,Rental_Amount
		,Isnull(Actual_amount, 0.00) AS Actual_amount
		,Land_Lord_Pan
		,RENT_ADDRESS
		,Land_Lord_Name
	FROM MTS_IT_DECLARATION_HOUSE_RENT_DETAILS WITH (NOLOCK)
	WHERE Employee_Id = @Employee_Id
		AND Financial_Year = @Financial_Year

	SELECT Employee_id
		,Financial_Year
		,SUM(Rental_Amount) AS Total_Rental
		,sum(Isnull(Actual_amount, 0.00)) AS Actual_amount
	FROM MTS_IT_DECLARATION_HOUSE_RENT_DETAILS WITH (NOLOCK)
	WHERE Employee_Id = @Employee_Id
		AND Financial_Year = @Financial_Year
	GROUP BY Employee_id
		,Financial_Year
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GET_IT_DECLARATION_OTHER_SOURCE_INCOME]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GET_IT_DECLARATION_OTHER_SOURCE_INCOME] (
	@Employee_Id BIGINT
	,@Financial_Year BIGINT
	)
AS
BEGIN
	SELECT ID
		,Employee_ID
		,Financial_Year
		,Income_Source
		,Income_Amount
		,INTEREST_EARNED_FROM_SAVINGS_DEPOSIT
		,INTEREST_EARNED_FROM_FIXED_DEPOSIT
	FROM MTS_IT_DECLARATION_OTHER_SOURCE_INCOME WITH (NOLOCK)
	WHERE Employee_Id = @Employee_Id
		AND Financial_Year = @Financial_Year
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GET_IT_DECLARATION_SECTION_SUBSECTION_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GET_IT_DECLARATION_SECTION_SUBSECTION_DETAILS] (
	@Employee_id BIGINT
	,@Financial_Year BIGINT
	)
AS
BEGIN
	
;WITH EMP_SECTION_DETAILS        
 AS (        
  SELECT SD.Section ,SD.EMP_IT_ID ,SD.Submitted_amount ,SD.Submitted_on 
  ,SD.Proof_Contents  ,SD.Proof_Submitted_on ,SD.Approved_Amount ,SD.Approved_By ,SD.Approved_On  
  FROM MTS_IT_DECLARATION_EMPLOYEE_DETAILS ED WITH (NOLOCK)   
  INNER JOIN MTS_IT_DECLARATION_EMPLOYEE_SECTION_DETAILS SD WITH (NOLOCK) ON ED.id= SD.EMP_IT_ID AND SD.sub_Section=''
  WHERE ED.Employee_id =@Employee_id AND ED.Financial_Year = @Financial_Year
  ) 

 SELECT MD.ID AS Id    
  ,MD.SECTION      
  ,MD.SUB_SECTION      
  ,ESD.EMP_IT_ID      
  ,DESCRIPTION      
  ,NOTES      
  ,MAX_LIMIT      
  ,[PERCENTAGE]      
  ,ACTIVE      
  ,Submitted_amount      
  ,Submitted_on      
  ,Proof_Contents      
  ,Proof_Submitted_on      
  ,Approved_Amount      
  ,Approved_By      
  ,Approved_On      
 FROM MTS_IT_DECLARATION_SECTIONS MD WITH (NOLOCK)  
  LEFT JOIN EMP_SECTION_DETAILS ESD ON ESD.Section = MD.SECTION     
 WHERE MD.SUB_SECTION = ''

 ;WITH EMP_SUB_SECTION_DETAILS        
 AS (        
  SELECT SD.Section , SD.sub_Section ,SD.EMP_IT_ID ,SD.Submitted_amount ,SD.Submitted_on 
  ,SD.Proof_Contents  ,SD.Proof_Submitted_on ,SD.Approved_Amount ,SD.Approved_By ,SD.Approved_On  
  FROM MTS_IT_DECLARATION_EMPLOYEE_DETAILS ED WITH (NOLOCK)   
  INNER JOIN MTS_IT_DECLARATION_EMPLOYEE_SECTION_DETAILS SD WITH (NOLOCK) ON ED.id= SD.EMP_IT_ID AND SD.sub_Section<>''
  WHERE ED.Employee_id =@Employee_id AND ED.Financial_Year = @Financial_Year
  )  
  
 SELECT MD.ID AS Id    
  ,MD.SECTION      
  ,MD.SUB_SECTION      
  ,ESSD.EMP_IT_ID      
  ,DESCRIPTION      
  ,NOTES      
  ,MAX_LIMIT      
  ,[PERCENTAGE]      
  ,ACTIVE      
  ,ESSD.Submitted_amount      
  ,ESSD.Submitted_on      
  ,ESSD.Proof_Contents      
  ,ESSD.Proof_Submitted_on      
  ,ESSD.Approved_Amount      
  ,ESSD.Approved_By      
  ,ESSD.Approved_On      
 FROM MTS_IT_DECLARATION_SECTIONS MD WITH (NOLOCK)   
 LEFT JOIN EMP_SUB_SECTION_DETAILS ESSD ON ESSD.Section = MD.SECTION AND ESSD.sub_Section = MD.SUB_SECTION
 WHERE MD.SUB_SECTION <> '' 
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GET_IT_DECLARATION_SUMMARY]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GET_IT_DECLARATION_SUMMARY] (
	@Employee_Id BIGINT
	,@Financial_Year BIGINT
	)
AS
BEGIN
		;

	WITH Hra
	AS (
		SELECT Employee_id
			,Financial_Year
			,SUM(Rental_Amount) AS Total_Rental
		FROM MTS_IT_DECLARATION_HOUSE_RENT_DETAILS WITH (NOLOCK)
		WHERE Employee_Id = @Employee_Id
			AND Financial_Year = @Financial_Year
		GROUP BY Employee_id
			,Financial_Year
		)
		,House_Loan
	AS (
		SELECT EMPLOYEE_ID
			,FINANCIAL_YEAR
			,PRINCIPAL_PAID_ON_LOAN
			,INTEREST_PAID_ON_LOAN
		FROM MTS_IT_DECLARATION_HOUSE_LOAN_DETAILS WITH (NOLOCK)
		WHERE Employee_Id = @Employee_Id
			AND Financial_Year = @Financial_Year
		)
		,Dec_Details
	AS (
		SELECT Employee_Id
			,Financial_Year
			,SUM(Submitted_amount) AS Submitted_amount
			,SUM(Approved_Amount) AS Approved_Amount
		FROM MTS_IT_DECLARATION_EMPLOYEE_SECTION_DETAILS ESD WITH (NOLOCK)
		INNER JOIN MTS_IT_DECLARATION_EMPLOYEE_DETAILS ED WITH (NOLOCK) ON ESD.EMP_IT_ID = ED.Id
		WHERE Employee_Id = @Employee_Id
			AND Financial_Year = @Financial_Year
		GROUP BY Employee_Id
			,Financial_Year
		)
	SELECT Total_Rental
		,PRINCIPAL_PAID_ON_LOAN
		,INTEREST_PAID_ON_LOAN
		,Submitted_amount
		,Approved_Amount
	FROM Hra H
	INNER JOIN House_Loan HL ON H.Employee_id = HL.EMPLOYEE_ID
		AND H.Financial_Year = HL.FINANCIAL_YEAR
	INNER JOIN Dec_Details DD ON DD.Employee_id = HL.EMPLOYEE_ID
		AND DD.Financial_Year = HL.FINANCIAL_YEAR
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETACTIVESECURITYQUESTIONS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETACTIVESECURITYQUESTIONS]
	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
AS
BEGIN
	SET NOCOUNT ON;

	SELECT QUESTIONID
		,QUESTION
	FROM MTS_Q_A WITH (NOLOCK)
	WHERE ACTIVE = 1
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETAPPCONFIG]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETAPPCONFIG]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT CONFIGKEY
		,CONFIGVALUE
	FROM MTS_APPCONFIG WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETCREATEUSER]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETCREATEUSER]
AS
BEGIN
	--GET CLIENT	
	SELECT 1
		,1
		,1

	--GETBUSINESS
	SELECT 1
		,1

	--GET DEPARTMENTS
	SELECT 1
		,1
		,1

	--GET LOCATIONS
	SELECT 1
		,1
		,1

	--GET ROLES
	SELECT ROLE_NAME
		,ROLEID
		,BUSINESSID
		,CLIENTID
		,LOCATIONID
		,COMPANYID
		,DEPARTMENTID
	FROM MTS_ROLES WITH (NOLOCK)
	WHERE AUTHORITY_LEVEL < 100
		AND AUTHORITY_LEVEL > 0
		AND ACTIVE = 1

	SELECT 1
		,1
		,1
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETDETAILVIEW]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETDETAILVIEW] @USERID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT L.USERNAME
		,L.USERID
		,L.FIRSTNAME
		,L.LASTNAME
		,C.EMAIL
		,C.ADD1
		,C.ADD2
		,C.CITY
		,C.STATE
		,C.COUNTRY
		,C.ZIPCODE
		,C.PHONE
		,C.MOBILE
	FROM MTS_LOGIN L WITH (NOLOCK)
	INNER JOIN MTS_USERCONTACTS C WITH (NOLOCK) ON C.USERID = L.USERID
	WHERE L.USERID = @USERID
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETEMAILSCHEDULE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETEMAILSCHEDULE]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT SCHEDULEID
		,TEMPLATEID
		,SENDBY
		,DAY
		,[TIME]
	FROM MTS_EMAILSCHEDULE WITH (NOLOCK)
	WHERE SENDBY = 1;
END;
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETEMAILSCHEDULEFORTIMESCHEDULER]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETEMAILSCHEDULEFORTIMESCHEDULER]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT SCHEDULEID
		,TEMPLATEID
		,SENDBY
		,DAY
		,[TIME]
	FROM MTS_EMAILSCHEDULE WITH (NOLOCK)
	WHERE SENDBY <> 1;
END;
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETEMAILSWAITINGTOBESEND]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETEMAILSWAITINGTOBESEND]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT ID
		,TEMPLATEID
		,EMAILSP
	FROM MTS_EMAILMASTER WITH (NOLOCK)
	WHERE STATUS = 0;
END;
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETEMAILTEMPLATE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETEMAILTEMPLATE]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT TEMPLATEID
		,TEMPLATENAME
		,XMLTEMPLATE
		,SMTPID
		,ACTIVE
		,HTMLPAGE
	FROM MTS_EMAILTEMPLATE WITH (NOLOCK);
END;
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETEMPLOYEEROLE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETEMPLOYEEROLE] @employeeid BIGINT
AS
BEGIN
	SELECT R.ROLE_NAME
	FROM MTS_ROLES R WITH (NOLOCK)
	INNER JOIN MTS_AUTHORITY A WITH (NOLOCK) ON A.ROLEID = R.ROLEID
		AND A.USERID = @employeeid
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETPASSWORDHISTORY]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETPASSWORDHISTORY] (@USERID BIGINT)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT PH_ID
		,PASSWORD
	FROM MTS_PASSWORDHISTORY WITH (NOLOCK)
	WHERE USERID = @USERID
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETPASSWORDPOLICY]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETPASSWORDPOLICY]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT PASSWORDPOLICYID
		,PASSWORDCHANGEDAYS
		,PASSWORDCOUNT
		,MAXIMUM_ATTEMPTS
		,PASSWORDREGEX
		,MINIMUM_LENGTH
		,MAXIMUM_LENGH
	FROM MTS_PASSWORD_POLICY WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETQA]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETQA]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT QUESTIONID
		,QUESTION
		,ACTIVE
	FROM MTS_Q_A WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETQABASEDONID]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETQABASEDONID] @QUESTIONID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT QUESTION
		,ACTIVE
		,QUESTIONID
	FROM MTS_Q_A WITH (NOLOCK)
	WHERE QUESTIONID = @QUESTIONID
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETROLE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETROLE]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT ROLEID
		,ROLE_NAME [Role]
		,C.COMPANYNAME [Department]
	FROM MTS_ROLES R WITH (NOLOCK)
	INNER JOIN MTS_COMPANY C WITH (NOLOCK) ON R.COMPANYID = C.COMPANYID
		AND ROLEID <> 1 
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETSECURITYQUESTIONS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETSECURITYQUESTIONS]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT QUESTIONID
		,QUESTION
	FROM MTS_Q_A WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETSERVICECONFIG]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETSERVICECONFIG]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT SERVICENAME
		,SERVICEDISPLAYNAME
		,SERVICEDESCRIPTION
		,SERVICEINVOKETYPE
		,SERVICEPARAMS
		,[TIME]
	FROM MTS_SERVICECONFIG WITH (NOLOCK)
	ORDER BY [SERVICEID] ASC
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETSERVICECONFIGFORSERVICE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETSERVICECONFIGFORSERVICE] @Servicename VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT SERVICENAME
		,SERVICEDISPLAYNAME
		,SERVICEDESCRIPTION
		,SERVICEINVOKETYPE
		,DLLNAME
		,SERVICEPARAMS
		,[TIME]
		,RETRYCOUNT
		,MAXERRORS
	FROM [MTS_SERVICECONFIG] WITH (NOLOCK)
	WHERE SERVICENAME = @Servicename;
END;
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETSTMPDETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETSTMPDETAILS]
AS
BEGIN
	OPEN SYMMETRIC KEY PASSWORDKEY DECRYPTION BY CERTIFICATE SMTP;

	SELECT SMTPID
		,SMTPCLIENTHOST
		,SMTPCLIENTPORT
		,USERNAME
		,CONVERT(VARCHAR, DECRYPTBYKEY(PASSWORD)) AS PASSWORD
		,DOMAIN
		,ENABLESSL
		,TIMEOUT
		,SMTPDELIVERYMETHOD
		,USEDEFAULTCREDENTIALS
	FROM MTS_SMTPDETAILS WITH (NOLOCK);
END;
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETTEMPLATEIDFROMSCHEDULEID]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETTEMPLATEIDFROMSCHEDULEID] @Scheduleid INT
AS
BEGIN
	SELECT TEMPLATEID
	FROM EMAILSCHEDULE WITH (NOLOCK)
	WHERE SCHEDULEID = @Scheduleid;
END;
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETUSER]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETUSER] (@LOGIN VARCHAR(30))
AS
BEGIN
	SET NOCOUNT ON;

	SELECT L.USERID
		,L.USERNAME
		,L.PASSWORD
		,L.QUESTIONID
		,L.SEC_A
		,L.STATUS
		,L.LOCKED
		,L.LAST_LOGIN
		,GETDATE() LAST_PWD_CHANGE
		,L.NO_OF_ATTEMPTS
		,L.MENURANGE
		,L.FIRSTNAME
		,L.LASTNAME
		,L.ACTIVE
		,UC.EMAIL
		,ROLEID = (
			SELECT AUTHORITY_LEVEL
			FROM MTS_ROLES WITH (NOLOCK)
			WHERE ROLEID = AUTH.ROLEID
			)
		,ROLENAME = (
			SELECT ROLE_NAME
			FROM MTS_ROLES WITH (NOLOCK)
			WHERE ROLEID = AUTH.ROLEID
			)
	FROM MTS_LOGIN L WITH (NOLOCK)
	LEFT JOIN MTS_AUTHORITY AUTH WITH (NOLOCK) ON AUTH.USERID = L.USERID
	LEFT JOIN MTS_USERCONTACTS UC WITH (NOLOCK) ON L.USERID = UC.USERID
	WHERE L.USERNAME = @LOGIN

	SELECT TOP (1) PWDPSY.PASSWORDPOLICYID
		,PWDPSY.BUSINESSID
		,PWDPSY.CLIENTID
		,PWDPSY.LOCATIONID
		,PWDPSY.COMPANYID
		,PWDPSY.DEPARTMENTID
		,PWDPSY.PASSWORDCHANGEDAYS
		,PWDPSY.PASSWORDCOUNT
		,PWDPSY.MAXIMUM_ATTEMPTS
		,PWDPSY.PASSWORDREGEX
		,PWDPSY.MINIMUM_LENGTH
		,PWDPSY.MAXIMUM_LENGH
	FROM MTS_PASSWORD_POLICY PWDPSY WITH (NOLOCK)
	WHERE PWDPSY.BUSINESSID = 1
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETUSERDETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETUSERDETAILS] @USERID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT L.USERNAME
		,L.FIRSTNAME
		,L.LASTNAME
		,C.EMAIL
		,L.USERID
		,L.LOCKED
		,A.ROLEID
		,ROLE_NAME
		,L.ACTIVE
	FROM MTS_LOGIN L WITH (NOLOCK)
	INNER JOIN MTS_USERCONTACTS C WITH (NOLOCK) ON C.USERID = L.USERID
	INNER JOIN MTS_AUTHORITY A WITH (NOLOCK) ON A.USERID = L.USERID
	INNER JOIN MTS_ROLES R WITH (NOLOCK) ON R.ROLEID = A.ROLEID
	WHERE L.USERID = @USERID
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETUSERLIST]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETUSERLIST]
AS
BEGIN
	--GET CARD TYPE
	SELECT L.USERID
		,L.USERNAME
		,L.FIRSTNAME
		,L.LASTNAME
		,C.EMAIL
		,R.ROLE_NAME
	FROM MTS_LOGIN L WITH (NOLOCK)
	INNER JOIN MTS_USERCONTACTS C WITH (NOLOCK) ON C.USERID = L.USERID
	INNER JOIN MTS_AUTHORITY A WITH (NOLOCK) ON A.USERID = L.USERID
	INNER JOIN MTS_ROLES R WITH (NOLOCK) ON R.ROLEID = A.ROLEID

	SELECT COUNT(USERID) AS TOTAL_USERS
	FROM MTS_LOGIN WITH (NOLOCK)
	WHERE ACTIVE = 1
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_GETUSERS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETUSERS]
AS
BEGIN
	SELECT L.USERID
		,L.USERNAME
		,L.FIRSTNAME
		,L.LASTNAME
	FROM MTS_LOGIN L WITH (NOLOCK)
	INNER JOIN MTS_AUTHORITY A WITH (NOLOCK) ON A.USERID = L.USERID
	WHERE A.ROLEID = (
			SELECT ROLEID
			FROM MTS_ROLES WITH (NOLOCK)
			WHERE ROLE_NAME = 'USER'
			)
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_INSERT_IT_DECLARELATION_SECTIONS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_INSERT_IT_DECLARELATION_SECTIONS] (
	@EMP_IT_ID BIGINT
	,@Section VARCHAR(50)
	,@sub_Section VARCHAR(50)
	,@Submitted_amount DECIMAL(18, 2)
	,@Submitted_on DATETIME
	,@Proof_Contents VARBINARY(MAX)
	,@Proof_Submitted_on DATETIME
	,@Approved_Amount DECIMAL(18, 2)
	,@Approved_By VARCHAR(255)
	,@Approved_On DATETIME
	,@Financial_Year BIGINT
	,@Employee_id BIGINT
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT 1
			FROM MTS_IT_DECLARATION_EMPLOYEE_SECTION_DETAILS WITH (NOLOCK)
			WHERE Section = @Section
				AND sub_Section = @sub_Section
				AND EMP_IT_ID = @EMP_IT_ID
			)
	BEGIN
		INSERT INTO MTS_IT_DECLARATION_EMPLOYEE_SECTION_DETAILS (
			EMP_IT_ID
			,Section
			,sub_Section
			,Submitted_amount
			,Submitted_on
			,Proof_Contents
			,Proof_Submitted_on
			,Approved_Amount
			,Approved_By
			,Approved_On
			)
		VALUES (
			@EMP_IT_ID
			,@Section
			,@sub_Section
			,@Submitted_amount
			,@Submitted_on
			,@Proof_Contents
			,@Proof_Submitted_on
			,@Approved_Amount
			,@Approved_By
			,@Approved_On
			)
	END
	ELSE
	BEGIN
		UPDATE MTS_IT_DECLARATION_EMPLOYEE_SECTION_DETAILS
		SET Submitted_amount = @Submitted_amount
			,Submitted_on = ISNULL(@Submitted_on, Submitted_on)
			,Proof_Contents = @Proof_Contents
			,Proof_Submitted_on = ISNULL(@Proof_Submitted_on, Proof_Submitted_on)
			,Approved_Amount = @Approved_Amount
			,Approved_By = @Approved_By
			,Approved_On = ISNULL(@Approved_On, Approved_On)
		WHERE EMP_IT_ID = @EMP_IT_ID
			AND Section = @Section
			AND sub_Section = @sub_Section
	END

	IF @Section = '80C'
		AND @sub_Section = '(n)'
	BEGIN
		UPDATE MTS_IT_DECLARATION_HOUSE_LOAN_DETAILS
		SET INTEREST_PAID_ON_LOAN = @Submitted_amount
		WHERE EMPLOYEE_ID = @Employee_id
			AND FINANCIAL_YEAR = @Financial_Year
	END

	IF @Section = '80EE'
		AND @sub_Section = '80EEA'
	BEGIN
		UPDATE MTS_IT_DECLARATION_HOUSE_LOAN_DETAILS
		SET PRINCIPAL_PAID_ON_LOAN = @Submitted_amount
		WHERE EMPLOYEE_ID = @Employee_id
			AND FINANCIAL_YEAR = @Financial_Year
	END
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_INSERT_UPDATE_IT_DECLARATION_HOUSE_LOAN_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_INSERT_UPDATE_IT_DECLARATION_HOUSE_LOAN_DETAILS] (
	@ID BIGINT
	,@Employee_id BIGINT
	,@Financial_Year BIGINT
	,@PRINCIPAL_PAID_ON_LOAN DECIMAL(18, 2)
	,@INTEREST_PAID_ON_LOAN DECIMAL(18, 2)
	,@NAME_OF_LENDER VARCHAR(100)
	,@LENDER_PAN VARCHAR(50)
	)
AS
BEGIN
	IF @ID = 0
	BEGIN
		INSERT INTO MTS_IT_DECLARATION_HOUSE_LOAN_DETAILS (
			EMPLOYEE_ID
			,FINANCIAL_YEAR
			,PRINCIPAL_PAID_ON_LOAN
			,INTEREST_PAID_ON_LOAN
			,NAME_OF_LENDER
			,LENDER_PAN
			)
		VALUES (
			@Employee_id
			,@Financial_Year
			,@PRINCIPAL_PAID_ON_LOAN
			,@INTEREST_PAID_ON_LOAN
			,@NAME_OF_LENDER
			,@LENDER_PAN
			)
	END
	ELSE
	BEGIN
		IF EXISTS (
				SELECT 1
				FROM MTS_IT_DECLARATION_HOUSE_LOAN_DETAILS WITH (NOLOCK)
				WHERE Id = @ID
				)
		BEGIN
			UPDATE MTS_IT_DECLARATION_HOUSE_LOAN_DETAILS
			SET PRINCIPAL_PAID_ON_LOAN = @PRINCIPAL_PAID_ON_LOAN
				,INTEREST_PAID_ON_LOAN = @INTEREST_PAID_ON_LOAN
				,NAME_OF_LENDER = @NAME_OF_LENDER
				,LENDER_PAN = @LENDER_PAN
			WHERE Id = @ID
		END
	END

	BEGIN
		DECLARE @EMP_IT_ID BIGINT
			,@Section VARCHAR(50)
			,@sub_Section VARCHAR(50)
			,@Submitted_amount DECIMAL(18, 2)
			,@Submitted_on DATETIME
			,@Proof_Contents VARBINARY(MAX)
			,@Proof_Submitted_on DATETIME
			,@Approved_Amount DECIMAL(18, 2)
			,@Approved_By VARCHAR(255)
			,@Approved_On DATE

		SELECT @EMP_IT_ID = isnull(ID, 0)
		FROM MTS_IT_DECLARATION_EMPLOYEE_DETAILS WITH (NOLOCK)
		WHERE Employee_id = @Employee_id
			AND Financial_Year = @Financial_Year

		SET @EMP_IT_ID = ISNULL(@EMP_IT_ID, 0)
		SET @Section = '80C'
		SET @sub_Section = '(n)'
		SET @Submitted_amount = @PRINCIPAL_PAID_ON_LOAN
		SET @Submitted_on = NULL
		SET @Proof_Contents = NULL
		SET @Approved_Amount = 0.00
		SET @Proof_Submitted_on = NULL
		SET @Approved_By = NULL
		SET @Approved_On = NULL

		EXEC MTS_INSERT_IT_DECLARELATION_SECTIONS @EMP_IT_ID
			,@Section
			,@sub_Section
			,@Submitted_amount
			,@Submitted_on
			,@Proof_Contents
			,@Proof_Submitted_on
			,@Approved_Amount
			,@Approved_By
			,@Approved_On
			,@Financial_Year
			,@Employee_id

		SET @EMP_IT_ID = ISNULL(@EMP_IT_ID, 0)
		SET @Section = '80C'

		SELECT @Submitted_amount = SUM(Submitted_amount)
		FROM MTS_IT_DECLARATION_EMPLOYEE_SECTION_DETAILS WITH (NOLOCK)
		WHERE Section = @Section
			AND sub_Section <> ''
			AND EMP_IT_ID = @EMP_IT_ID

		SET @EMP_IT_ID = ISNULL(@EMP_IT_ID, 0)
		SET @Section = '80C'
		SET @sub_Section = ''
		SET @Submitted_amount = @Submitted_amount
		SET @Submitted_on = NULL
		SET @Proof_Contents = NULL
		SET @Approved_Amount = 0.00
		SET @Proof_Submitted_on = NULL
		SET @Approved_By = NULL
		SET @Approved_On = NULL

		EXEC MTS_INSERT_IT_DECLARELATION_SECTIONS @EMP_IT_ID
			,@Section
			,@sub_Section
			,@Submitted_amount
			,@Submitted_on
			,@Proof_Contents
			,@Proof_Submitted_on
			,@Approved_Amount
			,@Approved_By
			,@Approved_On
			,@Financial_Year
			,@Employee_id

		SET @EMP_IT_ID = ISNULL(@EMP_IT_ID, 0)
		SET @Section = '80EE'
		SET @sub_Section = ''
		SET @Submitted_amount = @INTEREST_PAID_ON_LOAN
		SET @Submitted_on = NULL
		SET @Proof_Contents = NULL
		SET @Approved_Amount = 0.00
		SET @Proof_Submitted_on = NULL
		SET @Approved_By = NULL
		SET @Approved_On = NULL

		EXEC MTS_INSERT_IT_DECLARELATION_SECTIONS @EMP_IT_ID
			,@Section
			,@sub_Section
			,@Submitted_amount
			,@Submitted_on
			,@Proof_Contents
			,@Proof_Submitted_on
			,@Approved_Amount
			,@Approved_By
			,@Approved_On
			,@Financial_Year
			,@Employee_id

		SET @EMP_IT_ID = ISNULL(@EMP_IT_ID, 0)
		SET @Section = '80EE'
		SET @sub_Section = '80EEA'
		SET @Submitted_amount = @INTEREST_PAID_ON_LOAN
		SET @Submitted_on = NULL
		SET @Proof_Contents = NULL
		SET @Approved_Amount = 0.00
		SET @Proof_Submitted_on = NULL
		SET @Approved_By = NULL
		SET @Approved_On = NULL

		EXEC MTS_INSERT_IT_DECLARELATION_SECTIONS @EMP_IT_ID
			,@Section
			,@sub_Section
			,@Submitted_amount
			,@Submitted_on
			,@Proof_Contents
			,@Proof_Submitted_on
			,@Approved_Amount
			,@Approved_By
			,@Approved_On
			,@Financial_Year
			,@Employee_id
	END
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_INSERT_UPDATE_IT_DECLARATION_HOUSE_RENT_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_INSERT_UPDATE_IT_DECLARATION_HOUSE_RENT_DETAILS] (
	@ID BIGINT
	,@Employee_id BIGINT
	,@Financial_Year BIGINT
	,@Rented_From DATE
	,@Rented_To DATE
	,@Rental_Amount DECIMAL(18, 2)
	,@Land_Lord_Pan VARCHAR(50)
	,@Rental_Address VARCHAR(255)
	,@Land_Lord_Name VARCHAR(255)
	,@Actual_Amount DECIMAL(18, 2)
	)
AS
BEGIN
	IF @ID = 0
	BEGIN
		INSERT INTO MTS_IT_DECLARATION_HOUSE_RENT_DETAILS (
			Employee_id
			,Financial_Year
			,Rented_From
			,Rented_To
			,Rental_Amount
			,Land_Lord_Pan
			,RENT_ADDRESS
			,Land_Lord_Name
			,Actual_amount
			)
		VALUES (
			@Employee_id
			,@Financial_Year
			,@Rented_From
			,@Rented_To
			,@Rental_Amount
			,@Land_Lord_Pan
			,@Rental_Address
			,@Land_Lord_Name
			,@Actual_Amount
			)
	END
	ELSE
	BEGIN
		IF EXISTS (
				SELECT 1
				FROM MTS_IT_DECLARATION_HOUSE_RENT_DETAILS WITH (NOLOCK)
				WHERE Id = @ID
				)
		BEGIN
			UPDATE MTS_IT_DECLARATION_HOUSE_RENT_DETAILS
			SET Rented_From = @Rented_From
				,Rented_To = @Rented_To
				,Rental_Amount = @Rental_Amount
				,Land_Lord_Pan = @Land_Lord_Pan
				,RENT_ADDRESS = @Rental_Address
				,Land_Lord_Name = @Land_Lord_Name
				,Actual_amount = @Actual_Amount
			WHERE Id = @ID
		END
	END

	BEGIN
		DECLARE @EMP_IT_ID BIGINT
			,@Section VARCHAR(50)
			,@sub_Section VARCHAR(50)
			,@Submitted_amount DECIMAL(18, 2)
			,@Submitted_on DATETIME
			,@Proof_Contents VARBINARY(MAX)
			,@Proof_Submitted_on DATETIME
			,@Approved_Amount DECIMAL(18, 2)
			,@Approved_By VARCHAR(255)
			,@Approved_On DATE

		SELECT @EMP_IT_ID = ISNULL(Id, 0)
		FROM MTS_IT_DECLARATION_EMPLOYEE_DETAILS WITH (NOLOCK)
		WHERE Employee_id = @Employee_id
			AND Financial_Year = @Financial_Year

		SELECT @Submitted_amount = SUM(Rental_Amount)
			,@Approved_Amount = sum(Isnull(Actual_amount, 0.00))
		FROM MTS_IT_DECLARATION_HOUSE_RENT_DETAILS WITH (NOLOCK)
		WHERE Employee_Id = @Employee_Id
			AND Financial_Year = @Financial_Year
		GROUP BY Employee_id
			,Financial_Year

		SET @EMP_IT_ID = ISNULL(@EMP_IT_ID, 0)
		SET @Section = '80GG'
		SET @sub_Section = ''
		SET @Submitted_on = NULL
		SET @Proof_Contents = NULL
		SET @Proof_Submitted_on = NULL
		SET @Approved_By = NULL
		SET @Approved_On = NULL

		EXEC MTS_INSERT_IT_DECLARELATION_SECTIONS @EMP_IT_ID
			,@Section
			,@sub_Section
			,@Submitted_amount
			,@Submitted_on
			,@Proof_Contents
			,@Proof_Submitted_on
			,@Approved_Amount
			,@Approved_By
			,@Approved_On
			,@Financial_Year
			,@Employee_id
	END
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_INSERT_UPDATE_IT_DECLARATION_OTHER_SOURCE_INCOME]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_INSERT_UPDATE_IT_DECLARATION_OTHER_SOURCE_INCOME] (
	@ID BIGINT
	,@Employee_ID BIGINT
	,@Financial_Year BIGINT
	,@Income_Source VARCHAR(100)
	,@Income_Amount DECIMAL(18, 2)
	,@Savings_Deposit_Interest DECIMAL(18, 2)
	,@Fixed_Deposit_Interest DECIMAL(18, 2)
	)
AS
BEGIN
	IF @ID = 0
	BEGIN
		INSERT INTO MTS_IT_DECLARATION_OTHER_SOURCE_INCOME (
			Employee_ID
			,Financial_Year
			,Income_Source
			,Income_Amount
			,INTEREST_EARNED_FROM_SAVINGS_DEPOSIT
			,INTEREST_EARNED_FROM_FIXED_DEPOSIT
			)
		VALUES (
			@Employee_ID
			,@Financial_Year
			,@Income_Source
			,@Income_Amount
			,@Savings_Deposit_Interest
			,@Fixed_Deposit_Interest
			)
	END
	ELSE
	BEGIN
		IF EXISTS (
				SELECT 1
				FROM MTS_IT_DECLARATION_OTHER_SOURCE_INCOME WITH (NOLOCK)
				WHERE ID = @ID
				)
		BEGIN
			UPDATE MTS_IT_DECLARATION_OTHER_SOURCE_INCOME
			SET Income_Source = @Income_Source
				,Income_Amount = @Income_Amount
				,INTEREST_EARNED_FROM_SAVINGS_DEPOSIT = @Savings_Deposit_Interest
				,INTEREST_EARNED_FROM_FIXED_DEPOSIT = @Fixed_Deposit_Interest
			WHERE ID = @ID
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_IT_DECLARATION_EMP_IDS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_IT_DECLARATION_EMP_IDS]
AS
BEGIN
	DECLARE @YEAR_ID BIGINT

	SELECT @YEAR_ID = Id
	FROM MTS_IT_DECLARATION_FINANCIAL_YEAR WITH (NOLOCK)
	WHERE [status] = 1

	SELECT Employee_id
	FROM MTS_IT_DECLARATION_EMPLOYEE_DETAILS WITH (NOLOCK)
	WHERE Financial_Year = @YEAR_ID AND IT_Declaration_Enabled = 1
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_PAYROLL_AUDIT]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_PAYROLL_AUDIT] (
	@AUDIT_OPTION_ID BIGINT
	,@UNIQUE_ID BIGINT
	,@USER_ID BIGINT
	)
AS
BEGIN
	IF @AUDIT_OPTION_ID = 1
	BEGIN
		INSERT INTO MTS_PAYROLL_EMPLOYEE_EXIT_BONUS_AUDIT (
			BONUS_ID
			,MAX_GROSS_SALARY
			,CEILING_AMOUNT
			,CEILING_PERCENTAGE
			,PREVIOUS_BONUS_DATE
			,EFFECTIVE_MONTH
			,MODIFIED_BY
			,MODIFIED_ON
			)
		SELECT ID
			,MAX_GROSS_SALARY
			,CEILING_AMOUNT
			,CEILING_PERCENTAGE
			,PREVIOUS_BONUS_DATE
			,EFFECTIVE_MONTH
			,@USER_ID
			,GETDATE()
		FROM MTS_PAYROLL_EMPLOYEE_EXIT_BONUS
		WHERE ID = @UNIQUE_ID
	END

	IF @AUDIT_OPTION_ID = 2
	BEGIN
		INSERT INTO MTS_PAYROLL_EMPLOYEE_LOP_AUDIT (
			LOP_ID
			,EMP_ID
			,PAYROLL_MONTH
			,LEAVE_FROM
			,LEAVE_TO
			,LOP_DAYS
			,AUTO_LOP
			,STATUS
			,REASON
			,MODIFIED_BY
			,MODIFIED_ON
			)
		SELECT ID
			,EMP_ID
			,PAYROLL_MONTH
			,LEAVE_FROM
			,LEAVE_TO
			,LOP_DAYS
			,AUTO_LOP
			,STATUS
			,REASON
			,@USER_ID
			,GETDATE()
		FROM MTS_PAYROLL_EMPLOYEE_LOP
		WHERE ID = @UNIQUE_ID
	END

	IF @AUDIT_OPTION_ID = 3
	BEGIN
		INSERT INTO MTS_PAYROLL_MONTHLY_DETAILS_FOR_EMPLOYEE_AUDIT (
			PAYROLL_ID
			,EMP_ID
			,PAYROLL_MONTH
			,BASIC_PAY
			,HOUSE_RENT
			,SPECIAL_ALLOWANCE
			,MEDICAL_ALLOWANCE
			,CONVEYENCE
			,MONTHLY_GROSS
			,GROSS_EARNINGS
			,PF_DETECTION
			,PROFESSIONAL_TAX
			,ESI_DEDUCTION
			,SUDEXO_DEDUCTION
			,INCOME_TAX
			,NET_MONTHLY_SALARY
			,INCENTIVE
			,EMPLOYER_PF
			,EMPLOYER_ESI
			,EMPLOYER_LWF
			,CTC_TOTAL
			,PAID_DAYS
			,LOP_DAYS
			,TOTAL_DAYS
			,EXIT_BONUS
			,FOOD_ALLOWANCE
			,EPF_WAGES
			,EPF_ADMIN_CHARGES
			,EPF_EDLI_CHARGES
			,REEMBUSMENT_CHARGES
			,OTHER_EARNINGS
			,OTHER_DEDUCTIONS
			,MODIFIED_BY
			,MODIFIED_ON
			)
		SELECT ID
			,EMP_ID
			,PAYROLL_MONTH
			,BASIC_PAY
			,HOUSE_RENT
			,SPECIAL_ALLOWANCE
			,MEDICAL_ALLOWANCE
			,CONVEYENCE
			,MONTHLY_GROSS
			,GROSS_EARNINGS
			,PF_DETECTION
			,PROFESSIONAL_TAX
			,ESI_DEDUCTION
			,SUDEXO_DEDUCTION
			,INCOME_TAX
			,NET_MONTHLY_SALARY
			,INCENTIVE
			,EMPLOYER_PF
			,EMPLOYER_ESI
			,EMPLOYER_LWF
			,CTC_TOTAL
			,PAID_DAYS
			,LOP_DAYS
			,TOTAL_DAYS
			,EXIT_BONUS
			,FOOD_ALLOWANCE
			,EPF_WAGES
			,EPF_ADMIN_CHARGES
			,EPF_EDLI_CHARGES
			,REEMBUSMENT_CHARGES
			,OTHER_EARNINGS
			,OTHER_DEDUCTIONS
			,@USER_ID
			,GETDATE()
		FROM MTS_PAYROLL_MONTHLY_DETAILS_FOR_EMPLOYEE
		WHERE ID = @UNIQUE_ID
	END
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_PAYROLL_CONSOLIDATE_SALARY_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_PAYROLL_CONSOLIDATE_SALARY_DETAILS] (
	@MONTH VARCHAR(2)
	,@YEAR VARCHAR(4)
	,@ATTANDANCE_FROM DATE
	,@ATTANDANCE_TO DATE
	)
AS
BEGIN
	DECLARE @MONTHNO VARCHAR(2)
		,@STARTDATE DATE
		,@ENDDATE DATE
		,@ATTENDANCE_DATE_FROM DATE
		,@ATTENDANCE_DATE_TO DATE

	SET @ATTENDANCE_DATE_FROM = @ATTANDANCE_FROM
	SET @ATTENDANCE_DATE_TO = @ATTANDANCE_TO

	IF EXISTS (
			SELECT 1
			FROM MTS_PAYROLL_MONTHLY_DETAILS_FOR_EMPLOYEE WITH (NOLOCK)
			WHERE MONTH(PAYROLL_MONTH) = @MONTH
				AND YEAR(PAYROLL_MONTH) = @YEAR
			)
	BEGIN
		DELETE
		FROM MTS_PAYROLL_MONTHLY_DETAILS_FOR_EMPLOYEE
		WHERE MONTH(PAYROLL_MONTH) = @MONTH
			AND YEAR(PAYROLL_MONTH) = @YEAR
	END

	IF LEN(@MONTH) = 2
	BEGIN
		SET @MONTHNO = @MONTH
	END
	ELSE IF LEN(@MONTH) = 1
	BEGIN
		SET @MONTHNO = '0' + @MONTH
	END

	SET @STARTDATE = CAST(@MONTHNO + '-01-' + @YEAR AS DATE)

	SELECT @ENDDATE = CAST(EOMONTH(@STARTDATE) AS DATE)

	EXEC MTS_PAYROLL_PREPROCESS_DETAILS @STARTDATE
		,@ENDDATE

	--check cycle date
	DECLARE @CYCLESTARTDATE DATE
		,@CYCLEENDDATE DATE
		,@CYCLEEndSTARTDATE DATE
		,@DATEQUARTER INT

	SET @DATEQUARTER = datepart(qq, @STARTDATE)

	BEGIN
		IF (
				@DATEQUARTER = 2
				OR @DATEQUARTER = 4
				)
		BEGIN
			SET @CYCLESTARTDATE = DATEADD(qq, DATEDIFF(qq, 0, @STARTDATE), 0)
			SET @CYCLEENDDATE = DATEADD(dd, - 1, DATEADD(qq, DATEDIFF(qq, 0, @STARTDATE) + 2, 0))
			SET @CYCLEEndSTARTDATE = dateadd(dd, (01 - datepart(dd, @CYCLEENDDATE)), @CYCLEENDDATE)
		END
		ELSE
		BEGIN
			SET @CYCLESTARTDATE = DATEADD(qq, DATEDIFF(qq, 0, @STARTDATE) - 1, 0)
			SET @CYCLEENDDATE = DATEADD(dd, - 1, DATEADD(qq, DATEDIFF(qq, 0, @STARTDATE) + 1, 0))
			SET @CYCLEEndSTARTDATE = dateadd(dd, (01 - datepart(dd, @CYCLEENDDATE)), @CYCLEENDDATE)
		END
	END

	PRINT @CYCLEENDDATE
	PRINT @CYCLEEndSTARTDATE
	PRINT @CYCLESTARTDATE

	--MTS_PAYROLL_ESI_MASTER
	DECLARE @ESI_NUMBER VARCHAR(50)
		,@ESI_EMPLOYEE_CONTRIBUTION_PERCENTAGE DECIMAL(18, 2)
		,@ESI_EMPLOYER_CONTRIBUTION_PERCENTAGE DECIMAL(18, 2)
		,@ESI_BASIC_SALARY DECIMAL(18, 2)

	SELECT TOP 1 @ESI_NUMBER = ESI_NUMBER
		,@ESI_EMPLOYEE_CONTRIBUTION_PERCENTAGE = ESI_EMPLOYEE_CONTRIBUTION_PERCENTAGE
		,@ESI_EMPLOYER_CONTRIBUTION_PERCENTAGE = ESI_EMPLOYER_CONTRIBUTION_PERCENTAGE
		,@ESI_BASIC_SALARY = ESI_BASIC_SALARY
	FROM MTS_PAYROLL_ESI_MASTER WITH (NOLOCK)
	WHERE EFFECTIVE_SINCE <= @ENDDATE
		AND STATUS = 1
	ORDER BY EFFECTIVE_SINCE DESC

	--MTS_PAYROLL_EPF_MASTER
	DECLARE @EPF_NUMBER VARCHAR(50)
		,@EPF_EMPLOYEE_CONTRIBUTION_PERCENTAGE DECIMAL(18, 2)
		,@EPF_EMPLOYER_CONTRIBUTION_PERCENTAGE DECIMAL(18, 2)
		,@EPF_MAX_SALARY DECIMAL(18, 2)
		,@EPF_MIN_SALARY DECIMAL(18, 2)
		,@EPS_ADMIN_CHARGES_PERCENTAGE DECIMAL(18, 2)
		,@EPS_EDLI_CHARGES_PERCENTAGE DECIMAL(18, 2)

	SELECT TOP 1 @EPF_NUMBER = EPF_NUMBER
		,@EPF_EMPLOYEE_CONTRIBUTION_PERCENTAGE = EPF_EMPLOYEE_CONTRIBUTION_PERCENTAGE
		,@EPF_EMPLOYER_CONTRIBUTION_PERCENTAGE = EPF_EMPLOYER_CONTRIBUTION_PERCENTAGE
		,@EPF_MAX_SALARY = EPF_BASIC_MAX_SALARY
		,@EPF_MIN_SALARY = EPF_BASIC_MIN_SALARY
		,@EPS_ADMIN_CHARGES_PERCENTAGE = ISNULL(EPS_ADMINISTRATIVE_CHARGES_PERCENTAGE, 0.00)
		,@EPS_EDLI_CHARGES_PERCENTAGE = ISNULL(EPS_EDLI_CHARGES_PERCENTAGE, 0.00)
	FROM MTS_PAYROLL_EPF_MASTER WITH (NOLOCK)
	WHERE EFFECTIVE_SINCE <= @ENDDATE
		AND STATUS = 1
	ORDER BY EFFECTIVE_SINCE DESC;

	--MTS_PAYROLL_LWF_MASTER
	DECLARE @LWF_NUMBER VARCHAR(50)
		,@LWF_EMPLOYEE_CONTRIBUTION_AMOUNT DECIMAL(18, 2)
		,@LWF_EMPLOYER_CONTRIBUTION_AMOUNT DECIMAL(18, 2)
		,@LWF_MAX_SALARY DECIMAL(18, 2)

	SELECT TOP 1 @LWF_NUMBER = LWF_NUMBER
		,@LWF_EMPLOYEE_CONTRIBUTION_AMOUNT = ISNULL(LWF_EMPLOYEE_CONTRIBUTION_AMOUNT, 0.00)
		,@LWF_EMPLOYER_CONTRIBUTION_AMOUNT = ISNULL(LWF_EMPLOYER_CONTRIBUTION_AMOUNT, 0.00)
		,@LWF_MAX_SALARY = ISNULL(LWF_BASIC_MAX_SALARY, 0.00)
	FROM MTS_PAYROLL_LWF_MASTER
	WHERE EOMONTH(EFFECTIVE_MONTH) = @ENDDATE
		AND STATUS = 1;

	--MTS_PAYROLL_EMPLOYEE_EXIT_BONUS
	DECLARE @EEB_EMPLOYEE_CEILING_PERCENTAGE DECIMAL(18, 2)
		,@EEB_EMPLOYER_CEILING_AMOUNT DECIMAL(18, 2)
		,@EEB_MAX_GROSS_SALARY DECIMAL(18, 2)
		,@EEB_PREVIOUS_BONUS_DATE DATE

	SELECT TOP 1 @EEB_EMPLOYEE_CEILING_PERCENTAGE = ISNULL(CEILING_PERCENTAGE, 0.00)
		,@EEB_EMPLOYER_CEILING_AMOUNT = ISNULL(CEILING_AMOUNT, 0.00)
		,@EEB_MAX_GROSS_SALARY = ISNULL(MAX_GROSS_SALARY, 0.00)
		,@EEB_PREVIOUS_BONUS_DATE = PREVIOUS_BONUS_DATE
	FROM MTS_PAYROLL_EMPLOYEE_EXIT_BONUS WITH (NOLOCK)
	WHERE (EFFECTIVE_MONTH) <= @ENDDATE
	ORDER BY EFFECTIVE_MONTH DESC;

	WITH EMPLOYEE_DETAILS
	AS (
		SELECT E.id AS EMP_ID
			,E.Employee_Id AS EMP_NO
			,E.Firstname + E.Lastname AS Name
			,E.Dateofjoin
			,E.Designation
			,E.GENDER
			,E.IS_PF_RESTRICTION_APPLICABLE
		FROM EMPLOYEE E WITH (NOLOCK)
		)
		,VARIANCE_EARNINGS
	AS (
		SELECT *
		FROM (
			SELECT EMP_ID
				,[DESCRIPTION]
				,AMOUNT
			FROM MTS_PAYROLL_EMPLOYEE_MONTHLY_VARIANCE WITH (NOLOCK)
			WHERE MONTH(EFFECTIVE_MONTH) = @MONTH
				AND YEAR(EFFECTIVE_MONTH) = @YEAR
				AND TYPE = '1'
			) t
		PIVOT(SUM(AMOUNT) FOR [DESCRIPTION] IN (
					[BONUS]
					,[INCENTIVE]
					,[REIMBURSEMENT]
					)) AS pivot_table
		)
		,EMPLOYEE_LEAVE_CUMULATIVE_DETAIL
	AS (
		SELECT Employee_Id
			,SUM(Numberofdays) AS LOP
		FROM EMPLOYEE_LEAVE_DETAILS ELD WITH (NOLOCK)
		WHERE ApprovedDate BETWEEN @ATTENDANCE_DATE_FROM
				AND @ATTENDANCE_DATE_TO
			AND isLOP = 1
		GROUP BY Employee_Id
		
		UNION ALL
		
		SELECT EMP_ID AS Employee_Id
			,SUM(LOP_DAYS) AS LOP
		FROM MTS_PAYROLL_EMPLOYEE_LOP ELD WITH (NOLOCK)
		WHERE MONTH(PAYROLL_MONTH) = @MONTH
			AND YEAR(PAYROLL_MONTH) = @YEAR
		GROUP BY EMP_ID
		)
		,EMPLOYEE_LEAVE_DETAIL
	AS (
		SELECT Employee_Id
			,SUM(LOP) AS LOP
		FROM EMPLOYEE_LEAVE_CUMULATIVE_DETAIL WITH (NOLOCK)
		GROUP BY Employee_Id
		)
		,PAID_DAYS_DETAIL
	AS (
		SELECT ED.EMP_ID
			,CASE 
				WHEN DATEDIFF(DAY, Dateofjoin, ML.ResignedOn) BETWEEN 0
						AND 30
					AND MONTH(Dateofjoin) = MONTH(ML.ResignedOn)
					AND CAST(ML.ResignedOn AS DATE) BETWEEN @STARTDATE
						AND @ENDDATE
					THEN ISNULL(datediff(day, Dateofjoin, ML.ResignedOn) + 1, 0)
				WHEN CAST(ML.ResignedOn AS DATE) BETWEEN @STARTDATE
						AND @ENDDATE
					THEN ISNULL(datediff(day, @STARTDATE, ML.ResignedOn) + 1, 0)
				WHEN CAST(Dateofjoin AS DATE) BETWEEN @STARTDATE
						AND @ENDDATE
					THEN ISNULL(datediff(day, Dateofjoin, @ENDDATE) + 1, 0)
				WHEN CAST(Dateofjoin AS DATE) < @STARTDATE
					THEN ISNULL(datediff(day, @STARTDATE, dateadd(month, 1, @STARTDATE)), 0)
				ELSE 1
				END AS PAID_DAYS
			,datediff(day, @STARTDATE, dateadd(month, 1, @STARTDATE)) AS TOTAL_DAYS
		FROM EMPLOYEE_DETAILS ED WITH (NOLOCK)
		LEFT JOIN MTS_LOGIN ML ON ML.USERID = ED.EMP_ID
		)
		,EMPLOYEE_EARNINGS
	AS (
		SELECT PEE.EMP_ID
			,(BASIC_PAY / (ISNULL(TOTAL_DAYS, 1)) * (ISNULL((ISNULL(PAID_DAYS, 1) - ISNULL(LOP, 0)), 1))) AS BASIC_PAY
			,(HOUSE_RENT_ALLOWANCE / (ISNULL(TOTAL_DAYS, 1)) * (ISNULL((ISNULL(PAID_DAYS, 1) - ISNULL(LOP, 0)), 1))) AS HOUSE_RENT_ALLOWANCE
			,(SPECIAL_ALLOWANCE / (ISNULL(TOTAL_DAYS, 1)) * (ISNULL((ISNULL(PAID_DAYS, 1) - ISNULL(LOP, 0)), 1))) AS SPECIAL_ALLOWANCE
			,(MEDICAL_ALLOWANCE / (ISNULL(TOTAL_DAYS, 1)) * (ISNULL((ISNULL(PAID_DAYS, 1) - ISNULL(LOP, 0)), 1))) AS MEDICAL_ALLOWANCE
			,(CONVEYANCE / (ISNULL(TOTAL_DAYS, 1)) * (ISNULL((ISNULL(PAID_DAYS, 1) - ISNULL(LOP, 0)), 1))) AS CONVEYANCE
			,(FOOD_ALLOWANCE / (ISNULL(TOTAL_DAYS, 1)) * (ISNULL((ISNULL(PAID_DAYS, 1) - ISNULL(LOP, 0)), 1))) AS FOOD_ALLOWANCE
			,(
				(BASIC_PAY / (ISNULL(TOTAL_DAYS, 1)) * (ISNULL((ISNULL(PAID_DAYS, 1) - ISNULL(LOP, 0)), 1))) + (HOUSE_RENT_ALLOWANCE / (ISNULL(TOTAL_DAYS, 1)) * (ISNULL((ISNULL(PAID_DAYS, 1) - ISNULL(LOP, 0)), 1))) + (SPECIAL_ALLOWANCE / (ISNULL(TOTAL_DAYS, 1)) * (ISNULL((ISNULL(PAID_DAYS, 1) - ISNULL(LOP, 0)), 1))) + (MEDICAL_ALLOWANCE / (ISNULL(TOTAL_DAYS, 1)) * (ISNULL((ISNULL(PAID_DAYS, 1) - ISNULL(LOP, 0)), 1))) + (CONVEYANCE / (ISNULL(TOTAL_DAYS, 1)) * (ISNULL((ISNULL(PAID_DAYS, 1) - ISNULL(LOP, 0)), 1))) + (FOOD_ALLOWANCE / (ISNULL(TOTAL_DAYS, 1)) * (ISNULL((ISNULL(PAID_DAYS, 1) - ISNULL(LOP, 0)), 1))
					)
				) AS MONTHLY_GROSS
			,OTHERS_EARNINGS
			,(BASIC_PAY + HOUSE_RENT_ALLOWANCE + SPECIAL_ALLOWANCE + MEDICAL_ALLOWANCE + CONVEYANCE + FOOD_ALLOWANCE) AS ESI_MONTHLY_GROSS
			,((BASIC_PAY + HOUSE_RENT_ALLOWANCE + SPECIAL_ALLOWANCE + MEDICAL_ALLOWANCE + CONVEYANCE + FOOD_ALLOWANCE + ISNULL(OTHERS_EARNINGS, 0.00)) / ISNULL(TOTAL_DAYS, 1)) * (ISNULL((ISNULL(PAID_DAYS, 1) - ISNULL(LOP, 0)), 1)) AS TOTAL_EARNINGS
			,CASE 
				WHEN VE.INCENTIVE IS NOT NULL
					THEN ISNULL(VE.INCENTIVE, 0.00)
				ELSE 0.00
				END AS INCENTIVE
			,CASE 
				WHEN VE.BONUS IS NOT NULL
					THEN ISNULL(VE.BONUS, 0.00)
				ELSE 0.00
				END AS BONUS
			,CASE 
				WHEN VE.REIMBURSEMENT IS NOT NULL
					THEN ISNULL(VE.REIMBURSEMENT, 0.00)
				ELSE 0.00
				END AS REEMBUSMENT_CHARGES
			,PAID_DAYS
			,LOP
			,TOTAL_DAYS
			,PEE.EFFECTIVE_SINCE AS EFFECTIVE_SINCE
		FROM MTS_PAYROLL_EMPLOYEE_EARNINGS PEE WITH (NOLOCK)
		LEFT JOIN VARIANCE_EARNINGS VE WITH (NOLOCK) ON PEE.EMP_ID = VE.EMP_ID
		LEFT JOIN EMPLOYEE_LEAVE_DETAIL ELD WITH (NOLOCK) ON ELD.Employee_Id = PEE.EMP_ID
		LEFT JOIN PAID_DAYS_DETAIL PDD WITH (NOLOCK) ON PDD.EMP_ID = PEE.EMP_ID
		WHERE PEE.EFFECTIVE_SINCE <= @ENDDATE
			AND PEE.ACTIVE = 1
		)
		,VARIANCE_DEDUCTIONS
	AS (
		SELECT *
		FROM (
			SELECT EMP_ID
				,[DESCRIPTION]
				,AMOUNT
			FROM MTS_PAYROLL_EMPLOYEE_MONTHLY_VARIANCE WITH (NOLOCK)
			WHERE MONTH(EFFECTIVE_MONTH) = @MONTH
				AND YEAR(EFFECTIVE_MONTH) = @YEAR
				AND TYPE = '2'
			) t
		PIVOT(SUM(AMOUNT) FOR [DESCRIPTION] IN (
					[INCOME TAX]
					,[VPF DEDUCTION]
					)) AS pivot_table
		)
		,Gross_earning_Total_given
	AS (
		SELECT sum(Gross_Earnings) AS Gross_Earnings
			,sum(Professional_Tax) AS PT_PAID
			,Emp_No
			,Sum(ISNULL(ESI, 0.00)) / CASE 
				WHEN (ISNULL(count(*), 1)) <> 0
					THEN ISNULL(count(*), 1)
				ELSE 1
				END AS ESI
			,count(*) AS Noofmonth
		FROM [Employee_Payslip] ES WITH (NOLOCK)
		WHERE CAST(CAST(Month(ES.Month + ' 01 1900') AS VARCHAR) + '-01-' + CAST(Es.year AS VARCHAR) AS DATE) BETWEEN @CYCLESTARTDATE
				AND @CYCLEEndSTARTDATE
		GROUP BY Emp_No
		)
		,EMPLOYEE_PROFESSIONAL_TAX
	AS (
		SELECT EE.EMP_ID
			,CASE 
				WHEN CAST(ML.ResignedOn AS DATE) BETWEEN @STARTDATE
						AND @ENDDATE
					THEN FLOOR((ISNULL(PT.PT_AMOUNT, 0.00) - ISNULL(PT_PAID, 0.00)))
				WHEN (DATEDIFF(MONTH, ED.Dateofjoin, @CYCLEENDDATE) + 1) < 6
					THEN FLOOR(ROUND(ISNULL(PT.PT_AMOUNT, 0.00) - ISNULL(PT_PAID, 0.00), 0) / CASE 
								WHEN (ISNULL((DATEDIFF(MONTH, ED.Dateofjoin, @CYCLEENDDATE) + 1), 1) - ISNULL(GE.Noofmonth, 0)) <> 0
									THEN (ISNULL((DATEDIFF(MONTH, ED.Dateofjoin, @CYCLEENDDATE) + 1), 1) - ISNULL(GE.Noofmonth, 0))
								ELSE 1
								END)
				ELSE FLOOR(ROUND(ISNULL(PT.PT_AMOUNT, 0.00) - ISNULL(PT_PAID, 0.00), 0) / (6 - ISNULL(GE.Noofmonth, 0)))
				END AS PT_AMOUNT
		FROM EMPLOYEE_EARNINGS EE WITH (NOLOCK)
		INNER JOIN EMPLOYEE_DETAILS ED WITH (NOLOCK) ON EE.EMP_ID = ED.EMP_ID
		LEFT JOIN MTS_PAYROLL_PROFESSIONAL_TAX_DETAIL PT WITH (NOLOCK) ON PT_HEADER_ID = 1
		LEFT JOIN Gross_earning_Total_given GE WITH (NOLOCK) ON ED.EMP_NO = GE.Emp_No
		LEFT JOIN MTS_LOGIN ML WITH (NOLOCK) ON ML.USERID = ED.EMP_ID
		WHERE (
				(
					ML.ResignedOn IS NOT NULL
					AND (
						((ISNULL(GE.Gross_Earnings, 0.00) + (EE.TOTAL_EARNINGS))) BETWEEN TAX_RANGE_FROM
							AND TAX_RANGE_TO
						AND CAST(ML.ResignedOn AS DATE) BETWEEN @STARTDATE
							AND @ENDDATE
						)
					)
				OR (
					ML.ResignedOn IS NULL
					AND ((DATEDIFF(MONTH, ED.Dateofjoin, @CYCLEENDDATE) + 1) < 6)
					AND (
						(
							ISNULL(GE.Gross_Earnings, 0.00) + ISNULL(EE.TOTAL_EARNINGS, 0.00) + (
								(
									(
										CASE 
											WHEN (
													EFFECTIVE_SINCE > ED.Dateofjoin
													AND ISNULL(GE.Noofmonth, 0) = 0
													)
												THEN ISNULL((DATEDIFF(MONTH, EFFECTIVE_SINCE, @CYCLEENDDATE) + 1), 1)
											ELSE ISNULL((DATEDIFF(MONTH, ED.Dateofjoin, @CYCLEENDDATE) + 1), 1)
											END - ISNULL(GE.Noofmonth, 0)
										) - 1
									) * ISNULL(EE.ESI_MONTHLY_GROSS, EE.TOTAL_EARNINGS)
								)
							)
						) BETWEEN TAX_RANGE_FROM
						AND TAX_RANGE_TO
					)
				OR (
					ML.ResignedOn IS NULL
					AND ((DATEDIFF(MONTH, ED.Dateofjoin, @CYCLEENDDATE) + 1) >= 6)
					AND ((ISNULL(GE.Gross_Earnings, 0.00) + ISNULL(EE.TOTAL_EARNINGS, 0.00) + (((6 - ISNULL(GE.Noofmonth, 0)) - 1) * ISNULL(EE.ESI_MONTHLY_GROSS, EE.TOTAL_EARNINGS)))) BETWEEN TAX_RANGE_FROM
						AND TAX_RANGE_TO
					)
				)
		)
		,ESI_DEDUCTED
	AS (
		SELECT EMP_ID
			,ROUND(ISNULL(SUM(ISNULL(ESI_DEDUCTION, 0.00)), 0.00) / CASE 
					WHEN ISNULL(COUNT(1), 1) <> 0
						THEN ISNULL(COUNT(1), 1)
					ELSE 1
					END, 0) AS ESI
		FROM MTS_PAYROLL_MONTHLY_DETAILS_FOR_EMPLOYEE WITH (NOLOCK)
		WHERE PAYROLL_MONTH BETWEEN @CYCLESTARTDATE
				AND @CYCLEENDDATE
		GROUP BY EMP_ID
		)
		,EMPLOYEE_DEDUCTIONS
	AS (
		SELECT PED.EMP_ID
			,CASE 
				WHEN ESI_MONTHLY_GROSS <= @ESI_BASIC_SALARY
					THEN (MONTHLY_GROSS * @ESI_EMPLOYEE_CONTRIBUTION_PERCENTAGE) / 100
				WHEN ESI_MONTHLY_GROSS > @ESI_BASIC_SALARY
					AND (
						GE.ESI > 0.00
						OR ESID.ESI > 0.00
						)
					AND MONTHLY_GROSS <= @ESI_BASIC_SALARY
					THEN (MONTHLY_GROSS * @ESI_EMPLOYEE_CONTRIBUTION_PERCENTAGE) / 100
				WHEN ESI_MONTHLY_GROSS > @ESI_BASIC_SALARY
					AND GE.ESI > 0.00
					AND MONTHLY_GROSS > @ESI_BASIC_SALARY
					THEN (MONTHLY_GROSS * @ESI_EMPLOYEE_CONTRIBUTION_PERCENTAGE) / 100
				ELSE 0.00
				END AS ESI_DEDUCTION
			,CASE 
				WHEN ESI_MONTHLY_GROSS <= @ESI_BASIC_SALARY
					THEN (MONTHLY_GROSS * @ESI_EMPLOYER_CONTRIBUTION_PERCENTAGE) / 100
				WHEN ESI_MONTHLY_GROSS > @ESI_BASIC_SALARY
					AND (
						GE.ESI > 0.00
						OR ESID.ESI > 0.00
						)
					AND MONTHLY_GROSS <= @ESI_BASIC_SALARY
					THEN (MONTHLY_GROSS * @ESI_EMPLOYER_CONTRIBUTION_PERCENTAGE) / 100
				WHEN ESI_MONTHLY_GROSS > @ESI_BASIC_SALARY
					AND (
						GE.ESI > 0.00
						OR ESID.ESI > 0.00
						)
					AND MONTHLY_GROSS > @ESI_BASIC_SALARY
					THEN (MONTHLY_GROSS * @ESI_EMPLOYER_CONTRIBUTION_PERCENTAGE) / 100
				ELSE 0.00
				END AS EMPLOYER_ESI
			,CASE 
				WHEN BASIC_PAY >= @EPF_MAX_SALARY
					AND ISNULL(ED.IS_PF_RESTRICTION_APPLICABLE, 0) = 1
					THEN (BASIC_PAY * @EPF_EMPLOYEE_CONTRIBUTION_PERCENTAGE) / 100
				WHEN BASIC_PAY >= @EPF_MAX_SALARY
					AND ISNULL(ED.IS_PF_RESTRICTION_APPLICABLE, 0) = 0
					THEN (@EPF_MAX_SALARY * @EPF_EMPLOYEE_CONTRIBUTION_PERCENTAGE) / 100
				WHEN (MONTHLY_GROSS - HOUSE_RENT_ALLOWANCE) >= @EPF_MAX_SALARY
					THEN (@EPF_MAX_SALARY * @EPF_EMPLOYEE_CONTRIBUTION_PERCENTAGE) / 100
				WHEN (MONTHLY_GROSS - HOUSE_RENT_ALLOWANCE) < @EPF_MAX_SALARY
					THEN ((MONTHLY_GROSS - HOUSE_RENT_ALLOWANCE) * @EPF_EMPLOYEE_CONTRIBUTION_PERCENTAGE) / 100
				END AS PF_DEDUCTION
			,CASE 
				WHEN BASIC_PAY >= @EPF_MAX_SALARY
					AND ISNULL(ED.IS_PF_RESTRICTION_APPLICABLE, 0) = 1
					THEN (BASIC_PAY * @EPF_EMPLOYER_CONTRIBUTION_PERCENTAGE) / 100
				WHEN BASIC_PAY >= @EPF_MAX_SALARY
					AND ISNULL(ED.IS_PF_RESTRICTION_APPLICABLE, 0) = 0
					THEN (@EPF_MAX_SALARY * @EPF_EMPLOYER_CONTRIBUTION_PERCENTAGE) / 100
				WHEN (MONTHLY_GROSS - HOUSE_RENT_ALLOWANCE) >= @EPF_MAX_SALARY
					THEN (@EPF_MAX_SALARY * @EPF_EMPLOYER_CONTRIBUTION_PERCENTAGE) / 100
				WHEN (MONTHLY_GROSS - HOUSE_RENT_ALLOWANCE) < @EPF_MAX_SALARY
					THEN ((MONTHLY_GROSS - HOUSE_RENT_ALLOWANCE) * @EPF_EMPLOYER_CONTRIBUTION_PERCENTAGE) / 100
				END AS EMPLOYER_PF
			,CASE 
				WHEN BASIC_PAY >= @EPF_MAX_SALARY
					AND ISNULL(ED.IS_PF_RESTRICTION_APPLICABLE, 0) = 1
					THEN BASIC_PAY
				WHEN BASIC_PAY >= @EPF_MAX_SALARY
					AND ISNULL(ED.IS_PF_RESTRICTION_APPLICABLE, 0) = 0
					THEN @EPF_MAX_SALARY
				WHEN (MONTHLY_GROSS - HOUSE_RENT_ALLOWANCE) >= @EPF_MAX_SALARY
					THEN @EPF_MAX_SALARY
				WHEN (MONTHLY_GROSS - HOUSE_RENT_ALLOWANCE) < @EPF_MAX_SALARY
					THEN MONTHLY_GROSS - HOUSE_RENT_ALLOWANCE
				END AS PF_WAGES
			,CASE 
				WHEN BASIC_PAY >= @EPF_MAX_SALARY
					AND ISNULL(ED.IS_PF_RESTRICTION_APPLICABLE, 0) = 1
					THEN (BASIC_PAY * @EPS_ADMIN_CHARGES_PERCENTAGE) / 100
				WHEN BASIC_PAY >= @EPF_MAX_SALARY
					AND ISNULL(ED.IS_PF_RESTRICTION_APPLICABLE, 0) = 0
					THEN (@EPF_MAX_SALARY * @EPS_ADMIN_CHARGES_PERCENTAGE) / 100
				WHEN (MONTHLY_GROSS - HOUSE_RENT_ALLOWANCE) >= @EPF_MAX_SALARY
					THEN (@EPF_MAX_SALARY * @EPS_ADMIN_CHARGES_PERCENTAGE) / 100
				WHEN (MONTHLY_GROSS - HOUSE_RENT_ALLOWANCE) < @EPF_MAX_SALARY
					THEN ((MONTHLY_GROSS - HOUSE_RENT_ALLOWANCE) * @EPS_ADMIN_CHARGES_PERCENTAGE) / 100
				END AS EPS_ADMIN_CHARGES
			,CASE 
				WHEN BASIC_PAY > @EPF_MAX_SALARY
					AND ISNULL(ED.IS_PF_RESTRICTION_APPLICABLE, 0) = 1
					THEN (BASIC_PAY * @EPS_EDLI_CHARGES_PERCENTAGE) / 100
				WHEN BASIC_PAY > @EPF_MAX_SALARY
					AND ISNULL(ED.IS_PF_RESTRICTION_APPLICABLE, 0) = 0
					THEN (@EPF_MAX_SALARY * @EPS_EDLI_CHARGES_PERCENTAGE) / 100
				WHEN (MONTHLY_GROSS - HOUSE_RENT_ALLOWANCE) > @EPF_MAX_SALARY
					THEN (@EPF_MAX_SALARY * @EPS_EDLI_CHARGES_PERCENTAGE) / 100
				WHEN (MONTHLY_GROSS - HOUSE_RENT_ALLOWANCE) < @EPF_MAX_SALARY
					THEN ((MONTHLY_GROSS - HOUSE_RENT_ALLOWANCE) * @EPS_EDLI_CHARGES_PERCENTAGE) / 100
				END AS EPS_EDLI_CHARGES
			,SUDEXO_PASS
			,PROFESSIONAL_TAX
			,ELD.LOP AS LOP_DAYS
			,PED.OTHERS_DEDUCTIONS
			,CASE 
				WHEN VD.[INCOME TAX] IS NOT NULL
					THEN ISNULL(VD.[INCOME TAX], 0.00)
				ELSE 0.00
				END AS INCOME_TAX
			,CASE 
				WHEN VD.[VPF DEDUCTION] IS NOT NULL
					THEN ISNULL(VD.[VPF DEDUCTION], 0.00)
				ELSE 0.00
				END AS VPF_DEDUCTION
		FROM MTS_PAYROLL_EMPLOYEE_DEDUCTIONS PED WITH (NOLOCK)
		LEFT JOIN EMPLOYEE_EARNINGS EE WITH (NOLOCK) ON EE.EMP_ID = PED.EMP_ID
		LEFT JOIN EMPLOYEE_DETAILS ED WITH (NOLOCK) ON ED.EMP_ID = PED.EMP_ID
		LEFT JOIN EMPLOYEE_LEAVE_DETAIL ELD WITH (NOLOCK) ON ELD.Employee_Id = PED.EMP_ID
		LEFT JOIN VARIANCE_DEDUCTIONS VD WITH (NOLOCK) ON PED.EMP_ID = VD.EMP_ID
		LEFT JOIN Gross_earning_Total_given GE WITH (NOLOCK) ON ED.EMP_NO = GE.Emp_No
		LEFT JOIN ESI_DEDUCTED ESID WITH (NOLOCK) ON PED.EMP_ID = ESID.EMP_ID
		WHERE PED.EFFECTIVE_SINCE <= @ENDDATE
			AND PED.ACTIVE = 1
		)
		,CONSOLIDATED_DETAILS
	AS (
		SELECT ED.EMP_ID
			,@ENDDATE AS PAYROLL_MONTH
			,ROUND(ISNULL(EE.BASIC_PAY, 0.00), 0) AS BASIC_PAY
			,ROUND(ISNULL(EE.HOUSE_RENT_ALLOWANCE, 0.00), 0) AS HOUSE_RENT
			,ROUND(ISNULL(SPECIAL_ALLOWANCE, 0.00), 0) AS SPECIAL_ALLOWANCE
			,ROUND(ISNULL(MEDICAL_ALLOWANCE, 0.00), 0) AS MEDICAL_ALLOWANCE
			,ROUND(ISNULL(EE.FOOD_ALLOWANCE, 0.00), 0) AS FOOD_ALLOWANCE
			,ROUND(ISNULL(EE.CONVEYANCE, 0.00), 0) AS CONVEYENCE
			,ROUND(ISNULL(OTHERS_EARNINGS, 0.00), 0) AS OTHER_EARNINGS
			,ROUND(ISNULL(MONTHLY_GROSS, 0.00), 0) AS MONTHLY_GROSS
			,ROUND((ISNULL(TOTAL_EARNINGS, 0.00)), 0) AS GROSS_EARNINGS
			,ROUND(ISNULL(PF_DEDUCTION, 0.00), 0) AS PF_DEDUCTION
			,ROUND(ISNULL(EPT.PT_AMOUNT, 0.00), 0) PROFESSIONAL_TAX
			,ROUND(ISNULL(ESI_DEDUCTION, 0.00), 0) AS ESI_DEDUCTION
			,ROUND(ISNULL(SUDEXO_PASS, 0.00), 0) AS SUDEXO_DEDUCTION
			,ROUND(ISNULL(INCOME_TAX, 0.00), 0) AS INCOME_TAX
			,ROUND(ISNULL(OTHERS_DEDUCTIONS, 0.00), 0) + ISNULL(@LWF_EMPLOYEE_CONTRIBUTION_AMOUNT, 0.00) AS OTHER_DEDUCTIONS
			,ROUND(((ISNULL(TOTAL_EARNINGS, 0.00)) - ROUND((ISNULL(PF_DEDUCTION, 0.00) + ISNULL(EPT.PT_AMOUNT, 0.00) + ISNULL(ESI_DEDUCTION, 0.00) + ISNULL(SUDEXO_PASS, 0.00) + ISNULL(INCOME_TAX, 0.00) + ISNULL(OTHERS_DEDUCTIONS, 0.00) + ISNULL(@LWF_EMPLOYEE_CONTRIBUTION_AMOUNT, 0.00) + ISNULL(VPF_DEDUCTION, 0.00)), 0)), 0) AS NET_MONTHLY_SALARY
			,ROUND(ISNULL(INCENTIVE, 0.00), 0) AS INCENTIVE
			,ROUND(ISNULL(EMPLOYER_PF, 0.00), 0) AS EMPLOYER_PF
			,ROUND(ISNULL(VPF_DEDUCTION, 0.00), 0) AS VPF_DEDUCTION
			,ROUND(ISNULL(EMPLOYER_ESI, 0.00), 0) AS EMPLOYER_ESI
			,ROUND(ISNULL(@LWF_EMPLOYER_CONTRIBUTION_AMOUNT, 0.00), 0) AS EMPLOYER_LWF
			,ROUND(((ISNULL(TOTAL_EARNINGS, 0.00) + (ISNULL(INCENTIVE, 0.00)) + (ISNULL(BONUS, 0.00))) - ROUND((ISNULL(PF_DEDUCTION, 0.00) + ISNULL(EPT.PT_AMOUNT, 0.00) + ISNULL(ESI_DEDUCTION, 0.00) + ISNULL(SUDEXO_PASS, 0.00) + ISNULL(INCOME_TAX, 0.00) + ISNULL(OTHERS_DEDUCTIONS, 0.00) + ISNULL(@LWF_EMPLOYEE_CONTRIBUTION_AMOUNT, 0.00) + ISNULL(VPF_DEDUCTION, 0.00)), 0)), 0) AS CTC_TOTAL
			,(ISNULL(PDD.PAID_DAYS, 0) - ISNULL(EDD.LOP_DAYS, 0)) AS PAID_DAYS
			,ISNULL(EDD.LOP_DAYS, 0) AS LOP_DAYS
			,(ISNULL(PDD.TOTAL_DAYS, ISNULL(datediff(day, @STARTDATE, dateadd(month, 1, @STARTDATE)), 0))) AS TOTAL_DAYS
			,CASE 
				WHEN ML.ResignedOn IS NOT NULL
					AND MONTH(ML.ResignedOn) = @MONTH
					AND YEAR(ML.ResignedOn) = @YEAR
					AND ESI_MONTHLY_GROSS < ISNULL(@EEB_MAX_GROSS_SALARY, 0.00)
					AND DATEDIFF(DAY, ED.Dateofjoin, ML.ResignedOn) > 30
					THEN ROUND((
								(
									ISNULL(@EEB_EMPLOYER_CEILING_AMOUNT, 0.00) * (
										CASE 
											WHEN (@EEB_PREVIOUS_BONUS_DATE > ED.Dateofjoin)
												THEN (
														ISNULL(DATEDIFF(MONTH, @EEB_PREVIOUS_BONUS_DATE, ML.ResignedOn), 0) + (
															CASE 
																WHEN DATEPART(DAY, ML.ResignedOn) < 15
																	THEN - 1
																ELSE 0
																END
															)
														)
											ELSE (
													ISNULL(DATEDIFF(MONTH, ED.Dateofjoin, ML.ResignedOn), 0) + (
														CASE 
															WHEN DATEPART(DAY, ED.Dateofjoin) > 15
																AND DATEPART(DAY, ML.ResignedOn) < 15
																THEN - 1
															WHEN DATEPART(DAY, ED.Dateofjoin) < 15
																AND DATEPART(DAY, ML.ResignedOn) > 15
																THEN 1
															ELSE 0
															END
														)
													)
											END
										) * ISNULL(@EEB_EMPLOYEE_CEILING_PERCENTAGE, 0.00)
									) / 100
								), 0)
				ELSE 0.00
				END AS EXIT_BONUS
			,ROUND(ISNULL(PF_WAGES, 0.00), 0) AS EPF_WAGES
			,ROUND(ISNULL(EPS_ADMIN_CHARGES, 0.00), 0) AS EPF_ADMIN_CHARGES
			,ROUND(ISNULL(EPS_EDLI_CHARGES, 0.00), 0) AS EPF_EDLI_CHARGES
			,ROUND(ISNULL(REEMBUSMENT_CHARGES, 0.00), 0) AS REEMBUSMENT_CHARGES
			,ROUND(ISNULL(BONUS, 0.00), 0) AS EMPLOYEE_BONUS
		FROM EMPLOYEE_DETAILS ED WITH (NOLOCK)
		INNER JOIN EMPLOYEE_EARNINGS EE WITH (NOLOCK) ON EE.EMP_ID = ED.EMP_ID
		INNER JOIN EMPLOYEE_DEDUCTIONS EDD WITH (NOLOCK) ON EDD.EMP_ID = EE.EMP_ID
		LEFT JOIN EMPLOYEE_PROFESSIONAL_TAX EPT WITH (NOLOCK) ON EPT.EMP_ID = ED.EMP_ID
		LEFT JOIN MTS_LOGIN ML WITH (NOLOCK) ON ML.USERID = ED.EMP_ID
		LEFT JOIN PAID_DAYS_DETAIL PDD WITH (NOLOCK) ON PDD.EMP_ID = EE.EMP_ID
		WHERE ML.ACTIVE = 1
			OR (
				ML.ACTIVE = 0
				AND (
					(
						ML.ResignedOn BETWEEN @STARTDATE
							AND @ENDDATE
						)
					)
				)
		)
	INSERT INTO MTS_PAYROLL_MONTHLY_DETAILS_FOR_EMPLOYEE (
		EMP_ID
		,PAYROLL_MONTH
		,BASIC_PAY
		,HOUSE_RENT
		,SPECIAL_ALLOWANCE
		,MEDICAL_ALLOWANCE
		,FOOD_ALLOWANCE
		,CONVEYENCE
		,OTHER_EARNINGS
		,MONTHLY_GROSS
		,GROSS_EARNINGS
		,PF_DETECTION
		,PROFESSIONAL_TAX
		,ESI_DEDUCTION
		,SUDEXO_DEDUCTION
		,INCOME_TAX
		,OTHER_DEDUCTIONS
		,NET_MONTHLY_SALARY
		,INCENTIVE
		,EMPLOYER_PF
		,EMPLOYER_ESI
		,EMPLOYER_LWF
		,CTC_TOTAL
		,PAID_DAYS
		,LOP_DAYS
		,TOTAL_DAYS
		,EXIT_BONUS
		,EPF_WAGES
		,EPF_ADMIN_CHARGES
		,EPF_EDLI_CHARGES
		,REEMBUSMENT_CHARGES
		,VPF_DEDUCTION
		,EMPLOYEE_BONUS
		)
	SELECT EMP_ID
		,PAYROLL_MONTH
		,BASIC_PAY
		,HOUSE_RENT
		,SPECIAL_ALLOWANCE
		,MEDICAL_ALLOWANCE
		,FOOD_ALLOWANCE
		,CONVEYENCE
		,OTHER_EARNINGS
		,MONTHLY_GROSS
		,GROSS_EARNINGS
		,PF_DEDUCTION
		,PROFESSIONAL_TAX
		,ESI_DEDUCTION
		,SUDEXO_DEDUCTION
		,INCOME_TAX
		,OTHER_DEDUCTIONS
		,NET_MONTHLY_SALARY
		,INCENTIVE
		,EMPLOYER_PF
		,EMPLOYER_ESI
		,EMPLOYER_LWF
		,(CTC_TOTAL + EXIT_BONUS) AS CTC_TOTAL
		,PAID_DAYS
		,LOP_DAYS
		,TOTAL_DAYS
		,EXIT_BONUS
		,EPF_WAGES
		,EPF_ADMIN_CHARGES
		,EPF_EDLI_CHARGES
		,REEMBUSMENT_CHARGES
		,VPF_DEDUCTION
		,EMPLOYEE_BONUS
	FROM CONSOLIDATED_DETAILS

	IF NOT EXISTS (
			SELECT *
			FROM MTS_PAYROLL_CLOSING_PERIOD
			WHERE MONTH(PAYROLL_MONTH) = @MONTH
				AND YEAR(PAYROLL_MONTH) = @YEAR
			)
	BEGIN
		INSERT INTO MTS_PAYROLL_CLOSING_PERIOD (
			PAYROLL_MONTH
			,ATTENDANCE_DATE_FROM
			,ATTENDANCE_DATE_TO
			,CLOSED_STATUS
			)
		VALUES (
			@ENDDATE
			,@ATTENDANCE_DATE_FROM
			,@ATTENDANCE_DATE_TO
			,0
			)
	END
	ELSE
	BEGIN
		UPDATE MTS_PAYROLL_CLOSING_PERIOD
		SET ATTENDANCE_DATE_FROM = @ATTENDANCE_DATE_FROM
			,ATTENDANCE_DATE_TO = @ATTENDANCE_DATE_TO
		WHERE PAYROLL_MONTH = @ENDDATE
	END
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_PAYROLL_GET_FROM_MONTH]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_PAYROLL_GET_FROM_MONTH] (
	@MONTH VARCHAR(2)
	,@YEAR VARCHAR(4)
	)
AS
BEGIN
	DECLARE @LAST_CLOSED_DATE DATE = DATEADD(MONTH, - 1, CAST(@MONTH + '-01-' + @YEAR AS DATE))

	IF NOT EXISTS (
			SELECT 1
			FROM MTS_PAYROLL_CLOSING_PERIOD
			WHERE MONTH(PAYROLL_MONTH) = @MONTH
				AND YEAR(PAYROLL_MONTH) = @YEAR
			)
	BEGIN
		SELECT CAST(DATEADD(MONTH, - 1, CAST(@MONTH + '-25-' + @YEAR AS DATE)) AS DATE)
	END
	ELSE
	BEGIN
		IF EXISTS (
				SELECT 1
				FROM MTS_PAYROLL_CLOSING_PERIOD
				WHERE MONTH(@LAST_CLOSED_DATE) = MONTH(PAYROLL_MONTH)
					AND YEAR(@LAST_CLOSED_DATE) = YEAR(PAYROLL_MONTH)
				)
		BEGIN
			DECLARE @ATTENDANCE_DATE_FROM DATE

			SELECT TOP 1 @ATTENDANCE_DATE_FROM = DATEADD(DAY, 1, ATTENDANCE_DATE_TO)
			FROM MTS_PAYROLL_CLOSING_PERIOD
			WHERE MONTH(@LAST_CLOSED_DATE) = MONTH(PAYROLL_MONTH)
				AND YEAR(@LAST_CLOSED_DATE) = YEAR(PAYROLL_MONTH)
			ORDER BY ID DESC

			SELECT CAST(@ATTENDANCE_DATE_FROM AS DATE)
		END
		ELSE
		BEGIN
			SELECT CAST(DATEADD(MONTH, - 1, CAST(@MONTH + '-25-' + @YEAR AS DATE)) AS DATE)
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_PAYROLL_GET_PAYROLL_MONTH]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_PAYROLL_GET_PAYROLL_MONTH]
AS
BEGIN
	IF NOT EXISTS (
			SELECT 1
			FROM MTS_PAYROLL_CLOSING_PERIOD WITH (NOLOCK)
			)
	BEGIN
		SELECT FORMAT(DATEADD(MONTH, - 1, GETDATE()), 'MMMM-yyyy')
	END
	ELSE
	BEGIN
		SELECT FORMAT(MAX(PAYROLL_MONTH), 'MMMM-yyyy')
		FROM MTS_PAYROLL_CLOSING_PERIOD WITH (NOLOCK)
	END
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_PAYROLL_GET_PREVIOUS_BONUSMONTH]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_PAYROLL_GET_PREVIOUS_BONUSMONTH] (
	@MONTH VARCHAR(2)
	,@YEAR VARCHAR(4)
	)
AS
BEGIN
	DECLARE @LAST_CLOSED_DATE DATE = EOMONTH(DATEADD(MONTH, - 1, EOMONTH(CAST(@MONTH + '-01-' + @YEAR AS DATE))))

	IF NOT EXISTS (
			SELECT 1
			FROM MTS_PAYROLL_EMPLOYEE_EXIT_BONUS WITH (NOLOCK)
			WHERE EFFECTIVE_MONTH < @LAST_CLOSED_DATE
			)
	BEGIN
		SELECT FORMAT(DATEADD(month, DATEDIFF(month, 0, CAST('01' + '-01-' + @YEAR AS DATE)), 0), 'MMM-yyyy')
	END
	ELSE
	BEGIN
		IF EXISTS (
				SELECT 1
				FROM MTS_PAYROLL_EMPLOYEE_EXIT_BONUS WITH (NOLOCK)
				WHERE EFFECTIVE_MONTH < @LAST_CLOSED_DATE
				)
		BEGIN
			DECLARE @PREV_BONUS_DATE DATE

			SELECT TOP 1 @PREV_BONUS_DATE = PREVIOUS_BONUS_DATE
			FROM MTS_PAYROLL_EMPLOYEE_EXIT_BONUS WITH (NOLOCK)
			WHERE EFFECTIVE_MONTH < @LAST_CLOSED_DATE
			ORDER BY ID DESC

			SELECT FORMAT(CAST(@PREV_BONUS_DATE AS DATE), 'MMM-yyyy')
		END
		ELSE
		BEGIN
			SELECT FORMAT(CAST(DATEADD(MONTH, DATEDIFF(month, 0, CAST('01' + '-01-' + @YEAR AS DATE)), 0) AS DATE), 'MMM-yyyy')
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_PAYROLL_GET_TO_MONTH]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_PAYROLL_GET_TO_MONTH] (
	@MONTH VARCHAR(2)
	,@YEAR VARCHAR(4)
	)
AS
BEGIN
	DECLARE @LAST_CLOSED_DATE DATE = EOMONTH(CAST(@MONTH + '-01-' + @YEAR AS DATE))

	IF NOT EXISTS (
			SELECT 1
			FROM MTS_PAYROLL_CLOSING_PERIOD WITH (NOLOCK)
			WHERE MONTH(PAYROLL_MONTH) = @MONTH
				AND YEAR(PAYROLL_MONTH) = @YEAR
			)
	BEGIN
		SELECT CAST(@MONTH + '-25-' + @YEAR AS DATE)
	END
	ELSE
	BEGIN
		IF EXISTS (
				SELECT 1
				FROM MTS_PAYROLL_CLOSING_PERIOD WITH (NOLOCK)
				WHERE MONTH(@LAST_CLOSED_DATE) = MONTH(PAYROLL_MONTH)
					AND YEAR(@LAST_CLOSED_DATE) = YEAR(PAYROLL_MONTH)
				)
		BEGIN
			DECLARE @ATTENDANCE_DATE_TO DATE

			SELECT TOP 1 @ATTENDANCE_DATE_TO = ATTENDANCE_DATE_TO
			FROM MTS_PAYROLL_CLOSING_PERIOD WITH (NOLOCK)
			WHERE MONTH(@LAST_CLOSED_DATE) = MONTH(PAYROLL_MONTH)
				AND YEAR(@LAST_CLOSED_DATE) = YEAR(PAYROLL_MONTH)
			ORDER BY ID DESC

			SELECT CAST(@ATTENDANCE_DATE_TO AS DATE)
		END
		ELSE
		BEGIN
			SELECT CAST(@MONTH + '-25-' + @YEAR AS DATE)
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_PAYROLL_PREPROCESS_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_PAYROLL_PREPROCESS_DETAILS] (
	@START_DATE DATE
	,@END_DATE DATE
	)
AS
BEGIN
	DECLARE @emp_id BIGINT

	DECLARE CUR_EMPLOYEE_EARNINGS CURSOR STATIC
	FOR
	SELECT DISTINCT EMP_ID
	FROM MTS_PAYROLL_EMPLOYEE_EARNINGS

	OPEN CUR_EMPLOYEE_EARNINGS

	FETCH NEXT
	FROM CUR_EMPLOYEE_EARNINGS
	INTO @emp_id

	WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE @EARNINGS_ID BIGINT

		SELECT TOP 1 @EARNINGS_ID = ID
		FROM MTS_PAYROLL_EMPLOYEE_EARNINGS MPE
		WHERE MPE.EFFECTIVE_SINCE <= @END_DATE
			AND (
				MPE.EFFECTIVE_TO IS NULL
				OR MPE.EFFECTIVE_TO >= @START_DATE
				)
			AND EMP_ID = @emp_id
			AND (
				ACTIVE = 1
				OR (
					ACTIVE = 0
					AND IS_APPROVED = 1
					)
				)
		ORDER BY ID DESC

		UPDATE MTS_PAYROLL_EMPLOYEE_EARNINGS
		SET ACTIVE = 1
		WHERE ID = @EARNINGS_ID
			AND EMP_ID = @emp_id

		UPDATE MTS_PAYROLL_EMPLOYEE_EARNINGS
		SET ACTIVE = 0
		WHERE ID <> @EARNINGS_ID
			AND EMP_ID = @emp_id

		FETCH NEXT
		FROM CUR_EMPLOYEE_EARNINGS
		INTO @emp_id
	END

	CLOSE CUR_EMPLOYEE_EARNINGS

	DEALLOCATE CUR_EMPLOYEE_EARNINGS

	DECLARE CUR_EMPLOYEE_DEDUCTIONS CURSOR STATIC
	FOR
	SELECT DISTINCT EMP_ID
	FROM MTS_PAYROLL_EMPLOYEE_DEDUCTIONS

	OPEN CUR_EMPLOYEE_DEDUCTIONS

	FETCH NEXT
	FROM CUR_EMPLOYEE_DEDUCTIONS
	INTO @emp_id

	WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE @DEDUCTIONS_ID BIGINT

		SELECT TOP 1 @DEDUCTIONS_ID = ID
		FROM MTS_PAYROLL_EMPLOYEE_DEDUCTIONS MPD WITH (NOLOCK)
		WHERE MPD.EFFECTIVE_SINCE <= @END_DATE
			AND (
				MPD.EFFECTIVE_TO IS NULL
				OR MPD.EFFECTIVE_TO >= @START_DATE
				)
			AND EMP_ID = @emp_id
			AND (
				ACTIVE = 1
				OR (
					ACTIVE = 0
					AND IS_APPROVED = 1
					)
				)
		ORDER BY ID DESC

		UPDATE MTS_PAYROLL_EMPLOYEE_DEDUCTIONS
		SET ACTIVE = 1
		WHERE ID = @DEDUCTIONS_ID
			AND EMP_ID = @emp_id

		UPDATE MTS_PAYROLL_EMPLOYEE_DEDUCTIONS
		SET ACTIVE = 0
		WHERE ID <> @DEDUCTIONS_ID
			AND EMP_ID = @emp_id

		FETCH NEXT
		FROM CUR_EMPLOYEE_DEDUCTIONS
		INTO @emp_id
	END

	CLOSE CUR_EMPLOYEE_DEDUCTIONS

	DEALLOCATE CUR_EMPLOYEE_DEDUCTIONS
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_PAYROLLBANK_SHEET_REPORT]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_PAYROLLBANK_SHEET_REPORT] (
	@MONTH VARCHAR(2)
	,@YEAR VARCHAR(4)
	)
AS
BEGIN
	DECLARE @DATE DATE = (
			SELECT CAST(@MONTH + '-01-' + @YEAR AS DATE)
			)

	SELECT E.Employee_Id AS Code
		,E.Firstname + ' ' + E.Lastname AS Name
		,'MTS Salary ' + FORMAT(@DATE, 'MMM-yyyy') AS Naration
		,EBD.Accountnumber AS 'Bank Account'
		,MDE.CTC_TOTAL AS Amount
	FROM MTS_PAYROLL_MONTHLY_DETAILS_FOR_EMPLOYEE MDE WITH (NOLOCK)
	INNER JOIN EMPLOYEE E WITH (NOLOCK) ON E.id = MDE.EMP_ID
	LEFT JOIN Employee_BankDetails EBD WITH (NOLOCK) ON EBD.Employee_Id = E.id
	WHERE MONTH(MDE.PAYROLL_MONTH) = @MONTH
		AND YEAR(MDE.PAYROLL_MONTH) = @YEAR

	SELECT 'MAITRIT10082012' AS COLUMN1
		,'Total' AS COLUMN2
		,'Salary for ' + FORMAT(@DATE, 'MMM-yyyy') AS COLUMN3
		,'007705014932' AS COLUMN4
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_READ_ALLPOLICIES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_READ_ALLPOLICIES]
AS
BEGIN
	SELECT ID
		,POLICYNAME
	FROM MTS_HRPOLICIES WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_READ_PAYROLL_LOP_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_READ_PAYROLL_LOP_DETAILS] (
	@MONTH VARCHAR(2)
	,@YEAR VARCHAR(4)
	,@ATTENDANCE_DATE_FROM DATE
	,@ATTENDANCE_DATE_TO DATE
	)
AS
BEGIN
	WITH EMPLOYEE_LEAVE_CUMULATIVE_DETAIL
	AS (
		SELECT Employee_Id
			,SUM(Numberofdays) AS LOP
		FROM EMPLOYEE_LEAVE_DETAILS ELD WITH (NOLOCK)
		WHERE ApprovedDate BETWEEN @ATTENDANCE_DATE_FROM
				AND @ATTENDANCE_DATE_TO
			AND isLOP = 1
		GROUP BY Employee_Id
		
		UNION ALL
		
		SELECT EMP_ID AS Employee_Id
			,SUM(LOP_DAYS) AS LOP
		FROM MTS_PAYROLL_EMPLOYEE_LOP ELD WITH (NOLOCK)
		WHERE MONTH(PAYROLL_MONTH) = @MONTH
			AND YEAR(PAYROLL_MONTH) = @YEAR
		GROUP BY EMP_ID
		)
	SELECT E.id AS Employee_Id
		,E.Employee_Id AS Emp_No
		,E.Firstname + ' ' + E.Lastname AS Employee_Name
		,DATENAME(MONTH, CAST(@MONTH + '-01-' + @YEAR AS DATE)) AS PAYROLL_MONTH
		,@YEAR AS PAYROLL_YEAR
		,SUM(LOP) AS LOP
		,E.Dateofjoin AS Dateofjoin
		,EOMONTH(CAST(@MONTH + '-01-' + @YEAR AS DATE)) AS PAYROLL_EOM
	FROM Employee E WITH (NOLOCK)
	INNER JOIN MTS_LOGIN ML WITH (NOLOCK) ON E.id = ML.USERID
	LEFT JOIN EMPLOYEE_LEAVE_CUMULATIVE_DETAIL EL WITH (NOLOCK) ON EL.Employee_Id = E.id
	WHERE ML.ACTIVE = 1
		AND CAST(E.Dateofjoin AS DATE) <= EOMONTH(CAST(@MONTH + '-01-' + @YEAR AS DATE)) --OR CAST(E.Dateofjoin AS DATE) = CAST(@MONTH +'-01-' + @YEAR AS DATE) )
	GROUP BY E.id
		,E.Employee_Id
		,E.Firstname
		,E.Lastname
		,E.Dateofjoin
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_READROLES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_READROLES]
AS
BEGIN
	SELECT ROLEID
		,ROLE_NAME
	FROM MTS_ROLES WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_RESETPASSWORD]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_RESETPASSWORD] (
	@Userid BIGINT
	,@Password VARCHAR(50)
	,@Status TINYINT
	)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE DBO.MTS_LOGIN
	SET PASSWORD = @Password
		,STATUS = @Status
		,LAST_PWD_CHANGE = GETDATE()
		,LOCKED = 0
		,NO_OF_ATTEMPTS = 0
	WHERE USERID = @Userid;

	SET NOCOUNT OFF;
END;
GO

/****** Object:  StoredProcedure [dbo].[MTS_SMTPDETAIL]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_SMTPDETAIL] (
	@Sptype BIGINT
	,@Smtpid BIGINT = NULL
	,@Smtpname VARCHAR(30) = NULL
	,@Smtpclienthost VARCHAR(50) = NULL
	,@Smtpclientport INT = NULL
	,@Username VARCHAR(100) = NULL
	,@Domain VARCHAR(100) = NULL
	,@Password VARCHAR(100) = NULL
	,@Enablessl BIT = NULL
	,@Timeout INT = NULL
	,@Smtpdeliverymethod TINYINT = NULL
	,@Defaultcredentials BIT = NULL
	)
AS
BEGIN
	BEGIN TRAN;

	OPEN SYMMETRIC KEY PASSWORDKEY DECRYPTION BY CERTIFICATE SMTP;

	IF @Sptype = 0
	BEGIN
		SELECT SMTPID
			,SMTPNAME
			,SMTPCLIENTHOST
			,SMTPCLIENTPORT
			,USERNAME
			,DOMAIN
			,ENABLESSL
			,TIMEOUT
			,SMTPDELIVERYMETHOD
			,USEDEFAULTCREDENTIALS
		FROM MTS_SMTPDETAILS;
	END;
	ELSE
	BEGIN
		IF @Sptype = 1
		BEGIN
			SELECT SMTPID
				,SMTPNAME
				,SMTPCLIENTHOST
				,SMTPCLIENTPORT
				,USERNAME
				,CONVERT(VARCHAR, DECRYPTBYKEY(PASSWORD)) AS PASSWORD
				,DOMAIN
				,ENABLESSL
				,TIMEOUT
				,SMTPDELIVERYMETHOD
				,USEDEFAULTCREDENTIALS
			FROM MTS_SMTPDETAILS WITH (NOLOCK)
			WHERE SMTPID = @Smtpid;
		END;
		ELSE
		BEGIN
			IF @Sptype = 2
			BEGIN
				IF NOT EXISTS (
						SELECT 1
						FROM MTS_SMTPDETAILS WITH (NOLOCK)
						WHERE SMTPNAME = @Smtpname
						)
				BEGIN
					INSERT INTO MTS_SMTPDETAILS (
						SMTPNAME
						,SMTPCLIENTHOST
						,SMTPCLIENTPORT
						,USERNAME
						,PASSWORD
						,DOMAIN
						,ENABLESSL
						,TIMEOUT
						,SMTPDELIVERYMETHOD
						,USEDEFAULTCREDENTIALS
						)
					VALUES (
						@Smtpname
						,@Smtpclienthost
						,@Smtpclientport
						,@Username
						,ENCRYPTBYKEY(KEY_GUID('PasswordKey'), @Password)
						,@Domain
						,@Enablessl
						,@Timeout
						,@Smtpdeliverymethod
						,@Defaultcredentials
						);

					IF @@Error <> 0
					BEGIN
						ROLLBACK TRAN;

						RETURN - 1;
					END;
				END;
				ELSE
				BEGIN
					COMMIT;

					RETURN 1;
				END;
			END;
			ELSE
			BEGIN
				IF @Sptype = 3
				BEGIN
					IF NOT EXISTS (
							SELECT 1
							FROM MTS_SMTPDETAILS WITH (NOLOCK)
							WHERE SMTPNAME = @Smtpname
								AND SMTPID <> @Smtpid
							)
					BEGIN
						UPDATE MTS_SMTPDETAILS
						SET SMTPNAME = @Smtpname
							,SMTPCLIENTHOST = @Smtpclienthost
							,SMTPCLIENTPORT = @Smtpclientport
							,USERNAME = @Username
							,[Password] = EncryptByKey(Key_GUID('PasswordKey'), @PASSWORD)
							,DOMAIN = @Domain
							,ENABLESSL = @Enablessl
							,TIMEOUT = @Timeout
							,SMTPDELIVERYMETHOD = @Smtpdeliverymethod
							,USEDEFAULTCREDENTIALS = @Defaultcredentials
						WHERE SMTPID = @Smtpid;

						IF @@Error <> 0
						BEGIN
							ROLLBACK TRAN;

							RETURN - 1;
						END;
					END;
					ELSE
					BEGIN
						COMMIT;

						RETURN 1;
					END;
				END;
				ELSE
				BEGIN
					IF @Sptype = 4
					BEGIN
						UPDATE MTS_SMTPDETAILS
						SET PASSWORD = ENCRYPTBYKEY(KEY_GUID('PasswordKey'), @Password)
						WHERE SMTPID = @Smtpid;

						IF @@Error <> 0
						BEGIN
							ROLLBACK TRAN;

							RETURN - 1;
						END;
					END;
					ELSE
					BEGIN
						COMMIT;

						RETURN 1;
					END;;
				END;
			END;
		END;
	END;

	COMMIT;

	RETURN 0;
END;
GO

/****** Object:  StoredProcedure [dbo].[MTS_UPDATE_HRPOLICIES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_UPDATE_HRPOLICIES] (
	@id INT
	,@policyname VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT POLICYNAME
			FROM MTS_HRPOLICIES WITH (NOLOCK)
			WHERE POLICYNAME = @policyname
			)
	BEGIN
		UPDATE MTS_HRPOLICIES
		SET POLICYNAME = @policyname
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_UPDATE_IT_DECLARATION_FINAL_SUBMIT]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_UPDATE_IT_DECLARATION_FINAL_SUBMIT] (
	@EMP_IT_ID BIGINT
	,@FLAG BIT
	,@SUB_DATE DATE
	,@APPROVED_BY VARCHAR(100)
	)
AS
BEGIN
	IF @FLAG = 0
	BEGIN
		UPDATE [MTS_IT_DECLARATION_EMPLOYEE_SECTION_DETAILS]
		SET Approved_On = @SUB_DATE
			,Approved_By = @APPROVED_BY
		WHERE EMP_IT_ID = @EMP_IT_ID
	END
	ELSE
	BEGIN
		UPDATE [MTS_IT_DECLARATION_EMPLOYEE_SECTION_DETAILS]
		SET Submitted_on = @SUB_DATE
		WHERE EMP_IT_ID = @EMP_IT_ID
	END
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_UPDATE_PAYROLL_DETAILS_FOR_EMPLOYEE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_UPDATE_PAYROLL_DETAILS_FOR_EMPLOYEE] (
	@ID BIGINT
	,@EMPLOYEEID BIGINT
	,@BASICPAY DECIMAL(18, 2)
	,@HOUSEALLOWANCE DECIMAL(18, 2)
	,@SPECIALALLOWANCE DECIMAL(18, 2)
	,@MEDICAL_ALLOWANCE DECIMAL(18, 2)
	,@FOOD_ALLOWANCE DECIMAL(18, 2)
	,@CONVEYANCE DECIMAL(18, 2)
	,@OTHERS DECIMAL(18, 2)
	,@TOTALEARNINGS DECIMAL(18, 2)
	,@SUDEXOPASS DECIMAL(18, 2)
	,@INCOMETAX DECIMAL(18, 2)
	,@PROFESSIONAL_TAX DECIMAL(18, 2)
	,@EMPLOYEEESI DECIMAL(18, 2)
	,@EMPLOYEE_PF DECIMAL(18, 2)
	,@OTHERSDEDUCTIONS DECIMAL(18, 2)
	,@TOTALDEDUCTIONS DECIMAL(18, 2)
	,@INCENTIVES DECIMAL(18, 2)
	,@NETSALARY DECIMAL(18, 2)
	,@TOTALDAYS BIGINT
	,@LOPDAYS BIGINT
	,@PAIDDAYS BIGINT
	,@USER_ID BIGINT
	)
AS
BEGIN
	EXEC MTS_PAYROLL_AUDIT 3
		,@ID
		,@USER_ID

	UPDATE MTS_PAYROLL_MONTHLY_DETAILS_FOR_EMPLOYEE
	SET BASIC_PAY = @BASICPAY
		,HOUSE_RENT = @HOUSEALLOWANCE
		,SPECIAL_ALLOWANCE = @SPECIALALLOWANCE
		,MEDICAL_ALLOWANCE = @MEDICAL_ALLOWANCE
		,FOOD_ALLOWANCE = @FOOD_ALLOWANCE
		,CONVEYENCE = @CONVEYANCE
		,OTHER_EARNINGS = @OTHERS
		,MONTHLY_GROSS = @TOTALEARNINGS
		,GROSS_EARNINGS = @TOTALEARNINGS
		,PF_DETECTION = @EMPLOYEE_PF
		,PROFESSIONAL_TAX = @PROFESSIONAL_TAX
		,ESI_DEDUCTION = @EMPLOYEEESI
		,SUDEXO_DEDUCTION = @SUDEXOPASS
		,INCOME_TAX = @INCOMETAX
		,OTHER_DEDUCTIONS = @OTHERSDEDUCTIONS
		,INCENTIVE = @INCENTIVES
		,CTC_TOTAL = @NETSALARY + @INCENTIVES
		,TOTAL_DAYS = @TOTALDAYS
		,PAID_DAYS = @PAIDDAYS
		,LOP_DAYS = @LOPDAYS
	WHERE ID = @ID
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_UPDATEANONYMSATTEMPTS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--[MTS_UPDATEANONYMSATTEMPTS] ANONYMOUS ATTEMPT
CREATE PROCEDURE [dbo].[MTS_UPDATEANONYMSATTEMPTS] (@AUDIT_INFO VARCHAR(255))
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRAN

	INSERT INTO MTS_AUDIT (
		[USERID]
		,[AUDIT_DATETIME]
		,[AUDIT_INFO]
		)
	VALUES (
		NULL
		,GETDATE()
		,@AUDIT_INFO
		)

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN

		RETURN - 1
	END

	COMMIT

	RETURN 0
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_UPDATEDETAILVIEW]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_UPDATEDETAILVIEW]
	@USERID BIGINT
	,@FIRSTNAME VARCHAR(30)
	,@LASTNAME VARCHAR(30)
	,@EMAIL VARCHAR(50)
	,@ADD1 VARCHAR(30)
	,@ADD2 VARCHAR(30)
	,@CITY VARCHAR(30)
	,@STATE VARCHAR(30)
	,@COUNTRY VARCHAR(30)
	,@ZIPCODE VARCHAR(30)
	,@PHONE VARCHAR(30)
	,@MOBILE VARCHAR(30)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRAN

	UPDATE MTS_USERCONTACTS
	SET EMAIL = @EMAIL
		,ADD1 = @ADD1
		,ADD2 = @ADD2
		,CITY = @CITY
		,STATE = @STATE
		,COUNTRY = @COUNTRY
		,ZIPCODE = @ZIPCODE
		,PHONE = @PHONE
		,MOBILE = @MOBILE
	WHERE USERID = @USERID

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN

		RETURN - 1
	END

	UPDATE MTS_LOGIN
	SET FIRSTNAME = @FIRSTNAME
		,LASTNAME = @LASTNAME
	WHERE USERID = @USERID

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN

		RETURN - 1
	END
	
	COMMIT

	RETURN 0
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_UPDATEEMAILSTATUS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_UPDATEEMAILSTATUS] (
	@Id BIGINT
	,@Status TINYINT
	)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE MTS_EmailMaster
	WITH (ROWLOCK)

	SET STATUS = @Status
	WHERE ID = @Id;
END;
GO

/****** Object:  StoredProcedure [dbo].[MTS_UPDATELASTPWDCHANGE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_UPDATELASTPWDCHANGE] (
	@USERID BIGINT
	)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRAN

	UPDATE MTS_LOGIN
	SET LAST_PWD_CHANGE = GETDATE()
	WHERE USERID = @USERID

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN

		RETURN - 1
	END

	COMMIT

	RETURN 1
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_UPDATELOCKUSER]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_UPDATELOCKUSER] @USERID BIGINT
	,@STATUS TINYINT
	,@AUDIT_INFO VARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRAN

	UPDATE [MTS_LOGIN]
	SET [LOCKED] = 1
		,STATUS = @STATUS
	WHERE [USERID] = @USERID

	INSERT INTO [MTS_AUDIT] (
		[USERID]
		,[AUDIT_DATETIME]
		,[AUDIT_INFO]
		)
	VALUES (
		@USERID
		,GETDATE()
		,@AUDIT_INFO
		)

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN

		RETURN - 1
	END

	COMMIT

	RETURN 0
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_UPDATEPASSWORD]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_UPDATEPASSWORD] (
	@USERID BIGINT
	,@NEWPASSWORD VARCHAR(50)
	,@PH_ID BIGINT
	)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRAN

	IF (@PH_ID <> 0)
	BEGIN
		DELETE
		FROM MTS_PASSWORDHISTORY
		WHERE PH_ID = @PH_ID

		INSERT INTO MTS_PASSWORDHISTORY (
			USERID
			,PASSWORD
			)
		VALUES (
			@USERID
			,@NEWPASSWORD
			)

		UPDATE MTS_LOGIN
		SET PASSWORD = @NEWPASSWORD
			,LAST_LOGIN = GETDATE()
			,LAST_PWD_CHANGE = GETDATE()
			,STATUS = 2
		WHERE USERID = @USERID

		INSERT INTO [MTS_AUDIT] (
			[USERID]
			,[AUDIT_DATETIME]
			,[AUDIT_INFO]
			)
		VALUES (
			@USERID
			,GETDATE()
			,'PASSWORD CHANGED'
			)
	END
	ELSE
	BEGIN
		PRINT 5

		INSERT INTO MTS_PASSWORDHISTORY (
			USERID
			,PASSWORD
			)
		VALUES (
			@USERID
			,@NEWPASSWORD
			)

		UPDATE MTS_LOGIN
		SET PASSWORD = @NEWPASSWORD
			,LAST_LOGIN = GETDATE()
			,LAST_PWD_CHANGE = GETDATE()
			,STATUS = 2
		WHERE USERID = @USERID

		INSERT INTO [MTS_AUDIT] (
			[USERID]
			,[AUDIT_DATETIME]
			,[AUDIT_INFO]
			)
		VALUES (
			@USERID
			,GETDATE()
			,'PASSWORD CHANGED'
			)
	END

	IF @@ERROR <> 0
	BEGIN
		PRINT 1

		ROLLBACK TRAN

		RETURN - 1
	END

	COMMIT

	PRINT 2

	RETURN 1
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_UPDATEQA]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_UPDATEQA]
	@QUESTION VARCHAR(255)
	,@ACTIVE BIT
	,@QUESTIONID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRAN

	IF NOT EXISTS (
			SELECT 1
			FROM MTS_Q_A WITH (NOLOCK)
			WHERE QUESTION = @QUESTION
				AND QUESTIONID <> @QUESTIONID
			)
	BEGIN
		UPDATE MTS_Q_A
		SET QUESTION = @QUESTION
			,ACTIVE = @ACTIVE
		WHERE QUESTIONID = @QUESTIONID

		IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRAN

			RETURN - 1
		END
	END
	ELSE
	BEGIN
		COMMIT

		RETURN 1
	END

	COMMIT

	RETURN 0
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_UPDATESECURITYQUESTION]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_UPDATESECURITYQUESTION] (
	@USERID BIGINT
	,
	@QUESTIONID BIGINT
	,@SEC_A VARCHAR(255)
	)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRAN

	UPDATE MTS_LOGIN
	SET
		LAST_LOGIN = GETDATE()
		,QUESTIONID = @QUESTIONID
		,SEC_A = @SEC_A
	WHERE USERID = @USERID

	INSERT INTO [MTS_AUDIT] (
		[USERID]
		,[AUDIT_DATETIME]
		,[AUDIT_INFO]
		)
	VALUES (
		@USERID
		,GETDATE()
		,'PASSWORD CHANGED'
		)

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN

		RETURN - 1
	END

	COMMIT
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_UPDATESERVICECONFIG]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_UPDATESERVICECONFIG] @Servicename VARCHAR(50)
	,@Servicedisplayname VARCHAR(50)
	,@Servicedescription VARCHAR(255)
	,@Serviceinvoketype VARCHAR(1)
	,@Serviceparams VARCHAR(MAX)
	,@Time VARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE MTS_SERVICECONFIG
	SET SERVICEDISPLAYNAME = @Servicedisplayname
		,SERVICEDESCRIPTION = @Servicedescription
		,SERVICEINVOKETYPE = @Serviceinvoketype
		,SERVICEPARAMS = @Serviceparams
		,[TIME] = @Time
	WHERE SERVICENAME = @Servicename;
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_UPDATESERVICESTATUS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_UPDATESERVICESTATUS] @Servicename VARCHAR(50)
	,@Status TINYINT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE MTS_SERVICECONFIG
	SET STATUS = @Status
	WHERE SERVICENAME = @Servicename;
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_UPDATESTATUS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_UPDATESTATUS] (
	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
	@USERID BIGINT
	,@STATUS TINYINT
	,@AUDIT_INFO VARCHAR(255)
	)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRAN

	UPDATE MTS_LOGIN
	SET STATUS = @STATUS
	WHERE USERID = @USERID

	INSERT INTO [MTS_AUDIT] (
		[USERID]
		,[AUDIT_DATETIME]
		,[AUDIT_INFO]
		)
	VALUES (
		@USERID
		,GETDATE()
		,@AUDIT_INFO
		)

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN

		RETURN - 1
	END

	COMMIT

	RETURN 1
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_UPDATEUSER]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_UPDATEUSER] @USERID BIGINT
	,@FIRSTNAME VARCHAR(30)
	,@LASTNAME VARCHAR(30)
	,@EMAIL VARCHAR(50)
	,@ROLE BIGINT
	,@ACTIVE BIT
	,@LOCKED BIT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION

	UPDATE MTS_LOGIN
	SET FIRSTNAME = @FIRSTNAME
		,LASTNAME = @LASTNAME
		,ACTIVE = @ACTIVE
		,LOCKED = @LOCKED
	WHERE USERID = @USERID

	UPDATE MTS_USERCONTACTS
	SET EMAIL = @EMAIL
	WHERE USERID = @USERID

	UPDATE MTS_AUTHORITY
	SET ROLEID = @ROLE
	WHERE USERID = @USERID

	IF @LOCKED = 0
		AND EXISTS (
			SELECT 1
			FROM MTS_LOGIN
			WHERE USERID = @USERID
				AND STATUS = 3
			)
	BEGIN
		UPDATE MTS_LOGIN
		SET NO_OF_ATTEMPTS = 0
			,STATUS = 2
		WHERE USERID = @USERID
	END

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRANSACTION

		RETURN - 1
	END

	COMMIT

	RETURN 0
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_UPDATEUSERATTEMPTS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_UPDATEUSERATTEMPTS] (
	@USERID BIGINT
	,@NO_OF_ATTEMPTS TINYINT
	)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRAN

	IF (@NO_OF_ATTEMPTS <> 0)
	BEGIN
		UPDATE [MTS_LOGIN]
		SET [NO_OF_ATTEMPTS] = @NO_OF_ATTEMPTS
		WHERE [USERID] = @USERID

		INSERT INTO [MTS_AUDIT] (
			[USERID]
			,[AUDIT_DATETIME]
			,[AUDIT_INFO]
			)
		VALUES (
			@USERID
			,GETDATE()
			,'LOGIN FAILED'
			)
	END
	ELSE
	BEGIN
		UPDATE [MTS_LOGIN]
		SET [NO_OF_ATTEMPTS] = 0
			,[LAST_LOGIN] = GETDATE()
		WHERE [USERID] = @USERID

		INSERT INTO [MTS_AUDIT] (
			[USERID]
			,[AUDIT_DATETIME]
			,[AUDIT_INFO]
			)
		VALUES (
			@USERID
			,GETDATE()
			,'LOGINED SUCCESSFULLY'
			)
	END

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN

		RETURN - 1
	END

	COMMIT

	RETURN 0
END
GO

/****** Object:  StoredProcedure [dbo].[MTS_USERPASSWORDEMAIL]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_USERPASSWORDEMAIL] @To AS VARCHAR(50)
	,@Firstname AS VARCHAR(30)
	,@Lastname AS VARCHAR(30)
	,@Userid AS VARCHAR(30)
	,@Password AS VARCHAR(50)
AS
BEGIN
	SELECT @To AS 'To'
		,@Firstname + ' ' + @Lastname AS USERNAME
		,@Userid AS USERID
		,@Password AS 'PASSWORD'
		,(
			SELECT TOP 1 ROLE_NAME
			FROM MTS_LOGIN AS L WITH (NOLOCK)
			INNER JOIN MTS_AUTHORITY AS A WITH (NOLOCK) ON L.USERID = A.USERID
			INNER JOIN MTS_ROLES AS R WITH (NOLOCK) ON R.ROLEID = A.ROLEID
			WHERE USERNAME = @Userid
			) AS ROLE
END;
GO

/****** Object:  StoredProcedure [dbo].[PUBLISHING_APPRAISAL_PROCESS_DETAILS_PERIOD]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[PUBLISHING_APPRAISAL_PROCESS_DETAILS_PERIOD] (@appraisal_process_period_id BIGINT)
AS
BEGIN
	UPDATE MTS_APPRAISAL_PROCESS_DETAILS
	SET Active = 2
	WHERE Id = @appraisal_process_period_id
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ACTIVE_EMPLOYEE_NAMES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ACTIVE_EMPLOYEE_NAMES]
AS
BEGIN
	SELECT E.id
		,E.Firstname + ' ' + E.Lastname AS EmployeeName
	FROM Employee AS E
	INNER JOIN Mts_Login M ON E.id = M.USERID
	WHERE M.ACTIVE = 1
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ALL_DisableHOLIDAYDATES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[READ_ALL_DisableHOLIDAYDATES] (@year BIGINT)
AS
BEGIN
	SELECT DATEOFHOLIDAY
	FROM HOLIDAYSLIST WITH (NOLOCK)
	WHERE year(DATEOFHOLIDAY) = @year
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ALL_HOLIDAYDATES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[READ_ALL_HOLIDAYDATES] (
	@FROMDATE DATE
	,@TODATE DATE
	)
AS
BEGIN
	SELECT DATEOFHOLIDAY
	FROM HOLIDAYSLIST WITH (NOLOCK)
	WHERE DATEOFHOLIDAY BETWEEN @FROMDATE
			AND @TODATE
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ALL_HOLIDAYSLIST]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[READ_ALL_HOLIDAYSLIST] (@yearofholiday VARCHAR(255))
AS
BEGIN
	SELECT id
		,DateOfHoliday
		,HolidayReason
		,YearOfHoliday
		,DayNameofDate
	FROM HolidaysList WITH (NOLOCK)
	WHERE YearOfHoliday = @yearofholiday
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ALL_MESSAGES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[READ_ALL_MESSAGES] (@roleid BIGINT)
AS
BEGIN
	IF (@roleid <> 1)
	BEGIN
		SELECT MSG.id
			,MSG.FromDate
			,ToDate
			,MessageHeader
			,MessageTitle
			,Message AS [Message]
			,STATUS AS [Status]
			,CONCAT (
				E.Firstname
				,' '
				,E.Lastname
				) AS PostedBy
			,TemplateId
			,MessageStatus
		FROM MTS_MESSAGES MSG WITH (NOLOCK)
		INNER JOIN Employee E WITH (NOLOCK) ON E.id = MSG.Employee_Id
		WHERE CAST(GETDATE() AS DATE) BETWEEN Fromdate
				AND ToDate
	END
	ELSE
	BEGIN
		SELECT MSG.id
			,FromDate
			,ToDate
			,MessageHeader
			,MessageTitle
			,Message AS [Message]
			,STATUS AS [Status]
			,CONCAT (
				E.Firstname
				,' '
				,E.Lastname
				) AS PostedBy
			,TemplateId
			,MessageStatus
		FROM MTS_MESSAGES MSG WITH (NOLOCK)
		INNER JOIN Employee E WITH (NOLOCK) ON E.id = MSG.Employee_Id
		ORDER BY MSG.FromDate DESC
	END
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ALL_MTS_HOLIDAYSLIST]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[READ_ALL_MTS_HOLIDAYSLIST]
AS
BEGIN
	SELECT [id]
		,[Holidays]
	FROM MTS_HOLIDAYSLIST
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ALLASSETCATEGORIES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ALLASSETCATEGORIES]
AS
BEGIN
	SELECT CategoryId
		,CategoryName
	FROM MTS_AssetCategories WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ALLASSETENTRIES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ALLASSETENTRIES]
AS
BEGIN
	SELECT AD.ID
		,VENDOR_ID
		,MTSV.NAME AS VENDOR_NAME
		,PURCHASE_ORDER_NUMBER
		,PURCHASED_ON
		,BILL_NUMBER
		,format(BILL_DATE, 'MM/dd/yyyy') AS BILL_DATE
		,ACAT.CATEGORYNAME AS ASSET_TYPE
		,AST.ASSETNAME AS ASSET_NAME
		,ASSET_DESCRIPTION
		,COST
		,COST_TYPE
		,MAKE
		,MODEL
		,SERIAL_NUMBER
		,IDENTIFICATION_CODE
		,WARRANTY_MONTHS
		,format(WARRANTY_STARTDATE, 'MM/dd/yyyy') AS WARRANTY_STARTDATE
		,format(WARRANTY_ENDDATE, 'MM/dd/yyyy') AS WARRANTY_ENDDATE
		,INVOICE_ID
		,ASSETTYPE_ID
		,ASSETNAME_ID
	FROM ASSET_DETAILS AD WITH (NOLOCK)
	LEFT JOIN MTS_ASSET_NAME AST WITH (NOLOCK) ON AD.ASSET_NAMEID = AST.ID
	LEFT JOIN MTS_ASSETCATEGORIES ACAT WITH (NOLOCK) ON AD.ASSET_TYPEID = ACAT.CATEGORYID
	LEFT JOIN MTS_VENDORS MTSV WITH (NOLOCK) ON MTSV.ID = AD.VENDOR_ID
	WHERE AD.active = 1

	SELECT AD.VENDOR_ID
		,MTSV.NAME AS VENDOR_NAME
		,PURCHASE_ORDER_NUMBER
		,BILL_NUMBER
		,format(BILL_DATE, 'MM/dd/yyyy') AS BILL_DATE
		,format(PURCHASED_ON, 'MM/dd/yyyy') AS PURCHASED_ON
		,sum(COST) AS COST
	FROM ASSET_DETAILS AD WITH (NOLOCK)
	INNER JOIN MTS_VENDORS MTSV WITH (NOLOCK) ON MTSV.ID = AD.VENDOR_ID
	WHERE AD.active = 1
	GROUP BY BILL_NUMBER
		,MTSV.NAME
		,BILL_DATE
		,PURCHASED_ON
		,PURCHASE_ORDER_NUMBER
		,AD.VENDOR_ID
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ALLASSETNAMES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ALLASSETNAMES]
AS
BEGIN
	SELECT ID
		,Assetname
	FROM MTS_ASSET_NAME WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ALLEMPLOYEELEAVELIST]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ALLEMPLOYEELEAVELIST] (
	@fromdate DATE
	,@todate DATE
	,@employeename BIGINT
	)
AS
BEGIN
	IF (@employeename = 0)
	BEGIN
		SET @employeename = NULL
	END

	SELECT e.Employee_Id
		,Approval
		,CAST(Convert(VARCHAR(255), l.FromDate, 110) AS VARCHAR(255)) AS 'FromDate'
		,CAST(Convert(VARCHAR(255), l.ToDate, 110) AS VARCHAR(255)) AS 'ToDate'
		,l.Numberofdays
		,ml.LeaveType
		,l.Reason
		,e.Firstname + ' ' + e.Lastname AS EmployeeName
	FROM MTS_LeaveType AS ml WITH (NOLOCK)
	INNER JOIN Employee_Leave AS l WITH (NOLOCK) ON ml.Id = l.LeaveType
	INNER JOIN Employee AS e WITH (NOLOCK) ON l.Employee_Id = e.id
	WHERE (
			@fromdate BETWEEN l.FromDate
				AND l.ToDate
			OR @todate BETWEEN l.FromDate
				AND l.ToDate
			OR l.FromDate BETWEEN @fromdate
				AND @todate
			OR l.ToDate BETWEEN @fromdate
				AND @todate
			)
		AND e.id = isnull(@employeename, e.id)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ALLEMPLOYEENAMES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ALLEMPLOYEENAMES]
AS
BEGIN
	SELECT id
		,FirstName + ' ' + LastName AS EmployeeName
	FROM Employee WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_AMC_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_AMC_DETAILS] (@ITEMCODE BIGINT)
AS
BEGIN
	SELECT AMC.Id
		,AC.CategoryName AS Assettype
		,AN.Assetname AS Assetname
		,AMC.Category
		,AMC.Item_code
		,VM.NAME AS Vendor
		,AMC.AmcType
		,AMC.Insurancetype
		,CASE AMC.Category
			WHEN 1
				THEN AMC.AmcCharges
			WHEN 2
				THEN AMC.PremiumCharges
			END CHARGES
		,AMC.PremiumCharges
		,format(AMC.PaymentRefDate, 'MM/dd/yyyy') AS PaymentRefDate
		,AMC.PaymentRefNumber
		,format(AMC.FromDate, 'MM/dd/yyyy') AS FromDate
		,format(AMC.ToDate, 'MM/dd/yyyy') AS ToDate
		,AMC.ContactPerson
		,AMC.ContactPhone
		,AMC.Notes
	FROM AMC_OR_ASSET_INSURANCE AMC WITH (NOLOCK)
	LEFT JOIN MTS_AssetCategories AC WITH (NOLOCK) ON AMC.AssetTypeId = AC.CategoryId
	LEFT JOIN MTS_ASSET_NAME AN WITH (NOLOCK) ON AMC.AssetName = AN.Id
	LEFT JOIN MTS_VENDORS VM WITH (NOLOCK) ON AMC.Vendor = VM.ID
	WHERE AMC.Item_code = @ITEMCODE
END
GO

/****** Object:  StoredProcedure [dbo].[READ_Amc_IMAGES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_Amc_IMAGES] (@ASSETCODE BIGINT)
AS
BEGIN
	DECLARE @INVOICEID BIGINT = (
			SELECT Amc_document_id
			FROM AMC_OR_ASSET_INSURANCE WITH (NOLOCK)
			WHERE ID = @ASSETCODE
			)

	SELECT [FILE]
		,FILE_NAME
	FROM AMC_OR_INSURANCE_DETAILS WITH (NOLOCK)
	WHERE ID = @INVOICEID
END
GO

/****** Object:  StoredProcedure [dbo].[READ_AMC_INSURANCE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_AMC_INSURANCE] (@id VARCHAR(255))
AS
BEGIN
	SELECT AssetTypeId
		,AssetName
		,Category
		,Vendor
		,Amctype
		,Insurancetype
		,AmcCharges
		,PremiumCharges
		,PaymentType
		,PaymentRefDate
		,FromDate
		,ToDate
		,ContactPerson
		,ContactPhone
		,Notes
	FROM AMC_OR_ASSET_INSURANCE WITH (NOLOCK)
	WHERE Item_code = @id
END
GO

/****** Object:  StoredProcedure [dbo].[READ_AMC_OR_ASSET_INSURANCE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_AMC_OR_ASSET_INSURANCE]
AS
BEGIN
	SELECT Id
		,AssetTypeId
		,AssetName
		,Category
		,Vendor
		,Amctype
		,Insurancetype
		,AmcCharges
		,PremiumCharges
		,PaymentType
		,PaymentRefDate
		,PaymentRefNumber
		,FromDate
		,ToDate
		,ContactPerson
		,ContactPhone
		,Notes
		,item_code
		,AMC_DOCUMENT_ID
	FROM AMC_OR_ASSET_INSURANCE WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_APPRAISAL_MANAGERS_FEEDBACK_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_APPRAISAL_MANAGERS_FEEDBACK_DETAILS] (
	@EMP_ID BIGINT
	,@APPRAISAL_ID BIGINT
	)
AS
BEGIN
	DECLARE @appraisal_process_period_id BIGINT

	IF ISNULL(@APPRAISAL_ID, 0) = 0
	BEGIN
		SELECT @appraisal_process_period_id = APD.Id
		FROM MTS_APPRAISAL_PROCESS_DETAILS APD WITH (NOLOCK)
		INNER JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE RT WITH (NOLOCK) ON RT.Appraisal_Process_Period_Id = APD.Id
		WHERE APD.Active = 2
			AND RT.Employee_Id = @EMP_ID
	END
	ELSE
	BEGIN
		SELECT @appraisal_process_period_id = @APPRAISAL_ID
	END

	SELECT MAMF.ID
		,E.Firstname + ' ' + E.Lastname AS EmployeeName
		,M.Firstname + ' ' + M.Lastname AS ManagerName
		,MAMF.FEEDBACK AS FeedBack
		,MAMF.CREATED_ON AS CreatedOn
	FROM MTS_APPRAISAL_MANAGERS_FEEDBACK MAMF WITH (NOLOCK)
	INNER JOIN EMPLOYEE E WITH (NOLOCK) ON MAMF.EMPLOYEE_ID = E.id
	INNER JOIN EMPLOYEE M WITH (NOLOCK) ON MAMF.POSTED_USER_ID = M.id
	WHERE MAMF.EMPLOYEE_ID = @EMP_ID
		AND MAMF.APPRAISAL_FEEDBACK_ID = @appraisal_process_period_id
END
GO

/****** Object:  StoredProcedure [dbo].[Read_Appraisal_SkillKRAMapping]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Read_Appraisal_SkillKRAMapping]
AS
BEGIN
	SELECT Id
		,PerformanceType
	FROM MTS_Appraisal_PerformanceType WITH (NOLOCK)

	SELECT id
		,[Description]
	FROM MTS_Appraisal_SkillKRAMapping WITH (NOLOCK)

	SELECT *
	FROM MTS_Appraisal_SkillKRAMapping WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_APPROVAL_ACTION_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_APPROVAL_ACTION_DETAILS] (@ACTIVITYID BIGINT)
AS
BEGIN
	SELECT MAD.ID
		,MMP.MODULE
		,ACTIVITY_ID
		,[STATUS]
		,E.Firstname + ' ' + E.Lastname AS FROM_WHOM
		,E1.Firstname + ' ' + E1.Lastname AS TO_WHOM
		,CONVERT(VARCHAR(20), [DATE], 100) AS DATE
		,MAD.[PARAMETERS] AS PARAMETER_VALUE
		,MMP.[PARAMETERS]
		,REMARKS
	FROM MTS_APPROVAL_DETAILS MAD WITH (NOLOCK)
	LEFT JOIN Employee E WITH (NOLOCK) ON MAD.FROM_USER_ID = E.id
	LEFT JOIN Employee E1 WITH (NOLOCK) ON MAD.TO_USER_ID = E1.id
	LEFT JOIN MTS_MODULE_PARAMETERS MMP WITH (NOLOCK) ON MAD.MODULE = MMP.MODULE_ID
	WHERE ACTIVITY_ID = @ACTIVITYID
	ORDER BY [DATE]
END
GO

/****** Object:  StoredProcedure [dbo].[READ_APPROVAL_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_APPROVAL_DETAILS] (@USERID BIGINT)
AS
BEGIN
	WITH TEMP_APPROVAL_HEADER (
		ACTIVITY_ID
		,EMPID
		)
	AS (
		SELECT ACTIVITY_ID
			,EmployeeID
		FROM MTS_APPROVAL_HEADER WITH (NOLOCK)
		WHERE [STATUS] <> 2
			AND [STATUS] <> 3
		)
	SELECT MAD.ID
		,MAD.MODULE AS MODULE_ID
		,MMP.MODULE
		,MAD.ACTIVITY_ID
		,[STATUS]
		,E.Firstname + ' ' + E.Lastname AS FROM_WHOM
		,E1.Firstname + ' ' + E1.Lastname AS TO_WHOM
		,CONVERT(VARCHAR(20), [DATE], 100) AS DATE
		,MAD.[PARAMETERS] AS PARAMETER_VALUE
		,MMP.[PARAMETERS]
		,REMARKS
		,TO_INBOX_FLAG
		,ISNULL(E2.Firstname, 'No') + ' ' + ISNULL(E2.Lastname, 'Data') AS EmployeeName
		,(
			SELECT TOP 1 VALUE
			FROM STRING_SPLIT(MAD.[PARAMETERS], ',')
			ORDER BY value DESC
			) AS MonthYear
	FROM MTS_APPROVAL_DETAILS MAD WITH (NOLOCK)
	LEFT JOIN Employee E WITH (NOLOCK) ON MAD.FROM_USER_ID = E.id
	LEFT JOIN Employee E1 WITH (NOLOCK) ON MAD.TO_USER_ID = E1.id
	LEFT JOIN MTS_MODULE_PARAMETERS MMP WITH (NOLOCK) ON MAD.MODULE = MMP.MODULE_ID
	RIGHT JOIN TEMP_APPROVAL_HEADER TAH ON MAD.ACTIVITY_ID = TAH.ACTIVITY_ID
	LEFT JOIN Employee E2 ON TAH.EMPID = E2.id
	WHERE TO_USER_ID = @USERID
		AND TO_INBOX_FLAG = 1
		AND [STATUS] <> 2
		AND [STATUS] <> 3 
	ORDER BY [DATE] DESC

	--Approved Table
	SELECT MAD.ID
		,MAD.MODULE AS MODULE_ID
		,MMP.MODULE
		,MAH.ACTIVITY_ID
		,MAD.[STATUS]
		,E.Firstname + ' ' + E.Lastname AS FROM_WHOM
		,E1.Firstname + ' ' + E1.Lastname AS TO_WHOM
		,CONVERT(VARCHAR(20), MAD.[DATE], 100) AS DATE
		,MAD.[PARAMETERS] AS PARAMETER_VALUE
		,MMP.[PARAMETERS]
		,REMARKS
		,ISNULL(E2.Firstname, 'No') + ' ' + ISNULL(E2.Lastname, 'Data') AS EmployeeName
		,(
			SELECT TOP 1 VALUE
			FROM STRING_SPLIT(MAD.[PARAMETERS], ',')
			ORDER BY value DESC
			) AS MonthYear
	FROM MTS_APPROVAL_DETAILS MAD WITH (NOLOCK)
	LEFT JOIN Employee E WITH (NOLOCK) ON MAD.FROM_USER_ID = E.id
	LEFT JOIN Employee E1 WITH (NOLOCK) ON MAD.TO_USER_ID = E1.id
	LEFT JOIN MTS_MODULE_PARAMETERS MMP WITH (NOLOCK) ON MAD.MODULE = MMP.MODULE_ID
	LEFT JOIN MTS_APPROVAL_HEADER MAH WITH (NOLOCK) ON MAD.ACTIVITY_ID = MAH.ACTIVITY_ID
	LEFT JOIN Employee E2 WITH (NOLOCK) ON MAH.EmployeeID = E2.id
	WHERE MAD.[STATUS] = 2
	ORDER BY [DATE] DESC

	-- To show Inbox only for Approver and Inititor in Layout
	SELECT Approval_flag
	FROM EMPLOYEE WITH (NOLOCK)
	WHERE id = @USERID
END
GO

/****** Object:  StoredProcedure [dbo].[READ_APPROVEDLEAVELIST]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_APPROVEDLEAVELIST] (
	@managerid BIGINT
	,@fromDate DATE
	,@todate DATE
	)
AS
BEGIN
	SELECT DISTINCT l.Employee_Id
		,CAST(Convert(VARCHAR(255), l.FromDate, 110) AS VARCHAR(255)) AS 'FromDate'
		,CAST(Convert(VARCHAR(255), l.ToDate, 110) AS VARCHAR(255)) AS 'ToDate'
		,l.NumberOfDays
		,ml.LeaveType
		,l.Reason
		,(
			SELECT e.Firstname + ' ' + e.Lastname AS EmployeeName
			FROM Employee AS e WITH (NOLOCK)
			WHERE e.id = l.Employee_Id
			) AS EmployeeName
		,(
			SELECT e.Employee_Id AS Empid
			FROM Employee AS e WITH (NOLOCK)
			WHERE e.id = l.Employee_Id
			) AS Empid
	FROM MTS_LeaveType AS ml WITH (NOLOCK)
	INNER JOIN Employee_Leave AS l WITH (NOLOCK) ON ml.Id = l.LeaveType
	INNER JOIN Employee AS e WITH (NOLOCK) ON l.Approval = 2
	WHERE (
			@fromdate BETWEEN FromDate
				AND ToDate
			OR @todate BETWEEN FromDate
				AND ToDate
			OR FromDate BETWEEN @fromdate
				AND @todate
			OR ToDate BETWEEN @fromdate
				AND @todate
			)
		AND Managerid = @managerid
	ORDER BY FromDate
END
GO

/****** Object:  StoredProcedure [dbo].[READ_APPROVEDLEAVELISTFOREXPORT]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_APPROVEDLEAVELISTFOREXPORT] (
	@month INT
	,@year VARCHAR(255)
	)
AS
BEGIN
	WITH LeaveTaken (
		Employee_Id
		,LeaveType
		,Leavebalance
		,availableleave
		,NumberofdaysLeaveTaken
		,LOPDays
		)
	AS (
		SELECT elb.Employee_Id
			,elb.LeaveType
			,(elb.Leavebalance) AS availableleave
			,elb.Leavebalance
			,SUM(lr.Numberofdays) - SUM(lr.LOPDays) AS NumberofdaysLeaveTaken
			,SUM(lr.LOPDays) AS LOPDays
		FROM LeaveReport lr WITH (NOLOCK)
		INNER JOIN EmployeeLeaveBalance elb WITH (NOLOCK) ON lr.LeaveType = elb.LeaveType
			AND LR.Employee_Id = elb.Employee_Id
		WHERE lr.Month <= @month
			AND lr.Year = @year
			AND elb.Year = @year
		GROUP BY elb.Employee_Id
			,elb.Leavebalance
			,elb.LeaveType
		)
	SELECT emp.Employee_Id
		,ISNULL(MLP.LEAVE_TYPE, Mlt.LeaveType) AS LeaveType
		,@month AS Month
		,emp.Firstname + ' ' + emp.Lastname Fullname
		,r.Year AS year
		,LT.NumberofdaysLeaveTaken AS Numberofdays
		,LT.availableleave - LT.NumberofdaysLeaveTaken AS LeaveBalance
		,LT.LeaveType
	FROM LeaveReport r WITH (NOLOCK)
	INNER JOIN mts_leaveType Mlt WITH (NOLOCK) ON r.leaveType = Mlt.ID
	INNER JOIN EmployeeLeaveBalance ELB WITH (NOLOCK) ON ELB.Employee_Id = r.Employee_Id
		AND ELB.LeaveType = Mlt.ID
		AND ELB.Year = @year
	LEFT JOIN MTS_LEAVEPOLICY MLP WITH (NOLOCK) ON MLP.LEAVE_CODE = Mlt.LeaveType
	INNER JOIN Employee emp WITH (NOLOCK) ON emp.id = r.Employee_Id
	INNER JOIN LeaveTaken LT ON LT.Employee_Id = emp.id
		AND LT.LeaveType = Mlt.ID
	WHERE Month <= @month
		AND r.year = @year
	GROUP BY emp.Employee_Id
		,emp.Firstname
		,emp.Lastname
		,Mlt.LeaveType
		,r.Year
		,ELB.Leavebalance
		,MLP.LEAVE_TYPE
		,ELB.AdvanceCredit
		,LT.availableleave
		,LT.NumberofdaysLeaveTaken
		,LT.LeaveType
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ASSET_CLASSIFICATION_COUNT]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSET_CLASSIFICATION_COUNT] @AssetTypeId BIGINT
AS
BEGIN
	WITH DISTINCT_ASSET_NAME
	AS (
		SELECT AssettypeId AS ASSET_TYPEID
			,Assetname AS ASSET_NAMEID
		FROM MTS_ASSETS WITH (NOLOCK)
		WHERE AssettypeId = @AssetTypeId
			AND Assetname IS NOT NULL
		GROUP BY AssettypeId
			,Assetname
		)
	SELECT ANC.ASSET_TYPEID
		,ANC.ASSET_NAMEID
		,MAC.CategoryName
		,MAN.Assetname
		,COUNT(AD.ID) AS COUNT
	FROM DISTINCT_ASSET_NAME ANC
	LEFT JOIN ASSET_DETAILS AD WITH (NOLOCK) ON AD.ASSET_TYPEID = ANC.ASSET_TYPEID
		AND AD.ASSET_NAMEID = ANC.ASSET_NAMEID
		AND AD.active = 1
	LEFT JOIN MTS_AssetCategories MAC WITH (NOLOCK) ON ANC.ASSET_TYPEID = MAC.CategoryId
	LEFT JOIN MTS_ASSET_NAME MAN WITH (NOLOCK) ON ANC.ASSET_NAMEID = MAN.Id
	GROUP BY ANC.ASSET_TYPEID
		,ANC.ASSET_NAMEID
		,MAC.CategoryName
		,MAN.Assetname
	ORDER BY ANC.ASSET_TYPEID
		,ANC.ASSET_NAMEID
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ASSET_DASHBOARD_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSET_DASHBOARD_DETAILS]
AS
BEGIN
	SELECT MAC.CategoryId AS ASSET_TYPEID
		,MAC.CategoryName
		,SUM(CASE 
				WHEN MAC.CategoryId = AD.ASSET_TYPEID
					THEN 1
				ELSE 0
				END) AS COUNT
	FROM MTS_AssetCategories MAC WITH (NOLOCK)
	LEFT JOIN ASSET_DETAILS AD WITH (NOLOCK) ON MAC.CategoryId = AD.ASSET_TYPEID
		AND AD.active = 1
	GROUP BY MAC.CategoryId
		,MAC.CategoryName
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ASSET_DASHBOARD_TABLE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSET_DASHBOARD_TABLE] @AssetTypeId BIGINT
	,@AssetNameId BIGINT
AS
BEGIN
	WITH total
	AS (
		SELECT Item_code AS ID
			,sum(cost) AS totalcost
		FROM asset_maintenance WITH (NOLOCK)
		GROUP BY Item_code
		)
	SELECT Ass.ID
		,Ass.ASSET_TYPEID
		,Ass.IDENTIFICATION_CODE
		,name.Id AS AssetnameId
		,cat.CategoryName AS AssetType
		,name.Assetname AS AssetName
		,Ass.ASSET_DESCRIPTION
		,format(Ass.BILL_DATE, 'yyyy') AS Purchased_year
		,t.totalcost
		,Ass.MAKE
		,emp.Firstname + emp.Lastname AS AssignedTo
		,Ass.SERIAL_NUMBER
		,STUFF((
				SELECT ',' + CAST(AAS.Category AS VARCHAR)
				FROM AMC_OR_ASSET_INSURANCE AAS
				WHERE AAS.Item_code = Ass.ID
					AND AAS.ToDate >= cast(GETDATE() AS DATE)
				GROUP BY AAS.Item_code
					,AAS.Category
				FOR XML PATH('')
				), 1, 1, '') AS Category
	FROM ASSET_DETAILS Ass WITH (NOLOCK)
	INNER JOIN MTS_ASSET_NAME name WITH (NOLOCK) ON Ass.ASSET_NAMEID = name.id
	INNER JOIN MTS_AssetCategories cat WITH (NOLOCK) ON Ass.ASSET_TYPEID = cat.CategoryId
	LEFT JOIN Employee emp WITH (NOLOCK) ON Ass.CURRENTLY_ASSIGNED_TO = emp.id
	LEFT JOIN total t ON Ass.ID = t.ID
	WHERE Ass.active = 1
		AND (
			(
				Ass.ASSET_TYPEID = @AssetTypeId
				AND Ass.ASSET_NAMEID = @AssetNameId
				)
			OR (
				Ass.ASSET_TYPEID = @AssetTypeId
				AND @AssetNameId = 0
				)
			)
	GROUP BY Ass.ID
		,Ass.ASSET_TYPEID
		,Ass.IDENTIFICATION_CODE
		,name.Id
		,cat.CategoryName
		,name.Assetname
		,Ass.ASSET_DESCRIPTION
		,Ass.BILL_DATE
		,t.totalcost
		,Ass.MAKE
		,emp.Firstname
		,emp.Lastname
		,Ass.SERIAL_NUMBER
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ASSET_MAINTENANCDE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSET_MAINTENANCDE]
AS
BEGIN
	SELECT *
	FROM Asset_Maintenance WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ASSET_MAINTENANCE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSET_MAINTENANCE] (@ITEMCODE BIGINT)
AS
BEGIN
	SELECT AM.Id
		,MAC.CategoryName
		,MAN.Assetname
		,format(AM.Dateofpurchase, 'MM/dd/yyyy') AS Dateofpurchase
		,MV.NAME
		,AM.MaintenanceCarried_out
		,AM.Cost
		,AM.Item_code
		,AM.Notes
	FROM Asset_Maintenance AM WITH (NOLOCK)
	INNER JOIN MTS_AssetCategories MAC WITH (NOLOCK) ON MAC.CategoryId = AM.AssettypeId
	INNER JOIN MTS_ASSET_NAME MAN WITH (NOLOCK) ON MAN.Id = AM.Assetname
	INNER JOIN MTS_VENDORS MV WITH (NOLOCK) ON MV.ID = AM.Vendor
	WHERE Item_code = @ITEMCODE
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ASSET_MAINTENANCE_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSET_MAINTENANCE_DETAILS]
AS
BEGIN
	SELECT Id
		,AssettypeId
		,Assetname
		,Dateofpurchase
		,Vendor
		,MaintenanceCarried_out
		,Cost
		,Notes
		,Item_code
	FROM Asset_Maintenance WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ASSET_MASTER]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSET_MASTER]
AS
BEGIN
	SELECT MA.Id
		,MA.AssetCode
		,MAC.CategoryName
		,MAN.Assetname
		,MA.Depreciation
		,MA.Expectedlife
		,MA.Salvagevalue
	FROM MTS_ASSETS MA WITH (NOLOCK)
	INNER JOIN MTS_AssetCategories MAC WITH (NOLOCK) ON MAC.CategoryId = MA.AssettypeId
	INNER JOIN MTS_ASSET_NAME MAN WITH (NOLOCK) ON MAN.Id = MA.Assetname
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ASSET_REPORT]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSET_REPORT]
AS
BEGIN
	SELECT format(DET.BILL_DATE, 'MM/dd/yyyy') AS PURCHASED_ON
		,VEN.NAME AS SUPPLIER_NAME
		,STUFF((
				SELECT TOP 1 ',' + CASE 
						WHEN ASSIGN.ASSIGN_TYPEID = 1
							THEN DEP.Department
						WHEN ASSIGN.ASSIGN_TYPEID = 2
							THEN LOC.PLACE_NAME
						END
				FROM ASSIGN_ASSET ASSIGN WITH (NOLOCK)
				LEFT JOIN ASSET_DETAILS AD WITH (NOLOCK) ON AD.ID = ASSIGN.ITEM_CODE
				LEFT JOIN LOCATION_DETAILS LOC WITH (NOLOCK) ON ASSIGN.LOCATION_ID = LOC.LOCATION_ID
					AND ASSIGN.LOCATION_DETAILS_ID = LOC.PLACE_ID
				LEFT JOIN Employee E WITH (NOLOCK) ON E.id = ASSIGN.EMPLOYEE_ID
				LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
				WHERE ASSIGN.ITEM_CODE = DET.ID
					AND AD.active = 1
				GROUP BY ASSIGN.ITEM_CODE
					,ASSIGN.ASSIGN_TYPEID
					,LOC.PLACE_NAME
					,DEP.Department
					,ASSIGN.ID
				ORDER BY ASSIGN.ID DESC
				FOR XML path('')
				), 1, 1, '') AS [LOCATION]
		,cat.CategoryName AS ASSET_TYPE
		,name.Assetname AS ASSET_NAME
		,DET.IDENTIFICATION_CODE AS ASSET_NUMBER
		,DET.ASSET_DESCRIPTION AS ITEM_DESCRIPTION
		,DET.COST AS PURCHASE_VALUE
		,format(SALE.DateOfSale, 'MM/dd/yyyy') AS DateOfSale
		,CASE 
			WHEN (SALE.DateOfSale IS NOT NULL)
				THEN 
					(
						SELECT convert(VARCHAR(3), DATEDIFF(MONTH, DET.BILL_DATE, SALE.DateOfSale) / 12) + ' y ' + convert(VARCHAR(2), DATEDIFF(MONTH, DET.BILL_DATE, SALE.DateOfSale) % 12) + ' m'
						)
			WHEN (SALE.DateOfSale IS NULL)
				THEN
					(
						SELECT convert(VARCHAR(3), DATEDIFF(MONTH, DET.BILL_DATE, GETDATE()) / 12) + ' y ' + convert(VARCHAR(2), DATEDIFF(MONTH, DET.BILL_DATE, GETDATE()) % 12) + ' m'
						)
			END AS LIFE_IN_YRS
		,SALE.SalePrice
		,DET.ID
	FROM ASSET_DETAILS DET WITH (NOLOCK)
	LEFT JOIN MTS_VENDORS VEN WITH (NOLOCK) ON DET.VENDOR_ID = VEN.ID
	LEFT JOIN MTS_AssetCategories cat WITH (NOLOCK) ON DET.ASSET_TYPEID = cat.CategoryId
	LEFT JOIN MTS_ASSET_NAME name WITH (NOLOCK) ON DET.ASSET_NAMEID = name.id
	LEFT JOIN MTS_ASSETS ASS WITH (NOLOCK) ON DET.ASSET_TYPEID = ASS.AssetTypeId 
	LEFT JOIN ASSET_SALE SALE WITH (NOLOCK) ON DET.ASSET_TYPEID = SALE.Asset_Type
		AND DET.ASSET_NAMEID = SALE.Asset_Name
		AND DET.ID = SALE.Item_code
	LEFT JOIN ASSIGN_ASSET AA WITH (NOLOCK) ON CAST(DET.ID AS VARCHAR) = AA.ITEM_CODE
	GROUP BY DET.BILL_DATE
		,VEN.NAME
		,cat.CategoryName
		,name.Assetname
		,DET.IDENTIFICATION_CODE
		,DET.ASSET_DESCRIPTION
		,DET.COST
		,SALE.DateOfSale
		,SALE.SalePrice
		,DET.ID
	ORDER BY DET.BILL_DATE
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ASSET_SALE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSET_SALE] (@ITEMCODE BIGINT)
AS
BEGIN
	SELECT Id
		,format(DateOfSale, 'MM/dd/yyyy') AS DateOfSale
		,TypeOfSale
		,SalePrice
		,SoldTo
		,format(ApporvedDate, 'MM/dd/yyyy') AS ApporvedDate
		,ApporvedRef
		,ApporvedBy
		,Notes
	FROM ASSET_SALE WITH (NOLOCK)
	WHERE Item_code = @ITEMCODE
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ASSETCATEGORY_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSETCATEGORY_DETAILS]
AS
BEGIN
	SELECT CategoryId
		,CategoryName
	FROM MTS_AssetCategories WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ASSETDETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSETDETAILS]
AS
BEGIN
	WITH total
	AS (
		SELECT Item_code AS ID
			,sum(cost) AS totalcost
		FROM asset_maintenance WITH (NOLOCK)
		GROUP BY Item_code
		)
	SELECT Ass.ID
		,Ass.ASSET_TYPEID
		,Ass.IDENTIFICATION_CODE
		,name.Id AS AssetnameId
		,cat.CategoryName AS AssetType
		,name.Assetname AS AssetName
		,Ass.ASSET_DESCRIPTION
		,year(Ass.BILL_DATE) AS Purchased_year
		,t.totalcost
		,Ass.MAKE
		,emp.Firstname + ' ' + emp.Lastname AS AssignedTo
		,Ass.SERIAL_NUMBER
		,STUFF((
				SELECT ',' + CAST(AAS.Category AS VARCHAR)
				FROM AMC_OR_ASSET_INSURANCE AAS
				WHERE AAS.Item_code = Ass.ID
					AND AAS.ToDate >= cast(GETDATE() AS DATE)
				GROUP BY AAS.Item_code
					,AAS.Category
				FOR XML PATH('')
				), 1, 1, '') AS Category
	FROM ASSET_DETAILS Ass WITH (NOLOCK)
	INNER JOIN MTS_ASSET_NAME name WITH (NOLOCK) ON Ass.ASSET_NAMEID = name.id
	INNER JOIN MTS_AssetCategories cat WITH (NOLOCK) ON Ass.ASSET_TYPEID = cat.CategoryId
	LEFT JOIN Employee emp WITH (NOLOCK) ON Ass.CURRENTLY_ASSIGNED_TO = emp.id
	LEFT JOIN total t ON Ass.ID = t.ID
	WHERE Ass.active = 1
	GROUP BY Ass.ID
		,Ass.ASSET_TYPEID
		,Ass.IDENTIFICATION_CODE
		,name.Id
		,cat.CategoryName
		,name.Assetname
		,Ass.ASSET_DESCRIPTION
		,Ass.BILL_DATE
		,t.totalcost
		,Ass.MAKE
		,emp.Firstname
		,emp.Lastname
		,Ass.SERIAL_NUMBER
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ASSETDETAILSBYID]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSETDETAILSBYID] @Id BIGINT
AS
BEGIN
	WITH total (
		ID
		,totalcost
		)
	AS (
		SELECT Item_code
			,sum(cost)
		FROM asset_maintenance WITH (NOLOCK)
		GROUP BY Item_code
		)
	SELECT Ass.ID
		,Ass.ASSET_TYPEID
		,Ass.IDENTIFICATION_CODE
		,MAS.Id AS AssetnameId
		,cat.CategoryName AS AssetType
		,CASE 
			WHEN Ass.active = 1
				THEN 1
			ELSE 0
			END AS [ACTIVE]
		,MAS.Assetname AS AssetName
		,Ass.ASSET_DESCRIPTION
		,format(Ass.BILL_DATE, 'yyyy') AS Purchased_year
		,format(Ass.BILL_DATE, 'MM/dd/yyyy') AS Purchased_Date
		,t.totalcost
		,Ass.MAKE
		,emp.Firstname + ' ' + emp.Lastname AS AssignedTo
		,Ass.SERIAL_NUMBER
		,V.[NAME] AS VENDOR_NAME
		,Ass.BILL_NUMBER
		,CONVERT(VARCHAR(10), Ass.BILL_DATE, 101) AS BILL_DATE
		,Ass.COST
		,Ass.COST_TYPE
		,Ass.MODEL
		,Ass.WARRANTY_STARTDATE
		,Ass.WARRANTY_ENDDATE
		,STUFF((
				SELECT ',' + CAST(AAS.Category AS VARCHAR)
				FROM AMC_OR_ASSET_INSURANCE AAS WITH (NOLOCK)
				WHERE AAS.Item_code = Ass.ID
					AND AAS.ToDate >= cast(GETDATE() AS DATE)
				GROUP BY AAS.Item_code
					,AAS.Category
				FOR XML PATH('')
				), 1, 1, '') AS Category
	FROM ASSET_DETAILS Ass WITH (NOLOCK)
	INNER JOIN MTS_ASSET_NAME MAS WITH (NOLOCK) ON Ass.ASSET_NAMEID = MAS.id
	INNER JOIN MTS_AssetCategories cat WITH (NOLOCK) ON Ass.ASSET_TYPEID = cat.CategoryId
	LEFT JOIN Employee emp WITH (NOLOCK) ON Ass.CURRENTLY_ASSIGNED_TO = emp.id
	LEFT JOIN AMC_OR_ASSET_INSURANCE ins WITH (NOLOCK) ON Ass.ID = ins.Item_code
	LEFT JOIN total t WITH (NOLOCK) ON Ass.ID = t.ID
	INNER JOIN MTS_VENDORS V WITH (NOLOCK) ON Ass.VENDOR_ID = V.ID
	WHERE Ass.id = @Id
	GROUP BY Ass.ID
		,Ass.ASSET_TYPEID
		,Ass.IDENTIFICATION_CODE
		,MAS.Id
		,cat.CategoryName
		,Ass.active
		,MAS.Assetname
		,Ass.ASSET_DESCRIPTION
		,Ass.BILL_DATE
		,t.totalcost
		,Ass.MAKE
		,emp.Firstname
		,emp.Lastname
		,Ass.SERIAL_NUMBER
		,V.[NAME]
		,Ass.BILL_NUMBER
		,Ass.BILL_DATE
		,Ass.COST
		,Ass.COST_TYPE
		,Ass.MODEL
		,Ass.WARRANTY_STARTDATE
		,Ass.WARRANTY_ENDDATE
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ASSETS_ASSIGNED_TO_EMPLOYEE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSETS_ASSIGNED_TO_EMPLOYEE] @employeeid BIGINT
AS
BEGIN
	SELECT MAC.CategoryName AS CLASSIFICATION
		,MAN.Assetname AS CATEGORY
		,ISNULL(AD.IDENTIFICATION_CODE, 'Not available') AS ITEM_CODE
		,AD.ASSET_TYPEID
		,AD.ASSET_NAMEID
		,AD.ID AS Item_Id
		,@employeeid AS Employee_id
		,AA.ACTION_DATE
	FROM ASSET_DETAILS AD WITH (NOLOCK)
	LEFT JOIN MTS_AssetCategories MAC WITH (NOLOCK) ON AD.ASSET_TYPEID = MAC.CategoryId
	LEFT JOIN MTS_ASSET_NAME MAN WITH (NOLOCK) ON AD.ASSETNAME_ID = MAN.Id
	LEFT JOIN ASSIGN_ASSET AA WITH (NOLOCK) ON CAST(AA.ITEM_CODE AS BIGINT) = AD.ID
		AND AA.UNASSIGNED_DATE IS NULL
	WHERE (
			AD.CURRENTLY_ASSIGNED_TO = @employeeid
			AND AD.active = 1
			)
		OR (
			AD.CURRENTLY_ASSIGNED_TO IS NULL
			AND @employeeid IS NULL
			AND AD.active = 1
			)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ASSETS_ASSIGNED_TO_EMPLOYEE_COUNTS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSETS_ASSIGNED_TO_EMPLOYEE_COUNTS]
AS
BEGIN
	SELECT ISNULL(E.Employee_Id, 'NOT ASSIGNED') AS Employee_Id
		,AD.CURRENTLY_ASSIGNED_TO AS id
		,ISNULL(E.Firstname + ' ' + E.Lastname, 'NOT ASSIGNED') AS NAME
		,ISNULL(MD.Department, 'NOT ASSIGNED') AS Department
		,ISNULL(DESIG.Designation, 'NOT ASSIGNED') AS Designation
		,COUNT(AD.ID) AS COUNT
	FROM ASSET_DETAILS AD WITH (NOLOCK)
	LEFT JOIN Employee E WITH (NOLOCK) ON AD.CURRENTLY_ASSIGNED_TO = E.id
	LEFT JOIN MTS_Department MD WITH (NOLOCK) ON MD.id = E.DepartmentId
	LEFT JOIN MTS_Designation DESIG WITH (NOLOCK) ON DESIG.id = E.Designation
	WHERE AD.active = 1
	GROUP BY E.Employee_Id
		,AD.CURRENTLY_ASSIGNED_TO
		,E.Firstname
		,E.Lastname
		,MD.Department
		,DESIG.Designation
	ORDER BY Employee_Id
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ASSIGN_ASSET]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSIGN_ASSET] (@ITEMCODE BIGINT)
AS
BEGIN
	BEGIN
		DECLARE @IDENTIFICATIONCODE VARCHAR(255) = (
				SELECT IDENTIFICATION_CODE
				FROM ASSET_DETAILS
				WHERE ID = @ITEMCODE
				)
	END

	BEGIN
		SELECT AA.ID
			,MAC.CategoryName
			,MAN.Assetname
			,AA.ITEM_CODE
			,E.Firstname + ' ' + E.Fathername AS EMPLOYEE_NAME
			,MD.Department
			,ML.LocationName
			,LD.PLACE_NAME
			,format(AA.ACTION_DATE, 'MM/dd/yyyy') AS ACTION_DATE
			,format(AA.UNASSIGNED_DATE, 'MM/dd/yyyy') AS UNASSIGN_DATE
			,AA.NOTES
			,ASSIGN_TYPEID
		FROM ASSIGN_ASSET AA WITH (NOLOCK)
		LEFT JOIN MTS_AssetCategories MAC WITH (NOLOCK) ON MAC.CategoryId = AA.ASSET_TYPEID
		LEFT JOIN MTS_ASSET_NAME MAN WITH (NOLOCK) ON MAN.Id = AA.ASSET_NAMEID
		LEFT JOIN Employee E WITH (NOLOCK) ON E.id = AA.EMPLOYEE_ID
		LEFT JOIN MTS_Location ML WITH (NOLOCK) ON ML.LocationID = AA.LOCATION_ID
		LEFT JOIN LOCATION_DETAILS LD WITH (NOLOCK) ON LD.ID = AA.LOCATION_DETAILS_ID
		LEFT JOIN MTS_Department MD WITH (NOLOCK) ON MD.id = AA.DEPARTMENT_ID
		WHERE AA.ITEM_CODE = CAST(@ITEMCODE AS VARCHAR)
	END
END
GO

/****** Object:  StoredProcedure [dbo].[READ_AUTHORIZATION]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_AUTHORIZATION]
AS
BEGIN
	SELECT Url
	FROM SecuredAuthorization WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_BANKDETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_BANKDETAILS]
AS
BEGIN
	SELECT eb.id
		,eb.Employee_Id
		,ISNULL(eb.Bankname, 'Nil') AS Bankname
		,ISNULL(eb.Branchname, 'Nil') AS Branchname
		,ISNULL(eb.Accountnumber, 0) AS Accountnumber
		,ISNULL(eb.Ifsc, 'Nil') AS Ifsc
		,e.Firstname + ' ' + e.Lastname Name
		,e.Pancard
		,MTLOG.ACTIVE
	FROM Employee AS e WITH (NOLOCK)
	INNER JOIN Employee_BankDetails eb WITH (NOLOCK) ON e.id = eb.Employee_Id
	INNER JOIN MTS_LOGIN MTLOG WITH (NOLOCK) ON e.id = MTLOG.USERID
END
GO

/****** Object:  StoredProcedure [dbo].[READ_BIRTHDAYS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_BIRTHDAYS] (@isUpcommingBD BIT)
AS
BEGIN
	IF (@isUpcommingBD = 0)
	BEGIN
		DECLARE @date DATE = getdate();

		WITH Employee_CTE (
			Name
			,Month
			,Day
			,Active
			,Email
			,Department
			)
		AS (
			SELECT E.Firstname + ' ' + E.Lastname
				,month(Dateofbirth) AS Month
				,Day(Dateofbirth) AS day
				,MTLOG.ACTIVE
				,E.Email AS Email
				,MD.Department AS Department
			FROM Employee AS E WITH (NOLOCK)
			INNER JOIN MTS_LOGIN AS MTLOG WITH (NOLOCK) ON MTLOG.USERID = E.id
			INNER JOIN MTS_Department MD WITH (NOLOCK) ON E.DepartmentId = MD.id
			)
		SELECT TOP (15) Name
			,Email
			,Department
		FROM Employee_CTE WITH (NOLOCK)
		WHERE Month = month(@date)
			AND Day = day(@date)
			AND Active = 1
	END
	ELSE
	BEGIN
		DECLARE @CurrentMth INT = MONTH(getdate());
		DECLARE @TodayDate INT = DAY(getdate());
		DECLARE @MthEndtDate INT = DAY(EOMONTH(GETDATE()));
		DECLARE @MthName VARCHAR(15) = DATENAME(MONTH, GETDATE());

		IF EXISTS (
				SELECT *
				FROM EMPLOYEE E WITH (NOLOCK)
				WHERE month(E.Dateofbirth) > @CurrentMth
				)
		BEGIN
			SELECT TOP (5) E.Firstname + ' ' + E.Lastname AS Name
				,E.Email AS Email
				,Day(E.Dateofbirth) AS [Day]
				,DATENAME(MONTH, E.Dateofbirth) AS MthName
				,MD.Department AS Department
			FROM Employee AS E WITH (NOLOCK)
			INNER JOIN MTS_LOGIN AS MTLOG WITH (NOLOCK) ON MTLOG.USERID = E.id
			INNER JOIN MTS_Department MD WITH (NOLOCK) ON E.DepartmentId = MD.id
			WHERE MTLOG.Active = 1
				AND (
					(
						MONTH(E.Dateofbirth) = @CurrentMth
						AND Day(E.Dateofbirth) > @TodayDate
						)
					OR (
						MONTH(E.Dateofbirth) > @CurrentMth
						AND MONTH(E.Dateofbirth) <= 12
						)
					)
			ORDER BY MONTH(E.Dateofbirth)
				,Day(E.Dateofbirth)
				,E.Firstname
		END
		ELSE IF EXISTS (
				SELECT *
				FROM EMPLOYEE E WITH (NOLOCK)
				WHERE MONTH(E.Dateofbirth) BETWEEN MONTH(E.Dateofbirth)
						AND DATEADD(MONTH, 12, GETDATE())
				)
		BEGIN
			SELECT TOP (5) E.Firstname + ' ' + E.Lastname AS Name
				,E.Email AS Email
				,Day(E.Dateofbirth) AS [Day]
				,DATENAME(MONTH, E.Dateofbirth) AS MthName
				,MD.Department AS Department
			FROM Employee AS E WITH (NOLOCK)
			INNER JOIN MTS_LOGIN AS MTLOG WITH (NOLOCK) ON MTLOG.USERID = E.id
			INNER JOIN MTS_Department MD WITH (NOLOCK) ON E.DepartmentId = MD.id
			WHERE MTLOG.Active = 1
				AND (
					month(E.Dateofbirth) BETWEEN month(E.Dateofbirth)
						AND DATEADD(MONTH, 12, GETDATE())
					)
			ORDER BY month(E.Dateofbirth)
				,Day(E.Dateofbirth)
				,E.Firstname
		END
		ELSE
		BEGIN
			SELECT 0
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[READ_BLOODGROUP]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_BLOODGROUP]
AS
BEGIN
	SELECT *
	FROM MTS_BloodGroup WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_CURRENTLY_ASSIGNED_EMPLOYEE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_CURRENTLY_ASSIGNED_EMPLOYEE] (@ITEMCODE VARCHAR(MAX))
AS
BEGIN
	SELECT E.Firstname + '' + E.Lastname AS EMPLOYEE_NAME
	FROM Employee AS E WITH (NOLOCK)
	INNER JOIN ASSET_DETAILS AS AD WITH (NOLOCK) ON E.id = AD.CURRENTLY_ASSIGNED_TO
	WHERE AD.ID = CAST(@ITEMCODE AS BIGINT)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_DEPARTMENT]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_DEPARTMENT]
AS
BEGIN
	SELECT *
	FROM Mts_Department WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_DESIGNATION]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_DESIGNATION]
AS
BEGIN
	SELECT *
	FROM Mts_Designation WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_DETAILED_EMPLOYEE_LEAVE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_DETAILED_EMPLOYEE_LEAVE] (
	@EMPID BIGINT
	,@LEAVEID BIGINT
	)
AS
BEGIN
	SELECT MLP.LEAVE_TYPE AS AppliedLeaveType
		,MLP1.LEAVE_TYPE AS LeaveType
		,sum(ELD.Numberofdays) AS NumberOfDays
	FROM EMPLOYEE_LEAVE_DETAILS ELD WITH (NOLOCK)
	LEFT JOIN MTS_LeaveType MLT WITH (NOLOCK) ON ELD.AppliedLeaveType = MLT.id
	LEFT JOIN MTS_LeaveType MLT1 WITH (NOLOCK) ON ELD.LeaveType = MLT1.id
	LEFT JOIN MTS_LeavePolicy MLP WITH (NOLOCK) ON MLT.Leavetype = MLP.LEAVE_CODE
	LEFT JOIN MTS_LeavePolicy MLP1 WITH (NOLOCK) ON MLT1.Leavetype = MLP1.LEAVE_CODE
	WHERE Employee_Id = @EMPID
		AND LeaveId = @LEAVEID
	GROUP BY MLP.LEAVE_TYPE
		,MLP1.LEAVE_TYPE
END
GO

/****** Object:  StoredProcedure [dbo].[Read_Document_Images]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Read_Document_Images] (
	@documentid BIGINT
	,@empid BIGINT
	)
AS
BEGIN
	SELECT DocumentImage
		,DocumentName
	FROM Employee_Documents WITH (NOLOCK)
	WHERE DocumentId = @documentid
		AND Employee_Id = @empid
END
GO

/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEE] (@empid VARCHAR(255))
AS
BEGIN
	SELECT E.id
		,E.Firstname
		,E.Dateofbirth
		,E.Dateofjoin
		,E.Email
		,E.Fathername
		,ISNULL(E.Spousename, '') AS Spousename
		,E.Pancard
		,E.Mobile
		,m.id AS maritalid
		,E.Gender
		,dep.id AS departmentid
		,d.id AS designationid
		,nat.id AS nationalityid
		,ISNULL(E.FunctionalRole, 0) AS FunctionalRole
		,E.Aadhar
		,E.Lastname
		,E.Employee_Id
		,E.PF_AccountNumber
		,E.PF_UAN
		,E.ESI_Number
	FROM Employee E WITH (NOLOCK)
	FULL OUTER JOIN Mts_Marital_status m WITH (NOLOCK) ON m.id = E.Maritalstatus
	FULL OUTER JOIN Mts_Designation d WITH (NOLOCK) ON d.id = E.Designation
	FULL OUTER JOIN Mts_Department dep WITH (NOLOCK) ON dep.id = E.DepartmentId
	FULL OUTER JOIN Mts_Nationality nat WITH (NOLOCK) ON nat.id = E.Nationality
	WHERE E.Employee_Id = @empid
END
GO

/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_APPRORED_LEAVES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEE_APPRORED_LEAVES] (
	@empid BIGINT
	,@approved_only BIT
	,@year BIGINT
	)
AS
BEGIN
	DECLARE @APPRORED INT = 2;

	IF (@approved_only = 1)
	BEGIN
		IF @year >= 2019
		BEGIN
			WITH AdvanceCredit (
				AdvanceAvailed
				,LeaveType
				)
			AS (
				SELECT ISNULL(elb.AdvanceAvailed, 0) AS AdvanceAvailed
					,elb.LeaveType
				FROM EmployeeLeaveBalance elb WITH (NOLOCK)
				INNER JOIN MTS_LeaveType mlt WITH (NOLOCK) ON elb.LeaveType = mlt.id
				WHERE elb.Employee_Id = @empid
					AND elb.Year = @year
				)
				,LeaveTaken (
				Numberofdays
				,LeaveType
				)
			AS (
				SELECT SUM(el.Numberofdays) AS Numberofdays
					,mlt.LeaveType
				FROM EMPLOYEE_LEAVE_DETAILS el WITH (NOLOCK)
				INNER JOIN MTS_LeaveType mlt WITH (NOLOCK) ON el.LeaveType = mlt.id
				WHERE el.Employee_Id = @empid
					AND el.Approval IN (@APPRORED)
					AND (YEAR(el.FromDate)) = @year
					AND isLOP = 0
				GROUP BY mlt.LeaveType
				)
				,ApprovedLeaveAvailed (
				ApprovedLeaveAvailed
				,LeaveType
				)
			AS (
				SELECT COUNT(AdvanceCredit)
					,LeaveType
				FROM EMPLOYEE_LEAVE_DETAILS WITH (NOLOCK)
				WHERE Employee_Id = @empid
					AND year(FromDate) = @year
					AND Approval IN (@APPRORED)
					AND isLOP = 0
					AND AdvanceCredit = 1
				GROUP BY LeaveType
				)
			SELECT ELB.id AS ID
				,MLP.LEAVE_TYPE
				,MLT.Leavetype AS LEAVE_CODE
				,ELB.LeaveType AS LeaveTypeId
				,ELB.Leavebalance AS LeaveCredited
				,ELB.AdvanceCredit AS AdvanceCredit
				,(ELB.Leavebalance + ELB.AdvanceCredit) AS TotalLeavesCredit
				,ISNULL(LT.Numberofdays, 0) AS NumberofdaysLeaveTaken
				,ISNULL(AC.AdvanceAvailed, 0) AS AdvanceAvailed
				,CASE 
					WHEN (ELB.Leavebalance + ELB.AdvanceCredit) - (ISNULL(LT.Numberofdays, 0) - ISNULL(ALA.ApprovedLeaveAvailed, 0) + ISNULL(AC.AdvanceAvailed, 0)) < 0
						THEN 0
					ELSE (ELB.Leavebalance + ELB.AdvanceCredit) - (ISNULL(LT.Numberofdays, 0) - ISNULL(ALA.ApprovedLeaveAvailed, 0) + ISNULL(AC.AdvanceAvailed, 0))
					END AS AvailableLeave
				,STUFF((
						SELECT ', ' + (E1.Firstname + ' ' + E1.Lastname)
						FROM EMPLOYEE E1
						WHERE E1.id = @empid
						FOR XML PATH('')
						), 1, 2, '') AS EmployeeName
				,STUFF((
						SELECT Employee_Id
						FROM Employee WITH (NOLOCK)
						WHERE id = @empid
						), 1, 0, '') AS Employee_Id
			FROM EmployeeLeaveBalance ELB WITH (NOLOCK)
			INNER JOIN MTS_LeaveType MLT WITH (NOLOCK) ON ELB.LeaveType = MLT.id
			INNER JOIN MTS_LeavePolicy MLP WITH (NOLOCK) ON MLT.Leavetype = MLP.LEAVE_CODE
			LEFT JOIN LeaveTaken LT ON MLP.LEAVE_CODE = LT.LeaveType
			LEFT JOIN AdvanceCredit AC ON MLT.id = AC.LeaveType
			LEFT JOIN ApprovedLeaveAvailed ALA ON MLT.id = ALA.LeaveType
			WHERE ELB.Employee_Id = @empid
				AND ELB.Year = @year
		END
		ELSE
		BEGIN
			WITH AdvanceCredit (
				AdvanceAvailed
				,LeaveType
				)
			AS (
				SELECT ISNULL(elb.AdvanceAvailed, 0) AS AdvanceAvailed
					,elb.LeaveType
				FROM EmployeeLeaveBalance elb WITH (NOLOCK)
				INNER JOIN MTS_LeaveType mlt WITH (NOLOCK) ON elb.LeaveType = mlt.id
				WHERE elb.Employee_Id = @empid
					AND elb.Year = @year
				)
				,LeaveTaken (
				Numberofdays
				,LeaveType
				)
			AS (
				SELECT SUM(el.Numberofdays) AS Numberofdays
					,mlt.LeaveType
				FROM Employee_leave el WITH (NOLOCK)
				INNER JOIN MTS_LeaveType mlt WITH (NOLOCK) ON el.LeaveType = mlt.id
				WHERE el.Employee_Id = @empid
					AND el.Approval IN (@APPRORED)
					AND (YEAR(el.FromDate)) = @year
					AND isLOP = 0
				GROUP BY mlt.LeaveType
				)
			SELECT ELB.id AS ID
				,MLP.LEAVE_TYPE
				,MLT.Leavetype AS LEAVE_CODE
				,ELB.LeaveType AS LeaveTypeId
				,ELB.Leavebalance AS LeaveCredited
				,ELB.AdvanceCredit AS AdvanceCredit
				,(ELB.Leavebalance + ELB.AdvanceCredit) AS TotalLeavesCredit
				,ISNULL(LT.Numberofdays, 0) AS NumberofdaysLeaveTaken
				,ISNULL(AC.AdvanceAvailed, 0) AS AdvanceAvailed
				,0 AS AvailableLeave
				,STUFF((
						SELECT ', ' + (E1.Firstname + ' ' + E1.Lastname)
						FROM EMPLOYEE E1
						WHERE E1.id = @empid
						FOR XML PATH('')
						), 1, 2, '') AS EmployeeName
				,STUFF((
						SELECT Employee_Id
						FROM Employee WITH (NOLOCK)
						WHERE id = @empid
						), 1, 0, '') AS Employee_Id
			FROM EmployeeLeaveBalance ELB WITH (NOLOCK)
			INNER JOIN MTS_LeaveType MLT WITH (NOLOCK) ON ELB.LeaveType = MLT.id
			INNER JOIN MTS_LeavePolicy MLP WITH (NOLOCK) ON MLT.Leavetype = MLP.LEAVE_CODE
			LEFT JOIN LeaveTaken LT ON MLP.LEAVE_CODE = LT.LeaveType
			LEFT JOIN AdvanceCredit AC ON MLT.id = AC.LeaveType
			WHERE ELB.Employee_Id = @empid
				AND ELB.Year = @year
		END
	END
	ELSE
	BEGIN
		IF @year >= 2019
		BEGIN
			WITH AdvanceCredit (
				AdvanceAvailed
				,LeaveType
				)
			AS (
				SELECT ISNULL(elb.AdvanceAvailed, 0) AS AdvanceAvailed
					,elb.LeaveType
				FROM EmployeeLeaveBalance elb WITH (NOLOCK)
				INNER JOIN MTS_LeaveType mlt WITH (NOLOCK) ON elb.LeaveType = mlt.id
				WHERE elb.Employee_Id = @empid
					AND elb.Year = @year
				)
				,LeaveTaken (
				Numberofdays
				,LeaveType
				)
			AS (
				SELECT SUM(el.Numberofdays) AS Numberofdays
					,mlt.LeaveType
				FROM EMPLOYEE_LEAVE_DETAILS el WITH (NOLOCK)
				INNER JOIN MTS_LeaveType mlt WITH (NOLOCK) ON el.LeaveType = mlt.id
				WHERE el.Employee_Id = @empid
					AND el.Approval IN (@APPRORED)
					AND (YEAR(el.FromDate)) = @year
					AND isLOP = 0
				GROUP BY mlt.LeaveType
				)
				,ApprovedLeaveAvailed (
				ApprovedLeaveAvailed
				,LeaveType
				)
			AS (
				SELECT COUNT(AdvanceCredit)
					,LeaveType
				FROM EMPLOYEE_LEAVE_DETAILS WITH (NOLOCK)
				WHERE Employee_Id = @empid
					AND year(FromDate) = @year
					AND Approval IN (@APPRORED)
					AND isLOP = 0
					AND AdvanceCredit = 1
				GROUP BY LeaveType
				)
			SELECT ELB.id AS ID
				,MLP.LEAVE_TYPE
				,MLT.Leavetype AS LEAVE_CODE
				,ELB.LeaveType AS LeaveTypeId
				,ELB.Leavebalance AS LeaveCredited
				,ELB.AdvanceCredit AS AdvanceCredit
				,(ELB.Leavebalance + ELB.AdvanceCredit) AS TotalLeavesCredit
				,ISNULL(LT.Numberofdays, 0) AS NumberofdaysLeaveTaken
				,ISNULL(AC.AdvanceAvailed, 0) AS AdvanceAvailed
				,CASE 
					WHEN (ELB.Leavebalance + ELB.AdvanceCredit) - (ISNULL(LT.Numberofdays, 0) - ISNULL(ALA.ApprovedLeaveAvailed, 0) + ISNULL(AC.AdvanceAvailed, 0)) < 0
						THEN 0
					ELSE (ELB.Leavebalance + ELB.AdvanceCredit) - (ISNULL(LT.Numberofdays, 0) - ISNULL(ALA.ApprovedLeaveAvailed, 0) + ISNULL(AC.AdvanceAvailed, 0))
					END AS AvailableLeave
				,STUFF((
						SELECT ', ' + (E1.Firstname + ' ' + E1.Lastname)
						FROM EMPLOYEE E1
						WHERE E1.id = @empid
						FOR XML PATH('')
						), 1, 2, '') AS EmployeeName
				,STUFF((
						SELECT Employee_Id
						FROM Employee WITH (NOLOCK)
						WHERE id = @empid
						), 1, 0, '') AS Employee_Id
			FROM EmployeeLeaveBalance ELB WITH (NOLOCK)
			INNER JOIN MTS_LeaveType MLT WITH (NOLOCK) ON ELB.LeaveType = MLT.id
			INNER JOIN MTS_LeavePolicy MLP WITH (NOLOCK) ON MLT.Leavetype = MLP.LEAVE_CODE
			LEFT JOIN LeaveTaken LT ON MLP.LEAVE_CODE = LT.LeaveType
			LEFT JOIN AdvanceCredit AC ON MLT.id = AC.LeaveType
			LEFT JOIN ApprovedLeaveAvailed ALA ON MLT.id = ALA.LeaveType
			WHERE ELB.Employee_Id = @empid
				AND ELB.Year = @year
		END
		ELSE
		BEGIN
			WITH AdvanceCredit (
				AdvanceAvailed
				,LeaveType
				)
			AS (
				SELECT ISNULL(elb.AdvanceAvailed, 0) AS AdvanceAvailed
					,elb.LeaveType
				FROM EmployeeLeaveBalance elb WITH (NOLOCK)
				INNER JOIN MTS_LeaveType mlt WITH (NOLOCK) ON elb.LeaveType = mlt.id
				WHERE elb.Employee_Id = @empid
					AND elb.Year = @year
				)
				,LeaveTaken (
				Numberofdays
				,LeaveType
				)
			AS (
				SELECT SUM(el.Numberofdays) AS Numberofdays
					,mlt.LeaveType
				FROM Employee_leave el WITH (NOLOCK)
				INNER JOIN MTS_LeaveType mlt WITH (NOLOCK) ON el.LeaveType = mlt.id
				WHERE el.Employee_Id = @empid
					AND el.Approval IN (@APPRORED)
					AND (YEAR(el.FromDate)) = @year
					AND isLOP = 0
				GROUP BY mlt.LeaveType
				)
			SELECT ELB.id AS ID
				,MLP.LEAVE_TYPE
				,MLT.Leavetype AS LEAVE_CODE
				,ELB.LeaveType AS LeaveTypeId
				,ELB.Leavebalance AS LeaveCredited
				,ELB.AdvanceCredit AS AdvanceCredit
				,(ELB.Leavebalance + ELB.AdvanceCredit) AS TotalLeavesCredit
				,ISNULL(LT.Numberofdays, 0) AS NumberofdaysLeaveTaken
				,ISNULL(AC.AdvanceAvailed, 0) AS AdvanceAvailed
				,0 AS AvailableLeave
				,STUFF((
						SELECT ', ' + (E1.Firstname + ' ' + E1.Lastname)
						FROM EMPLOYEE E1
						WHERE E1.id = @empid
						FOR XML PATH('')
						), 1, 2, '') AS EmployeeName
				,STUFF((
						SELECT Employee_Id
						FROM Employee WITH (NOLOCK)
						WHERE id = @empid
						), 1, 0, '') AS Employee_Id
			FROM EmployeeLeaveBalance ELB WITH (NOLOCK)
			INNER JOIN MTS_LeaveType MLT WITH (NOLOCK) ON ELB.LeaveType = MLT.id
			INNER JOIN MTS_LeavePolicy MLP WITH (NOLOCK) ON MLT.Leavetype = MLP.LEAVE_CODE
			LEFT JOIN LeaveTaken LT ON MLP.LEAVE_CODE = LT.LeaveType
			LEFT JOIN AdvanceCredit AC ON MLT.id = AC.LeaveType
			WHERE ELB.Employee_Id = @empid
				AND ELB.Year = @year
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_ASSIGNED_MANAGERS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEE_ASSIGNED_MANAGERS] @EmployeeId BIGINT
AS
BEGIN
	SELECT E.Firstname + ' ' + E.Lastname AS EmployeeName
		,MA.USERID AS id
		,CASE 
			WHEN ERM.MANAGERID IS NOT NULL
				THEN 1
			ELSE 0
			END AS ACTIVE
	FROM MTS_AUTHORITY MA WITH (NOLOCK)
	LEFT JOIN EMPLOYEE E WITH (NOLOCK) ON MA.USERID = E.id
	LEFT JOIN Employee_Reporting_Managers ERM WITH (NOLOCK) ON ERM.MANAGERID = MA.USERID
		AND ERM.EMPLOYEEID = @EmployeeId
	INNER JOIN MTS_LOGIN MTLOG WITH (NOLOCK) ON MTLOG.USERID = E.id
		AND MTLOG.ACTIVE = 1
	WHERE (
			MA.ROLEID = 3
			OR MA.ROLEID = 1
			)
		AND E.id <> @EmployeeId
	GROUP BY E.FIRSTNAME
		,E.Lastname
		,MA.USERID
		,ERM.MANAGERID
	ORDER BY EmployeeName
END
GO

/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_ENTRY_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEE_ENTRY_DETAILS] @id VARCHAR(30)
	,@date DATE
	,@time BIGINT
AS
BEGIN
	SELECT attn.EmployeeCode AS EmployeeCode
		,(E.Firstname + ' ' + E.Lastname) AS EmployeeName
		,DEP.Department AS Department
		,D.Designation AS Designation
		,format(attn.InDateTime, 'MM/dd/yyyy') AS EntryDate
		,attn.InDeviceName
		,attn.OutDeviceName
		,format(attn.InDateTime, 'hh:mm tt') AS InDateTime
		,format(attn.OutDateTime, 'hh:mm tt') AS OutDateTime
		,attn.Duration / 60 AS HOURS
		,attn.Duration % 60 AS MINUTES
		,RIGHT('0' + CAST((attn.Duration / 60) AS VARCHAR(2)), 2) + 'h ' + RIGHT('0' + CAST((attn.Duration % 60) AS VARCHAR(2)), 2) + 'm' AS WorkingHours
		,attn.StatusCode
		,attn.PunchRecords
		,attn.Duration AS DurationInMins
		,format(attn.InDateTime, 'dddd') AS day
	FROM MTS_ATTENDANCE attn WITH (NOLOCK)
	LEFT JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = convert(VARCHAR(10), attn.EmployeeCode)
	LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
	LEFT JOIN MTS_Designation D WITH (NOLOCK) ON D.id = E.Designation
	WHERE attn.EmployeeCode = @id
		AND (
			(
				(@time <> 0)
				AND (attn.Duration / 60) < @time
				)
			OR @time = 0
			)
		AND (
			(
				E.DepartmentId <> 2
				AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @date), 0) AS DATE)
					AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @date) + 1, - 1) AS DATE)
				AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
				AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
				AND CAST(InDateTime AS DATE) NOT IN (
					SELECT CAST(DateOfHoliday AS DATE)
					FROM HolidaysList WITH (NOLOCK)
					)
				)
			OR (
				E.DepartmentId = 2
				AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @date), 0) AS DATE)
					AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @date) + 1, - 1) AS DATE)
				)
			)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_ID]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEE_ID] (
	@empid VARCHAR(50)
	,@empname VARCHAR(50)
	)
AS
BEGIN
	SELECT CASE 
			WHEN EXISTS (
					SELECT Employee_Id
					FROM Employee WITH (NOLOCK)
					WHERE Employee_Id = @empid
					)
				THEN cast(1 AS BIT)
			ELSE cast(0 AS BIT)
			END

	SELECT Employee_Id
		,CONCAT (
			Firstname
			,' '
			,Lastname
			) AS Employee_Name
	FROM Employee WITH (NOLOCK)
	WHERE Employee_Id = @empid
		AND CONCAT (
			Firstname
			,' '
			,Lastname
			) = @empname
END
GO

/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_IMAGE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEE_IMAGE] (@empid BIGINT)
AS
BEGIN
	SELECT IMAGE
	FROM EmployeeImage WITH (NOLOCK)
	WHERE Employee_Id = @empid
END
GO

/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_LEAVE_DETAILS_BETWEEN_YEAR]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEE_LEAVE_DETAILS_BETWEEN_YEAR] @APPLY_LEAVE_TYPE BIGINT
	,@FROM_DATE DATE
	,@TO_DATE DATE
	,@Year BIGINT
AS
BEGIN
	SELECT DateOfHoliday
	FROM HolidaysList WITH (NOLOCK)
	WHERE YearOfHoliday = @Year
		AND DateOfHoliday >= @FROM_DATE
		AND DateOfHoliday <= @TO_DATE
	GROUP BY DateOfHoliday;
END
GO

/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_LEAVEBALANCE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[READ_EMPLOYEE_LEAVEBALANCE] (
	@empid VARCHAR(255)
	,@departmentid BIGINT
	)
AS
BEGIN
	IF EXISTS (
			SELECT Employee_Id
				,Gender
			FROM Employee WITH (NOLOCK)
			WHERE gender = 0
				AND id = @empid
			)
	BEGIN
		SELECT emp.Employee_Id
			,emp.Firstname + ' ' + emp.Lastname Fullname
			,l.Leavetype
			,l.id AS LeavetypeId
			,elb.Leavebalance
		FROM EmployeeLeaveBalance elb WITH (NOLOCK)
		INNER JOIN Employee emp WITH (NOLOCK) ON elb.Employee_Id = @empid
		INNER JOIN Mts_LeaveType l WITH (NOLOCK) ON elb.LeaveType = l.id
		WHERE emp.id = @empid
			AND l.DepartmentId = @departmentid
		
		UNION ALL
		
		SELECT e.Employee_Id
			,e.Firstname + ' ' + e.Lastname Fullname
			,m.LeaveType
			,Numberofdays AS Leavebalance
			,m.id AS LeavetypeId
		FROM EmployeeLeaveBalance elb WITH (NOLOCK)
		RIGHT JOIN Mts_Leavetype m WITH (NOLOCK) ON m.id = elb.LeaveType
			AND Employee_Id = @empid
		INNER JOIN Employee e WITH (NOLOCK) ON e.id = @empid
		WHERE isnull(m.id, 0) <> isnull(elb.LeaveType, 0)
			AND m.DepartmentId = @departmentid
	END

	IF EXISTS (
			SELECT Employee_Id
				,Gender
			FROM Employee WITH (NOLOCK)
			WHERE gender = 1
				AND id = @empid
			)
	BEGIN
		SELECT emp.Employee_Id
			,emp.Firstname + ' ' + emp.Lastname Fullname
			,l.Leavetype
			,elb.Leavebalance
			,l.id AS LeavetypeId
		FROM EmployeeLeaveBalance elb WITH (NOLOCK)
		INNER JOIN Employee emp WITH (NOLOCK) ON elb.Employee_Id = @empid
		INNER JOIN Mts_LeaveType l WITH (NOLOCK) ON elb.LeaveType = l.id
		WHERE emp.id = @empid
			AND l.DepartmentId = @departmentid
		
		UNION ALL
		
		SELECT e.Employee_Id
			,e.Firstname + ' ' + e.Lastname Fullname
			,m.LeaveType
			,Numberofdays AS Leavebalance
			,m.id AS LeavetypeId
		FROM EmployeeLeaveBalance elb WITH (NOLOCK)
		RIGHT JOIN Mts_Leavetype m WITH (NOLOCK) ON m.id = elb.LeaveType
			AND Employee_Id = @empid
		INNER JOIN Employee e WITH (NOLOCK) ON e.id = @empid
		WHERE isnull(m.id, 0) <> isnull(elb.LeaveType, 0)
			AND m.DepartmentId = @departmentid
	END
END
GO

/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_LEAVES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEE_LEAVES] (
	@empid BIGINT
	,@approved_only BIT
	,@year BIGINT
	)
AS
BEGIN
	DECLARE @APPRORED INT = 2
		,@PENDING INT = 1;

	IF (@approved_only = 1)
	BEGIN
		IF @year > 2019
		BEGIN
			WITH AdvanceCredit (
				AdvanceAvailed
				,LeaveType
				)
			AS (
				SELECT ISNULL(elb.AdvanceAvailed, 0) AS AdvanceAvailed
					,elb.LeaveType
				FROM EmployeeLeaveBalance elb WITH (NOLOCK)
				INNER JOIN MTS_LeaveType mlt WITH (NOLOCK) ON elb.LeaveType = mlt.id
				WHERE elb.Employee_Id = @empid
					AND elb.Year = @year
				)
				,LeaveTaken (
				Numberofdays
				,LeaveType
				)
			AS (
				SELECT SUM(el.Numberofdays) AS Numberofdays
					,mlt.LeaveType
				FROM EMPLOYEE_LEAVE_DETAILS el WITH (NOLOCK)
				INNER JOIN MTS_LeaveType mlt WITH (NOLOCK) ON el.LeaveType = mlt.id
				WHERE el.Employee_Id = @empid
					AND el.Approval IN (@APPRORED)
					AND (YEAR(el.FromDate)) = @year
					AND isLOP = 0
				GROUP BY mlt.LeaveType
				)
				,ApprovedLeaveAvailed (
				ApprovedLeaveAvailed
				,LeaveType
				)
			AS (
				SELECT COUNT(AdvanceCredit)
					,LeaveType
				FROM EMPLOYEE_LEAVE_DETAILS WITH (NOLOCK)
				WHERE Employee_Id = @empid
					AND year(FromDate) = @year
					AND Approval IN (@APPRORED)
					AND isLOP = 0
					AND AdvanceCredit = 1
				GROUP BY LeaveType
				)
			SELECT ELB.id AS ID
				,MLP.LEAVE_TYPE
				,MLT.Leavetype AS LEAVE_CODE
				,ELB.LeaveType AS LeaveTypeId
				,ELB.Leavebalance AS LeaveCredited
				,ELB.AdvanceCredit AS AdvanceCredit
				,(ELB.Leavebalance + ELB.AdvanceCredit) AS TotalLeavesCredit
				,ISNULL(LT.Numberofdays, 0) AS NumberofdaysLeaveTaken
				,ISNULL(AC.AdvanceAvailed, 0) AS AdvanceAvailed
				,CASE 
					WHEN (ELB.Leavebalance + ELB.AdvanceCredit) - (ISNULL(LT.Numberofdays, 0) - ISNULL(ALA.ApprovedLeaveAvailed, 0) + ISNULL(AC.AdvanceAvailed, 0)) < 0
						THEN 0
					ELSE (ELB.Leavebalance + ELB.AdvanceCredit) - (ISNULL(LT.Numberofdays, 0) - ISNULL(ALA.ApprovedLeaveAvailed, 0) + ISNULL(AC.AdvanceAvailed, 0))
					END AS AvailableLeave
				,STUFF((
						SELECT ', ' + (E1.Firstname + ' ' + E1.Lastname)
						FROM EMPLOYEE E1
						WHERE E1.id = @empid
						FOR XML PATH('')
						), 1, 2, '') AS EmployeeName
				,STUFF((
						SELECT Employee_Id
						FROM Employee WITH (NOLOCK)
						WHERE id = @empid
						), 1, 0, '') AS Employee_Id
			FROM EmployeeLeaveBalance ELB WITH (NOLOCK)
			INNER JOIN MTS_LeaveType MLT WITH (NOLOCK) ON ELB.LeaveType = MLT.id
			INNER JOIN MTS_LeavePolicy MLP WITH (NOLOCK) ON MLT.Leavetype = MLP.LEAVE_CODE
			LEFT JOIN LeaveTaken LT ON MLP.LEAVE_CODE = LT.LeaveType
			LEFT JOIN AdvanceCredit AC ON MLT.id = AC.LeaveType
			LEFT JOIN ApprovedLeaveAvailed ALA ON MLT.id = ALA.LeaveType
			WHERE ELB.Employee_Id = @empid
				AND ELB.Year = @year
		END
		ELSE
		BEGIN
			WITH AdvanceCredit (
				AdvanceAvailed
				,LeaveType
				)
			AS (
				SELECT ISNULL(elb.AdvanceAvailed, 0) AS AdvanceAvailed
					,elb.LeaveType
				FROM EmployeeLeaveBalance elb WITH (NOLOCK)
				INNER JOIN MTS_LeaveType mlt WITH (NOLOCK) ON elb.LeaveType = mlt.id
				WHERE elb.Employee_Id = @empid
					AND elb.Year = @year
				)
				,LeaveTaken (
				Numberofdays
				,LeaveType
				)
			AS (
				SELECT SUM(el.Numberofdays) AS Numberofdays
					,mlt.LeaveType
				FROM Employee_leave el WITH (NOLOCK)
				INNER JOIN MTS_LeaveType mlt WITH (NOLOCK) ON el.LeaveType = mlt.id
				WHERE el.Employee_Id = @empid
					AND el.Approval IN (@APPRORED)
					AND (YEAR(el.FromDate)) = @year
					AND isLOP = 0
				GROUP BY mlt.LeaveType
				)
			SELECT ELB.id AS ID
				,MLP.LEAVE_TYPE
				,MLT.Leavetype AS LEAVE_CODE
				,ELB.LeaveType AS LeaveTypeId
				,ELB.Leavebalance AS LeaveCredited
				,ELB.AdvanceCredit AS AdvanceCredit
				,(ELB.Leavebalance + ELB.AdvanceCredit) AS TotalLeavesCredit
				,ISNULL(LT.Numberofdays, 0) AS NumberofdaysLeaveTaken
				,ISNULL(AC.AdvanceAvailed, 0) AS AdvanceAvailed
				,CASE 
					WHEN (ELB.Leavebalance + ELB.AdvanceCredit) - (ISNULL(LT.Numberofdays, 0) + ISNULL(AC.AdvanceAvailed, 0)) < 0
						THEN 0
					ELSE (ELB.Leavebalance + ELB.AdvanceCredit) - (ISNULL(LT.Numberofdays, 0) + ISNULL(AC.AdvanceAvailed, 0))
					END AS AvailableLeave
				,STUFF((
						SELECT ', ' + (E1.Firstname + ' ' + E1.Lastname)
						FROM EMPLOYEE E1
						WHERE E1.id = @empid
						FOR XML PATH('')
						), 1, 2, '') AS EmployeeName
				,STUFF((
						SELECT Employee_Id
						FROM Employee WITH (NOLOCK)
						WHERE id = @empid
						), 1, 0, '') AS Employee_Id
			FROM EmployeeLeaveBalance ELB WITH (NOLOCK)
			INNER JOIN MTS_LeaveType MLT WITH (NOLOCK) ON ELB.LeaveType = MLT.id
			INNER JOIN MTS_LeavePolicy MLP WITH (NOLOCK) ON MLT.Leavetype = MLP.LEAVE_CODE
			LEFT JOIN LeaveTaken LT ON MLP.LEAVE_CODE = LT.LeaveType
			LEFT JOIN AdvanceCredit AC ON MLT.id = AC.LeaveType
			WHERE ELB.Employee_Id = @empid
				AND ELB.Year = @year
		END
	END
	ELSE
	BEGIN
		IF @year > 2019
		BEGIN
			WITH AdvanceCredit (
				AdvanceAvailed
				,LeaveType
				)
			AS (
				SELECT ISNULL(elb.AdvanceAvailed, 0) AS AdvanceAvailed
					,elb.LeaveType
				FROM EmployeeLeaveBalance elb WITH (NOLOCK)
				INNER JOIN MTS_LeaveType mlt WITH (NOLOCK) ON elb.LeaveType = mlt.id
				WHERE elb.Employee_Id = @empid
					AND elb.Year = @year
				)
				,LeaveTaken (
				Numberofdays
				,LeaveType
				)
			AS (
				SELECT SUM(el.Numberofdays) AS Numberofdays
					,mlt.LeaveType
				FROM EMPLOYEE_LEAVE_DETAILS el WITH (NOLOCK)
				INNER JOIN MTS_LeaveType mlt WITH (NOLOCK) ON el.LeaveType = mlt.id
				WHERE el.Employee_Id = @empid
					AND el.Approval IN (
						@PENDING
						,@APPRORED
						)
					AND (YEAR(el.FromDate)) = @year
					AND isLOP = 0
				GROUP BY mlt.LeaveType
				)
				,ApprovedLeaveAvailed (
				ApprovedLeaveAvailed
				,LeaveType
				)
			AS (
				SELECT COUNT(AdvanceCredit)
					,LeaveType
				FROM EMPLOYEE_LEAVE_DETAILS WITH (NOLOCK)
				WHERE Employee_Id = @empid
					AND year(FromDate) = @year
					AND Approval IN (@APPRORED)
					AND isLOP = 0
					AND AdvanceCredit = 1
				GROUP BY LeaveType
				)
			SELECT ELB.id AS ID
				,MLP.LEAVE_TYPE
				,MLT.Leavetype AS LEAVE_CODE
				,ELB.LeaveType AS LeaveTypeId
				,ELB.Leavebalance AS LeaveCredited
				,ELB.AdvanceCredit AS AdvanceCredit
				,(ELB.Leavebalance + ELB.AdvanceCredit) AS TotalLeavesCredit
				,ISNULL(LT.Numberofdays, 0) AS NumberofdaysLeaveTaken
				,ISNULL(AC.AdvanceAvailed, 0) AS AdvanceAvailed
				,CASE 
					WHEN (ELB.Leavebalance + ELB.AdvanceCredit) - (ISNULL(LT.Numberofdays, 0) - ISNULL(ALA.ApprovedLeaveAvailed, 0) + ISNULL(AC.AdvanceAvailed, 0)) < 0
						THEN 0
					ELSE (ELB.Leavebalance + ELB.AdvanceCredit) - (ISNULL(LT.Numberofdays, 0) - ISNULL(ALA.ApprovedLeaveAvailed, 0) + ISNULL(AC.AdvanceAvailed, 0))
					END AS AvailableLeave
				,STUFF((
						SELECT ', ' + (E1.Firstname + ' ' + E1.Lastname)
						FROM EMPLOYEE E1
						WHERE E1.id = @empid
						FOR XML PATH('')
						), 1, 2, '') AS EmployeeName
				,STUFF((
						SELECT Employee_Id
						FROM Employee WITH (NOLOCK)
						WHERE id = @empid
						), 1, 0, '') AS Employee_Id
			FROM EmployeeLeaveBalance ELB WITH (NOLOCK)
			INNER JOIN MTS_LeaveType MLT WITH (NOLOCK) ON ELB.LeaveType = MLT.id
			INNER JOIN MTS_LeavePolicy MLP WITH (NOLOCK) ON MLT.Leavetype = MLP.LEAVE_CODE
			LEFT JOIN LeaveTaken LT ON MLP.LEAVE_CODE = LT.LeaveType
			LEFT JOIN AdvanceCredit AC ON MLT.id = AC.LeaveType
			LEFT JOIN ApprovedLeaveAvailed ALA ON MLT.id = ALA.LeaveType
			WHERE ELB.Employee_Id = @empid
				AND ELB.Year = @year
		END
		ELSE
		BEGIN
			WITH AdvanceCredit (
				AdvanceAvailed
				,LeaveType
				)
			AS (
				SELECT ISNULL(elb.AdvanceAvailed, 0) AS AdvanceAvailed
					,elb.LeaveType
				FROM EmployeeLeaveBalance elb WITH (NOLOCK)
				INNER JOIN MTS_LeaveType mlt WITH (NOLOCK) ON elb.LeaveType = mlt.id
				WHERE elb.Employee_Id = @empid
					AND elb.Year = @year
				)
				,LeaveTaken (
				Numberofdays
				,LeaveType
				)
			AS (
				SELECT SUM(el.Numberofdays) AS Numberofdays
					,mlt.LeaveType
				FROM Employee_leave el WITH (NOLOCK)
				INNER JOIN MTS_LeaveType mlt WITH (NOLOCK) ON el.LeaveType = mlt.id
				WHERE el.Employee_Id = @empid
					AND el.Approval IN (
						@PENDING
						,@APPRORED
						)
					AND (YEAR(el.FromDate)) = @year
					AND isLOP = 0
				GROUP BY mlt.LeaveType
				)
			SELECT ELB.id AS ID
				,MLP.LEAVE_TYPE
				,MLT.Leavetype AS LEAVE_CODE
				,ELB.LeaveType AS LeaveTypeId
				,ELB.Leavebalance AS LeaveCredited
				,ELB.AdvanceCredit AS AdvanceCredit
				,(ELB.Leavebalance + ELB.AdvanceCredit) AS TotalLeavesCredit
				,ISNULL(LT.Numberofdays, 0) AS NumberofdaysLeaveTaken
				,ISNULL(AC.AdvanceAvailed, 0) AS AdvanceAvailed
				,CASE 
					WHEN (ELB.Leavebalance + ELB.AdvanceCredit) - (ISNULL(LT.Numberofdays, 0) + ISNULL(AC.AdvanceAvailed, 0)) < 0
						THEN 0
					ELSE (ELB.Leavebalance + ELB.AdvanceCredit) - (ISNULL(LT.Numberofdays, 0) + ISNULL(AC.AdvanceAvailed, 0))
					END AS AvailableLeave
				,STUFF((
						SELECT ', ' + (E1.Firstname + ' ' + E1.Lastname)
						FROM EMPLOYEE E1
						WHERE E1.id = @empid
						FOR XML PATH('')
						), 1, 2, '') AS EmployeeName
				,STUFF((
						SELECT Employee_Id
						FROM Employee WITH (NOLOCK)
						WHERE id = @empid
						), 1, 0, '') AS Employee_Id
			FROM EmployeeLeaveBalance ELB WITH (NOLOCK)
			INNER JOIN MTS_LeaveType MLT WITH (NOLOCK) ON ELB.LeaveType = MLT.id
			INNER JOIN MTS_LeavePolicy MLP WITH (NOLOCK) ON MLT.Leavetype = MLP.LEAVE_CODE
			LEFT JOIN LeaveTaken LT ON MLP.LEAVE_CODE = LT.LeaveType
			LEFT JOIN AdvanceCredit AC ON MLT.id = AC.LeaveType
			WHERE ELB.Employee_Id = @empid
				AND ELB.Year = @year
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_LEAVES_FOR_EMP_LEAVETYPE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEE_LEAVES_FOR_EMP_LEAVETYPE] (
	@empid BIGINT
	,@leavetype BIGINT
	,@year BIGINT
	)
AS
BEGIN
	DECLARE @REJECTED INT = 3
		,@CANCELED INT = 4
	DECLARE @NumberLeaveTaken DECIMAL(10, 1)
		,@advanceAvailed DECIMAL(10, 1)
		,@leavebalance DECIMAL(10, 1)
		,@NumberLeavePending DECIMAL(10, 1)
		,@NumberLeaveApprored DECIMAL(10, 1)
		,@ApprovedLeaveAvailed BIGINT

	IF (@year < 2020)
	BEGIN
		IF EXISTS (
				SELECT *
				FROM Employee_Leave WITH (NOLOCK)
				WHERE Employee_Id = @empid
					AND Approval NOT IN (
						@REJECTED
						,@CANCELED
						)
					AND LeaveType = @leavetype
					AND year(FromDate) = @year
				)
		BEGIN
			SELECT @NumberLeaveTaken = isnull(Sum(Numberofdays), 0)
			FROM Employee_Leave WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND year(FromDate) = @year
				AND Approval NOT IN (
					3
					,4
					)
				AND LeaveType = @leavetype
				AND isLOP = 0

			SELECT @NumberLeaveApprored = isnull(Sum(Numberofdays), 0)
			FROM Employee_Leave WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND year(FromDate) = @year
				AND Approval IN (2)
				AND LeaveType = @leavetype
				AND isLOP = 0

			SELECT @NumberLeavePending = isnull(Sum(Numberofdays), 0)
			FROM Employee_Leave WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND year(FromDate) = @year
				AND Approval IN (1)
				AND LeaveType = @leavetype
				AND isLOP = 0

			SELECT @advanceAvailed = AdvanceAvailed
			FROM EmployeeLeaveBalance WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND LeaveType = @leavetype
				AND year = @year

			SET @ApprovedLeaveAvailed = 0;

			IF EXISTS (
					SELECT Leavebalance + AdvanceCredit
					FROM EmployeeLeaveBalance WITH (NOLOCK)
					WHERE Employee_Id = @empid
						AND LeaveType = @leavetype
						AND year = @year
					)
			BEGIN
				SELECT @leavebalance = Leavebalance + AdvanceCredit
				FROM EmployeeLeaveBalance WITH (NOLOCK)
				WHERE Employee_Id = @empid
					AND LeaveType = @leavetype
					AND year = @year
			END
			ELSE
			BEGIN
				SET @leavebalance = 0
			END

			SELECT el.Approval
				,ISNULL(@NumberLeaveTaken, 0) AS LeaveCountTaken
				,ISNULL((@NumberLeaveApprored - @ApprovedLeaveAvailed) + @advanceAvailed, 0) AS ApproredLeaveCount
				,ISNULL(@NumberLeavePending, 0) AS PendingLeaveCount
				,ISNULL(@leavebalance, 0) AS AvailableLeave
				,STUFF((
						SELECT HolidayAsLeave
						FROM MTS_LeaveType
						WHERE id = @leavetype
						), 1, 0, '') AS HolidayAsLeave
			FROM Employee_leave AS el WITH (NOLOCK)
			INNER JOIN EmployeeLeaveBalance elb WITH (NOLOCK) ON el.Employee_Id = elb.Employee_Id
				AND el.LeaveType = elb.LeaveType
			WHERE el.Employee_Id = @empid
				AND Approval NOT IN (
					@REJECTED
					,@CANCELED
					)
			GROUP BY el.Approval
		END
		ELSE
		BEGIN
			DECLARE @Creditbalance DECIMAL(10, 1)
				,@PendingLeaves DECIMAL(10, 1) = 0
				,@advanceAavailed DECIMAL(10, 1) = 0

			SELECT @Creditbalance = SUM(ELB.Leavebalance + ELB.AdvanceCredit)
			FROM EmployeeLeaveBalance ELB WITH (NOLOCK)
			WHERE ELB.Employee_Id = @empid
				AND ELB.LeaveType = @leavetype
				AND ELB.year = @year

			SELECT @PendingLeaves = isnull(Sum(Numberofdays), 0)
			FROM Employee_Leave WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND year(FromDate) = @year
				AND Approval IN (1)
				AND LeaveType = @leavetype
				AND isLOP = 0

			SELECT @advanceAavailed = AdvanceAvailed
			FROM EmployeeLeaveBalance WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND LeaveType = @leavetype
				AND year = @year

			SELECT 0 AS Approval
				,0 AS LeaveCountTaken
				,@advanceAavailed AS ApproredLeaveCount
				,@PendingLeaves AS PendingLeaveCount
				,@Creditbalance AS AvailableLeave
				,STUFF((
						SELECT HolidayAsLeave
						FROM MTS_LeaveType
						WHERE id = @leavetype
						), 1, 0, '') AS HolidayAsLeave
			FROM EmployeeLeaveBalance ELB WITH (NOLOCK)
			WHERE ELB.Employee_Id = @empid
				AND ELB.LeaveType = @leavetype
				AND ELB.year = @year
		END
	END
	ELSE
	BEGIN
		IF EXISTS (
				SELECT *
				FROM EMPLOYEE_LEAVE_DETAILS WITH (NOLOCK)
				WHERE Employee_Id = @empid
					AND Approval NOT IN (
						@REJECTED
						,@CANCELED
						)
					AND LeaveType = @leavetype
					AND year(FromDate) = @year
				)
		BEGIN
			SELECT @NumberLeaveTaken = isnull(Sum(Numberofdays), 0)
			FROM EMPLOYEE_LEAVE_DETAILS WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND year(FromDate) = @year
				AND Approval NOT IN (
					3
					,4
					)
				AND LeaveType = @leavetype
				AND isLOP = 0

			SELECT @NumberLeaveApprored = isnull(Sum(Numberofdays), 0)
			FROM EMPLOYEE_LEAVE_DETAILS WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND year(FromDate) = @year
				AND Approval IN (2)
				AND LeaveType = @leavetype
				AND isLOP = 0

			SELECT @NumberLeavePending = isnull(Sum(Numberofdays), 0)
			FROM EMPLOYEE_LEAVE_DETAILS WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND year(FromDate) = @year
				AND Approval IN (1)
				AND LeaveType = @leavetype
				AND isLOP = 0

			SELECT @advanceAvailed = AdvanceAvailed
			FROM EmployeeLeaveBalance WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND LeaveType = @leavetype
				AND year = @year

			SELECT @ApprovedLeaveAvailed = COUNT(AdvanceCredit)
			FROM EMPLOYEE_LEAVE_DETAILS WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND year(FromDate) = @year
				AND Approval IN (2)
				AND LeaveType = @leavetype
				AND isLOP = 0 AND AdvanceCredit=1

			IF EXISTS (
					SELECT Leavebalance + AdvanceCredit
					FROM EmployeeLeaveBalance WITH (NOLOCK)
					WHERE Employee_Id = @empid
						AND LeaveType = @leavetype
						AND year = @year
					)
			BEGIN
				SELECT @leavebalance = Leavebalance + AdvanceCredit
				FROM EmployeeLeaveBalance WITH (NOLOCK)
				WHERE Employee_Id = @empid
					AND LeaveType = @leavetype
					AND year = @year
			END
			ELSE
			BEGIN
				SET @leavebalance = 0
			END

			SELECT el.Approval
				,ISNULL(@NumberLeaveTaken, 0) AS LeaveCountTaken
				,ISNULL((@NumberLeaveApprored - @ApprovedLeaveAvailed) + @advanceAvailed, 0) AS ApproredLeaveCount
				,ISNULL(@NumberLeavePending, 0) AS PendingLeaveCount
				,ISNULL(@leavebalance, 0) AS AvailableLeave
				,STUFF((
						SELECT HolidayAsLeave
						FROM MTS_LeaveType
						WHERE id = @leavetype
						), 1, 0, '') AS HolidayAsLeave
			FROM Employee_leave AS el WITH (NOLOCK)
			INNER JOIN EmployeeLeaveBalance elb WITH (NOLOCK) ON el.Employee_Id = elb.Employee_Id
				AND el.LeaveType = elb.LeaveType
			WHERE el.Employee_Id = @empid
				AND Approval NOT IN (
					@REJECTED
					,@CANCELED
					)
			GROUP BY el.Approval
		END
		ELSE
		BEGIN
			DECLARE @Credit_balance DECIMAL(10, 1)
				,@Pending_Leaves DECIMAL(10, 1) = 0
				,@advance_Aavailed DECIMAL(10, 1) = 0

			SELECT @Credit_balance = SUM(ELB.Leavebalance + ELB.AdvanceCredit)
			FROM EmployeeLeaveBalance ELB WITH (NOLOCK)
			WHERE ELB.Employee_Id = @empid
				AND ELB.LeaveType = @leavetype
				AND ELB.year = @year

			SELECT @Pending_Leaves = isnull(Sum(Numberofdays), 0)
			FROM EMPLOYEE_LEAVE_DETAILS WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND year(FromDate) = @year
				AND Approval IN (1)
				AND LeaveType = @leavetype
				AND isLOP = 0

			SELECT @advance_Aavailed = AdvanceAvailed
			FROM EmployeeLeaveBalance WITH (NOLOCK)
			WHERE Employee_Id = @empid
				AND LeaveType = @leavetype
				AND year = @year

			SELECT 0 AS Approval
				,0 AS LeaveCountTaken
				,@advance_Aavailed AS ApproredLeaveCount
				,@Pending_Leaves AS PendingLeaveCount
				,@Credit_balance AS AvailableLeave
				,STUFF((
						SELECT HolidayAsLeave
						FROM MTS_LeaveType
						WHERE id = @leavetype
						), 1, 0, '') AS HolidayAsLeave
			FROM EmployeeLeaveBalance ELB WITH (NOLOCK)
			WHERE ELB.Employee_Id = @empid
				AND ELB.LeaveType = @leavetype
				AND ELB.year = @year
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_MONTHLY_LOP_DAYS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEE_MONTHLY_LOP_DAYS] @EMPLOYEE_ID BIGINT
	,@MONTH VARCHAR(2)
	,@YEAR VARCHAR(4)
AS
BEGIN
	SET NOCOUNT ON;

	WITH EMP_LOP_DETAILS
	AS (
		SELECT Id
			,Employee_Id
			,LeaveType
			,FromDate
			,ToDate
			,Reason
			,Numberofdays
			,1 AS AUTO_LOP
		FROM EMPLOYEE_LEAVE_DETAILS WITH (NOLOCK)
		WHERE Employee_Id = @EMPLOYEE_ID
			AND DATEPART(MONTH, ApprovedDate) = @MONTH
			AND DATEPART(YEAR, ApprovedDate) = @YEAR
			AND isLOP = 1
			AND FromDate NOT IN (
				SELECT LEAVE_FROM
				FROM MTS_PAYROLL_EMPLOYEE_LOP WITH (NOLOCK)
				WHERE EMP_ID = @EMPLOYEE_ID
					AND AUTO_LOP = 1
				)
		
		UNION ALL
		
		SELECT ID AS Id
			,EMP_ID AS Employee_Id
			,NULL AS LeaveType
			,LEAVE_FROM AS FromDate
			,LEAVE_TO AS ToDate
			,REASON AS Reason
			,LOP_DAYS AS Numberofdays
			,AUTO_LOP
		FROM MTS_PAYROLL_EMPLOYEE_LOP WITH (NOLOCK)
		WHERE EMP_ID = @EMPLOYEE_ID
			AND DATEPART(MONTH, PAYROLL_MONTH) = @MONTH
			AND DATEPART(YEAR, PAYROLL_MONTH) = @YEAR
		)
	SELECT *
	FROM EMP_LOP_DETAILS
END
GO

/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEEALLLEAVEBALANCE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEEALLLEAVEBALANCE] (@empid BIGINT)
AS
BEGIN
	DECLARE @GENDER BIGINT
		,@MARITALSTATUS BIGINT

	SELECT @GENDER = gender
		,@MARITALSTATUS = maritalstatus
	FROM Employee
	WHERE id = @empid

	IF @GENDER = 1
	BEGIN
		IF @MARITALSTATUS = 1
		BEGIN
			SELECT E.Firstname + ' ' + E.Lastname AS Fullname
				,E.Employee_Id
				,Lt.id AS LeaveTypeID
				,LT.Leavetype
				,ELB.Leavebalance AS Leavebalance
			FROM EmployeeLeaveBalance ELB WITH (NOLOCK)
			INNER JOIN MTS_LeaveType LT WITH (NOLOCK) ON LT.id = ELB.LeaveType
			INNER JOIN Employee E WITH (NOLOCK) ON E.id = ELB.Employee_Id
			WHERE ELB.Employee_Id = @empid
				AND UPPER(LT.Leavetype) <> 'MATERNITY'
				AND UPPER(LT.Leavetype) <> 'PATERNITY'
		END
		ELSE IF @MARITALSTATUS <> 1
		BEGIN
			SELECT E.Firstname + ' ' + E.Lastname AS Fullname
				,E.Employee_Id
				,Lt.id AS LeaveTypeID
				,LT.Leavetype
				,ELB.Leavebalance AS Leavebalance
			FROM EmployeeLeaveBalance ELB WITH (NOLOCK)
			INNER JOIN MTS_LeaveType LT WITH (NOLOCK) ON LT.id = ELB.LeaveType
			INNER JOIN Employee E WITH (NOLOCK) ON E.id = ELB.Employee_Id
			WHERE ELB.Employee_Id = @empid
				AND UPPER(LT.Leavetype) <> 'PATERNITY'
		END
	END
	ELSE
	BEGIN
		IF @MARITALSTATUS = 1
		BEGIN
			SELECT E.Firstname + ' ' + E.Lastname AS Fullname
				,E.Employee_Id
				,Lt.id AS LeaveTypeID
				,LT.Leavetype
				,ELB.Leavebalance AS Leavebalance
			FROM EmployeeLeaveBalance ELB WITH (NOLOCK)
			INNER JOIN MTS_LeaveType LT WITH (NOLOCK) ON LT.id = ELB.LeaveType
			INNER JOIN Employee E WITH (NOLOCK) ON E.id = ELB.Employee_Id
			WHERE ELB.Employee_Id = @empid
				AND UPPER(LT.Leavetype) <> 'MATERNITY'
				AND UPPER(LT.Leavetype) <> 'PATERNITY'
		END
		ELSE
		BEGIN
			IF @MARITALSTATUS <> 1
				SELECT E.Firstname + ' ' + E.Lastname AS Fullname
					,E.Employee_Id
					,Lt.id AS LeaveTypeID
					,LT.Leavetype
					,ELB.Leavebalance AS Leavebalance
				FROM EmployeeLeaveBalance ELB WITH (NOLOCK)
				INNER JOIN MTS_LeaveType LT WITH (NOLOCK) ON LT.id = ELB.LeaveType
				INNER JOIN Employee E WITH (NOLOCK) ON E.id = ELB.Employee_Id
				WHERE ELB.Employee_Id = @empid
					AND UPPER(LT.Leavetype) <> 'MATERNITY'
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEEDETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEEDETAILS]
AS
BEGIN
	SELECT E.id
		,E.Employee_Id
		,E.Firstname
		,E.Lastname
		,E.Gender
		,CASE E.Gender
			WHEN 0
				THEN 'Male'
			WHEN 1
				THEN 'Female'
			ELSE 'transgender'
			END AS Gender_Name
		,E.Fathername
		,CAST(Convert(VARCHAR(255), E.Dateofbirth, 110) AS VARCHAR(255)) AS 'Dateofbirth'
		,E.DepartmentId
		,Dt.Department
		,E.PF_AccountNumber
		,E.Aadhar
		,E.PF_UAN
		,E.Pancard
		,CAST(Convert(VARCHAR(255), E.Dateofjoin, 110) AS VARCHAR(255)) AS 'Dateofjoin'
		,CAST(Convert(VARCHAR(255), MTLOG.ResignedOn, 110) AS VARCHAR(255)) AS 'ResignedOn'
		,CASE 
			WHEN MTLOG.Active = 1
				THEN convert(VARCHAR(3), DATEDIFF(MONTH, E.Dateofjoin, GETDATE()) / 12) + ' y ' + convert(VARCHAR(2), DATEDIFF(MONTH, E.Dateofjoin, GETDATE()) % 12) + ' m'
			WHEN MTLOG.Active = 0
				THEN convert(VARCHAR(3), DATEDIFF(MONTH, E.Dateofjoin, MTLOG.ResignedOn) / 12) + ' y ' + convert(VARCHAR(2), DATEDIFF(MONTH, E.Dateofjoin, MTLOG.ResignedOn) % 12) + ' m'
			END AS Experience
		,D.Designation
		,MA.ROLEID
		,MTLOG.Active
		,STUFF((
				SELECT ', ' + ml.Languagename
				FROM EmployeeDetails AS Em
				INNER JOIN MTS_Languages ml ON Employee_Id = E.id
				WHERE ml.id IN (
						SELECT cast(dropdowndata AS BIGINT)
						FROM function_string_to_table(Em.Languagename, ',') AS Languages
						)
				FOR XML PATH('')
				), 1, 1, '') AS Languages
		,STUFF((
				SELECT DISTINCT ', ' + ms.Skills
				FROM Employee_Skills AS Es
				INNER JOIN MTS_Skills ms ON Es.Employee_Id = E.id
				WHERE ms.id IN (
						SELECT cast(dropdowndata AS BIGINT)
						FROM function_string_to_table(Es.Skill, ',') AS Skills
						)
				FOR XML PATH('')
				), 1, 1, '') AS Skills
		,EBD.Bankname
		,STUFF((
				SELECT ', ' + (E1.Firstname + ' ' + E1.Lastname)
				FROM Employee_Reporting_Managers TA
				LEFT JOIN EMPLOYEE E1 ON TA.ManagerId = E1.id
				INNER JOIN MTS_AUTHORITY MA ON MA.USERID = TA.ManagerId
					AND (
						MA.ROLEID = 3
						OR MA.ROLEID = 1
						)
				INNER JOIN MTS_LOGIN ML ON ML.USERID = E1.id
					AND ML.ACTIVE = 1
				WHERE TA.EmployeeId = E.id
				FOR XML PATH('')
				), 1, 2, '') AS AssignedManagers
	FROM Employee AS E WITH (NOLOCK)
	INNER JOIN MTS_Designation D WITH (NOLOCK) ON D.id = E.Designation
	INNER JOIN MTS_Department Dt WITH (NOLOCK) ON Dt.id = E.DepartmentId
	INNER JOIN MTS_AUTHORITY AS MA WITH (NOLOCK) ON E.id = MA.USERID
	INNER JOIN MTS_LOGIN AS MTLOG WITH (NOLOCK) ON MTLOG.USERID = E.id
	LEFT JOIN Employee_BankDetails AS EBD WITH (NOLOCK) ON EBD.Employee_Id = E.id
END
GO

/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEEDOCUMENTS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEEDOCUMENTS]
AS
BEGIN
	SELECT *
	FROM MTS_EmployeeDocuments WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEELEAVELIST_BETWEEN_DATE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEELEAVELIST_BETWEEN_DATE] (
	@FromDate DATE
	,@ToDate DATE
	,@id BIGINT
	,@leaveTypeid BIGINT
	)
AS
BEGIN
	DECLARE @BeforeFromDate DATE = DATEADD(day, - 1, @FromDate)
		,@BeforeToDate DATE = DATEADD(day, - 1, @ToDate)
		,@AfterFromDate DATE = DATEADD(day, - 1, @FromDate)
		,@AfterToDate DATE = DATEADD(day, - 1, @ToDate)

	SELECT *
	FROM Employee_Leave WITH (NOLOCK)
	WHERE Approval <> 3
		AND Approval <> 4
		AND Employee_Id = @id
		AND LeaveType = @leaveTypeid
		AND (
			@fromdate BETWEEN FromDate
				AND ToDate
			OR @todate BETWEEN FromDate
				AND ToDate
			OR FromDate BETWEEN @fromdate
				AND @todate
			OR ToDate BETWEEN @fromdate
				AND @todate
			)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEELEAVELIST_BETWEEN_DATE_WITHOUT_LeaveType]    Script Date: 1/5/2021 3:30:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

  
CREATE PROCEDURE [dbo].[READ_EMPLOYEELEAVELIST_BETWEEN_DATE_WITHOUT_LeaveType] (  
 @FromDate DATE  
 ,@ToDate DATE  
 ,@FromSession BIGINT  
 ,@Tosession BIGINT  
 ,@id BIGINT  
 )  
AS  
BEGIN  
 DECLARE @BeforeFromDate DATE = DATEADD(day, - 1, @FromDate)  
  ,@BeforeToDate DATE = DATEADD(day, - 1, @ToDate)  
  ,@AfterFromDate DATE = DATEADD(day, - 1, @FromDate)  
  ,@AfterToDate DATE = DATEADD(day, - 1, @ToDate) 

 SELECT *  INTO #Employee_Leave_List
 FROM Employee_Leave WITH (NOLOCK)  
 WHERE Approval <> 3  
  AND Approval <> 4  
  AND Employee_Id = @id  
  AND (  
   @fromdate BETWEEN FromDate  
    AND ToDate  
   OR @todate BETWEEN FromDate  
    AND ToDate  
   OR FromDate BETWEEN @fromdate  
    AND @todate  
   OR ToDate BETWEEN @fromdate  
    AND @todate  
   )  
	IF((@FromSession = 1 AND @Tosession = 1) OR (@FromSession = 2 AND @Tosession = 3))
	BEGIN
		SELECT * FROM #Employee_Leave_List WHERE LeaveFromSession IN (1,2,3) AND LeaveToSession IN (1,2,3)
	END
	ELSE IF(@FromSession = 2 AND @Tosession = 2)
	BEGIN
		SELECT * FROM #Employee_Leave_List WHERE LeaveFromSession IN (1,2) AND LeaveToSession IN (1,2)
	END
	ELSE IF(@FromSession = 3 AND @Tosession = 3)
	BEGIN
		SELECT * FROM #Employee_Leave_List WHERE LeaveFromSession IN (1,3) AND LeaveToSession IN (1,3)
	END
	ELSE
	BEGIN
		SELECT * FROM #Employee_Leave_List WHERE LeaveFromSession = @Tosession AND LeaveToSession = @FromSession
	END
END
GO


/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEELEAVELIST_BETWEEN_DATE_WITHOUT_LeaveType_OLD]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEELEAVELIST_BETWEEN_DATE_WITHOUT_LeaveType_OLD] (
	@FromDate DATE
	,@ToDate DATE
	,@FromSession BIGINT
	,@Tosession BIGINT
	,@id BIGINT
	)
AS
BEGIN
	DECLARE @BeforeFromDate DATE = DATEADD(day, - 1, @FromDate)
		,@BeforeToDate DATE = DATEADD(day, - 1, @ToDate)
		,@AfterFromDate DATE = DATEADD(day, - 1, @FromDate)
		,@AfterToDate DATE = DATEADD(day, - 1, @ToDate)

	SELECT *
	FROM Employee_Leave WITH (NOLOCK)
	WHERE Approval <> 3
		AND Approval <> 4
		AND Employee_Id = @id
		AND (
			(
				FromDate = @ToDate
				AND (
					@Tosession = 1
					OR @Tosession = LeaveFromSession
					OR @Tosession IS NULL
					)
				)
			OR (
				ToDate = @fromdate
				AND (
					@FromSession = 1
					OR @FromSession = LeaveToSession
					)
				)
			OR (
				(
					@fromdate BETWEEN FromDate
						AND ToDate
					AND @fromdate <> FromDate
					)
				AND (
					@todate BETWEEN FromDate
						AND ToDate
					AND @todate <> ToDate
					)
				)
			)
		AND (
			@fromdate BETWEEN FromDate
				AND ToDate
			OR @todate BETWEEN FromDate
				AND ToDate
			OR FromDate BETWEEN @fromdate
				AND @todate
			OR ToDate BETWEEN @fromdate
				AND @todate
			)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEEROLE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEEROLE] @employeeid BIGINT
AS
BEGIN
	SELECT R.ROLE_NAME
	FROM MTS_ROLES R WITH (NOLOCK)
	INNER JOIN MTS_AUTHORITY A WITH (NOLOCK) ON A.ROLEID = R.ROLEID
		AND A.USERID = @employeeid
END
GO

/****** Object:  StoredProcedure [dbo].[Read_Employees]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Read_Employees]
AS
BEGIN
	SELECT E.Firstname + '' + E.Lastname AS Employee_Name
		,E.Employee_Id
	FROM Employee E WITH (NOLOCK)
	ORDER BY E.Firstname
END
GO

/****** Object:  StoredProcedure [dbo].[READ_FILTERED_ASSET_NAME]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_FILTERED_ASSET_NAME] (@assettype BIGINT)
AS
BEGIN
	SELECT DISTINCT name.Id
		,name.Assetname
	FROM MTS_Assets AS asset WITH (NOLOCK)
	INNER JOIN MTS_ASSET_NAME name WITH (NOLOCK) ON asset.Assetname = name.Id
	WHERE AssettypeId = @assettype;
END
GO

/****** Object:  StoredProcedure [dbo].[Read_Filtered_LeaveType]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Read_Filtered_LeaveType] (@empid BIGINT)
AS
BEGIN
	IF EXISTS (
			SELECT *
			FROM EmployeeLeaveBalance WITH (NOLOCK)
			WHERE Employee_Id = @empid
			)
	BEGIN
		IF EXISTS (
				SELECT *
				FROM MTS_LeaveType WITH (NOLOCK)
				WHERE id IN (
						SELECT LeaveType
						FROM EmployeeLeaveBalance WITH (NOLOCK)
						WHERE Employee_Id = @empid
						)
				)
		BEGIN
			IF EXISTS (
					SELECT *
					FROM MTS_LeavePolicy WITH (NOLOCK)
					WHERE LEAVE_CODE IN (
							SELECT Leavetype
							FROM MTS_LeaveType WITH (NOLOCK)
							WHERE id IN (
									SELECT LeaveType
									FROM EmployeeLeaveBalance WITH (NOLOCK)
									WHERE Employee_Id = @empid
									)
							)
					)
			BEGIN
				SELECT DISTINCT (elb.LeaveType) AS id
					,mlp.LEAVE_TYPE AS LeaveType
				FROM EmployeeLeaveBalance elb WITH (NOLOCK)
				INNER JOIN MTS_LeaveType mlt WITH (NOLOCK) ON elb.LeaveType = mlt.id
				INNER JOIN MTS_LeavePolicy mlp WITH (NOLOCK) ON mlt.Leavetype = mlp.LEAVE_CODE
				WHERE elb.Employee_Id = @empid
			END
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[READ_FUNCTIONALROLE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_FUNCTIONALROLE]
AS
BEGIN
	SELECT *
	FROM MTS_FunctionalRole WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_GOVERNMENT_ID]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_GOVERNMENT_ID]
AS
BEGIN
	SELECT *
	FROM MTS_Government_Id WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_INVOICE_IMAGES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_INVOICE_IMAGES] (@ASSETCODE BIGINT)
AS
BEGIN
	DECLARE @INVOICEID BIGINT = (
			SELECT INVOICE_ID
			FROM ASSET_DETAILS WITH (NOLOCK)
			WHERE ID = @ASSETCODE
			)

	SELECT INVOICE
		,INVOICE_NAME
	FROM ASSET_INVOICE_DETAILS WITH (NOLOCK)
	WHERE ID = @INVOICEID
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ITEMCODE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ITEMCODE] (
	@assettypeid BIGINT
	,@assetnameid BIGINT
	)
AS
BEGIN
	SELECT ID
		,CONCAT (
			isnull(identification_code, 'Asset Code N/A')
			,' ( '
			,ASSET_DESCRIPTION
			,' )'
			) AS Item
	FROM ASSET_DETAILS WITH (NOLOCK)
	WHERE ASSET_TYPEID = @assettypeid
		AND ASSET_NAMEID = @assetnameid
		AND active = 1
END
GO

/****** Object:  StoredProcedure [dbo].[READ_ITEMCODE_AMCINSURANCE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ITEMCODE_AMCINSURANCE] (
	@assettypeid BIGINT
	,@assetnameid BIGINT
	,@categoryid BIGINT
	)
AS
BEGIN
	SELECT AD.ID
		,CONCAT (
			isnull(AD.identification_code, 'Asset Code N/A')
			,' ( '
			,AD.ASSET_DESCRIPTION
			,' )'
			) AS Item
	FROM ASSET_DETAILS AS AD WITH (NOLOCK)
	LEFT JOIN AMC_OR_ASSET_INSURANCE AS AAI WITH (NOLOCK) ON AAI.AssetTypeId = AD.ASSET_TYPEID
	WHERE AD.ASSET_TYPEID = @assettypeid
		AND AD.ASSET_NAMEID = @assetnameid
		AND AD.ID NOT IN (
			SELECT item_code
			FROM AMC_OR_ASSET_INSURANCE WITH (NOLOCK)
			WHERE Category = @categoryid
				AND item_code = AD.ID
				AND ToDate >= CAST(GETDATE() AS DATE)
			)
		AND AD.active = 1
	GROUP BY AD.ID
		,Ad.identification_code
		,AD.ASSET_DESCRIPTION
END
GO

/****** Object:  StoredProcedure [dbo].[READ_LANGUAGES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_LANGUAGES]
AS
BEGIN
	SELECT *
	FROM MTS_Languages WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_LASTINVOICEID]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_LASTINVOICEID]
AS
BEGIN
	SELECT TOP 1 ID
	FROM ASSET_INVOICE_DETAILS WITH (NOLOCK)
	ORDER BY ID DESC
END
GO

/****** Object:  StoredProcedure [dbo].[READ_LEAVE_POLICY]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_LEAVE_POLICY]
AS
BEGIN
	SELECT *
	FROM MTS_LeavePolicy WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_LEAVE_TYPE_FOR_EMPLOYEE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[READ_LEAVE_TYPE_FOR_EMPLOYEE] (@Dept_Id BIGINT)
AS
BEGIN
	SELECT lp.LEAVE_TYPE
		,lt.id
	FROM MTS_LeavePolicy lp WITH (NOLOCK)
	JOIN MTS_LeaveType lt WITH (NOLOCK) ON lt.Leavetype = lp.LEAVE_CODE
	WHERE lt.DepartmentId = @Dept_Id
END
GO

/****** Object:  StoredProcedure [dbo].[READ_LEAVESESSION]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_LEAVESESSION]
AS
BEGIN
	SELECT *
	FROM Mts_Session WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_LEAVETYPE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_LEAVETYPE]
AS
BEGIN
	WITH LEAVE_TYPE_TABLE
	AS (
		SELECT lev.*
			,dep.Department
		FROM MTS_Department AS dep WITH (NOLOCK)
		INNER JOIN MTS_LeaveType lev WITH (NOLOCK) ON dep.id = lev.DepartmentId
		)
	SELECT ltt.*
		,lpy.LEAVE_TYPE
	FROM LEAVE_TYPE_TABLE ltt WITH (NOLOCK)
	INNER JOIN MTS_LeavePolicy lpy WITH (NOLOCK) ON lpy.LEAVE_CODE = ltt.Leavetype
END
GO

/****** Object:  StoredProcedure [dbo].[READ_LEAVETYPENAME]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_LEAVETYPENAME] @leavetypeid BIGINT
AS
BEGIN
	SELECT Leavetype
	FROM MTS_LeaveType WITH (NOLOCK)
	WHERE id = @leavetypeid
END
GO

/****** Object:  StoredProcedure [dbo].[READ_LOCATION]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_LOCATION]
AS
BEGIN
	SELECT LocationID
		,LocationName
	FROM MTS_Location WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_LOCATION_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_LOCATION_DETAILS] (@LOCATIONID BIGINT)
AS
BEGIN
	SELECT PLACE_ID
		,PLACE_NAME
	FROM LOCATION_DETAILS WITH (NOLOCK)
	WHERE LOCATION_ID = @LOCATIONID
END
GO

/****** Object:  StoredProcedure [dbo].[READ_MANAGERNAMES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_MANAGERNAMES] (
	@EMPLOYEEID BIGINT
	,@ALLMANAGERS BIT
	)
AS
BEGIN
	IF EXISTS (
			SELECT *
			FROM Employee E WITH (NOLOCK)
			INNER JOIN MTS_AUthority auth WITH (NOLOCK) ON auth.USERID = E.id
				AND (
					auth.Roleid = 3
					OR auth.Roleid = 1
					)
			INNER JOIN MTS_LOGIN ML WITH (NOLOCK) ON ML.USERID = E.id
				AND ML.ACTIVE = 1
			INNER JOIN Employee_Reporting_Managers ERM WITH (NOLOCK) ON ERM.ManagerId = E.id
			WHERE ERM.EmployeeId = @EMPLOYEEID
				AND ERM.ManagerId <> @EMPLOYEEID
			)
		AND @ALLMANAGERS = 0
	BEGIN
		SELECT id
			,E.FirstName + ' ' + E.LastName AS EmployeeName
		FROM Employee E WITH (NOLOCK)
		INNER JOIN MTS_AUthority auth WITH (NOLOCK) ON auth.USERID = E.id
			AND (
				auth.Roleid = 3
				OR auth.Roleid = 1
				)
		INNER JOIN MTS_LOGIN ML WITH (NOLOCK) ON ML.USERID = E.id
			AND ML.ACTIVE = 1
		INNER JOIN Employee_Reporting_Managers ERM WITH (NOLOCK) ON ERM.ManagerId = E.id
		WHERE ERM.EmployeeId = @EMPLOYEEID
			AND ERM.ManagerId <> @EMPLOYEEID
	END
	ELSE
	BEGIN
		SELECT id
			,E.FirstName + ' ' + E.LastName AS EmployeeName
		FROM Employee E WITH (NOLOCK)
		INNER JOIN MTS_AUthority auth WITH (NOLOCK) ON auth.USERID = E.id
			AND (
				auth.Roleid = 3
				OR auth.Roleid = 1
				)
		INNER JOIN MTS_LOGIN ML WITH (NOLOCK) ON ML.USERID = E.id
			AND ML.ACTIVE = 1
		WHERE E.ID <> @EMPLOYEEID
	END
END
GO

/****** Object:  StoredProcedure [dbo].[READ_MARITAL_STATUS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_MARITAL_STATUS]
AS
BEGIN
	SELECT *
	FROM Mts_Marital_status WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_MONTHLY_ATTENDANCE_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_MONTHLY_ATTENDANCE_DETAILS] @DATE DATETIME
AS
BEGIN
	SELECT E.Employee_Id
		,E.Firstname + ' ' + E.Lastname AS Employee_Name
		,DEPT.Department
		,DESIG.Designation
	FROM Employee E WITH (NOLOCK)
	LEFT JOIN MTS_Department DEPT WITH (NOLOCK) ON E.DepartmentId = DEPT.id
	LEFT JOIN MTS_Designation DESIG WITH (NOLOCK) ON E.Designation = DESIG.id
END
GO

/****** Object:  StoredProcedure [dbo].[READ_MONTHLY_ATTENDANCE_LOG]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_MONTHLY_ATTENDANCE_LOG] @month DATE
	,@RoleId BIGINT
	,@UserId BIGINT
AS
BEGIN
	WITH durations
	AS (
		SELECT al.EmployeeCode AS EmployeeCode
			,(
				SELECT SUM(AL1.Duration)
				FROM MTS_ATTENDANCE AL1 WITH (NOLOCK)
				LEFT JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = AL1.EmployeeCode
				LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
				WHERE AL1.EmployeeCode = al.EmployeeCode
					AND (
						AL1.StatusCode = 'P'
						OR AL1.StatusCode = 'Â½P'
						)
					AND (
						(
							E.DepartmentId <> 2
							AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
								AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
							AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
							AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
							AND CAST(InDateTime AS DATE) NOT IN (
								SELECT CAST(DateOfHoliday AS DATE)
								FROM HolidaysList WITH (NOLOCK)
								)
							)
						OR (
							E.DepartmentId = 2
							AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
								AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
							)
						)
				) AS Duration
		FROM MTS_ATTENDANCE AL WITH (NOLOCK)
		GROUP BY al.EmployeeCode
		)
		,Total_status_counts
	AS (
		SELECT EmployeeCode AS EmployeeCode
			,(
				SELECT COUNT(ALOG.StatusCode)
				FROM MTS_ATTENDANCE ALOG WITH (NOLOCK)
				LEFT JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = ALOG.EmployeeCode
				LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
				WHERE
					(
						(
							E.DepartmentId <> 2
							AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
								AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
							AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
							AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
							AND CAST(InDateTime AS DATE) NOT IN (
								SELECT CAST(DateOfHoliday AS DATE)
								FROM HolidaysList WITH (NOLOCK)
								)
							)
						OR (
							E.DepartmentId = 2
							AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
								AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
							)
						)
					AND ALOG.StatusCode = 'P'
					AND MA.EmployeeCode = ALOG.EmployeeCode
				) AS PresentDays
			,(
				SELECT COUNT(ALOG1.StatusCode)
				FROM MTS_ATTENDANCE ALOG1 WITH (NOLOCK)
				LEFT JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = ALOG1.EmployeeCode
				LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
				WHERE
					(
						(
							E.DepartmentId <> 2
							AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
								AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
							AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
							AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
							AND CAST(InDateTime AS DATE) NOT IN (
								SELECT CAST(DateOfHoliday AS DATE)
								FROM HolidaysList WITH (NOLOCK)
								)
							)
						OR (
							E.DepartmentId = 2
							AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
								AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
							)
						)
					AND ALOG1.StatusCode = 'A'
					AND MA.EmployeeCode = ALOG1.EmployeeCode
				) AS AbsentDays
			,(
				SELECT COUNT(ALOG2.StatusCode)
				FROM MTS_ATTENDANCE ALOG2 WITH (NOLOCK)
				LEFT JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = ALOG2.EmployeeCode
				LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
				WHERE
					(
						(
							E.DepartmentId <> 2
							AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
								AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
							AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
							AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
							AND CAST(InDateTime AS DATE) NOT IN (
								SELECT CAST(DateOfHoliday AS DATE)
								FROM HolidaysList WITH (NOLOCK)
								)
							)
						OR (
							E.DepartmentId = 2
							AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
								AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
							)
						)
					AND ALOG2.StatusCode = 'Â½P'
					AND MA.EmployeeCode = ALOG2.EmployeeCode
				) AS HalfDays
			,(
				SELECT COUNT(ALOG3.StatusCode)
				FROM MTS_ATTENDANCE ALOG3 WITH (NOLOCK)
				LEFT JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = ALOG3.EmployeeCode
				LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
				WHERE
					(
						(
							E.DepartmentId <> 2
							AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
								AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
							AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
							AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
							AND CAST(InDateTime AS DATE) NOT IN (
								SELECT CAST(DateOfHoliday AS DATE)
								FROM HolidaysList WITH (NOLOCK)
								)
							)
						OR (
							E.DepartmentId = 2
							AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
								AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
							)
						)
					AND ALOG3.StatusCode <> 'Â½P'
					AND ALOG3.StatusCode <> 'A'
					AND ALOG3.StatusCode <> 'P'
					AND MA.EmployeeCode = ALOG3.EmployeeCode
				) AS OtherStatusCodes
		FROM MTS_ATTENDANCE MA WITH (NOLOCK)
		GROUP BY EmployeeCode
		)
	/****** Output ******/
	SELECT attendance_Log.EmployeeCode
		,(E.Firstname + ' ' + E.Lastname) AS EmployeeName
		,department.Department
		,RIGHT('00' + CONVERT(VARCHAR(4), durations.Duration / 60), 3) + 'h ' + RIGHT('0' + CONVERT(VARCHAR(2), durations.Duration % 60), 3) + 'm' AS Duration
		,CASE 
			WHEN PresentDays IS NOT NULL
				AND HalfDays IS NOT NULL
				THEN CAST(PresentDays AS FLOAT) + CAST(HalfDays AS FLOAT) / 2.0
			WHEN PresentDays IS NOT NULL
				AND HalfDays IS NULL
				THEN CAST(PresentDays AS FLOAT)
			WHEN PresentDays IS NULL
				AND HalfDays IS NOT NULL
				THEN CAST(HalfDays AS FLOAT) / 2.0
			END AS PresentDays
		,CASE 
			WHEN AbsentDays IS NOT NULL
				AND HalfDays IS NOT NULL
				THEN CAST(AbsentDays AS FLOAT) + CAST(HalfDays AS FLOAT) / 2.0
			WHEN AbsentDays IS NOT NULL
				AND HalfDays IS NULL
				THEN CAST(AbsentDays AS FLOAT)
			WHEN AbsentDays IS NULL
				AND HalfDays IS NOT NULL
				THEN CAST(HalfDays AS FLOAT) / 2.0
			END AS AbsentDays
		,OtherStatusCodes
		,PresentDays AS PresentDaysOnly
		,AbsentDays AS AbsentDaysOnly
		,HalfDays
		,(
			SELECT TOP 1 MA.InDateTime
			FROM MTS_ATTENDANCE MA WITH (NOLOCK)
			LEFT JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = MA.EmployeeCode
			LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
			WHERE
				(
					(
						E.DepartmentId <> 2
						AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
							AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
						AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
						AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
						AND CAST(InDateTime AS DATE) NOT IN (
							SELECT CAST(DateOfHoliday AS DATE)
							FROM HolidaysList WITH (NOLOCK)
							)
						)
					OR (
						E.DepartmentId = 2
						AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
							AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
						)
					)
			ORDER BY MA.InDateTime DESC
			) AS ATTENDANCE_UPTO
		,durations.Duration AS DurationInMins
	FROM MTS_ATTENDANCE attendance_Log WITH (NOLOCK)
	INNER JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = cast(attendance_Log.EmployeeCode AS VARCHAR(10))
	LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
	LEFT JOIN MTS_Department department WITH (NOLOCK) ON E.DepartmentId = department.id
	LEFT JOIN Durations durations ON attendance_Log.EmployeeCode = durations.EmployeeCode
	LEFT JOIN Total_status_counts ST ON ST.EmployeeCode = attendance_Log.EmployeeCode
	LEFT JOIN Employee_Reporting_Managers ERM WITH (NOLOCK) ON E.id = ERM.EmployeeId
	WHERE
		(
			(
				E.DepartmentId <> 2
				AND CAST(attendance_Log.InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
					AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
				AND FORMAT(attendance_Log.InDateTime, 'dddd') <> 'Sunday'
				AND FORMAT(attendance_Log.InDateTime, 'dddd') <> 'Saturday'
				AND CAST(attendance_Log.InDateTime AS DATE) NOT IN (
					SELECT CAST(DateOfHoliday AS DATE)
					FROM HolidaysList WITH (NOLOCK)
					)
				)
			OR (
				E.DepartmentId = 2
				AND CAST(attendance_Log.InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
					AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
				)
			)
		AND (
			(
				(
					@RoleId = 1
					OR @RoleId = 4
					)
				AND (E.id = E.id)
				)
			OR (
				(@RoleId = 3)
				AND (ERM.ManagerId = @UserId)
				)
			)
	GROUP BY attendance_Log.EmployeeCode
		,E.Firstname
		,E.Lastname
		,department.Department
		,durations.Duration
		,PresentDays
		,AbsentDays
		,HalfDays
		,OtherStatusCodes
END
GO

/****** Object:  StoredProcedure [dbo].[READ_MTS_ASSET]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_MTS_ASSET]
AS
BEGIN
	SELECT asset.*
		,name.Assetname AS Asset_Name
		,cat.CategoryName AS Asset_type
	FROM MTS_ASSETS AS asset WITH (NOLOCK)
	INNER JOIN MTS_ASSET_NAME name WITH (NOLOCK) ON asset.Assetname = name.id
	INNER JOIN MTS_AssetCategories cat WITH (NOLOCK) ON asset.AssettypeId = cat.CategoryId
END
GO

/****** Object:  StoredProcedure [dbo].[READ_MTS_LeavePolicy_LeaveType]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_MTS_LeavePolicy_LeaveType] (
	@empid BIGINT
	,@leavetype BIGINT
	,@year BIGINT
	)
AS
BEGIN
	SELECT *
	FROM MTS_LeavePolicy WITH (NOLOCK)
	WHERE LEAVE_CODE = (
			SELECT Leavetype
			FROM MTS_LeaveType WITH (NOLOCK)
			WHERE id = (
					SELECT Leavetype
					FROM EmployeeLeaveBalance WITH (NOLOCK)
					WHERE Employee_Id = @empid
						AND LeaveType = @leavetype
						AND Year = @year
					)
				AND DepartmentId = (
					SELECT DepartmentId
					FROM Employee WITH (NOLOCK)
					WHERE id = @empid
					)
			)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_NATIONALITY]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_NATIONALITY]
AS
BEGIN
	SELECT *
	FROM MTS_Nationality WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_PAYROLL_EMPLOYEE_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_PAYROLL_EMPLOYEE_DETAILS] (
	@MONTH VARCHAR(2)
	,@YEAR VARCHAR(4)
	)
AS
BEGIN
	SELECT D.Designation
		,EP.EMP_ID AS EMP_ID
		,EP.ID
		,format(Dateofjoin, 'dd/MMM/yyyy') Dateofjoin
		,E.Pancard
		,E.IS_PF_RESTRICTION_APPLICABLE
		,ISNULL(E.PF_AccountNumber, 'Nil') AS PF_AccountNumber
		,ISNULL(E.PF_UAN, 0) AS PF_UAN
		,ISNULL(E.ESI_Number, 0) AS ESI_Number
		,ISNULL(EB.Bankname, 'Nil') Bankname
		,ISNULL(EB.Accountnumber, 0) Accountnumber
		,E.Employee_Id AS EMP_NO
		,E.Firstname + ' ' + E.Lastname AS Employee_Name
		,DATENAME(MONTH, EP.PAYROLL_MONTH) AS [PAYROLL_MONTH]
		,DATENAME(YEAR, EP.PAYROLL_MONTH) AS [PAYROLL_YEAR]
		,ISNULL(EP.HOUSE_RENT, 0.00) AS HOUSE_RENT
		,ISNULL(Ep.BASIC_PAY, 0.00) AS BASIC_PAY
		,ISNULL(EP.Income_Tax, 0) Income_Tax
		,ISNULL(EP.Paid_Days, 0) AS Paid_Days
		,ISNULL(EP.LOP_DAYS, 0) AS LOP_DAYS
		,ISNULL(EP.TOTAL_DAYS, 0) AS TOTAL_DAYS
		,ISNULL(EP.PF_DETECTION, 0.00) + ISNULL(VPF_DEDUCTION, 0.00) AS PF_DETECTION
		,ISNULL(EP.Special_Allowance, 0.00) AS Special_Allowance
		,ISNULL(Ep.Medical_Allowance, 0.00) AS Medical_Allowance
		,ISNULL(Ep.FOOD_ALLOWANCE, 0.00) AS Food_Allowance
		,ISNULL(Ep.CONVEYENCE, 0.00) AS Conveyance
		,0.00 AS Communication_Allowance
		,0.00 AS Petrol_Allowance
		,0.00 AS Driver_Allowance
		,0.00 AS Education_Allowance
		,EP.OTHER_EARNINGS
		,Ep.GROSS_EARNINGS AS Gross_Earnings
		,Ep.Professional_Tax
		,ISNULL(Ep.SUDEXO_DEDUCTION, 0.00) SUDEXO_DEDUCTION
		,ISNULL(Ep.ESI_DEDUCTION, 0.00) AS ESI_DEDUCTION
		,ISNULL(Ep.OTHER_DEDUCTIONS, 0.00) AS OTHER_DEDUCTIONS
		,(ISNULL(Ep.ESI_DEDUCTION, 0.00) + ISNULL(EP.PF_DETECTION, 0.00) + ISNULL(EP.PROFESSIONAL_TAX, 0.00) + ISNULL(SUDEXO_DEDUCTION, 0.00) + ISNULL(INCOME_TAX, 0.00) + ISNULL(OTHER_DEDUCTIONS, 0.00) + ISNULL(VPF_DEDUCTION, 0.00)) AS Total_Deductions
		,Ep.OTHER_DEDUCTIONS AS OTHER_DEDUCTIONS
		,ISNULL(Ep.NET_MONTHLY_SALARY, 0.00) AS NET_MONTHLY_SALARY
		,ISNULL(EP.INCENTIVE, 0.00) AS INCENTIVE
		,ISNULL(EP.EXIT_BONUS, 0.00) AS EXIT_BONUS
		,ISNULL(EP.REEMBUSMENT_CHARGES, 0.00) AS REEMBUSMENT_CHARGES
		,ISNULL(EP.EMPLOYEE_BONUS, 0.00) AS BONUS
		,CTC_TOTAL
		,EOMONTH(EP.PAYROLL_MONTH) AS PAYROLL_EOM
	FROM MTS_PAYROLL_MONTHLY_DETAILS_FOR_EMPLOYEE EP WITH (NOLOCK)
	FULL OUTER JOIN Employee E WITH (NOLOCK) ON EP.EMP_ID = E.id
	FULL OUTER JOIN Employee_BankDetails EB WITH (NOLOCK) ON E.id = EB.Employee_Id
	FULL OUTER JOIN MTS_Designation D WITH (NOLOCK) ON D.id = E.Designation
	WHERE Month(EP.PAYROLL_MONTH) = @month
		AND Year(EP.PAYROLL_MONTH) = @year
END
GO

/****** Object:  StoredProcedure [dbo].[READ_PAYROLL_REPORT_SUMMARY]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_PAYROLL_REPORT_SUMMARY] (
	@FROM_MONTH VARCHAR(2)
	,@FROM_YEAR VARCHAR(4)
	,@OPTION BIGINT
	)
AS
BEGIN
	DECLARE @FROM_DATE DATE

	SELECT @FROM_DATE = EOMONTH(CAST(@FROM_MONTH + '-01-' + @FROM_YEAR AS DATE))

	IF @OPTION = 1
	BEGIN
		SELECT Employee_Id AS Employee_Id
			,E.Firstname + ' ' + E.Lastname AS Employee_Name
			,PF_AccountNumber
			,EPF_WAGES
			,PF_DETECTION AS Pf_Amount
			,ROUND((ISNULL(EPF_WAGES, 0.00) * 8.33) / 100, 0) AS EPS_AMOUNT
			,ISNULL(VPF_DEDUCTION, 0.00) AS VPF_AMOUNT
			,EPF_EDLI_CHARGES
			,EPF_ADMIN_CHARGES
		FROM Employee E WITH (NOLOCK)
		INNER JOIN MTS_PAYROLL_MONTHLY_DETAILS_FOR_EMPLOYEE PDE WITH (NOLOCK) ON PDE.EMP_ID = E.id
		WHERE PAYROLL_MONTH = @FROM_DATE
	END

	IF @OPTION = 2
	BEGIN
		SELECT Employee_Id
			,E.Firstname + ' ' + E.Lastname AS Employee_Name
			,ESI_Number
			,ESI_DEDUCTION
			,EMPLOYER_ESI
			,(ESI_DEDUCTION + EMPLOYER_ESI) AS TOTAL_CONTRIBUTION
		FROM MTS_PAYROLL_MONTHLY_DETAILS_FOR_EMPLOYEE PME WITH (NOLOCK)
		INNER JOIN Employee E WITH (NOLOCK) ON E.id = PME.EMP_ID
		WHERE PAYROLL_MONTH = @FROM_DATE
	END

	IF @OPTION = 3
	BEGIN
		SELECT Employee_Id
			,E.Firstname + ' ' + E.Lastname AS Employee_Name
			,PME.PROFESSIONAL_TAX
		FROM MTS_PAYROLL_MONTHLY_DETAILS_FOR_EMPLOYEE PME WITH (NOLOCK)
		INNER JOIN Employee E WITH (NOLOCK) ON E.id = PME.EMP_ID
		WHERE PAYROLL_MONTH = @FROM_DATE
	END

	IF @OPTION = 4
	BEGIN
		SELECT Employee_Id
			,E.Firstname + ' ' + E.Lastname AS Employee_Name
			,SUM(PME.LOP_DAYS) AS LOP_DAYS
		FROM MTS_PAYROLL_MONTHLY_DETAILS_FOR_EMPLOYEE PME WITH (NOLOCK)
		INNER JOIN Employee E WITH (NOLOCK) ON E.id = PME.EMP_ID
		WHERE PAYROLL_MONTH = @FROM_DATE
		GROUP BY Employee_Id
			,E.Firstname
			,E.Lastname
	END

	IF @OPTION = 5
	BEGIN
		SELECT Employee_Id
			,E.Firstname + ' ' + E.Lastname AS Insurance_Person_Name
			,E.ESI_Number
			,PME.PAID_DAYS
			,PME.GROSS_EARNINGS
			,'' AS Reason
			,'' AS Last_Working_Day
		FROM MTS_PAYROLL_MONTHLY_DETAILS_FOR_EMPLOYEE PME WITH (NOLOCK)
		INNER JOIN Employee E WITH (NOLOCK) ON E.id = PME.EMP_ID
		WHERE PAYROLL_MONTH = @FROM_DATE
	END
END
GO

/****** Object:  StoredProcedure [dbo].[Read_Payslip]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Read_Payslip] (
	@employeeid VARCHAR(255)
	,@year BIGINT
	,@month VARCHAR(255)
	)
AS
BEGIN
	SELECT D.Designation
		,md.Department
		,format(Dateofjoin, 'dd/MMM/yyyy') Dateofjoin
		,E.Pancard
		,ISNULL(E.PF_AccountNumber, 'Nil') AS PF_AccountNumber
		,ISNULL(E.PF_UAN, 0) AS PF_UAN
		,ISNULL(E.ESI_Number, 0) AS ESI_Number
		,ISNULL(EB.Bankname, 'Nil') Bankname
		,ISNULL(EB.Accountnumber, 0) Accountnumber
		,EP.Emp_No
		,E.Firstname + ' ' + E.Lastname AS Employee_Name
		,EP.Month
		,EP.Year
		,EP.HRA
		,Ep.Basic
		,ISNULL(EP.Income_Tax, 0) Income_Tax
		,EP.Paid_Days
		,EP.PF
		,ISNULL(EP.Prof_Dev, 0) Prof_Dev
		,EP.Special_Allowance
		,Ep.Medical_Allowance
		,Ep.Conveyance
		,ISNULL(Ep.Food_Allowance, 0) Food_Allowance
		,ISNULL(Ep.Communication_Allowance, 0) Communication_Allowance
		,ISNULL(Ep.Petrol_Allowance, 0) Petrol_Allowance
		,ISNULL(Ep.Driver_Allowance, 0) Driver_Allowance
		,ISNULL(Ep.Education_Allowance, 0) Education_Allowance
		,Ep.Gross_Earnings
		,Ep.Professional_Tax
		,ISNULL(Ep.Meal_Pass, 0) Meal_Pass
		,Ep.ESI
		,ISNULL(Ep.Others, 0) Others
		,Ep.Total_Deduction
		,Ep.Net_Salary
		,Ep.Reimbursement
	FROM Employee_Payslip EP WITH (NOLOCK)
	FULL OUTER JOIN Employee E WITH (NOLOCK) ON EP.Emp_No = E.Employee_Id
	FULL OUTER JOIN Employee_BankDetails EB WITH (NOLOCK) ON E.id = EB.Employee_Id
	FULL OUTER JOIN MTS_Designation D WITH (NOLOCK) ON D.id = E.Designation
	FULL OUTER JOIN MTS_Department md WITH (NOLOCK) ON md.id = E.DepartmentId
	WHERE EP.Emp_No = @employeeid
		AND EP.Month = @month
		AND EP.Year = @year
END
GO

/****** Object:  StoredProcedure [dbo].[READ_PENDINGLEAVELIST]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_PENDINGLEAVELIST] (@managerid BIGINT)
AS
BEGIN
	SELECT DISTINCT l.Employee_Id
		,ml.id
		,l.FromDate
		,l.ToDate
		,l.Numberofdays NumberOfDays
		,l.LeaveFromSession
		,l.LeaveToSession
		,ml.LeaveType
		,l.id AS primaryid
		,l.Reason
		,l.FromDate
		,l.ToDate
		,l.isLOP
		,(
			SELECT e.Firstname + ' ' + e.Lastname AS EmployeeName
			FROM Employee AS e WITH (NOLOCK)
			WHERE e.id = l.Employee_Id
			) AS EmployeeName
		,(
			SELECT e.Employee_Id AS Empid
			FROM Employee AS e WITH (NOLOCK)
			WHERE e.id = l.Employee_Id
			) AS Empid
	FROM MTS_LeaveType AS ml WITH (NOLOCK)
	INNER JOIN Employee_Leave AS l WITH (NOLOCK) ON ml.Id = l.LeaveType
	INNER JOIN Employee AS e WITH (NOLOCK) ON l.Approval = 1
	WHERE l.Managerid = @managerid
END
GO

/****** Object:  StoredProcedure [dbo].[READ_POLICYIMAGES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_POLICYIMAGES] (@documentid BIGINT)
AS
BEGIN
	SELECT DocumentImage
		,DocumentName
	FROM HR_POLICYDOCUMENTS WITH (NOLOCK)
	WHERE DocumentId = @documentid
END
GO

/****** Object:  StoredProcedure [dbo].[READ_QUALIFICATION]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_QUALIFICATION]
AS
BEGIN
	SELECT *
	FROM MTS_Qualification WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_REJECTED_APPROVAL_MODULE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_REJECTED_APPROVAL_MODULE] (@USERID BIGINT)
AS
BEGIN
	WITH REJECTED_TABLE_FROM_HEADER (
		ACTIVITY_ID
		,[STATUS]
		)
	AS (
		SELECT ACTIVITY_ID
			,[STATUS]
		FROM MTS_APPROVAL_HEADER
		WHERE [STATUS] = 3
		)
	SELECT MAD.ID
		,MAD.MODULE AS MODULE_ID
		,MMP.MODULE
		,MAD.ACTIVITY_ID
		,RTH.[STATUS]
		,E.Firstname + ' ' + E.Lastname AS FROM_WHOM
		,CONVERT(VARCHAR(20), MAH.[DATE], 100) AS DATE
		,MAD.[PARAMETERS] AS PARAMETER_VALUE
		,MMP.[PARAMETERS]
		,(
			SELECT TOP (1) REMARKS
			FROM MTS_APPROVAL_DETAILS
			WHERE [STATUS] = 3
				AND ACTIVITY_ID = MAD.ACTIVITY_ID
			ORDER BY ID DESC
			) AS REMARKS
		,ISNULL(E1.Firstname, 'No') + ' ' + ISNULL(E1.Lastname, 'Data') AS EmployeeName
		,(
			SELECT TOP 1 VALUE
			FROM STRING_SPLIT(MAD.[PARAMETERS], ',')
			ORDER BY value DESC
			) AS MonthYear
	FROM MTS_APPROVAL_HEADER MAH WITH (NOLOCK)
	LEFT JOIN MTS_APPROVAL_DETAILS MAD WITH (NOLOCK) ON MAH.ACTIVITY_ID = MAD.ACTIVITY_ID
	LEFT JOIN MTS_MODULE_PARAMETERS MMP WITH (NOLOCK) ON MAD.MODULE = MMP.MODULE_ID
	LEFT JOIN Employee E WITH (NOLOCK) ON MAD.FROM_USER_ID = E.id
	LEFT JOIN Employee E1 WITH (NOLOCK) ON MAH.EmployeeID = E1.id
	RIGHT JOIN REJECTED_TABLE_FROM_HEADER RTH WITH (NOLOCK) ON MAD.ACTIVITY_ID = RTH.ACTIVITY_ID
	WHERE MAD.[STATUS] = 0
		AND MAD.FROM_USER_ID = @USERID
	ORDER BY [DATE] DESC
END
GO

/****** Object:  StoredProcedure [dbo].[READ_RELATIONSHIP]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_RELATIONSHIP]
AS
BEGIN
	SELECT *
	FROM Mts_Relationship WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_SELECTED_ASSET_ITEM_CODE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_SELECTED_ASSET_ITEM_CODE] (@ASSETNAMEID BIGINT)
AS
BEGIN
	SELECT IDENTIFICATION_CODE
	FROM ASSET_DETAILS WITH (NOLOCK)
	WHERE ASSET_NAMEID = @ASSETNAMEID
END
GO

/****** Object:  StoredProcedure [dbo].[READ_SELECTED_ITEM_DESCRIPTION]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_SELECTED_ITEM_DESCRIPTION] (@ITEMCODE VARCHAR(255))
AS
BEGIN
	SELECT ASSET_DESCRIPTION
		,(
			SELECT TOP 1 ISNULL(unassigned_date, ACTION_DATE)
			FROM ASSIGN_ASSET WITH (NOLOCK)
			WHERE ITEM_CODE = CAST(@ITEMCODE AS BIGINT)
			ORDER BY ID DESC
			) AS [date]
	FROM ASSET_DETAILS WITH (NOLOCK)
	WHERE ID = CAST(@ITEMCODE AS BIGINT)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_SKILLS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_SKILLS]
AS
BEGIN
	SELECT *
	FROM MTS_Skills WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_SPECIFIC_ASSET_NAME]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_SPECIFIC_ASSET_NAME] (@assetname BIGINT)
AS
BEGIN
	SELECT Id
		,Assetname
	FROM MTS_ASSET_NAME WITH (NOLOCK)
	WHERE Id = @assetname
END
GO

/****** Object:  StoredProcedure [dbo].[READ_UPCOMMING_HOLIDAYSLIST]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[READ_UPCOMMING_HOLIDAYSLIST] (@yearofholiday VARCHAR(255))
AS
BEGIN
	DECLARE @todayDate VARCHAR(10) = CAST(DAY(GETDATE()) AS VARCHAR(10));
	DECLARE @currentMth VARCHAR(10) = CAST(MONTH(GETDATE()) AS VARCHAR(10));
	DECLARE @DATE VARCHAR(255) = @yearofholiday + '/' + @currentMth + '/' + @todayDate;

	PRINT (@DATE)

	SELECT id
		,CONCAT (
			FORMAT(DateOfHoliday, 'dd')
			,'- '
			,FORMAT(DateOfHoliday, 'MMM')
			,', '
			,FORMAT(DateOfHoliday, 'ddd')
			) AS DateOfHoliday
		,HolidayReason
		,YearOfHoliday
		,DayNameofDate
	FROM HolidaysList WITH (NOLOCK)
	WHERE YearOfHoliday = @yearofholiday
		AND DateOfHoliday > @DATE
END
GO

/****** Object:  StoredProcedure [dbo].[READ_VENDOR_NAME]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_VENDOR_NAME]
AS
BEGIN
	SELECT ID
		,Name
		,VENDOR_TYPE
	FROM MTS_VENDORS WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READ_VENDORNAMES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_VENDORNAMES]
AS
BEGIN
	SELECT ID
		,NAME
	FROM MTS_VENDORS WITH (NOLOCK)
END
GO

/****** Object:  StoredProcedure [dbo].[READEMPLOYEE_PANNUMBER]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READEMPLOYEE_PANNUMBER] (@empid VARCHAR(255))
AS
BEGIN
	SELECT Pancard
	FROM Employee WITH (NOLOCK)
	WHERE Employee_Id = @empid
END
GO

/****** Object:  StoredProcedure [dbo].[RESTRICT_EMPLOYEELEAVES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RESTRICT_EMPLOYEELEAVES] (
	@empid BIGINT
	,@departmentId INT
	,@leaveTypeID BIGINT
	,@fromdate DATE
	,@todate DATE
	,@nextdate DATE
	)
AS
BEGIN
	DECLARE @leaveTypeName VARCHAR(255) = (
			SELECT Leavetype
			FROM MTS_LeaveType WITH (NOLOCK)
			WHERE DepartmentId = @departmentId
				AND id = @leaveTypeID
			)
	DECLARE @masterLeaveTypeID BIGINT = (
			SELECT id
			FROM MTS_LeaveType WITH (NOLOCK)
			WHERE DepartmentId = @departmentId
				AND Leavetype = 'casual'
			)

	IF (Upper(@leaveTypeName) = 'CASUAL')
	BEGIN
		IF EXISTS (
				SELECT *
				FROM Employee_Leave WITH (NOLOCK)
				WHERE (
						FromDate = @fromdate
						OR ToDate = @fromdate
						OR ToDate = @todate
						OR ToDate = @nextdate
						OR FromDate = @nextdate
						)
					AND Employee_Id = @empid
					AND Approval <> 4
					AND Approval <> 3
				)
		BEGIN
			SELECT 2
		END
		ELSE
		BEGIN
			SELECT 1
		END
	END
	ELSE IF EXISTS (
			SELECT *
			FROM Employee_Leave WITH (NOLOCK)
			WHERE (
					(
						FromDate = @fromdate
						AND LeaveType = @masterLeaveTypeID
						)
					OR (
						ToDate = @fromdate
						AND LeaveType = @masterLeaveTypeID
						)
					OR (
						ToDate = @todate
						AND LeaveType = @masterLeaveTypeID
						)
					OR (
						ToDate = @nextdate
						AND LeaveType = @masterLeaveTypeID
						)
					OR (
						FromDate = @nextdate
						AND LeaveType = @masterLeaveTypeID
						)
					)
				AND Employee_Id = @empid
				AND Approval <> 4
				AND Approval <> 3
			)
	BEGIN
		SELECT 2
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO

/****** Object:  StoredProcedure [dbo].[REVISE_EMPLOYEE_PAYROLL_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[REVISE_EMPLOYEE_PAYROLL_DETAILS] (@EMP_ID BIGINT)
AS
BEGIN
	UPDATE MTS_PAYROLL_EMPLOYEE_EARNINGS
	SET REVISED = 1
	WHERE ID = (
			SELECT TOP 1 ID
			FROM MTS_PAYROLL_EMPLOYEE_EARNINGS WITH (NOLOCK)
			WHERE EMP_ID = @EMP_ID
			ORDER BY ID DESC
			)

	UPDATE MTS_PAYROLL_EMPLOYEE_DEDUCTIONS
	SET REVISED = 1
	WHERE ID = (
			SELECT TOP 1 ID
			FROM MTS_PAYROLL_EMPLOYEE_DEDUCTIONS WITH (NOLOCK)
			WHERE EMP_ID = @EMP_ID
			ORDER BY ID DESC
			)

	SELECT 2
END
GO

/****** Object:  StoredProcedure [dbo].[SESSIONEMPID]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SESSIONEMPID] (@userid BIGINT)
AS
BEGIN
	SELECT e.Employee_Id
		,e.Gender
		,e.DepartmentId
		,R.ROLE_NAME
	FROM MTS_Login WITH (NOLOCK)
	INNER JOIN Employee e WITH (NOLOCK) ON e.id = @userid
	LEFT JOIN MTS_AUTHORITY AS A WITH (NOLOCK) ON A.USERID = @userid
	LEFT JOIN MTS_ROLES AS R WITH (NOLOCK) ON R.ROLEID = A.ROLEID
END
GO

/****** Object:  StoredProcedure [dbo].[SKIPPING_MANAGERS_TO_EMPLOYEE_APPRAISAL_PROCESS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SKIPPING_MANAGERS_TO_EMPLOYEE_APPRAISAL_PROCESS] (
	@EMP_ID BIGINT
	,@APPRAISAL_PROCESS_ID BIGINT
	)
AS
BEGIN
	UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
	SET Manager_Id = 0
		,Staging = CASE 
			WHEN Staging = 1
				THEN 2
			ELSE NULL
			END
	WHERE Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
		AND Employee_Id = @EMP_ID

	UPDATE MTS_Appraisal_Employee_Mapping
	SET ManagerId = 0
	WHERE Appraisal_Process_Period_Id = @APPRAISAL_PROCESS_ID
		AND Employee_Id = @EMP_ID
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_ANNOUNCEMENTS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_ANNOUNCEMENTS] (
	@id BIGINT
	,@fromdate DATE
	,@todate DATE
	,@messageheader VARCHAR(255)
	,@messagetitle VARCHAR(255)
	,@message VARCHAR(255)
	)
AS
BEGIN
	UPDATE MTS_ANNOUNCEMENT
	SET FromDate = @fromdate
		,ToDate = @todate
		,MessageHeader = @messageheader
		,MessageTitle = @messagetitle
		,Message = @message
	WHERE id = @id
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_ASSET]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_ASSET] (
	@id BIGINT
	,@assettype BIGINT
	,@assetname VARCHAR(100)
	,@depreciation DECIMAL(4, 2)
	,@expectedlife BIGINT
	,@salvagevalue BIGINT
	)
AS
BEGIN
	UPDATE MTS_ASSETS
	SET AssettypeId = @assettype
		,Assetname = @assetname
		,Depreciation = @depreciation
		,ExpectedLife = @expectedlife
		,SalvageValue = @salvagevalue
	WHERE Id = @id

	SELECT 1
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_ASSET_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_ASSET_DETAILS] (
	@id BIGINT
	,@vendorid BIGINT
	,@purchaseordernumber VARCHAR(255)
	,@purchasedon DATE
	,@billnumber VARCHAR(255)
	,@billdate DATE
	,@assettypeid BIGINT
	,@assetnameid BIGINT
	,@assetdescription VARCHAR(255)
	,@costinrs DECIMAL(18, 2)
	,@costtype INT
	,@make VARCHAR(255)
	,@model VARCHAR(255)
	,@serialnumber VARCHAR(255)
	,@identificationcode VARCHAR(255)
	,@warrantymonths BIGINT
	,@warrantystartdate DATE
	,@warrantyenddate DATE
	,@invoiceid BIGINT
	,@assettype_id BIGINT
	,@assetname_id BIGINT
	,@inuse BIGINT
	)
AS
BEGIN
	UPDATE ASSET_DETAILS
	SET VENDOR_ID = @vendorid
		,PURCHASE_ORDER_NUMBER = @purchaseordernumber
		,PURCHASED_ON = @purchasedon
		,BILL_NUMBER = @billnumber
		,BILL_DATE = @billdate
		,ASSET_TYPEID = @assettypeid
		,ASSET_NAMEID = @assetnameid
		,ASSET_DESCRIPTION = @assetdescription
		,COST = @costinrs
		,COST_TYPE = @costtype
		,MAKE = @make
		,MODEL = @model
		,SERIAL_NUMBER = @serialnumber
		,IDENTIFICATION_CODE = @identificationcode
		,WARRANTY_MONTHS = @warrantymonths
		,WARRANTY_STARTDATE = @warrantystartdate
		,WARRANTY_ENDDATE = @warrantyenddate
		,INVOICE_ID = @invoiceid
		,ASSETTYPE_ID = @assettype_id
		,ASSETNAME_ID = @assetname_id
		,IN_USE = @inuse
	WHERE ID = @id

	BEGIN
		SELECT 1
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_ASSIGNED_MANAGER_TO_EMPLOYEE_APPRAISAL_PROCESS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UPDATE_ASSIGNED_MANAGER_TO_EMPLOYEE_APPRAISAL_PROCESS] (
	@EMP_ID BIGINT
	,@MANAGER_ID BIGINT
	,@appraisal_process_period_id BIGINT
	)
AS
BEGIN
	UPDATE MTS_Appraisal_Employee_Mapping
	SET ManagerId = @MANAGER_ID
	WHERE Employee_id = @EMP_ID
		AND Appraisal_Process_Period_Id = @appraisal_process_period_id

	UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
	SET Manager_Id = @MANAGER_ID
	WHERE Employee_Id = @EMP_ID
		AND Appraisal_Process_Period_Id = @appraisal_process_period_id
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_BANKDETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_BANKDETAILS] (
	@accountnumber BIGINT
	,@bankname VARCHAR(255)
	,@branchname VARCHAR(255)
	,@empid BIGINT
	,@ifsc VARCHAR(255)
	)
AS
BEGIN
	UPDATE Employee_BankDetails
	SET Accountnumber = @accountnumber
		,Bankname = @bankname
		,Branchname = @branchname
		,Employee_Id = @empid
		,Ifsc = @ifsc
	WHERE Employee_Id = @empid
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_BLOODGROUP]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_BLOODGROUP] (
	@id BIGINT
	,@bloodgroup VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM MTS_Bloodgroup WITH (NOLOCK)
			WHERE Bloodgroup = @bloodgroup
			)
	BEGIN
		UPDATE MTS_Bloodgroup
		SET Bloodgroup = @bloodgroup
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_DEPARTMENT]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_DEPARTMENT] (
	@id BIGINT
	,@department VARCHAR(max)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT Department
			FROM Mts_Department WITH (NOLOCK)
			WHERE Department = @department
			)
	BEGIN
		UPDATE Mts_Department
		SET Department = @department
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_DESIGNATION]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_DESIGNATION] (
	@id BIGINT
	,@designation VARCHAR(max)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT Designation
			FROM Mts_Designation WITH (NOLOCK)
			WHERE Designation = @designation
			)
	BEGIN
		UPDATE Mts_Designation
		SET Designation = @designation
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_EMPLOYEE] (
	@aadhar BIGINT
	,@dateofbirth DATE
	,@dateofjoin DATE
	,@designation BIGINT
	,@department BIGINT
	,@email VARCHAR(255)
	,@empid VARCHAR(max)
	,@fathername VARCHAR(255)
	,@firstname VARCHAR(255)
	,@gender VARCHAR(max)
	,@id BIGINT
	,@lastname VARCHAR(255)
	,@maritalstatus BIGINT
	,@mobile VARCHAR(15)
	,@nationality BIGINT
	,@pancard VARCHAR(255)
	,@spousename VARCHAR(255)
	,@pfaccountno VARCHAR(255)
	,@pfuan BIGINT
	,@esi BIGINT
	,@FunctionalRole BIGINT
	)
AS
BEGIN
	UPDATE Employee
	SET Aadhar = @aadhar
		,Dateofbirth = @dateofbirth
		,Dateofjoin = @dateofjoin
		,Designation = @designation
		,DepartmentId = @department
		,Email = @email
		,Fathername = @fathername
		,Firstname = @firstname
		,Gender = @gender
		,Lastname = @lastname
		,Maritalstatus = @maritalstatus
		,Mobile = @mobile
		,Nationality = @nationality
		,Pancard = @pancard
		,Spousename = @spousename
		,PF_AccountNumber = @pfaccountno
		,PF_UAN = @pfuan
		,ESI_Number = @esi
		,FunctionalRole = @FunctionalRole
	WHERE id = @id

	SELECT id
	FROM Employee WITH (NOLOCK)
	WHERE id = @id
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEE_DEPARTMENT_LEAVEPOLICY]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UPDATE_EMPLOYEE_DEPARTMENT_LEAVEPOLICY] (
	@eid BIGINT
	,@departmentid BIGINT
	)
AS
IF EXISTS (
		SELECT *
		FROM Employee WITH (NOLOCK)
		WHERE id = @eid
		)
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM Employee WITH (NOLOCK)
			WHERE id = @eid
				AND DepartmentId = @departmentid
			)
	BEGIN
		IF EXISTS (
				SELECT *
				FROM MTS_LeaveType WITH (NOLOCK)
				WHERE DepartmentId IN (
						SELECT DepartmentId
						FROM Employee WITH (NOLOCK)
						WHERE id = @eid
						)
				)
		BEGIN
			DELETE
			FROM EmployeeLeaveBalance
			WHERE Employee_Id = @eid

			UPDATE Employee
			SET DepartmentId = @departmentid
			WHERE id = @eid

			EXEC [dbo].[MTS_CALCULATELEAVE_ATJOIN] @eid

			EXEC [dbo].[MTS_CALCULATELEAVE_EARNED_FOR_EMPLOYEE] @eid

			IF EXISTS (
					SELECT *
					FROM EmployeeLeaveBalance WITH (NOLOCK)
					WHERE Employee_Id = @eid
					)
			BEGIN
				IF EXISTS (
						SELECT *
						FROM Employee_Leave WITH (NOLOCK)
						WHERE Approval = 2
							AND Employee_Id = @eid
							AND AppliedDate BETWEEN DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0)
								AND DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, - 1)
						)
				BEGIN
					DECLARE c CURSOR
					FOR
					SELECT DISTINCT LeaveType
					FROM Employee_Leave
					WHERE Approval = 2
						AND Employee_Id = @eid
						AND AppliedDate BETWEEN DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0)
							AND DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, - 1)
					GROUP BY LeaveType

					DECLARE @Previous_Leave AS FLOAT
					DECLARE @Previous_LeaveType_ID AS INT
					DECLARE @Previous_Dept_LeaveType_ID AS BIGINT
					DECLARE @Previous_LeaveType AS VARCHAR(50)

					OPEN c

					FETCH NEXT
					FROM c
					INTO @Previous_LeaveType_ID

					WHILE @@Fetch_Status = 0
					BEGIN
						SET @Previous_Leave = (
								SELECT SUM(Numberofdays) TotalLeaves
								FROM Employee_Leave WITH (NOLOCK)
								WHERE Approval = 2
									AND Employee_Id = @eid
									AND LeaveType = @Previous_LeaveType_ID
									AND AppliedDate BETWEEN DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0)
										AND DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, - 1)
								GROUP BY LeaveType
								)
						SET @Previous_LeaveType = (
								SELECT Leavetype
								FROM MTS_LeaveType WITH (NOLOCK)
								WHERE id = @Previous_LeaveType_ID
								)
						SET @Previous_Dept_LeaveType_ID = (
								SELECT id
								FROM MTS_LeaveType WITH (NOLOCK)
								WHERE LeaveType = @Previous_LeaveType
									AND DepartmentId = @departmentid
								)

						UPDATE EmployeeLeaveBalance
						SET Leavebalance = CASE 
								WHEN (Leavebalance - @Previous_Leave) >= 0
									THEN (Leavebalance - @Previous_Leave)
								ELSE 0
								END
						WHERE Employee_Id = @eid
							AND LeaveType = @Previous_Dept_LeaveType_ID

						FETCH NEXT
						FROM c
						INTO @Previous_LeaveType_ID
					END

					CLOSE c

					DEALLOCATE c
				END
			END
		END
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEE_EDUCATIONS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_EMPLOYEE_EDUCATIONS] (
	@employeeid BIGINT
	,@schoolname VARCHAR(255)
	,@schoolpassoutyear DATE
	,@collegename VARCHAR(255)
	,@collegepassoutyear DATE
	,@qualification BIGINT
	)
AS
BEGIN
	IF EXISTS (
			SELECT 1
			FROM Employee_Educations
			WHERE Employee_Id = @employeeid
				AND Schoolname = @schoolname
				AND Schoolpassedoutyear = @schoolpassoutyear
				AND Collegename = @collegename
				AND Collegepassedoutyear = @collegepassoutyear
				AND Qualification = @qualification
			)
	BEGIN
		SELECT 0
	END
	ELSE IF EXISTS (
			SELECT 1
			FROM Employee_Educations WITH (NOLOCK)
			WHERE Employee_Id = @employeeid
			)
	BEGIN
		UPDATE Employee_Educations
		SET Schoolname = @schoolname
			,Schoolpassedoutyear = @schoolpassoutyear
			,Collegename = @collegename
			,Collegepassedoutyear = @collegepassoutyear
			,Qualification = @qualification
		WHERE Employee_Id = @employeeid

		SELECT 1
	END
	ELSE
	BEGIN
		INSERT INTO Employee_Educations (
			Employee_Id
			,Schoolname
			,Schoolpassedoutyear
			,Collegename
			,Collegepassedoutyear
			,Qualification
			)
		VALUES (
			@employeeid
			,@schoolname
			,@schoolpassoutyear
			,@collegename
			,@collegepassoutyear
			,@qualification
			)

		SELECT 1
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEE_LEAVE_BALANCE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_EMPLOYEE_LEAVE_BALANCE] (
	@ID BIGINT
	,@MAXALLOWEDBALANCE BIGINT
	,@CONSECUTIVELEAVES BIGINT
	)
AS
BEGIN
	UPDATE EmployeeLeaveBalance
	SET AdvanceCredit = @MAXALLOWEDBALANCE
		,AdvanceAvailed = @CONSECUTIVELEAVES
	WHERE ID = @ID
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UPDATE_EMPLOYEE_MONTHLY_VARIANCE_PAYROLL] (
	@ID BIGINT
	,@EMP_ID BIGINT
	,@TYPE BIGINT
	,@DESCRIPTION VARCHAR(20)
	,@AMOUNT DECIMAL
	,@EFFECTIVE_MONTH DATE
	)
AS
BEGIN
	UPDATE MTS_PAYROLL_EMPLOYEE_MONTHLY_VARIANCE
	SET TYPE = @TYPE
		,DESCRIPTION = @DESCRIPTION
		,AMOUNT = @AMOUNT
		,EFFECTIVE_MONTH = @EFFECTIVE_MONTH
	WHERE ID = @ID

	SELECT 1
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEEADDRESS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_EMPLOYEEADDRESS] (
	@employeeid BIGINT
	,@Currentbuilding VARCHAR(255)
	,@currentcity VARCHAR(255)
	,@currentstate VARCHAR(255)
	,@currentpincode BIGINT
	,@permanentbuilding VARCHAR(255)
	,@permanentcity VARCHAR(255)
	,@permanentstate VARCHAR(255)
	,@permanentpincode BIGINT
	)
AS
BEGIN
	IF EXISTS (
			SELECT 1
			FROM Employee_Address WITH (NOLOCK)
			WHERE Employee_Id = @employeeid
				AND CurrentBuilding_Plot = @Currentbuilding
				AND CurrentCity = @currentcity
				AND CurrentState = @currentstate
				AND CurrentPincode = @currentpincode
				AND PermanentBuilding_Plot = @permanentbuilding
				AND PermanentCity = @permanentcity
				AND PermanentState = @permanentstate
				AND PermanentPincode = @permanentpincode
			)
	BEGIN
		SELECT 0
	END
	ELSE IF EXISTS (
			SELECT 1
			FROM Employee_Address WITH (NOLOCK)
			WHERE Employee_Id = @employeeid
			)
	BEGIN
		UPDATE Employee_Address
		SET Employee_Id = @employeeid
			,CurrentBuilding_Plot = @Currentbuilding
			,CurrentCity = @currentcity
			,CurrentState = @currentstate
			,CurrentPincode = @currentpincode
			,PermanentBuilding_Plot = @permanentbuilding
			,PermanentCity = @permanentcity
			,PermanentState = @permanentstate
			,PermanentPincode = @permanentpincode
		WHERE Employee_Id = @employeeid

		SELECT 1
	END
	ELSE
	BEGIN
		INSERT INTO Employee_Address (
			Employee_Id
			,CurrentBuilding_Plot
			,CurrentCity
			,CurrentState
			,CurrentPincode
			,PermanentBuilding_Plot
			,PermanentCity
			,PermanentState
			,PermanentPincode
			)
		VALUES (
			@employeeid
			,@Currentbuilding
			,@currentcity
			,@currentstate
			,@currentpincode
			,@permanentbuilding
			,@permanentcity
			,@permanentstate
			,@permanentpincode
			)

		SELECT 1
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEEDETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_EMPLOYEEDETAILS] (
	@employeeid BIGINT
	,@bloodgroup BIGINT
	,@languagename VARCHAR(255)
	)
AS
BEGIN
	IF EXISTS (
			SELECT 1
			FROM EmployeeDetails WITH (NOLOCK)
			WHERE Employee_Id = @employeeid
				AND BloodGroup = @bloodgroup
				AND Languagename = @languagename
			)
	BEGIN
		SELECT 0
	END
	ELSE IF EXISTS (
			SELECT 1
			FROM EmployeeDetails WITH (NOLOCK)
			WHERE Employee_Id = @employeeid
			)
	BEGIN
		UPDATE EmployeeDetails
		SET BloodGroup = @bloodgroup
			,Languagename = @languagename
		WHERE Employee_Id = @employeeid

		SELECT 1
	END
	ELSE
	BEGIN
		INSERT INTO EmployeeDetails (
			Employee_Id
			,BloodGroup
			,Languagename
			)
		VALUES (
			@employeeid
			,@bloodgroup
			,@languagename
			)

		SELECT 1
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_FINAL_MODERATOR_TO_EMPLOYEE_APPRAISAL_PROCESS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_FINAL_MODERATOR_TO_EMPLOYEE_APPRAISAL_PROCESS] (
	@EMP_ID VARCHAR(50)
	,@FINAL_MODERATOR_ID BIGINT
	,@AppraisalProcessId BIGINT
	)
AS
BEGIN
	DECLARE @empid BIGINT

	SELECT @empid = id
	FROM EMPLOYEE WITH (NOLOCK)
	WHERE Employee_Id = @EMP_ID

	UPDATE MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
	SET Final_Evaluator_Id = @FINAL_MODERATOR_ID
	WHERE Employee_Id = @empid
		AND Appraisal_Process_Period_Id = @AppraisalProcessId
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_GOVERNMENT_ID]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_GOVERNMENT_ID] (
	@id BIGINT
	,@idname VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT IdName
			FROM Mts_Government_Id WITH (NOLOCK)
			WHERE IdName = @idname
			)
	BEGIN
		UPDATE MTS_Government_Id
		SET Idname = @idname
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_HOLIDAYS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UPDATE_HOLIDAYS] (
	@id BIGINT
	,@yearofholiday VARCHAR(255)
	,@holidayreason VARCHAR(255)
	,@dateofholiday DATE
	,@dayname VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT 1
			FROM HolidaysList WITH (NOLOCK)
			WHERE YearOfHoliday = @yearofholiday
				AND HolidayReason = @holidayreason
				AND DateOfHoliday = @dateofholiday
			)
	BEGIN
		UPDATE HolidaysList
		SET YearOfHoliday = @yearofholiday
			,HolidayReason = @holidayreason
			,DateOfHoliday = @dateofholiday
			,DayNameofDate = @dayname
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_LANGUAGES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_LANGUAGES] (
	@id BIGINT
	,@languagename VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT Languagename
			FROM MTS_Languages WITH (NOLOCK)
			WHERE Languagename = @languagename
			)
	BEGIN
		UPDATE MTS_Languages
		SET Languagename = @languagename
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_LEAVE_POLICY]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_LEAVE_POLICY] (
	@ID BIGINT
	,@LEAVETYPE VARCHAR(50)
	,@LEAVECODE VARCHAR(5)
	,@ASSIGNEDAFTER BIGINT
	,@APPLICABLEFOR BIGINT
	,@MARITALSTATUS BIGINT
	,@ACCURAL BIT
	,@MAXALLOWEDBALANCE BIGINT
	,@CONSECUTIVELEAVES BIGINT
	,@ADJUSTMENTLEAVE VARCHAR(150)
	,@LEAVE_CANNOT_TAKETOGETHER VARCHAR(150)
	,@ENABLEUPLOADFOREXCEEDEDDAYS BIGINT
	,@PRORATA BIGINT
	)
AS
BEGIN
	UPDATE MTS_LeavePolicy
	SET LEAVE_TYPE = @LEAVETYPE
		,LEAVE_CODE = @LEAVECODE
		,ASSIGNED_AFTER = @ASSIGNEDAFTER
		,APPLICABLE_FOR = @APPLICABLEFOR
		,MARITAL_STATUS = @MARITALSTATUS
		,ACCURAL = @ACCURAL
		,MAX_ALLOWED_BALANCE = @MAXALLOWEDBALANCE
		,CONSECUTIVE_LEAVES = @CONSECUTIVELEAVES
		,ADJUSTMENT_LEAVE_AGAINST = @ADJUSTMENTLEAVE
		,LEAVE_CANNOT_TAKE_TOGETHER = @LEAVE_CANNOT_TAKETOGETHER
		,ENABLE_UPLOAD_DOC_FOR_EXCEEDED_DAYS = @ENABLEUPLOADFOREXCEEDEDDAYS
		,PRORATA = @PRORATA
	WHERE ID = @ID
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_LEAVETYPE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_LEAVETYPE] (
	@id BIGINT
	,@leavetype VARCHAR(255)
	,@numberofdays BIGINT
	,@department BIGINT
	,@HolidayAsLeave BIT
	)
AS
BEGIN
	UPDATE MTS_LeaveType
	SET Leavetype = @leavetype
		,Numberofdays = @numberofdays
		,DepartmentId = @department
		,HolidayAsLeave = @HolidayAsLeave
	WHERE id = @id

	SELECT 1
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_LOCATION]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_LOCATION] (
	@id BIGINT
	,@location VARCHAR(max)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT LocationName
			FROM Mts_Location WITH (NOLOCK)
			WHERE LocationName = @location
			)
	BEGIN
		UPDATE Mts_Location
		SET LocationName = @location
		WHERE LocationID = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_MARITAL_STATUS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_MARITAL_STATUS] (
	@id BIGINT
	,@marital_status VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM Mts_Marital_status WITH (NOLOCK)
			WHERE Marital_status = @marital_status
			)
	BEGIN
		UPDATE Mts_Marital_status
		SET Marital_status = @marital_status
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_MESSAGE_STATUS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_MESSAGE_STATUS] (
	@id BIGINT
	,@status BIT
	)
AS
BEGIN
	UPDATE MTS_MESSAGES
	SET STATUS = @status
	WHERE id = @id
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_MESSAGES]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UPDATE_MESSAGES] (
	@id BIGINT
	,@fromdate DATE
	,@todate DATE
	,@messageheader VARCHAR(255)
	,@messagetitle VARCHAR(255)
	,@message NVARCHAR(MAX)
	,@templatetype BIGINT
	)
AS
BEGIN
	UPDATE MTS_MESSAGES
	SET FromDate = @fromdate
		,ToDate = @todate
		,MessageHeader = @messageheader
		,MessageTitle = @messagetitle
		,Message = @message
		,PostedDate = GETDATE()
		,TemplateId = @templatetype
	WHERE id = @id
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_NATIONALITY]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_NATIONALITY] (
	@id BIGINT
	,@nationality VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM MTS_Nationality WITH (NOLOCK)
			WHERE Nationality = @nationality
			)
	BEGIN
		UPDATE MTS_Nationality
		SET Nationality = @nationality
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_PAYROLL_CLOSE_MONTH]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_PAYROLL_CLOSE_MONTH] (
	@MONTH VARCHAR(2)
	,@YEAR VARCHAR(4)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT 1
			FROM MTS_PAYROLL_CLOSING_PERIOD WITH (NOLOCK)
			WHERE MONTH(PAYROLL_MONTH) = @MONTH
				AND YEAR(PAYROLL_MONTH) = @YEAR
			)
	BEGIN
		SELECT 0
	END
	ELSE
	BEGIN
		UPDATE MTS_PAYROLL_CLOSING_PERIOD
		SET CLOSED_STATUS = 1
		WHERE MONTH(PAYROLL_MONTH) = @MONTH
			AND YEAR(PAYROLL_MONTH) = @YEAR

		SELECT 1
	END

	IF NOT EXISTS (
			SELECT 1
			FROM Employee_Payslip WITH (NOLOCK)
			WHERE MONTH = DATENAME(month, CAST(@MONTH + '-01-' + @YEAR AS DATE))
				AND YEAR = @YEAR
			)
	BEGIN
		INSERT INTO Employee_Payslip (
			Emp_No
			,Employee_Name
			,Month
			,Year
			,Basic
			,HRA
			,Special_Allowance
			,Prof_Dev
			,Medical_Allowance
			,Conveyance
			,Food_Allowance
			,Communication_Allowance
			,Petrol_Allowance
			,Driver_Allowance
			,Education_Allowance
			,Gross_Earnings
			,PF
			,Income_Tax
			,Professional_Tax
			,Meal_Pass
			,ESI
			,Paid_Days
			,Others
			,Total_Deduction
			,Net_Salary
			,Reimbursement
			)
		SELECT Employee_Id
			,CONCAT (
				Firstname
				,' '
				,Lastname
				) AS Employee_Name
			,DATENAME(month, CAST(@MONTH + '-01-' + @YEAR AS DATE)) AS [Month]
			,@YEAR AS [Year]
			,BASIC_PAY
			,HOUSE_RENT
			,SPECIAL_ALLOWANCE
			,0.00
			,MEDICAL_ALLOWANCE
			,CONVEYENCE
			,FOOD_ALLOWANCE
			,0.00 AS Communication_Allowance
			,0.00 AS Petrol_Allowance
			,0.00 AS Driver_Allowance
			,0.00 AS Education_Allowance
			,GROSS_EARNINGS
			,PF_DETECTION
			,INCOME_TAX
			,PROFESSIONAL_TAX
			,SUDEXO_DEDUCTION
			,ESI_DEDUCTION
			,PAID_DAYS
			,OTHER_DEDUCTIONS AS OTHER_DEDUCTIONS
			,(ISNULL(ESI_DEDUCTION, 0.00) + ISNULL(PF_DETECTION, 0.00) + ISNULL(PROFESSIONAL_TAX, 0.00) + ISNULL(SUDEXO_DEDUCTION, 0.00) + ISNULL(INCOME_TAX, 0.00) + ISNULL(OTHER_DEDUCTIONS, 0.00)) AS Total_Deductions
			,CTC_TOTAL
			,REEMBUSMENT_CHARGES
		FROM MTS_PAYROLL_MONTHLY_DETAILS_FOR_EMPLOYEE PME
		INNER JOIN EMPLOYEE E ON PME.EMP_ID = E.ID
		WHERE MONTH(PAYROLL_MONTH) = @MONTH
			AND YEAR(PAYROLL_MONTH) = @YEAR
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_PREV_BOUNS_DATE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_PREV_BOUNS_DATE] (
	@PrevBounsDate DATE
	,@USER_ID BIGINT
	)
AS
BEGIN
	DECLARE @ID BIGINT

	SELECT TOP 1 @ID = ID
	FROM MTS_PAYROLL_EMPLOYEE_EXIT_BONUS WITH (NOLOCK)
	ORDER BY ID DESC

	EXEC MTS_PAYROLL_AUDIT 1
		,@ID
		,@USER_ID

	UPDATE MTS_PAYROLL_EMPLOYEE_EXIT_BONUS
	SET PREVIOUS_BONUS_DATE = @PrevBounsDate
	WHERE ID = @ID
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_QUALIFICATION]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_QUALIFICATION] (
	@id BIGINT
	,@qualification VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT Qualification
			FROM MTS_Qualification WITH (NOLOCK)
			WHERE Qualification = @qualification
			)
	BEGIN
		UPDATE MTS_Qualification
		SET Qualification = @qualification
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_RELATIONSHIP]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_RELATIONSHIP] (
	@id BIGINT
	,@relationship VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT Relationship
			FROM Mts_Relationship WITH (NOLOCK)
			WHERE Relationship = @relationship
			)
	BEGIN
		UPDATE Mts_Relationship
		SET Relationship = @relationship
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_SESSION]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_SESSION] (
	@id BIGINT
	,@session VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT Session
			FROM Mts_Session WITH (NOLOCK)
			WHERE Session = @session
			)
	BEGIN
		UPDATE Mts_Session
		SET Session = @session
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_SKILLS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_SKILLS] (
	@id BIGINT
	,@skills VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT Skills
			FROM MTS_Skills WITH (NOLOCK)
			WHERE Skills = @skills
			)
	BEGIN
		UPDATE MTS_Skills
		SET Skills = @skills
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_UNASSIGN_ASSET]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_UNASSIGN_ASSET] @ASSET_TYPEID BIGINT
	,@ASSET_NAMEID BIGINT
	,@ASSETID BIGINT
	,@EMPLOYEEID BIGINT
	,@UNASSIGNED_DATE DATE
AS
BEGIN
	UPDATE ASSET_DETAILS
	SET CURRENTLY_ASSIGNED_TO = NULL
	WHERE ID = @ASSETID
END

BEGIN
	UPDATE ASSIGN_ASSET
	SET UNASSIGNED_DATE = @UNASSIGNED_DATE
	WHERE ASSET_TYPEID = @ASSET_TYPEID
		AND ASSET_NAMEID = @ASSET_NAMEID
		AND ITEM_CODE = @ASSETID
		AND EMPLOYEE_ID = @EMPLOYEEID
		AND UNASSIGNED_DATE IS NULL
END
GO

/****** Object:  StoredProcedure [dbo].[UPDATELOPDAYS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATELOPDAYS] (
	@empid BIGINT
	,@leavetype BIGINT
	,@month VARCHAR(255)
	,@year VARCHAR(255)
	,@lopdays FLOAT
	)
AS
BEGIN
	UPDATE LeaveReport
	SET LopDays = @lopdays
	WHERE Employee_id = @empid
		AND Month = @month
		AND year = @year
		AND LeaveType = @leavetype
END
GO

/****** Object:  StoredProcedure [dbo].[UPLOAD_ATTENDANCE_DATA]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPLOAD_ATTENDANCE_DATA] (
	@employeecode VARCHAR(10)
	,@employeename VARCHAR(50)
	,@InDeviceName VARCHAR(50)
	,@OutDeviceName VARCHAR(50)
	,@StatusCode NVARCHAR(50)
	,@Duration BIGINT NULL
	,@PunchRecords NVARCHAR(MAX)
	,@InDateTime DATETIME NULL
	,@OutDateTime DATETIME NULL
	,@Month DATETIME NULL
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM MTS_ATTENDANCE WITH (NOLOCK)
			WHERE EmployeeCode = @employeecode
				AND CAST(InDateTime AS DATE) = CAST(@InDateTime AS DATE)
				AND CAST(OutDateTime AS DATE) = CAST(@OutDateTime AS DATE)
			)
	BEGIN
		INSERT INTO MTS_ATTENDANCE (
			EmployeeCode
			,EmployeeName
			,InDeviceName
			,OutDeviceName
			,StatusCode
			,Duration
			,PunchRecords
			,InDateTime
			,OutDateTime
			,[Month]
			)
		VALUES (
			@employeecode
			,@employeename
			,@InDeviceName
			,@OutDeviceName
			,@StatusCode
			,@Duration
			,@PunchRecords
			,@InDateTime
			,@OutDateTime
			,@Month
			)
	END
END
GO

/****** Object:  StoredProcedure [dbo].[VALIDATE_APPROVAL_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VALIDATE_APPROVAL_DETAILS] (
	@PARAMETERS VARCHAR(100)
	,@MODULE BIGINT
	)
AS
BEGIN
	IF EXISTS (
			SELECT TOP 1 *
			FROM MTS_APPROVAL_DETAILS WITH (NOLOCK)
			WHERE MODULE = @MODULE
				AND [PARAMETERS] = @PARAMETERS
			ORDER BY ID DESC
			)
	BEGIN
		SELECT TOP 1 *
		FROM MTS_APPROVAL_DETAILS WITH (NOLOCK)
		WHERE MODULE = @MODULE
			AND [PARAMETERS] = @PARAMETERS
		ORDER BY ID DESC
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

/****** Object:  StoredProcedure [dbo].[VIEW_ASSETDETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[VIEW_ASSETDETAILS] (@aid BIGINT)
AS
BEGIN
	SELECT id
		,Name
		,Product
		,CategoryID
		,Make
		,Model
		,SerialNumber
		,PurchasedOn
		,LocationId
		,AssignedTo
		,DiscardedOn
		,Notes
		,BillDate
		,BillNumber
		,SaleCompany
		,InUse
	FROM MTS_AssetDetails WITH (NOLOCK)
	WHERE id = @aid
END
GO

/****** Object:  StoredProcedure [dbo].[VIEW_EACH_EMPLOYEE_ATTENDANCE_DETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VIEW_EACH_EMPLOYEE_ATTENDANCE_DETAILS] (@EMPID BIGINT)
AS
BEGIN
	--	PREVIOUS DAY ATTENDANCE DETAILS
	DECLARE @DEPT_ID BIGINT

	SELECT @DEPT_ID = MD.id
	FROM MTS_ATTENDANCE MA WITH (NOLOCK)
	LEFT JOIN EMPLOYEE E WITH (NOLOCK) ON MA.EmployeeCode = E.Employee_Id
	LEFT JOIN MTS_Department MD WITH (NOLOCK) ON E.DepartmentId = MD.id
	WHERE E.id = @EMPID

	IF EXISTS (
			SELECT *
			FROM MTS_ATTENDANCE MA WITH (NOLOCK)
			LEFT JOIN EMPLOYEE E WITH (NOLOCK) ON MA.EmployeeCode = E.Employee_Id
			LEFT JOIN MTS_Department MD WITH (NOLOCK) ON E.DepartmentId = MD.id
			WHERE E.id = @EMPID
				AND CONVERT(VARCHAR(10), InDateTime, 101) = CONVERT(VARCHAR(10), DATEADD(DAY, - 1, GETDATE()), 101)
			)
	BEGIN
		SELECT CONCAT (
				ISNULL(CASE 
						WHEN @DEPT_ID <> 2
							AND (
								FORMAT(DATEADD(DAY, - 1, GETDATE()), 'dddd') = 'Sunday'
								OR FORMAT(DATEADD(DAY, - 1, GETDATE()), 'dddd') = 'Saturday'
								OR CAST(DATEADD(DAY, - 1, GETDATE()) AS DATE) IN (
									SELECT CAST(DateOfHoliday AS DATE)
									FROM HolidaysList WITH (NOLOCK)
									)
								)
							THEN 0
						ELSE SUM(MA.DURATION) / 60
						END, 0)
				,' h '
				,ISNULL(CASE 
						WHEN @DEPT_ID <> 2
							AND (
								FORMAT(DATEADD(DAY, - 1, GETDATE()), 'dddd') = 'Sunday'
								OR FORMAT(DATEADD(DAY, - 1, GETDATE()), 'dddd') = 'Saturday'
								OR CAST(DATEADD(DAY, - 1, GETDATE()) AS DATE) IN (
									SELECT CAST(DateOfHoliday AS DATE)
									FROM HolidaysList WITH (NOLOCK)
									)
								)
							THEN 0
						ELSE SUM(MA.DURATION) % 60
						END, 0)
				,' m'
				) AS WorkedHours
			,CONCAT (
				ISNULL(CASE 
						WHEN @DEPT_ID <> 2
							AND (
								FORMAT(DATEADD(DAY, - 1, GETDATE()), 'dddd') = 'Sunday'
								OR FORMAT(DATEADD(DAY, - 1, GETDATE()), 'dddd') = 'Saturday'
								OR CAST(DATEADD(DAY, - 1, GETDATE()) AS DATE) IN (
									SELECT CAST(DateOfHoliday AS DATE)
									FROM HolidaysList WITH (NOLOCK)
									)
								)
							THEN 0
						ELSE COUNT(StatusCode) * 9
						END, 0)
				,' h'
				) AS ActualHours
			,CONCAT (
				ISNULL(CASE 
						WHEN @DEPT_ID <> 2
							AND (
								FORMAT(DATEADD(DAY, - 1, GETDATE()), 'dddd') = 'Sunday'
								OR FORMAT(DATEADD(DAY, - 1, GETDATE()), 'dddd') = 'Saturday'
								OR CAST(DATEADD(DAY, - 1, GETDATE()) AS DATE) IN (
									SELECT CAST(DateOfHoliday AS DATE)
									FROM HolidaysList WITH (NOLOCK)
									)
								)
							THEN 0
						ELSE (CONVERT(FLOAT, SUM(MA.DURATION))) * 100 / (CONVERT(FLOAT, COUNT(StatusCode)) * 9 * 60)
						END, 0)
				,'%'
				) AS Percentage
			,ISNULL(CASE 
					WHEN @DEPT_ID <> 2
						AND (
							FORMAT(DATEADD(DAY, - 1, GETDATE()), 'dddd') = 'Sunday'
							OR FORMAT(DATEADD(DAY, - 1, GETDATE()), 'dddd') = 'Saturday'
							OR CAST(DATEADD(DAY, - 1, GETDATE()) AS DATE) IN (
								SELECT CAST(DateOfHoliday AS DATE)
								FROM HolidaysList WITH (NOLOCK)
								)
							)
						THEN 0
					ELSE (CONVERT(FLOAT, SUM(MA.DURATION))) * 100 / (CONVERT(FLOAT, COUNT(StatusCode)) * 9 * 60)
					END, 0) AS [Percent]
		FROM MTS_ATTENDANCE MA WITH (NOLOCK)
		LEFT JOIN EMPLOYEE E WITH (NOLOCK) ON MA.EmployeeCode = E.Employee_Id
		LEFT JOIN MTS_Department MD WITH (NOLOCK) ON E.DepartmentId = MD.id
		WHERE E.id = @EMPID
			AND CONVERT(VARCHAR(10), InDateTime, 101) = CONVERT(VARCHAR(10), DATEADD(DAY, - 1, GETDATE()), 101)
	END
	ELSE
	BEGIN
		SELECT CONCAT (
				0
				,' h '
				,0
				,' m'
				) AS WorkedHours
			,CONCAT (
				0
				,' h'
				) AS ActualHours
			,CONCAT (
				0
				,'%'
				) AS Percentage
			,0 AS [Percent]
	END

	--	CURRENT WEEK ATTENDANCE DETAILS
	SELECT CONCAT (
			ISNULL(SUM(MA.DURATION) / 60, 0)
			,' h '
			,ISNULL(SUM(MA.DURATION) % 60, 0)
			,' m'
			) AS WorkedHours
		,CONCAT (
			ISNULL(COUNT(StatusCode) * 9, 0)
			,' h'
			) AS ActualHours
		,CONCAT (
			ISNULL(((CONVERT(FLOAT, SUM(MA.DURATION)))) * 100 / (CONVERT(FLOAT, COUNT(StatusCode)) * 9 * 60), 0)
			,'%'
			) AS Percentage
		,ISNULL(((CONVERT(FLOAT, SUM(MA.DURATION)))) * 100 / (CONVERT(FLOAT, COUNT(StatusCode)) * 9 * 60), 0) AS [Percent]
	FROM MTS_ATTENDANCE MA WITH (NOLOCK)
	LEFT JOIN EMPLOYEE E WITH (NOLOCK) ON MA.EmployeeCode = E.Employee_Id
	LEFT JOIN MTS_Department MD WITH (NOLOCK) ON E.DepartmentId = MD.id
	WHERE E.id = @EMPID
		AND StatusCode <> 'A'
		AND StatusCode <> 'WO'
		AND StatusCode <> 'WOP'
		AND MONTH(InDateTime) = MONTH(GETDATE())
		AND YEAR(InDateTime) = Year(GETDATE())
		AND (
			(
				E.DepartmentId <> 2
				AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(wk, DATEDIFF(wk, 1, GETDATE()), 0) AS DATE)
					AND CAST(DATEADD(wk, DATEDIFF(wk, 1, GETDATE()), 4) AS DATE)
				AND CAST(InDateTime AS DATE) NOT IN (
					SELECT CAST(DateOfHoliday AS DATE)
					FROM HolidaysList WITH (NOLOCK)
					)
				)
			OR (
				E.DepartmentId = 2
				AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(wk, DATEDIFF(wk, 1, GETDATE()), - 1) AS DATE)
					AND CAST(DATEADD(wk, DATEDIFF(wk, 1, GETDATE()), 5) AS DATE)
				)
			)

	--	CURRENT MONTH ATTENDANCE DETAILS
	SELECT CONCAT (
			ISNULL(SUM(MA.DURATION) / 60, 0)
			,' h '
			,ISNULL(SUM(MA.DURATION) % 60, 0)
			,' m'
			) AS WorkedHours
		,CONCAT (
			ISNULL(COUNT(StatusCode) * 9, 0)
			,' h'
			) AS ActualHours
		,CONCAT (
			ISNULL(((CONVERT(FLOAT, SUM(MA.DURATION)))) * 100 / (CONVERT(FLOAT, COUNT(StatusCode)) * 9 * 60), 0)
			,'%'
			) AS Percentage
		,ISNULL(((CONVERT(FLOAT, SUM(MA.DURATION)))) * 100 / (CONVERT(FLOAT, COUNT(StatusCode)) * 9 * 60), 0) AS [Percent]
	FROM MTS_ATTENDANCE MA WITH (NOLOCK)
	LEFT JOIN EMPLOYEE E WITH (NOLOCK) ON MA.EmployeeCode = E.Employee_Id
	LEFT JOIN MTS_Department MD WITH (NOLOCK) ON E.DepartmentId = MD.id
	WHERE E.id = @EMPID
		AND StatusCode <> 'A'
		AND StatusCode <> 'WO'
		AND StatusCode <> 'WOP'
		AND (
			(
				E.DepartmentId <> 2
				AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0) AS DATE)
					AND CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) + 1, - 1) AS DATE)
				AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
				AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
				AND CAST(InDateTime AS DATE) NOT IN (
					SELECT CAST(DateOfHoliday AS DATE)
					FROM HolidaysList WITH (NOLOCK)
					)
				)
			OR (
				E.DepartmentId = 2
				AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0) AS DATE)
					AND CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) + 1, - 1) AS DATE)
				)
			)

	-- (CURRENT MONTH - 1) ATTENDANCE DETAILS
	SELECT CONCAT (
			ISNULL(SUM(MA.DURATION) / 60, 0)
			,' h '
			,ISNULL(SUM(MA.DURATION) % 60, 0)
			,' m'
			) AS WorkedHours
		,CONCAT (
			ISNULL(COUNT(StatusCode) * 9, 0)
			,' h'
			) AS ActualHours
		,CONCAT (
			ISNULL(((CONVERT(FLOAT, SUM(MA.DURATION)))) * 100 / (CONVERT(FLOAT, COUNT(StatusCode)) * 9 * 60), 0)
			,'%'
			) AS Percentage
		,ISNULL(((CONVERT(FLOAT, SUM(MA.DURATION)))) * 100 / (CONVERT(FLOAT, COUNT(StatusCode)) * 9 * 60), 0) AS [Percent]
	FROM MTS_ATTENDANCE MA WITH (NOLOCK)
	LEFT JOIN EMPLOYEE E WITH (NOLOCK) ON MA.EmployeeCode = E.Employee_Id
	LEFT JOIN MTS_Department MD WITH (NOLOCK) ON E.DepartmentId = MD.id
	WHERE E.id = @EMPID
		AND StatusCode <> 'A'
		AND StatusCode <> 'WO'
		AND StatusCode <> 'WOP'
		AND (
			(
				E.DepartmentId <> 2
				AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 1, 0) AS DATE)
					AND CAST(EOMONTH(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 1, 0)) AS DATE)
				AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
				AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
				AND CAST(InDateTime AS DATE) NOT IN (
					SELECT CAST(DateOfHoliday AS DATE)
					FROM HolidaysList WITH (NOLOCK)
					)
				)
			OR (
				E.DepartmentId = 2
				AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 1, 0) AS DATE)
					AND CAST(EOMONTH(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 1, 0)) AS DATE)
				)
			)

	-- (CURRENT MONTH - 2) ATTENDANCE DETAILS
	SELECT CONCAT (
			ISNULL(SUM(MA.DURATION) / 60, 0)
			,' h '
			,ISNULL(SUM(MA.DURATION) % 60, 0)
			,' m'
			) AS WorkedHours
		,CONCAT (
			ISNULL(COUNT(StatusCode) * 9, 0)
			,' h'
			) AS ActualHours
		,CONCAT (
			ISNULL(((CONVERT(FLOAT, SUM(MA.DURATION)))) * 100 / (CONVERT(FLOAT, COUNT(StatusCode)) * 9 * 60), 0)
			,'%'
			) AS Percentage
		,ISNULL(((CONVERT(FLOAT, SUM(MA.DURATION)))) * 100 / (CONVERT(FLOAT, COUNT(StatusCode)) * 9 * 60), 0) AS [Percent]
	FROM MTS_ATTENDANCE MA WITH (NOLOCK)
	LEFT JOIN EMPLOYEE E WITH (NOLOCK) ON MA.EmployeeCode = E.Employee_Id
	LEFT JOIN MTS_Department MD WITH (NOLOCK) ON E.DepartmentId = MD.id
	WHERE E.id = @EMPID
		AND StatusCode <> 'A'
		AND StatusCode <> 'WO'
		AND StatusCode <> 'WOP'
		AND (
			(
				E.DepartmentId <> 2
				AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 2, 0) AS DATE)
					AND EOMONTH(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 2, 0))
				AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
				AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
				AND CAST(InDateTime AS DATE) NOT IN (
					SELECT CAST(DateOfHoliday AS DATE)
					FROM HolidaysList WITH (NOLOCK)
					)
				)
			OR (
				E.DepartmentId = 2
				AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 2, 0) AS DATE)
					AND CAST(EOMONTH(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 2, 0)) AS DATE)
				)
			)

	-- (CURRENT MONTH - 3) ATTENDANCE DETAILS
	SELECT CONCAT (
			ISNULL(SUM(MA.DURATION) / 60, 0)
			,' h '
			,ISNULL(SUM(MA.DURATION) % 60, 0)
			,' m'
			) AS WorkedHours
		,CONCAT (
			ISNULL(COUNT(StatusCode) * 9, 0)
			,' h'
			) AS ActualHours
		,CONCAT (
			ISNULL(((CONVERT(FLOAT, SUM(MA.DURATION)))) * 100 / (CONVERT(FLOAT, COUNT(StatusCode)) * 9 * 60), 0)
			,'%'
			) AS Percentage
		,ISNULL(((CONVERT(FLOAT, SUM(MA.DURATION)))) * 100 / (CONVERT(FLOAT, COUNT(StatusCode)) * 9 * 60), 0) AS [Percent]
	FROM MTS_ATTENDANCE MA WITH (NOLOCK)
	LEFT JOIN EMPLOYEE E WITH (NOLOCK) ON MA.EmployeeCode = E.Employee_Id
	LEFT JOIN MTS_Department MD WITH (NOLOCK) ON E.DepartmentId = MD.id
	WHERE E.id = @EMPID
		AND StatusCode <> 'A'
		AND StatusCode <> 'WO'
		AND StatusCode <> 'WOP'
		AND (
			(
				E.DepartmentId <> 2
				AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 3, 0) AS DATE)
					AND CAST(EOMONTH(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 3, 0)) AS DATE)
				AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
				AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
				AND CAST(InDateTime AS DATE) NOT IN (
					SELECT CAST(DateOfHoliday AS DATE)
					FROM HolidaysList WITH (NOLOCK)
					)
				)
			OR (
				E.DepartmentId = 2
				AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 3, 0) AS DATE)
					AND CAST(EOMONTH(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 3, 0)) AS DATE)
				)
			)

	-- (CURRENT MONTH - 4) ATTENDANCE DETAILS
	SELECT CONCAT (
			ISNULL(SUM(MA.DURATION) / 60, 0)
			,' h '
			,ISNULL(SUM(MA.DURATION) % 60, 0)
			,' m'
			) AS WorkedHours
		,CONCAT (
			ISNULL(COUNT(StatusCode) * 9, 0)
			,' h'
			) AS ActualHours
		,CONCAT (
			ISNULL(((CONVERT(FLOAT, SUM(MA.DURATION)))) * 100 / (CONVERT(FLOAT, COUNT(StatusCode)) * 9 * 60), 0)
			,'%'
			) AS Percentage
		,ISNULL(((CONVERT(FLOAT, SUM(MA.DURATION)))) * 100 / (CONVERT(FLOAT, COUNT(StatusCode)) * 9 * 60), 0) AS [Percent]
	FROM MTS_ATTENDANCE MA WITH (NOLOCK)
	LEFT JOIN EMPLOYEE E WITH (NOLOCK) ON MA.EmployeeCode = E.Employee_Id
	LEFT JOIN MTS_Department MD WITH (NOLOCK) ON E.DepartmentId = MD.id
	WHERE E.id = @EMPID
		AND StatusCode <> 'A'
		AND StatusCode <> 'WO'
		AND StatusCode <> 'WOP'
		AND (
			(
				E.DepartmentId <> 2
				AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 4, 0) AS DATE)
					AND CAST(EOMONTH(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 4, 0)) AS DATE)
				AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
				AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
				AND CAST(InDateTime AS DATE) NOT IN (
					SELECT CAST(DateOfHoliday AS DATE)
					FROM HolidaysList WITH (NOLOCK)
					)
				)
			OR (
				E.DepartmentId = 2
				AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 4, 0) AS DATE)
					AND CAST(EOMONTH(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 4, 0)) AS DATE)
				)
			)

	--Current month last updated date
	IF EXISTS (
			SELECT CONVERT(VARCHAR(20), InDateTime, 107) AS LAST_UPLOADED_DATE
			FROM MTS_ATTENDANCE MA WITH (NOLOCK)
			WHERE CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0) AS DATE)
					AND CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) + 1, - 1) AS DATE)
			)
	BEGIN
		SELECT TOP 1 CONVERT(VARCHAR(20), InDateTime, 107) AS LAST_UPLOADED_DATE
		FROM MTS_ATTENDANCE MA WITH (NOLOCK)
		WHERE CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0) AS DATE)
				AND CAST(DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) + 1, - 1) AS DATE)
		ORDER BY MA.InDateTime DESC
	END
	ELSE
	BEGIN
		SELECT 'No uploads' AS LAST_UPLOADED_DATE
	END
END
GO

/****** Object:  StoredProcedure [dbo].[VIEW_EMPLOYEEDETAILS]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VIEW_EMPLOYEEDETAILS] (@id BIGINT)
AS
BEGIN
	SELECT DISTINCT E.id
		,E.Firstname
		,D.Designation AS Designation
		,E.dateofbirth AS Dateofbirth
		,Dateofjoin
		,E.Email
		,MLOG.Active
		,MLOG.ResignedOn
		,E.Fathername
		,E.Spousename
		,E.Pancard
		,E.Mobile
		,E.DepartmentId
		,DEP.Department
		,ISNULL(E.FunctionalRole, 0) AS FunctionalRole
		,nat.Nationality
		,E.Aadhar
		,E.Lastname
		,E.Employee_Id
		,B.BloodGroup
		,Q.Qualification
		,marital.Marital_status
		,E.Gender
		,DATEDIFF(hour, E.Dateofbirth, GETDATE()) / 8766.0 AS AgeYearsDecimal
		,CONVERT(BIGINT, ROUND(DATEDIFF(hour, E.Dateofbirth, GETDATE()) / 8766.0, 0)) AS Employee_Age
		,Emd.BloodGroup
		,m.Relationship AS ContactRelationship
		,EC.Emergency_ContactName
		,EC.Emergency_ContactNumber
		,EC.Employee_Alternate_Mobile
		,EC.Personal_MailId AS PersonalMail
		,a.CurrentBuilding_Plot
		,a.CurrentCity
		,a.CurrentState
		,a.CurrentPincode
		,a.PermanentBuilding_Plot
		,a.PermanentCity
		,a.PermanentState
		,a.PermanentPincode
		,Es.Skill AS Skills
		,Emd.Languagename
		,Es.Certificationname
		,EEDU.Schoolname
		,Schoolpassedoutyear
		,EEDU.Collegename
		,Collegepassedoutyear
		,EEDU.Collegename
		,EEDU.Collegepassedoutyear
		,EEDU.Qualification
		,EBank.Bankname
		,EBank.Branchname
		,EBank.Accountnumber
		,EBank.Ifsc
		,ED.Dependentname
		,R.Relationship
		,ED.Dateofbirth AS RelDateofbirth
	FROM Employee AS E WITH (NOLOCK)
	FULL OUTER JOIN EmployeeDetails Emd WITH (NOLOCK) ON Emd.Employee_Id = E.id
	FULL OUTER JOIN Employee_Contacts Ec WITH (NOLOCK) ON Ec.Employee_Id = E.id
	FULL OUTER JOIN Employee_Educations EEDU WITH (NOLOCK) ON EEDU.Employee_Id = E.id
	FULL OUTER JOIN Employee_Languages EL WITH (NOLOCK) ON E.Employee_Id = EL.Employee_Id
	FULL OUTER JOIN Employee_Skills ES WITH (NOLOCK) ON ES.Employee_Id = E.id
	FULL OUTER JOIN Employee_Dependents ED WITH (NOLOCK) ON ED.Employee_Id = E.id
	FULL OUTER JOIN Employee_Address a WITH (NOLOCK) ON a.Employee_Id = E.id
	FULL OUTER JOIN MTS_Nationality nat WITH (NOLOCK) ON nat.id = E.Nationality
	FULL OUTER JOIN MTS_Qualification Q WITH (NOLOCK) ON Q.id = EEDU.Qualification
	FULL OUTER JOIN MTS_Languages L WITH (NOLOCK) ON L.id = Emd.id
	FULL OUTER JOIN Employee_BankDetails EBank WITH (NOLOCK) ON EBank.Employee_Id = E.id
	FULL OUTER JOIN Mts_Marital_status marital WITH (NOLOCK) ON marital.id = E.Maritalstatus
	FULL OUTER JOIN MTS_Designation D WITH (NOLOCK) ON D.id = E.Designation
	FULL OUTER JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
	FULL OUTER JOIN MTS_Relationship R WITH (NOLOCK) ON R.id = ED.Relationship
	FULL OUTER JOIN MTS_Relationship m WITH (NOLOCK) ON m.id = EC.Contact_Relationship
	FULL OUTER JOIN MTS_BloodGroup B WITH (NOLOCK) ON B.id = Emd.BloodGroup
	FULL OUTER JOIN MTS_LOGIN MLOG WITH (NOLOCK) ON MLOG.USERID = E.id
	WHERE E.id = @id

	SELECT DISTINCT *
	FROM EmployeeDetails AS Em WITH (NOLOCK)
	INNER JOIN MTS_Languages ml WITH (NOLOCK) ON Employee_Id = @id
	WHERE ml.id IN (
			SELECT cast(dropdowndata AS BIGINT)
			FROM function_string_to_table(Em.Languagename, ',')
			)

	SELECT DISTINCT *
	FROM Employee_Skills AS Es WITH (NOLOCK)
	INNER JOIN MTS_Skills ms WITH (NOLOCK) ON Employee_Id = @id
	WHERE ms.id IN (
			SELECT cast(dropdowndata AS BIGINT)
			FROM function_string_to_table(Es.Skill, ',')
			)
END
GO

/****** Object:  StoredProcedure [dbo].[VIEW_EMPLOYEELEAVELIST]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VIEW_EMPLOYEELEAVELIST] (@empid BIGINT)
AS
BEGIN
	SELECT Employee_Id
		,EL.id
		,MLT.id
		,Approval
		,AppliedDate
		,EL.FromDate AS 'FromDate'
		,EL.ToDate AS 'ToDate'
		,EL.Numberofdays
		,MLP.LEAVE_TYPE AS LeaveType
		,EL.Reason
		,YEAR(EL.FromDate) AS [Year]
	FROM Employee_Leave AS EL WITH (NOLOCK)
	LEFT JOIN MTS_LeaveType AS MLT WITH (NOLOCK) ON EL.LeaveType = MLT.id
	LEFT JOIN MTS_LeavePolicy MLP WITH (NOLOCK) ON MLT.Leavetype = MLP.LEAVE_CODE
	WHERE EL.Employee_Id = @empid
END
GO

/****** Object:  StoredProcedure [dbo].[VIEW_MODULE_PAGE]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VIEW_MODULE_PAGE] (
	@ACTIVITYID BIGINT
	,@MODULE BIGINT
	)
AS
BEGIN
	SELECT TOP 1 MAH.ACTIVITY_ID
		,MAD.MODULE AS MODULE_VALUE
		,MMP.MODULE
		,MAD.[PARAMETERS] AS PARAMETERS_VALUE
		,MMP.PAGE_URL
		,ISNULL(E.Firstname, 'No') + ' ' + ISNULL(E.Lastname, 'Data') AS EmployeeName
		,(
			SELECT TOP 1 VALUE
			FROM STRING_SPLIT(MAD.[PARAMETERS], ',')
			ORDER BY value DESC
			) AS MonthYear
	FROM MTS_APPROVAL_DETAILS MAD WITH (NOLOCK)
	LEFT JOIN MTS_MODULE_PARAMETERS MMP WITH (NOLOCK) ON MAD.MODULE = MMP.MODULE_ID
	LEFT JOIN MTS_APPROVAL_HEADER MAH WITH (NOLOCK) ON MAD.ACTIVITY_ID = MAH.ACTIVITY_ID
	LEFT JOIN EMPLOYEE E WITH (NOLOCK) ON MAH.EmployeeID = E.id
	WHERE MAH.ACTIVITY_ID = @ACTIVITYID
		AND MAD.MODULE = @MODULE
END
GO

/****** Object:  StoredProcedure [dbo].[XC_REPORT_TENANT_WISE_INVOICE_COUNT]    Script Date: 5/17/2020 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[XC_REPORT_TENANT_WISE_INVOICE_COUNT] (
	@FROMDATE DATETIME
	,@TODATE DATETIME
	)
AS
BEGIN
	SELECT '' AS CHECKBOX
		,XT.TENANT_NAME AS 'TENANT NAME'
		,XL.LOCATION_NAME AS 'LOCATION NAME'
		,XL.[LOCATIONADDRESS] AS 'ADDRESS'
		,XL.[CITY] AS 'CITY'
		,XL.[STATE] AS 'STATE'
		,XL.[ZIPCODE] AS 'ZIPCODE'
		,COUNT(INVOICE_UPLOAD_ID) AS 'INVOICE COUNT'
	FROM dbo.XC_INVOICE_UPLOAD XIU WITH (NOLOCK)
		,dbo.XC_LOCATION XL WITH (NOLOCK)
		,dbo.XC_TENANT XT WITH (NOLOCK)
	LEFT JOIN XC_DEMO_TENANT XD ON XT.TENANT_ID = XD.TENANT_ID
	WHERE UPLOADED_ON >= @FROMDATE
		AND UPLOADED_ON < @TODATE + 1
		AND XL.LOCATION_ID = XIU.LOCATION_ID
		AND XT.TENANT_ID = XIU.TENANT_ID
		AND XD.TENANT_ID IS NULL
		AND XIU.INVOICE_UPLOAD_STATUS <> 16
	GROUP BY XIU.TENANT_ID
		,XT.TENANT_NAME
		,XIU.LOCATION_ID
		,XL.LOCATION_NAME
		,XL.[LOCATIONADDRESS]
		,XL.[CITY]
		,XL.[STATE]
		,XL.[ZIPCODE]
	ORDER BY XT.TENANT_NAME
		,XL.LOCATION_NAME
END
GO


/****** Object:  StoredProcedure [dbo].[MTS_CALCULATELEAVE_EMPID_YEAR]    Script Date: 01/04/2021 12:31:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_CALCULATELEAVE_EMPID_YEAR] (@EMPLOYEEID BIGINT,@EMP_LEAVE_YEAR INT)  
AS  
BEGIN  
 DECLARE @LEAVE_CODE VARCHAR(5)  
  ,@ASSIGNED_AFTER BIGINT  
  ,@APPLICABLE_FOR BIGINT  
  ,@MARITAL_STATUS BIGINT 
  ,@EMP_JOINDATE DATE = EOMONTH(CAST(CAST(@EMP_LEAVE_YEAR AS VARCHAR) + '-01-01' AS DATE))
  ,@EMP_DEPARTMENT BIGINT  
  ,@EMP_GENDER BIGINT  
  ,@EMP_MARITALSTATUS BIGINT  
  ,@PRO_RATA BIT 
  ,@NumberOfMthPerYear BIGINT = 12
  ,@APPLICABLE_FOR_BOTH_GENDER INT = 3
  ,@APPLICABLE_FOR_BOTH_STATUS INT = 3
  
 SELECT @EMP_DEPARTMENT = DepartmentId  
  ,@EMP_GENDER = (  
   CASE   
    WHEN Gender = 0  
     THEN 1  
    WHEN Gender = 1  
     THEN 2  
    ELSE 3  
    END  
   )  
  ,@EMP_MARITALSTATUS = MaritalStatus  
 FROM Employee WITH (NOLOCK)  
 WHERE id = @EMPLOYEEID  
  
 DECLARE LEAVECALC_CURSOR CURSOR  
 FOR  
 SELECT LEAVE_CODE  
  ,ASSIGNED_AFTER  
  ,APPLICABLE_FOR  
  ,MARITAL_STATUS  
  ,PRORATA  
 FROM MTS_LeavePolicy WITH (NOLOCK)  
  
 OPEN LEAVECALC_CURSOR  
  
 FETCH NEXT  
 FROM LEAVECALC_CURSOR  
 INTO @LEAVE_CODE  
  ,@ASSIGNED_AFTER  
  ,@APPLICABLE_FOR  
  ,@MARITAL_STATUS  
  ,@PRO_RATA  
  
 WHILE @@FETCH_STATUS = 0  
 BEGIN
 IF EXISTS (  
    SELECT *  
    FROM MTS_LeaveType WITH (NOLOCK)  
    WHERE Leavetype = @LEAVE_CODE  
     AND DepartmentId = @EMP_DEPARTMENT  
    )  
  BEGIN  
	IF (@APPLICABLE_FOR = @EMP_GENDER OR @APPLICABLE_FOR = @APPLICABLE_FOR_BOTH_GENDER)  
    BEGIN  
     IF (@MARITAL_STATUS = @EMP_MARITALSTATUS OR @MARITAL_STATUS = @APPLICABLE_FOR_BOTH_STATUS)  
     BEGIN 
		 DECLARE @LT_ID INT, @NOD_LEAVE INT  
  
		  SELECT @LT_ID = ID ,@NOD_LEAVE = Numberofdays  
		  FROM MTS_LeaveType WITH (NOLOCK)  
		  WHERE Leavetype = @LEAVE_CODE AND DepartmentId = @EMP_DEPARTMENT
		  
			IF (@PRO_RATA = 1)  
			BEGIN
				IF (@ASSIGNED_AFTER <= (DATEDIFF(MONTH, @EMP_JOINDATE, getdate())))  
				BEGIN 
					IF NOT EXISTS ( SELECT *  
					   FROM EmployeeLeaveBalance WITH (NOLOCK)  
					   WHERE Employee_Id = @EMPLOYEEID  AND LeaveType = @LT_ID  AND Year = YEAR(@EMP_JOINDATE)  
					   )  
					BEGIN 
						DECLARE @TOTALNOD FLOAT

						SET @TOTALNOD = ROUND(((CONVERT(DECIMAL(18, 2), @NOD_LEAVE) / @NumberOfMthPerYear) * (@NumberOfMthPerYear - ((MONTH(@EMP_JOINDATE))-1))), 1) 

						INSERT INTO EmployeeLeaveBalance (Employee_Id, LeaveType, Leavebalance, AdvanceCredit, AdvanceAvailed, Year)  
						VALUES ( @EMPLOYEEID ,@LT_ID ,@TOTALNOD ,0 ,0 ,YEAR(@EMP_JOINDATE)) 
					END
				END
			END
			ELSE
			BEGIN			
				IF (@ASSIGNED_AFTER <= (DATEDIFF(MONTH, @EMP_JOINDATE, getdate())))  
				BEGIN 
					INSERT INTO EmployeeLeaveBalance (Employee_Id, LeaveType, Leavebalance, AdvanceCredit, AdvanceAvailed, Year)  
					VALUES ( @EMPLOYEEID ,@LT_ID ,@NOD_LEAVE ,0 ,0 ,YEAR(@EMP_JOINDATE)) 
				END
			END
		END
	END
  END
  FETCH NEXT  
  FROM LEAVECALC_CURSOR  
  INTO @LEAVE_CODE  
   ,@ASSIGNED_AFTER  
   ,@APPLICABLE_FOR  
   ,@MARITAL_STATUS  
   ,@PRO_RATA  
 END  
  
 CLOSE LEAVECALC_CURSOR  
  
 DEALLOCATE LEAVECALC_CURSOR  
END  
GO