using NCalc;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Runtime.Serialization;
using System.Security;
//using NCalc.Domain;
using System.Text.RegularExpressions;

namespace MTSRuleEngine
{
    #region Rule Exception
    public class RuleException : Exception
    {
        // Summary:
        //     Initializes a new instance of the System.Exception class.
        public RuleException()
        {

        }
        //
        // Summary:
        //     Initializes a new instance of the System.Exception class with a specified
        //     error message.
        //
        // Parameters:
        //   message:
        //     The message that describes the error.
        public RuleException(string message)
        {
        }
        //
        // Summary:
        //     Initializes a new instance of the System.Exception class with serialized
        //     data.
        //
        // Parameters:
        //   info:
        //     The System.Runtime.Serialization.SerializationInfo that holds the serialized
        //     object data about the exception being thrown.
        //
        //   context:
        //     The System.Runtime.Serialization.StreamingContext that contains contextual
        //     information about the source or destination.
        //
        // Exceptions:
        //   System.ArgumentNullException:
        //     The info parameter is null.
        //
        //   System.Runtime.Serialization.SerializationException:
        //     The class name is null or System.Exception.HResult is zero (0).
        [SecuritySafeCritical]
        protected RuleException(SerializationInfo info, StreamingContext context)
        {
        }
        //
        // Summary:
        //     Initializes a new instance of the System.Exception class with a specified
        //     error message and a reference to the inner exception that is the cause of
        //     this exception.
        //
        // Parameters:
        //   message:
        //     The error message that explains the reason for the exception.
        //
        //   innerException:
        //     The exception that is the cause of the current exception, or a null reference
        //     (Nothing in Visual Basic) if no inner exception is specified.
        public RuleException(string message, Exception innerException)
        {
        }

    }

    #endregion Rule Exception

    #region comment begin
    //public enum MTSRuleType
    //{
    //    Expression,
    //    Assign
    //}

    //public class MTSRule
    //{
    //    //public RuleType ruleType;
    //    public string Name;
    //    public string Expression;
    //    public string Value;
    //    public object Result;
    //    private MTSRule()
    //    {
    //    }
    //    public MTSRule(string name, string expression)
    //    {
    //        this.Name = name;
    //        this.Expression = expression;
    //    }
    //}


    //private void ExtractIdentifiers(LogicalExpression expression, List<string> identifiers)
    //{

    //    /*USAGE******

    //     *  List<string> identifiers = new List<string>();
    //        bool bHasErrors = e.HasErrors();
    //        if (!bHasErrors)
    //        {
    //            ExtractIdentifiers(e.ParsedExpression, identifiers);
    //        }
    //     */


    //    if (expression is UnaryExpression)
    //    {
    //        UnaryExpression ue = expression as UnaryExpression;

    //        ExtractIdentifiers(ue.Expression, identifiers);
    //    }
    //    else if (expression is BinaryExpression)
    //    {
    //        BinaryExpression be = expression as BinaryExpression;

    //        ExtractIdentifiers(be.LeftExpression, identifiers);
    //        ExtractIdentifiers(be.RightExpression, identifiers);
    //    }
    //    else if (expression is TernaryExpression)
    //    {
    //        TernaryExpression te = expression as TernaryExpression;

    //        ExtractIdentifiers(te.LeftExpression, identifiers);
    //        ExtractIdentifiers(te.MiddleExpression, identifiers);
    //        ExtractIdentifiers(te.RightExpression, identifiers);
    //    }
    //    else if (expression is FunctionExpression)
    //    {
    //        FunctionExpression fn = expression as FunctionExpression;

    //        LogicalExpression[] expressions = fn.Expressions;
    //        if (expressions != null && expressions.Length > 0)
    //        {
    //            for (int i = 0; i < expressions.Length; i++)
    //            {
    //                ExtractIdentifiers(expressions[i], identifiers);
    //            }
    //        }
    //    }
    //    else if (expression is IdentifierExpression)
    //    {
    //        IdentifierExpression identifier = expression as IdentifierExpression;

    //        if (!identifiers.Contains(identifier.Name))
    //        {
    //            identifiers.Add(identifier.Name);
    //        }
    //    }
    //}
    #endregion comment end

    #region PrameterHandler
    public delegate void MTSEvaluateParameterHandler(string name, MTSParameterArgs args);

    public class MTSParameterArgs : NCalc.ParameterArgs
    {

    }
    #endregion PrameterHandler

    #region class MTSRuleResult
    public class MTSRuleResult
    {
        public object Result;
        public string Expressions;
        public string Message;
        public override string ToString()
        {
            return Result.ToString();
        }
    }

    public class MTSRuleResults : Dictionary<string, MTSRuleResult>
    {
        public bool AnyRuleFailed()
        {
            bool result = true;
            foreach (var item in this)
            {
                if (Boolean.FalseString == item.Value.ToString())
                {
                    result = false;
                    break;
                }
            }
            return result;
        }
    }
    #endregion class MTSRuleResult


    public class MTSRules : Dictionary<string, string>
    {
        MTSRuleResults ruleResult = new MTSRuleResults();
        public MTSEvaluateParameterHandler EvaluateParameter;


        #region Utils
        private Expression getExpression(string expr)
        {
            expr = expr.Replace("'#", "#").Replace("#'", "#");
            Expression e = new Expression(expr, EvaluateOptions.IgnoreCase);
            e.EvaluateFunction += evalFunction;
            return e;
        }

        public static string getParsedExpression(Expression e)
        {
            string matchPattern = @"\[(.*?)\]";
            string reslt = e.ParsedExpression.ToString();
            MatchCollection parameters = Regex.Matches(reslt, matchPattern);

            foreach (Match m in parameters)
            {
                string key = m.Groups[1].ToString();
                if (e.Parameters.ContainsKey(key))
                {
                    reslt = reslt.Replace(string.Concat("[", m.Groups[1].ToString(), "]"), e.Parameters[key].ToString());
                }
            }

            return reslt;
        }


        #endregion Utils

        #region custom function Handler
        private void evalFunction(string name, FunctionArgs args)
        {
            double d = 0;
            switch (name.ToUpper())
            {
                case "ISEMPTY":
                    if (args.Parameters.Length < 1)
                        throw new ArgumentException("isEmpty() takes at least 1 arguments");
                    args.Result = string.IsNullOrEmpty(args.Parameters[0].ToString());
                    break;
                //case "STRINGCOMPARE":
                //    if (args.Parameters.Length < 2)
                //        throw new ArgumentException("Compare() takes at least 2 arguments");
                //    args.Result = string.Equals(args.Parameters[0].Evaluate().ToString(), args.Parameters[1].Evaluate().ToString(), StringComparison.OrdinalIgnoreCase);
                //    break;

                case "ISCONTAINS":
                    if (args.Parameters.Length < 2)
                        throw new ArgumentException("isContains() takes at least 2 arguments");
                    args.Result = args.Parameters[0].Evaluate().ToString().Split(',').Any(args.Parameters[0].Evaluate().ToString().Contains);
                    break;
                case "FORMAT":
                    if (args.Parameters.Length < 2)
                        throw new ArgumentException("format() takes at least 2 arguments");
                    args.Result = String.Format(args.Parameters[0].Evaluate().ToString(), args.Parameters[1].Evaluate().ToString());
                    break;
                case "TODAY":                    
                    try
                    {
                        if (args.Parameters.Length == 1)
                            d = Convert.ToDouble(args.Parameters[0].Evaluate());
                    }
                    catch (Exception)
                    {
                        throw new ArgumentException("today() arguments should be Integer or Double type");
                    }
                    //args.Result = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day).AddDays(d);
                    args.Result = DateTime.Now.Date.AddDays(d);

                    break;

                case "DATEDIF":                    
                    try
                    {
                        if (args.Parameters.Length == 2)
                        {

                            DateTime stDate = Convert.ToDateTime(args.Parameters[0].Evaluate());
                            DateTime edDate = Convert.ToDateTime(args.Parameters[1].Evaluate());

                            TimeSpan diff = edDate - stDate;

                            d = diff.TotalDays;
                        }
                    }
                    catch (Exception)
                    {
                        throw new ArgumentException("DATEDIF() arguments should be Integer or Double type");
                    }
                    //args.Result = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day).AddDays(d);
                    args.Result = d;

                    break;


                default:
                    break;
            }
        }

        #endregion custom function Handler

        #region Evals
        public MTSRuleResults Eval(MTSEvaluateParameterHandler parameterHandler)
        {
            EvaluateParameter = parameterHandler;
            ruleResult.Clear();
            foreach (var rule in this)
            {
                Expression e = getExpression(rule.Value);

                if (parameterHandler != null)
                {
                    e.EvaluateParameter += ParameterHandler;
                }
                try
                {
                    ruleResult.Add(rule.Key, new MTSRuleResult { Result = e.Evaluate() });
                }
                catch (Exception ex)
                {
                    ruleResult.Add(rule.Key, new MTSRuleResult { Result = "Error", Expressions = string.Format("Error Rule Failed Expression:{0} Message:{1} ", getParsedExpression(e), ex.Message) });
                }
            }
            return ruleResult;
        }


        private Dictionary<string, object> ValidateParams(Dictionary<string, object> parameters)
        {
            Dictionary<string, object> copyparameters = new Dictionary<string, object>(parameters, StringComparer.OrdinalIgnoreCase);
            foreach (var item in copyparameters.ToArray())
            {
                Double d;
                DateTime date;
                if (item.Value == null)
                {
                    copyparameters[item.Key] = string.Empty;
                }
                //else if (Double.TryParse(item.Value.ToString(), out d))
                //{
                //    copyparameters[item.Key] = d;
                //}
                else if (Double.TryParse(item.Value.ToString(), NumberStyles.AllowCurrencySymbol | NumberStyles.AllowDecimalPoint | NumberStyles.AllowThousands, new CultureInfo("en-US"), out d))
                {
                    copyparameters[item.Key] = d;
                }
                else if (DateTime.TryParse(item.Value.ToString(), out date))
                {
                    copyparameters[item.Key] = date;
                }
            }
            return copyparameters;

        }

        public MTSRuleResults Eval(Dictionary<string, object> parameters)
        {

            ruleResult.Clear();
            Dictionary<string, object> param = ValidateParams(parameters);
            foreach (var rule in this)
            {
                Expression e = getExpression(rule.Value);
                e.Parameters = param;
                try
                {
                    ruleResult.Add(rule.Key, new MTSRuleResult { Result = e.Evaluate(), Expressions = getParsedExpression(e), Message = string.Empty });

                }
                catch (Exception ex)
                {
                    ruleResult.Add(rule.Key, new MTSRuleResult { Result = false, Expressions = string.Format("{0}", rule.Value), Message = ex.Message });
                    //ruleResult.Add(rule.Key, new MTSRuleResult { Result = "Error", Expressions = string.Format("Error Rule Failed Expression:'{0}' Message:{1} Errors{2}", rule.Value, ex.Message, e.Error) });
                }
            }

            return ruleResult;
        }

        //public MTSRuleResults EvalAsString(Dictionary<string, object> parameters)
        //{
        //    Dictionary<string, object> validparams = ValidateParams(parameters);
        //    Dictionary<string, string> customfunction = new Dictionary<string, string>();

        //    ruleResult.Clear();
        //    string matchPattern = @"\[(.*?)\]";
        //    MatchCollection mc;

        //    foreach (var rule in this)
        //    {
        //        string reslt = rule.Value;
        //        //Remove Custom functions*******************
        //        foreach (var item in customFunctions)
        //        {
        //            mc = Regex.Matches(reslt, item, RegexOptions.IgnoreCase);
        //            foreach (Match m in mc)
        //            {
        //                string guid = Guid.NewGuid().ToString();
        //                customfunction.Add(guid, m.Groups[0].ToString());
        //                reslt = reslt.Replace(m.Groups[0].ToString(), guid);
        //            }

        //        }

        //        //Replace parametesrr
        //        mc = Regex.Matches(reslt, matchPattern);
        //        foreach (Match m in mc)
        //        {
        //            if (validparams[m.Groups[1].ToString()].ToString().Trim() != string.Empty)
        //            {
        //                reslt = reslt.Replace(string.Concat("[", m.Groups[1].ToString(), "]"), validparams[m.Groups[1].ToString()].ToString());
        //            }

        //        }
        //        //Add Custom functions back ;-)****************************

        //        foreach (var item in customfunction)
        //        {
        //            reslt = reslt.Replace(item.Key, item.Value);
        //        }

        //        Expression e = getExpression(reslt);
        //        e.Parameters = validparams;
        //        try
        //        {
        //            ruleResult.Add(rule.Key, new MTSRuleResult { Result = e.Evaluate(), Expressions = getPassedExpression(e) });
        //        }
        //        catch (Exception ex)
        //        {

        //            ruleResult.Add(rule.Key, new MTSRuleResult { Result = "Error", Expressions = string.Format("Error Rule Failed Expression:{0} Message:{1} ", getPassedExpression(e), ex.Message) });
        //        }
        //    }

        //    return ruleResult;
        //}
        #endregion Evals


        #region PrameterHandler
        public void ParameterHandler(string name, ParameterArgs args)
        {
            if (EvaluateParameter != null)
            {
                MTSParameterArgs mArgs = new MTSParameterArgs();
                EvaluateParameter(name, mArgs);
                args.Result = mArgs.Result;
            }
        }
        #endregion PrameterHandler

    }
}
