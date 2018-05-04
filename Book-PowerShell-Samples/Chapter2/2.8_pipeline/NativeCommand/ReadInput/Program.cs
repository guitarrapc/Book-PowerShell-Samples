using System;

namespace ReadInput
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Start");
            var stream = Console.OpenStandardInput();
            var bytes = new byte[256];
            var readLen = 0;
            while ((readLen = stream.Read(bytes, 0, bytes.Length)) != 0)
            {
                Console.WriteLine(readLen);
            }
            Console.WriteLine("End");
        }
    }
}
