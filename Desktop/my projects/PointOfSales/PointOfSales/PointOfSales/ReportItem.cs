using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PointOfSales
{
    class ReportItem
    {
        public string name { get; set; }
        public int value { get; set; }

        public ReportItem(String name, int value)
        {
            this.name = name;
            this.value = value;
        }
    
}
}
