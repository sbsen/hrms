using IntellaLend.Model;
using MTSEntityDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Audit
{
    public class LoanAudit
    {

        public static void InsertLoanAudit(DBConnect db, Loan loan, string auditDesc)
        {
            db.AuditLoan.Add(new AuditLoan()
            {
                AuditDescription = auditDesc,
                AuditDateTime = DateTime.Now,
                LoanID = loan.LoanID,
                ReviewTypeID = loan.ReviewTypeID,
                LoanTypeID = loan.LoanTypeID,
                CustomerID = loan.CustomerID,
                UploadedUserID = loan.UploadedUserID,
                LoggedUserID = loan.LoggedUserID,
                LoanCreatedOn = loan.CreatedOn,
                LoanLastModifiedOn = loan.ModifiedOn,
                FileName = loan.FileName,
                Status = loan.Status,
                SubStatus = loan.SubStatus,
                LoanNumber = loan.LoanNumber
            });

            db.SaveChanges();
        }

        public static void InsertLoanSearchAudit(DBConnect db, LoanSearch loanSearch, string auditDesc)
        {
            db.AuditLoanSearch.Add(new AuditLoanSearch()
            {
                LoanSearchID = loanSearch.ID,
                LoanID = loanSearch.LoanID,
                BorrowerName = loanSearch.BorrowerName,
                LoanAmount = loanSearch.LoanAmount,
                LoanNumber = loanSearch.LoanNumber,
                LoanTypeID = loanSearch.LoanTypeID,
                ReceivedDate = loanSearch.ReceivedDate,
                SSN = loanSearch.SSN,
                Status = loanSearch.Status,
                AuditDateTime = DateTime.Now,
                AuditDescription = auditDesc
            });

            db.SaveChanges();
        }

        public static void InsertLoanDetailsAudit(DBConnect db, LoanDetail loanDetails,Int64 UpdatedUserID, string auditDesc)
        {
            db.AuditLoanDetail.Add(new AuditLoanDetail()
            {
                AuditDescription = auditDesc,
                AuditDateTime = DateTime.Now,
                LoanID = loanDetails.LoanID,
                LoanDetailID = loanDetails.LoanDetailID,
                LoanObject = loanDetails.LoanObject,
                UpdatedUserID = UpdatedUserID
            });

            db.SaveChanges();
        }

        public static void InsertLoanMissingDocAudit(DBConnect db, Dictionary<string, object> missingDocAuditInfo, Int64 StatusID, string auditDesc)
        {
            if (missingDocAuditInfo.ContainsKey("LOANID") && missingDocAuditInfo.ContainsKey("DOCID") && missingDocAuditInfo.ContainsKey("USERID"))
            {
                db.AuditLoanMissingDoc.Add(new AuditLoanMissingDoc()
                {
                    AuditDescription = auditDesc,
                    AuditDateTime = DateTime.Now,
                    LoanID = Convert.ToInt64(missingDocAuditInfo["LOANID"]),
                    DocID = Convert.ToInt64(missingDocAuditInfo["DOCID"]),
                    UserID = Convert.ToInt64(missingDocAuditInfo["USERID"]),
                    FileName = Convert.ToString(missingDocAuditInfo["FILENAME"]),
                    Status = StatusID
                });

                db.SaveChanges();
            }
        }

    }
}
