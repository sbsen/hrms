USE [MTSHRMS_Testing]
GO
/****** Object:  StoredProcedure [dbo].[Get_SelfAppraisal_TabName]    Script Date: 3/18/2020 07:33:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dbo].[Get_SelfAppraisal_TabName] (
	@emp_id BIGINT
	,@isSelfDirectAppraisalPage BIT
	,@viewStatus bigint     
	,@APPRAISAL_ID BIGINT
	)
AS
BEGIN
DECLARE @EMP_NAME VARCHAR(255),@EMP_CODE VARCHAR(20),@EMP_DESIGNATION VARCHAR(30),@APPRAISAL_DESCRIPTION NVARCHAR(MAX)		


DECLARE @appraisal_process_period_id BIGINT,@CURRDATE datetime=getdate();

	
	IF ISNULL(@APPRAISAL_ID, 0) = 0
	BEGIN
		SELECT @appraisal_process_period_id = APD.Id
	FROM MTS_APPRAISAL_PROCESS_DETAILS APD WITH(NOLOCK)
	INNER JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE RT WITH (NOLOCK) ON RT.Appraisal_Process_Period_Id = APD.Id
	WHERE APD.Active = 2 AND RT.Employee_Id=@emp_id
	END
	ELSE
	BEGIN
		SELECT @appraisal_process_period_id = @APPRAISAL_ID 
	END





	SELECT @EMP_CODE=emp.Employee_Id , @EMP_NAME = emp.Firstname+' '+emp.Lastname
		,@EMP_DESIGNATION=mts_desg.Designation,@APPRAISAL_DESCRIPTION=APD.Appraisal_Process_Period
	FROM Employee emp
	inner join MTS_Designation mts_desg WITH (NOLOCK) ON mts_desg.id=emp.Designation
	INNER JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE RT WITH (NOLOCK) ON RT.Employee_Id = emp.Id
	INNER JOIN MTS_APPRAISAL_PROCESS_DETAILS APD WITH(NOLOCK) ON APD.Id=RT.Appraisal_Process_Period_Id
	WHERE emp.id = @emp_id and RT.Appraisal_Process_Period_Id=@appraisal_process_period_id


	


	--SELECT @appraisal_process_period_id = APD.Id
	--FROM MTS_APPRAISAL_PROCESS_DETAILS APD WITH(NOLOCK)
	--INNER JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE RT WITH (NOLOCK) ON RT.Appraisal_Process_Period_Id = APD.Id
	--WHERE APD.Active = 2 AND RT.Employee_Id=@emp_id

	SELECT @EMP_NAME AS [EMP_NAME]
	,@EMP_CODE as EMP_CODE
	,@EMP_DESIGNATION AS EMP_DESIGNATION
	,@APPRAISAL_DESCRIPTION AS [APPRAISAL_DESCRIPTION]
	,AEP.[Employee_Id]
		,AEP.[PerformanceTypeID]
		,APT.[PerformanceType]
	FROM MTS_Appraisal_Employee_Mapping AEP  WITH(NOLOCK)
	INNER JOIN MTS_Appraisal_PerformanceType APT  WITH(NOLOCK) ON AEP.PerformanceTypeID = APT.Id
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
		--	,@currentDate datetime

	SELECT @employee_Id = AEP.[Employee_Id]
		,@performanceTypeID = AEP.[PerformanceTypeID]
		,@performanceType = APT.[PerformanceType]
	FROM MTS_Appraisal_Employee_Mapping AEP  WITH(NOLOCK)
	INNER JOIN MTS_Appraisal_PerformanceType APT  WITH(NOLOCK) ON AEP.PerformanceTypeID = APT.Id
	WHERE AEP.[Employee_Id] = @emp_id
	GROUP BY AEP.[Employee_Id]
		,AEP.[PerformanceTypeID]
		,APT.[PerformanceType]
	ORDER BY AEP.[PerformanceTypeID]


		SELECT @status = ISNULL(Staging,0)
		FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE  WITH(NOLOCK)
		WHERE Employee_Id = @emp_id

	IF @isSelfDirectAppraisalPage = 1
	BEGIN
	if(@status = 0 or @status<=2)
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
		FROM MTS_Appraisal_Employee_Mapping AEM  WITH(NOLOCK)
		INNER JOIN MTS_Appraisal_SkillKRAMapping ASM  WITH(NOLOCK) ON AEM.Description = ASM.Id
		LEFT JOIN MTS_APPRAISAL_EMPLOYEE_MANAGER_SUMMARY SUMM  WITH(NOLOCK) ON SUMM.Employee_Id = AEM.Employee_Id
			AND SUMM.Employee_Mapping_Id = AEM.Id
		LEFT JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt  WITH(NOLOCK) ON rt.Employee_Id = AEM.Employee_Id and rt.Appraisal_Process_Period_Id=AEM.Appraisal_Process_Period_Id
		WHERE AEM.[Employee_Id] = @emp_id 
			AND @CURRDATE BETWEEN ISNULL(RT.FINAL_RATING_COMPLETION,@CURRDATE) AND DATEADD(MONTH,1,ISNULL(RT.FINAL_RATING_COMPLETION,@CURRDATE))
			AND AEM.Appraisal_Process_Period_Id = @appraisal_process_period_id
		ORDER BY ASM.id
			,AEM.Id


			if(@status=3)
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
			FROM MTS_Appraisal_Employee_Mapping AEM  WITH(NOLOCK)
			INNER JOIN MTS_Appraisal_SkillKRAMapping ASM  WITH(NOLOCK)  ON AEM.Description = ASM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_MANAGER_SUMMARY SUMM WITH(NOLOCK) ON SUMM.Employee_Id = AEM.Employee_Id
				AND SUMM.Employee_Mapping_Id = AEM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt  WITH(NOLOCK) ON rt.Employee_Id = AEM.Employee_Id and rt.Appraisal_Process_Period_Id=AEM.Appraisal_Process_Period_Id
			WHERE AEM.[Employee_Id] = @emp_id
				AND AEM.Appraisal_Process_Period_Id = @appraisal_process_period_id 
				--and @currDate between isnull(rt.Final_Rating_Completion,@currDate) and dateadd(month,1,rt.Final_Rating_Completion)
				AND @CURRDATE BETWEEN ISNULL(RT.FINAL_RATING_COMPLETION,@CURRDATE) AND DATEADD(MONTH,1,ISNULL(RT.FINAL_RATING_COMPLETION,@CURRDATE))
			ORDER BY ASM.id
				,AEM.Id


	END

	IF @isSelfDirectAppraisalPage = 0
	BEGIN
	
	

		if(@viewStatus=1)
		begin
		--SELECT @manager_id = Manager_Id
		--FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
		--WHERE Employee_Id = @emp_id
		--SELECT @roleid = ROLEID
		--FROM MTS_AUTHORITY ma
		----left join Employee emp on emp.id = ma.USERID
		--WHERE ma.USERID = @manager_id
		select @roleid=3;
		end
		if(@viewStatus=2)
		begin
		--SELECT @moderator_id = Final_Evaluator_Id
		--FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE
		--WHERE Employee_Id = @emp_id
		--SELECT @roleid = ROLEID
		--FROM MTS_AUTHORITY ma
		----left join Employee emp on emp.id = ma.USERID
		--WHERE ma.USERID = @moderator_id
		select @roleid=1;

		end
		

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
				--,rt.FEEDBACK_CATEGORY
				,ISNULL(LOWER(SFC.FEEDBACK_CATEGORY),'') AS FEEDBACK_CATEGORY
			FROM MTS_Appraisal_Employee_Mapping AEM  WITH(NOLOCK)
			INNER JOIN MTS_Appraisal_SkillKRAMapping ASM  WITH(NOLOCK) ON AEM.Description = ASM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_MANAGER_SUMMARY SUMM  WITH(NOLOCK) ON SUMM.Employee_Id = AEM.Employee_Id
				AND SUMM.Employee_Mapping_Id = AEM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt  WITH(NOLOCK) ON rt.Employee_Id = AEM.Employee_Id and rt.Appraisal_Process_Period_Id=AEM.Appraisal_Process_Period_Id
			LEFT JOIN MTS_APPRAISAL_SUMMARY_FEEDBACK_CATEGORY SFC WITH(NOLOCK) ON rt.FEEDBACK_CATEGORY = SFC.FEEDBACK_CATEGORY_ID
			WHERE AEM.[Employee_Id] = @emp_id
				AND AEM.Appraisal_Process_Period_Id = @appraisal_process_period_id
			ORDER BY ASM.id
				,AEM.Id

		--if @roleid=2 or @roleid=4
		-- SELECT AEM.Id,AEM.[Employee_Id],AEM.[PerformanceTypeID],AEM.[Description] as DescriptionID,ASM.Description,AEM.[Weightage],AEM.[EmployeeWeightage],SUMM.Self_Summary, rt.Staging, SUMM.Created_Date FROM [MTSIN_HR_NEWDev].[dbo].[MTS_Appraisal_Employee_Mapping] AEM
		-- INNER JOIN [MTSIN_HR_NEWDev].[dbo].MTS_Appraisal_SkillKRAMapping ASM on AEM.Description = ASM.Id
		-- LEFT join MTS_APPRAISAL_EMPLOYEE_MANAGER_SUMMARY SUMM ON SUMM.Employee_Id = AEM.Employee_Id AND SUMM.Employee_Mapping_Id=AEM.Id
		-- left join MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt on rt.Employee_Id =  AEM.Employee_Id
		-- where AEM.[Employee_Id]=@emp_id and AEM.Appraisal_Process_Period_Id=@appraisal_process_period_id
		-- order by ASM.id,AEM.Id
		IF @roleid = 3 and @status<=2
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
				--,rt.FEEDBACK_CATEGORY
				,ISNULL(LOWER(SFC.FEEDBACK_CATEGORY), '') AS FEEDBACK_CATEGORY
			FROM MTS_Appraisal_Employee_Mapping AEM  WITH(NOLOCK)
			INNER JOIN MTS_Appraisal_SkillKRAMapping ASM  WITH(NOLOCK) ON AEM.Description = ASM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_MANAGER_SUMMARY SUMM WITH(NOLOCK) ON SUMM.Employee_Id = AEM.Employee_Id
				AND SUMM.Employee_Mapping_Id = AEM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt  WITH(NOLOCK) ON rt.Employee_Id = AEM.Employee_Id and rt.Appraisal_Process_Period_Id=AEM.Appraisal_Process_Period_Id
			LEFT JOIN MTS_APPRAISAL_SUMMARY_FEEDBACK_CATEGORY SFC WITH(NOLOCK) ON rt.FEEDBACK_CATEGORY = SFC.FEEDBACK_CATEGORY_ID
			WHERE AEM.[Employee_Id] = @emp_id
				AND AEM.Appraisal_Process_Period_Id = @appraisal_process_period_id 
				AND @CURRDATE BETWEEN ISNULL(RT.FINAL_RATING_COMPLETION,@CURRDATE) AND DATEADD(MONTH,1,ISNULL(RT.FINAL_RATING_COMPLETION,@CURRDATE))
				--and @currDate between isnull(rt.Final_Rating_Completion,@currDate) and dateadd(month,1,rt.Final_Rating_Completion)
			ORDER BY ASM.id
				,AEM.Id


		IF @roleid = 3 and @status=3
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
				--,rt.FEEDBACK_CATEGORY
				,ISNULL(LOWER(SFC.FEEDBACK_CATEGORY), '') AS FEEDBACK_CATEGORY
			FROM MTS_Appraisal_Employee_Mapping AEM WITH(NOLOCK)
			INNER JOIN MTS_Appraisal_SkillKRAMapping ASM WITH(NOLOCK) ON AEM.Description = ASM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_MANAGER_SUMMARY SUMM WITH(NOLOCK) ON SUMM.Employee_Id = AEM.Employee_Id
				AND SUMM.Employee_Mapping_Id = AEM.Id
			LEFT JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE rt WITH(NOLOCK) ON rt.Employee_Id = AEM.Employee_Id and rt.Appraisal_Process_Period_Id=AEM.Appraisal_Process_Period_Id
			LEFT JOIN MTS_APPRAISAL_SUMMARY_FEEDBACK_CATEGORY SFC WITH(NOLOCK) ON rt.FEEDBACK_CATEGORY = SFC.FEEDBACK_CATEGORY_ID
			WHERE AEM.[Employee_Id] = @emp_id
				AND AEM.Appraisal_Process_Period_Id = @appraisal_process_period_id 
				AND @CURRDATE BETWEEN ISNULL(RT.FINAL_RATING_COMPLETION,@CURRDATE) AND DATEADD(MONTH,1,ISNULL(RT.FINAL_RATING_COMPLETION,@CURRDATE))
				--and @currDate between isnull(rt.Final_Rating_Completion,@currDate) and dateadd(month,1,rt.Final_Rating_Completion)
			ORDER BY ASM.id
				,AEM.Id
	END
END



