using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Problem41
{
    class Program
    {
        private static bool Is1ToNPandigital(int i)
        {
            var s = i.ToString();
            return Enumerable.Range(1, s.Length).Select(x => (char)(x + '0')).All(s.Contains);
        }

        static void Main(string[] args)
        {
            // Muzu omezit okruh hledani na 7 a mene ciferne prvocisla (<10M), protoze 8 a 9 pandigitalni
            // cisla maji ciferny soucet 36, resp. 45, jsou tedy delitelne 3 a nejsou prvocisla

            var primeLimit = 10000000;
            var sieveLimit = Math.Ceiling(Math.Sqrt(primeLimit));
            var notPrimes = new Dictionary<int, Boolean>();
            for (int i = 2; i < sieveLimit; i++)
            {
                if (notPrimes.ContainsKey(i))
                    continue;
                int j = 2*i;
                while (j < primeLimit)
                {
                    notPrimes[j] = true;
                    j += i;
                }
            }

            var primes = Enumerable.Range(2, primeLimit - 2).Except(notPrimes.Keys).ToList();
            Console.WriteLine("The answer is {0}", primes.Last(Is1ToNPandigital));

            Console.ReadKey();
        }
    }
}
