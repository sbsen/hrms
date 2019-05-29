using IntellaLend.Constance;
using IntellaLend.Model;
using MTSRuleEngine;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.RuleEngine
{
    public class LoanRuleEngine
    {
        #region Private Variables

        internal string TenantSchema;
        internal Batch batch;
        internal RuleEngineDataAccess ruleEngineDataAccess;
        internal Dictionary<long, string> loanDocTypes;
        internal Dictionary<long, long> stackingOrder;
        internal Dictionary<string, object> batchDocFields = new Dictionary<string, object>();
        internal MTSRules CheckListRules = new MTSRules();
        internal Dictionary<string, MTSRuleResult> output;
        internal List<Dictionary<string, string>> ls;
        internal List<object> ls2;
        internal Dictionary<string, string> dic;
        internal Int64 loanID;
        internal Dictionary<string, string> loanStackingDetails;

        #endregion

        #region Public Variables

        /// <summary>
        /// Get Loan Details
        /// </summary>
        public Loan loan;

        #endregion

        #region Constructor 

        public LoanRuleEngine(string tenantSchema, Int64 LoanId)
        {
            TenantSchema = tenantSchema;
            loanID = LoanId;
            ruleEngineDataAccess = new RuleEngineDataAccess(this.TenantSchema);
            loan = ruleEngineDataAccess.GetLoanDetails(LoanId);
            setClassProperties();
        }

        #endregion

        #region Public Properties
        /// <summary>
        /// To Check Loan PDF is Avaiable
        /// </summary>
        public bool IsLoanPDFGenerated
        {
            get
            {
                return ruleEngineDataAccess.GetLoanPDF(loanID);
            }
        }

        /// <summary>
        /// Returns Loan Stacking Order Details
        /// </summary>
        public Dictionary<string, string> LoanStackingDetails
        {
            get
            {
                return loanStackingDetails;
            }
        }


        /// <summary>
        /// Get Documents from Loan
        /// </summary>
        public List<object> batchDocTypes
        {
            get
            {
                //ls = new List<Dictionary<string, string>>();
                ls2 = new List<object>();
                //Dictionary<string, string> docName = null;
                List<DocumentTypeMaster> docTypes = ruleEngineDataAccess.GetCustLoanDocTypes(loan.CustomerID, loan.LoanTypeID);

                Dictionary<int, Dictionary<long, string>> dic = new Dictionary<int, Dictionary<long, string>>();
                Dictionary<long, string> docDic = new Dictionary<long, string>();
                List<DocumentObject> docObj = new List<DocumentObject>();

                foreach (Documents doc in batch.Documents)
                {
                    string displayName = ruleEngineDataAccess.GetDocumentTypeName(doc.DocumentTypeID);

                    //if DocID === 0 then wont displays on LoanInfo->Document List(Stacking Order) 
                    if (doc.DocumentTypeID != 0)
                    {
                        docObj.Add(new DocumentObject()
                        {
                            DocTypeID = doc.DocumentTypeID,
                            DocTypeName = displayName.Equals(string.Empty) ? doc.Type : displayName,
                            VersionNumber = doc.VersionNumber == 0 ? 1 : doc.VersionNumber
                        });

                        //docDic.Add(doc.DocumentTypeID, displayName.Equals(string.Empty) ? doc.Type : displayName);
                    }
                }

                var batchDocs = (from bDoc in docObj
                                 select new
                                 {
                                     DocID = bDoc.DocTypeID,
                                     DocName = bDoc.DocTypeName,
                                     DocumentLevel = 100,
                                     VersionNumber = bDoc.VersionNumber
                                 }).ToList();

                //var batchDocs = (from bDoc in dic
                //                 select new
                //                 {
                //                     DocID = bDoc.Key,
                //                     DocName = bDoc.Value,
                //                     DocumentLevel = 100                                     
                //                 }).ToList();

                var missingDoc = (from mDoc in GetMissingDocumentsInLoan
                                  join docTs in docTypes on Convert.ToInt64(mDoc["DocID"]) equals docTs.DocumentTypeID
                                  select new
                                  {
                                      DocID = Convert.ToInt64(mDoc["DocID"]),
                                      DocName = mDoc["DocName"],
                                      DocumentLevel = docTs.DocumentLevel,
                                      VersionNumber = 0
                                  }).ToList();

                var allDocTypes = batchDocs.Union(missingDoc).ToList();

                ls2 = (from bDoc in allDocTypes
                       join so in stackingOrder on bDoc.DocID equals so.Key into stackOrd
                       from sOrd in stackOrd.DefaultIfEmpty()
                       select new
                       {
                           DocID = bDoc.DocID.ToString(),
                           DocName = bDoc.DocName,
                           DocumentLevel = bDoc.DocumentLevel.Equals(100) ? "In Loan" : DocumentLevelConstant.GetDocumentLevelDescription(bDoc.DocumentLevel),
                           DocumentLevelIcon = bDoc.DocumentLevel.Equals(100) ? "Success" : DocumentLevelConstant.GetDocumentLevelIcons(bDoc.DocumentLevel),
                           DocumentLevelIconColor = bDoc.DocumentLevel.Equals(100) ? "Success" : DocumentLevelConstant.GetDocumentLevelIconColor(bDoc.DocumentLevel),
                           SequenceID = sOrd.Value,
                           VersionNumber = bDoc.VersionNumber
                       }).OrderByDescending(o => o.SequenceID != 0).ThenBy(o => o.SequenceID).ThenBy(o => o.VersionNumber).ToList<object>();

                return ls2;
            }
        }

        /// <summary>
        /// Get Missing Documents from Loan
        /// </summary>
        public List<Dictionary<string, string>> GetMissingDocumentsInLoan
        {
            get
            {
                ls = new List<Dictionary<string, string>>();
                dic = new Dictionary<string, string>();
                List<DocumentObject> _documentsInLoan = DocumentsInLoan;
                if (loanDocTypes != null && _documentsInLoan != null)
                    dic = loanDocTypes.Where(x => !(_documentsInLoan.Any(y => x.Key == y.DocTypeID))).ToDictionary(t => t.Key.ToString(), t => t.Value);

                Dictionary<string, string> docName = null;
                foreach (string key in dic.Keys)
                {
                    docName = new Dictionary<string, string>();
                    docName["DocID"] = key;
                    docName["DocName"] = dic[key];
                    docName["DocStatusDescription"] = string.Empty;
                    ls.Add(docName);
                }
                return ls;
            }
        }

        /// <summary>
        /// Get Missing Documents which is Uploaded
        /// </summary>
        public List<Dictionary<string, string>> GetMissingDocumentStatus
        {
            get
            {
                List<Dictionary<string, string>> newMissingDocuments = GetMissingDocumentsInLoan;
                ruleEngineDataAccess.GetMissingDocumentUploaded(ref newMissingDocuments, loanID);
                return newMissingDocuments;
            }
        }


        /// <summary>
        /// Get Additional Documents avaiable in Loan
        /// </summary>
        public List<Dictionary<string, string>> GetAdditionalDocumentsInLoan
        {
            get
            {
                ls = new List<Dictionary<string, string>>();
                dic = new Dictionary<string, string>();
                if (loanDocTypes != null && batchDocTypes != null)
                    dic = DocumentsInLoan.Where(x => !(loanDocTypes.Any(y => x.DocTypeID == y.Key))).ToDictionary(t => t.DocTypeID.ToString(), t => t.DocTypeName);

                Dictionary<string, string> docName = null;
                foreach (string key in dic.Keys)
                {
                    docName = new Dictionary<string, string>();
                    docName["DocID"] = key;
                    docName["DocName"] = dic[key];
                    ls.Add(docName);
                }
                return ls;
            }
        }

        /// <summary>
        /// Get Failed Checklist of the Loan
        /// </summary>
        public List<Dictionary<string, string>> GetFailedCheckList
        {
            get
            {
                ls = new List<Dictionary<string, string>>();
                dic = new Dictionary<string, string>();
                output = new Dictionary<string, MTSRuleResult>();
                output = CheckListRules.Eval(batchDocFields);
                foreach (string rule in output.Keys)
                {
                    if (!(Convert.ToBoolean(output[rule].Result)))
                    {
                        dic = new Dictionary<string, string>();
                        dic["CheckListName"] = rule;
                        dic["Formula"] = CheckListRules[rule];
                        dic["Expression"] = output[rule].Expressions;
                        dic["Result"] = output[rule].Result.ToString();
                        dic["Message"] = output[rule].Message.ToString();
                        ls.Add(dic);
                    }
                }
                return ls;
            }
        }

        /// <summary>
        /// Get Total Checklist Count
        /// </summary>
        public Int64 TotalCheckListCount
        {
            get
            {
                return CheckListRules.Count;
            }
        }


        /// <summary>
        /// Get All Checklist Result of the Loan
        /// </summary>
        public List<Dictionary<string, string>> GetAllCheckListDetails
        {
            get
            {
                ls = new List<Dictionary<string, string>>();
                dic = new Dictionary<string, string>();
                output = new Dictionary<string, MTSRuleResult>();
                output = CheckListRules.Eval(batchDocFields);
                foreach (string rule in output.Keys)
                {
                    dic["CheckListName"] = rule;
                    dic["Formula"] = CheckListRules[rule];
                    dic["Expression"] = output[rule].Expressions;
                    dic["Result"] = output[rule].Result.ToString();
                    dic["Message"] = output[rule].Message.ToString();
                    ls.Add(dic);
                }
                return ls;
            }
        }

        #endregion

        #region Private Properties

        private List<DocumentObject> DocumentsInLoan
        {
            get
            {
                List<DocumentObject> docObj = new List<DocumentObject>();

                foreach (Documents doc in batch.Documents)
                {
                    string displayName = ruleEngineDataAccess.GetDocumentTypeName(doc.DocumentTypeID);

                    if (doc.DocumentTypeID != 0)
                    {
                        docObj.Add(new DocumentObject()
                        {
                            DocTypeID = doc.DocumentTypeID,
                            DocTypeName = displayName.Equals(string.Empty) ? doc.Type : displayName,
                            VersionNumber = doc.VersionNumber
                        });
                    }
                }

                return docObj;


                //return batch.Documents.Select(b => new
                //{
                //    key = b.DocumentTypeID,
                //    value = b.Type                   
                //}).OrderBy(d => d.key).ToDictionary(d => d.key, d => d.value);
            }
        }

        private void setClassProperties()
        {
            if (loan != null)
            {
                batch = JsonConvert.DeserializeObject<Batch>(loan.LoanDetails.LoanObject);

                loanDocTypes = ruleEngineDataAccess.GetLoanDocTypes(loan.CustomerID, loan.LoanTypeID);

                CheckListRules = ruleEngineDataAccess.GetCheckList(loan.CustomerID, loan.ReviewTypeID, loan.LoanTypeID);

                stackingOrder = ruleEngineDataAccess.GetStackingOrder(loan.CustomerID, loan.ReviewTypeID, loan.LoanTypeID);

                loanStackingDetails = ruleEngineDataAccess.GetStackingOrderDetails(loan.CustomerID, loan.ReviewTypeID, loan.LoanTypeID);

                FormBatchDocFields();
            }
        }

        private void FormBatchDocFields()
        {
            string fieldName = string.Empty;
            string fieldValue = string.Empty;

            var batchDocs = from docs in batch.Documents
                            group docs by docs.DocumentTypeID into docGroup
                            select docGroup.OrderByDescending(p => p.VersionNumber).First();
            
            foreach (Documents doc in batchDocs)
            {
                if (doc.DocumentTypeID != 0)
                {
                    foreach (var docFields in doc.DocumentLevelFields)
                    {
                        fieldName = String.Format("{0}.{1}", doc.Type, docFields.Name);
                        fieldValue = string.IsNullOrEmpty(docFields.Value) ? string.Empty : docFields.Value;
                        batchDocFields.Add(fieldName, fieldValue);
                    }
                }
            }
        }

        #endregion
    }

    class DocumentObject
    {
        public Int64 DocTypeID { get; set; }
        public string DocTypeName { get; set; }
        public int VersionNumber { get; set; }
    }
}
