using System;
using System.IO;

namespace FileOutput
{
    class Program
    {
        static void Main(string[] args)
        {
            var inputStream = File.OpenRead(args[0]);
            var outputStream = Console.OpenStandardOutput();
            var bytes = new byte[256];
            var readLen = 0;
            while ((readLen = inputStream.Read(bytes, 0, bytes.Length)) != 0)
            {
                outputStream.Write(bytes, 0, readLen);
            }
        }
    }
}
