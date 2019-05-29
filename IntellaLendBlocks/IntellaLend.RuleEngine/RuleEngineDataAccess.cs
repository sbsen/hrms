using IntellaLend.Constance;
using IntellaLend.Model;
using MTSEntityDataAccess;
using MTSRuleEngine;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.RuleEngine
{
    public class RuleEngineDataAccess
    {
        private string TenantSchema;

        public RuleEngineDataAccess(string tenantSchema)
        {
            TenantSchema = tenantSchema;
        }

        public Loan GetLoanDetails(Int64 LoanID)
        {
            Loan loan = null;
            using (var db = new DBConnect(TenantSchema))
            {
                loan = db.Loan.AsNoTracking().Where(l => l.LoanID == LoanID).FirstOrDefault();

                if (loan != null)
                {
                    loan.LoanDetails = db.LoanDetail.AsNoTracking().Where(ld => ld.LoanID == loan.LoanID).FirstOrDefault();
                    loan.AuditLoan = db.AuditLoan.AsNoTracking().Where(ld => ld.LoanID == loan.LoanID).ToList();
                }
            }

            return loan;
        }

        public Dictionary<long, string> GetLoanDocTypes(Int64 CustomerID, Int64 LoanTypeID)
        {
            Dictionary<long, string> docTypeID = new Dictionary<long, string>();

            using (var db = new DBConnect(TenantSchema))
            {
                List<CustLoanDocMapping> CustReviewLoanDocMapping = db.CustLoanDocMapping.AsNoTracking()
                    .Where(d => d.CustomerID == CustomerID && d.LoanTypeID == LoanTypeID).ToList();

                if (CustReviewLoanDocMapping != null)
                {
                    foreach (var item in CustReviewLoanDocMapping)
                    {
                        DocumentTypeMaster doc = db.DocumentTypeMaster.AsNoTracking().Where(dm => dm.DocumentTypeID == item.DocumentTypeID).FirstOrDefault();

                        docTypeID[doc.DocumentTypeID] = doc.DisplayName;
                    }

                    docTypeID = docTypeID.OrderBy(d => d.Key).ToDictionary(d => d.Key, d => d.Value);

                }
            }

            return docTypeID;
        }

        public List<DocumentTypeMaster> GetCustLoanDocTypes(Int64 CustomerID, Int64 LoanTypeID)
        {
            List<DocumentTypeMaster> docTypes = new List<DocumentTypeMaster>();

            using (var db = new DBConnect(TenantSchema))
            {
                List<CustLoanDocMapping> CustReviewLoanDocMapping = db.CustLoanDocMapping.AsNoTracking()
                    .Where(d => d.CustomerID == CustomerID && d.LoanTypeID == LoanTypeID).ToList();

                if (CustReviewLoanDocMapping != null)
                {
                    foreach (var item in CustReviewLoanDocMapping)
                    {
                        DocumentTypeMaster doc = db.DocumentTypeMaster.AsNoTracking().Where(dm => dm.DocumentTypeID == item.DocumentTypeID).FirstOrDefault();
                        docTypes.Add(doc);
                    }
                }
            }

            return docTypes;
        }

        public MTSRules GetCheckList(Int64 CustomerID, Int64 ReviewID, Int64 LoanTypeID)
        {
            MTSRules CheckListRules = new MTSRules();

            using (var db = new DBConnect(TenantSchema))
            {
                //CustLoanReviewCheckMapping CustReviewLoanCheckMapping = db.CustLoanReviewCheckMapping
                //    .Include(d => d.CheckListMaster)
                //        .ThenInclude(c => c.CheckListDetailMasters)                
                //    .Single(d => d.CustomerID == CustomerID && d.ReviewTypeID == ReviewID && d.LoanTypeID == LoanTypeID);

                var obj = (from map in db.CustReviewLoanCheckMapping
                           join cdm in db.CheckListDetailMaster on map.CheckListID equals cdm.CheckListID
                           join rm in db.RuleMaster on cdm.CheckListDetailID equals rm.CheckListDetailID
                           where map.CustomerID == CustomerID && map.ReviewTypeID == ReviewID && map.LoanTypeID == LoanTypeID && cdm.Active == true
                           select new
                           {
                               CheckListName = cdm.Name,
                               Rule = rm.RuleDescription
                           }).ToList();

                if (obj != null)
                {
                    foreach (var item in obj)
                    {
                        CheckListRules[item.CheckListName.ToString()] = item.Rule;
                    }
                }
            }

            return CheckListRules;
        }

        public Dictionary<long, long> GetStackingOrder(Int64 CustomerID, Int64 ReviewID, Int64 LoanTypeID)
        {
            Dictionary<long, long> StackingOrder = new Dictionary<long, long>();

            using (var db = new DBConnect(TenantSchema))
            {

                Int64? StackingGrpId = db.CustReviewLoanStackMapping.AsNoTracking().Where(map => map.CustomerID == CustomerID && map.ReviewTypeID == ReviewID && map.LoanTypeID == LoanTypeID).FirstOrDefault().StackingOrderID;

                if (StackingGrpId != null)
                    StackingOrder = db.StackingOrderDetailMaster.AsNoTracking().Where(s => s.StackingOrderID == StackingGrpId).OrderBy(s => s.SequenceID).ToDictionary(t => t.DocumentTypeID, t => t.SequenceID);
            }

            return StackingOrder;
        }

        public Dictionary<string, string> GetStackingOrderDetails(Int64 CustomerID, Int64 ReviewID, Int64 LoanTypeID)
        {
            Dictionary<string, string> StackingOrder = new Dictionary<string, string>();
            StackingOrder["StackingOrderID"] = string.Empty;
            StackingOrder["StackingOrderName"] = string.Empty;
            using (var db = new DBConnect(TenantSchema))
            {

                Int64? StackingGrpId = db.CustReviewLoanStackMapping.AsNoTracking().Where(map => map.CustomerID == CustomerID && map.ReviewTypeID == ReviewID && map.LoanTypeID == LoanTypeID).FirstOrDefault().StackingOrderID;

                if (StackingGrpId != null)
                {
                   StackingOrderMaster sm = db.StackingOrderMaster.AsNoTracking().Where(s => s.StackingOrderID == StackingGrpId).FirstOrDefault();
                    if (sm != null)
                    {
                        StackingOrder["StackingOrderID"] = sm.StackingOrderID.ToString();
                        StackingOrder["StackingOrderName"] = sm.Description;
                    }
                }
            }

            return StackingOrder;
        }

        public bool GetLoanPDF(Int64 LoanID)
        {
            using (var db = new DBConnect(TenantSchema))
            {
                LoanPDF loanPdf = db.LoanPDF.AsNoTracking().Where(l => l.LoanID == LoanID).FirstOrDefault();

                if (loanPdf != null)
                    return string.IsNullOrEmpty(loanPdf.LoanPDFPath);                          
            }
            return false;
        }

        public void GetMissingDocumentUploaded(ref List<Dictionary<string, string>> MissingDocumentsInLoan, Int64 LoanID)
        {
            using (var db = new DBConnect(TenantSchema))
            {
                foreach (var doc in MissingDocumentsInLoan)
                {
                    doc["DocMissingStatusID"] = "0";

                    Int64 DocID = Convert.ToInt64(doc["DocID"]);

                    AuditLoanMissingDoc auditMissingLoan = db.AuditLoanMissingDoc.AsNoTracking().Where(md => md.LoanID == LoanID && md.DocID == DocID).FirstOrDefault();

                    if (auditMissingLoan != null) {
                        doc["DocMissingStatusID"] = auditMissingLoan.Status.ToString();
                        doc["DocMissingStatusDescription"] = auditMissingLoan.Status != 0 ? StatusConstant.GetStatusDescription(auditMissingLoan.Status) : string.Empty;
                    }
                }
            }            
        }
        
        public string GetDocumentTypeName(Int64 DocumentTypeID)
        {
            using (var db = new DBConnect(TenantSchema))
            {
                DocumentTypeMaster doc = db.DocumentTypeMaster.AsNoTracking().Where(l => l.DocumentTypeID == DocumentTypeID).FirstOrDefault();

                if (doc != null)
                    return doc.DisplayName;
            }

            return string.Empty;
        }

    }
}
