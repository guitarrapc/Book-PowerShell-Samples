using System;

namespace CSharpManagedDll
{
    public class Class1
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public string Hello()
        {
            return $"Hello {Name}";
        }
    }
}