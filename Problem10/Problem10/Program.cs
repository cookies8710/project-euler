using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Problem10
{
    class Program
    {
        static void Main(string[] args)
        {
            const int limit = 2000000;
            Dictionary<Int32, Boolean> primes = Enumerable.Range(2, limit-1).ToDictionary(x => x, _ => true);
            for (int j = 2; j <= limit; j++)
            {
                if (primes[j])
                {
                    for (int i = 2; i <= limit / j; i++)
                        primes[i*j] = false;
                }
            }

            Console.WriteLine(primes
                .Where(kv => kv.Value)
                .Select(kv => (Int64)kv.Key)
                .Sum());
                //.ToList()
                //.ForEach(x => Console.WriteLine(x));
            Console.ReadKey();
        }
    }
}
