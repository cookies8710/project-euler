using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

namespace Problem26
{
    class Program
    {
        public class DivisionResult
        {
            public String IntegralPart { get; set; }
            public String DecimalPart { get; set; }
            public String RepeatedPart { get; set; }

            public override string ToString()
            {
                var result = String.Format("{0}.{1}{2}", IntegralPart, DecimalPart, !String.IsNullOrEmpty(RepeatedPart) ? String.Format("({0})", RepeatedPart) : "");
                return result;
            }
        }

        public static DivisionResult Divide(int divisor, int divider)
        {
            if(divider <= 0)
                throw new ArgumentException("divider");

            Console.WriteLine(String.Format("Computing {0}/{1}", divisor, divider));

            var result = new DivisionResult();

            var reminders = new Dictionary<Int32, Int32>();

            int integralPart = divisor/divider;
            result.IntegralPart = integralPart.ToString();
            int reminder = divisor % divider;

            int position = 0;
            while (reminder != 0 && String.IsNullOrEmpty(result.RepeatedPart))
            {
                reminders.Add(position, reminder);
                reminder *= 10;

                int n = reminder/divider;
                reminder = reminder%divider;
                result.DecimalPart += n.ToString();

                KeyValuePair<Int32, Int32> er = reminders.FirstOrDefault(x => x.Value == reminder);
                if (!er.Equals(default(KeyValuePair<int, int>)))
                {
                    result.RepeatedPart = result.DecimalPart.Substring(er.Key);
                    result.DecimalPart = result.DecimalPart.Substring(0, er.Key);
                }

                position++;
            }
            
            return result;
        }

        static void Main(string[] args)
        {
            var divs = Enumerable.Range(2, 999).Select(x => new {Divisor = x, Result = Divide(1, x)})
                .ToDictionary(x => x.Divisor, x => x.Result);

            divs.Values.ToList().ForEach(Console.WriteLine);

            var infrep = divs.Values.Where(x => !String.IsNullOrEmpty(x.RepeatedPart));
            var maxlen = infrep.Select(x => x.RepeatedPart.Length).Max();
            var ml = divs.Where(x => !String.IsNullOrEmpty(x.Value.RepeatedPart)).First(x => x.Value.RepeatedPart.Length == maxlen);

            Console.WriteLine(String.Format("Maxlen is {0} for 1/{1} - detail: {2}", maxlen, ml.Key, ml.Value));

            Console.ReadKey();
        }
    }
}
