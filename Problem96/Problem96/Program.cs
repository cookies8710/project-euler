using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace Problem96
{
    class Place
    {
        public Place()
        {
            AllowedNumbers = new List<int>();
        }

        public int Number { get; set; }
        public List<int> AllowedNumbers { get; set; }

        public override string ToString()
        {
            return Number.ToString();
        }
    }

    class Position
    {
        public int Column { get; set; }
        public int Row { get; set; }
    }

    class SudokuSolver
    {
        Dictionary<Position, Place> field;
      //  List<List<Place>> field;
        String name;
        public void Load(StreamReader stream)
        {
            name = stream.ReadLine();
            field = new Dictionary<Position, Place>(); // new List<List<Place>>();
            for (int i = 0; i < 9; i++)
            {
                var line = stream.ReadLine();
                field.Add(line.Select(x => new Place() { Number = x - '0' }).ToList());
            }
        }

        public void Print()
        {
            Console.WriteLine(name);
            field.ForEach(l => Console.WriteLine(
                l
                .Select(i => i.ToString())
                .Aggregate((a, b) => String.Format("{0} {1}", a, b))));

        }

        public void Solve()
        {
            // init
            field.ForEach(l => l.ForEach(x => { if (x.Number == 0) x.AllowedNumbers = Enumerable.Range(1, 9).ToList(); }));

        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            StreamReader sr = new StreamReader(@"C:\Users\cookie\Dropbox\Programming Seminar\Euler\Cookie\problem96data.txt");
            var ss = new SudokuSolver();
            ss.Load(sr);
            ss.Solve();
            ss.Print();
            sr.Close();

            Console.ReadKey();
        }
    }
}
