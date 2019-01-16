using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Problem24
{
    class Solver
    {
        public Int64 Factorial(Int64 i)
        {
            if (i == 0)
                return 1;
            else
                return i * Factorial(i-1);
        }

        public List<Int64> ToFactorialFactors(Int64 n)
        {
            Int64 highest = 0;
            while (n > Factorial(highest))
                highest++;
            highest--;

            List<Int64> factors = new List<long>();
            Int64 reminder = n;
            for (int i = 0; i < highest; i++)
            {
                factors.Add(reminder/Factorial(highest-i));
                reminder -= factors.Last() * Factorial(highest - i);
            }

            return factors;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            var s = new Solver();
            var factors = s.ToFactorialFactors(999999);

            List<int> digits = new List<int>(Enumerable.Range(0, 10));
            foreach (var factor in factors)
            {
                int digit = digits[(int)factor];
                digits.Remove(digit);
                Console.Write(digit);
            }
            Console.WriteLine(digits.Last());

            Console.ReadKey();
        }
    }
}
