using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Problem39
{
    internal class Triplet
    {
        public int a { get; set; }
        public int b { get; set; }
        public int c { get; set; }
        
        public int Perimeter {
            get { return a + b + c; }
        }
    }

    class Program
    {

        static void Main(string[] args)
        {
            Console.WriteLine("Olinka je zlatíčko");

            var triplets = new List<Triplet>();
            var intSquares = Enumerable.Range(1, 1000).ToDictionary(x => x*x, x => x);
            for (int a = 1; a < 500; a++)
            {
                for (int b = a; b < 500; b++)
                {
                    var cc = a*a + b*b;
                    if(intSquares.ContainsKey(cc))
                        triplets.Add(new Triplet() {a = a, b = b, c = intSquares[cc]});
                }
            }

            Console.WriteLine("Precomputed");

            var grouppedByPerimeter = triplets.GroupBy(x => x.Perimeter).ToDictionary(x => x.Key, x => x.ToList());
            var m = grouppedByPerimeter.Select(x => new { Perimeter = x.Key, Count = x.Value.Count });
            foreach (var gpkv in m)
            {
                Console.WriteLine("Perimeter {0} - N: {1}", gpkv.Perimeter, gpkv.Count);
            }
            Console.WriteLine("---------------------");
            var mc = m.Max(x => x.Count);
            var mp = grouppedByPerimeter.Values.First(x => x.Count == mc);
            Console.WriteLine("Max count ({1}) is for perimeter {0}:", mp.First().Perimeter, mc);
            foreach (var tri in mp)
            {
                Console.WriteLine("\t({0}, {1}, {2})", tri.a, tri.b, tri.c);
            }

            Console.ReadKey();
        }
    }
}
