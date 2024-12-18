using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRM.BAL
{
    public class Utiils
    {
        public static int StringToIntDefault(string A_strNumber, int A_iDefault)
        {
            int Result = A_iDefault;
            try
            {
                Result = int.Parse(A_strNumber);
            }
            catch (Exception)
            {
            }
            return Result;
        }

    }
}