USE [MTSHRMS_Testing]
GO
/****** Object:  StoredProcedure [dbo].[Get_Employee_Ratings]    Script Date: 3/17/2020 01:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Get_Employee_Ratings] (
	@Empid BIGINT
	,@Appraisal_ID BIGINT
	,@isSelfDirectAppraisalPage BIT
	,@ViewStatus Bigint
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

		SELECT @STATUS = ISNULL(RT.Staging, 0)
		FROM MTS_APPRAISAL_PROCESS_DETAILS APD WITH (NOLOCK)
		INNER JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE RT WITH (NOLOCK) ON RT.Appraisal_Process_Period_Id = @Appraisal_ID
		WHERE APD.Active = 2
			AND RT.Employee_Id = @Empid
	END

	IF @isSelfDirectAppraisalPage = 1 
	BEGIN
		IF @STATUS = 0 --or @STATUS is null
		
		BEGIN
			SELECT MAERT.Id
				,MAERT.Employee_Id
				,MAERT.Appraisal_Process_Period_Id
				, Manager_Id
				--, Final_Evaluator_Id
				, Self_KRA_Rating
				--	,NULL AS Evaluator_KRA_Rating
				, Self_Skill_Rating
				--	,NULL AS Evaluator_Skill_Rating
				--	,NULL AS Final_Evaluator_KRA_Rating
				--	,NULL AS Final_Evaluator_Skill_Rating
				--	,NULL AS PERFORMANCE_RATING
				--	,NULL AS POTENTIAL_RATING
			--	, OVERALL_RATING
				, Self_Rating_Completion
				--	,NULL AS MAERT.Evaluator_Rating_Completion
				--	,NULL AS MAERT.Final_Rating_Completion
				--	,MAERT.FEEDBACK_CATEGORY
				,ISNULL(MAERT.Staging, 0) AS Staging1
			--	,ISNULL(PPR.RANK_DESCRIPTION,0) AS Performance
			--	,ISNULL(PPR1.RANK_DESCRIPTION,0) AS Potential
			--	,ISNULL(OPPR.RANK_DESCRIPTION,0) AS Overall_Rating
			FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE MAERT WITH (NOLOCK)
		--	INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR WITH (NOLOCK) ON MAERT.PERFORMANCE_RATING = PPR.ID
		--	INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR1 WITH (NOLOCK) ON MAERT.POTENTIAL_RATING = PPR1.ID
		--	INNER JOIN MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK) ON MAERT.OVERALL_RATING = OPPR.ID
			WHERE Employee_Id = @Empid
				AND MAERT.Appraisal_Process_Period_Id = @appraisal_process_period_id
		END

		IF @STATUS = 1
			OR @STATUS = 2
		BEGIN
			SELECT MAERT.Id
				,MAERT.Employee_Id
				,MAERT.Appraisal_Process_Period_Id
				,MAERT.Manager_Id
			--	,MAERT.Final_Evaluator_Id
				,MAERT.Self_KRA_Rating
				--	, MAERT.Evaluator_KRA_Rating
				,MAERT.Self_Skill_Rating
				--	, MAERT.Evaluator_Skill_Rating
				--	, MAERT.Final_Evaluator_KRA_Rating
				--	, MAERT.Final_Evaluator_Skill_Rating
				--	, MAERT.PERFORMANCE_RATING
				--, MAERT.POTENTIAL_RATING
				--	, MAERT.OVERALL_RATING
				,MAERT.Self_Rating_Completion
				--	,NULL AS MAERT.Evaluator_Rating_Completion
				--	,NULL AS MAERT.Final_Rating_Completion
				--	,MAERT.FEEDBACK_CATEGORY
				,ISNULL(MAERT.Staging, 0) AS Staging1
			--	,ISNULL(PPR.RANK_DESCRIPTION,0) AS Performance
			--	,ISNULL(PPR1.RANK_DESCRIPTION,0) AS Potential
			--	,ISNULL(OPPR.RANK_DESCRIPTION,0) AS Overall_Rating
			FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE MAERT WITH (NOLOCK)
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR WITH (NOLOCK) ON MAERT.PERFORMANCE_RATING = PPR.ID
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR1 WITH (NOLOCK) ON MAERT.POTENTIAL_RATING = PPR1.ID
			INNER JOIN MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK) ON MAERT.OVERALL_RATING = OPPR.ID
			WHERE MAERT.Employee_Id = @Empid
				AND MAERT.Appraisal_Process_Period_Id = @appraisal_process_period_id
		END

		IF @STATUS = 3
		BEGIN
			SELECT MAERT.Id
				,MAERT.Employee_Id
				,MAERT.Appraisal_Process_Period_Id
				,MAERT.Manager_Id
				,MAERT.Final_Evaluator_Id
				,MAERT.Self_KRA_Rating
			--	,MAERT.Evaluator_KRA_Rating
				,MAERT.Self_Skill_Rating
			--	,MAERT.Evaluator_Skill_Rating
				,MAERT.Final_Evaluator_KRA_Rating
				,MAERT.Final_Evaluator_Skill_Rating
				--	, MAERT.PERFORMANCE_RATING
				--, MAERT.POTENTIAL_RATING
				,MAERT.OVERALL_RATING 
				,MAERT.Self_Rating_Completion
				--	,NULL AS MAERT.Evaluator_Rating_Completion
				--	,NULL AS MAERT.Final_Rating_Completion
				--	,MAERT.FEEDBACK_CATEGORY
				,ISNULL(MAERT.Staging, 0) AS Staging1
				,ISNULL(PPR.RANK_DESCRIPTION,0) AS Performance
				,ISNULL(PPR1.RANK_DESCRIPTION,0) AS Potential
				,ISNULL(OPPR.RANK_DESCRIPTION,0) AS Overall_Rating
			FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE MAERT WITH (NOLOCK)
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR WITH (NOLOCK) ON MAERT.PERFORMANCE_RATING = PPR.ID
			INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR1 WITH (NOLOCK) ON MAERT.POTENTIAL_RATING = PPR1.ID
			INNER JOIN MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK) ON MAERT.OVERALL_RATING = OPPR.ID
			WHERE Employee_Id = @Empid
				AND MAERT.Appraisal_Process_Period_Id = @appraisal_process_period_id
		END


		--IF @STATUS=3 and @ROLEID<>1
		--BEGIN
		--	SELECT MAERT.Id
		--		,MAERT.Employee_Id
		--		,MAERT.Appraisal_Process_Period_Id
		--		,MAERT.Manager_Id
		--		,MAERT.Final_Evaluator_Id
		--		,MAERT.Self_KRA_Rating
		--		--,MAERT.Evaluator_KRA_Rating
		--		,MAERT.Self_Skill_Rating
		--		--,MAERT.Evaluator_Skill_Rating
		--		,MAERT.Final_Evaluator_KRA_Rating
		--		,MAERT.Final_Evaluator_Skill_Rating
		--		--	, MAERT.PERFORMANCE_RATING
		--		--, MAERT.POTENTIAL_RATING
		--		,MAERT.OVERALL_RATING 
		--		,MAERT.Self_Rating_Completion
		--		--	,NULL AS MAERT.Evaluator_Rating_Completion
		--		--	,NULL AS MAERT.Final_Rating_Completion
		--		--	,MAERT.FEEDBACK_CATEGORY
		--		,ISNULL(MAERT.Staging, 0) AS Staging1
		--		--,ISNULL(PPR.RANK_DESCRIPTION,0) AS Performance
		--		--,ISNULL(PPR1.RANK_DESCRIPTION,0) AS Potential
		--		,ISNULL(OPPR.RANK_DESCRIPTION,0) AS Overall_Rating
		--	FROM MTS_APPRAISAL_EMPLOYEE_RATING_TABLE MAERT WITH (NOLOCK)
		--	INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR WITH (NOLOCK) ON MAERT.PERFORMANCE_RATING = PPR.ID
		--	INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR1 WITH (NOLOCK) ON MAERT.POTENTIAL_RATING = PPR1.ID
		--	INNER JOIN MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH (NOLOCK) ON MAERT.OVERALL_RATING = OPPR.ID
		--	WHERE Employee_Id = @Empid
		--		AND MAERT.Appraisal_Process_Period_Id = @appraisal_process_period_id
		--END
	END

	IF @isSelfDirectAppraisalPage = 0
	BEGIN
		
		--ELSE IF @ROLEID <> 3 AND @ROLEID <> 1
		--BEGIN
		--	select MAERT.Id
		--		,MAERT.Employee_Id
		--		,MAERT.Appraisal_Process_Period_Id
		--		,MAERT.Manager_Id
		--		,MAERT.Final_Evaluator_Id
		--		,MAERT.Self_KRA_Rating
		--		,NULL AS Evaluator_KRA_Rating
		--		,MAERT.Self_Skill_Rating
		--		,NULL AS Evaluator_Skill_Rating
		--		,NULL AS Final_Evaluator_KRA_Rating
		--		,NULL AS Final_Evaluator_Skill_Rating
		--		,NULL AS PERFORMANCE_RATING
		--		,NULL AS POTENTIAL_RATING
		--		,NULL AS OVERALL_RATING
		--		,MAERT.Self_Rating_Completion
		--		,NULL AS Evaluator_Rating_Completion
		--		,'' Final_Rating_Completion
		--		,MAERT.FEEDBACK_CATEGORY
		--		,ISNULL(MAERT.Staging,0) AS Staging1
		--		,ISNULL(PPR.RANK_DESCRIPTION,0) AS Performance
		--		,ISNULL(PPR1.RANK_DESCRIPTION,0) AS Potential
		--		,ISNULL(OPPR.RANK_DESCRIPTION,0) AS Overall_Rating
		--		from MTS_APPRAISAL_EMPLOYEE_RATING_TABLE MAERT WITH(NOLOCK)
		--		INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR  WITH(NOLOCK) ON MAERT.PERFORMANCE_RATING = PPR.ID
		--		INNER JOIN MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION PPR1  WITH(NOLOCK) ON MAERT.POTENTIAL_RATING = PPR1.ID
		--		INNER JOIN MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION OPPR WITH(NOLOCK) ON MAERT.OVERALL_RATING = OPPR.ID
		--		WHERE Employee_Id=@Empid and MAERT.Appraisal_Process_Period_Id=@appraisal_process_period_id
		--END
		IF @STATUS = 3 and @ViewStatus = 1
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
				AND @CURRDATE BETWEEN ISNULL(MAERT.FINAL_RATING_COMPLETION,@CURRDATE) AND DATEADD(MONTH,1,ISNULL(MAERT.FINAL_RATING_COMPLETION,@CURRDATE))
		END

		IF @STATUS = 3 and @ViewStatus = 2
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

		IF @ViewStatus = 2 AND @STATUS < 3
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

	    IF @ViewStatus = 1 AND @STATUS < 3
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
				--	,NULL AS Final_Evaluator_KRA_Rating
				--	,NULL AS Final_Evaluator_Skill_Rating
				,NULL AS PERFORMANCE_RATING
				,NULL AS POTENTIAL_RATING
				,NULL AS OVERALL_RATING
				,MAERT.Self_Rating_Completion
				,MAERT.Evaluator_Rating_Completion
				--	,NULL Final_Rating_Completion
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
				--AND @CURRDATE BETWEEN ISNULL(MAERT.FINAL_RATING_COMPLETION,@CURRDATE) AND DATEADD(MONTH,1,ISNULL(MAERT.FINAL_RATING_COMPLETION,@CURRDATE))
		END
	END
END


