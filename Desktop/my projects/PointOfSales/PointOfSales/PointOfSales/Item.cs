using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PointOfSales
{
    class Item
    {
        public string name { get; set; }
        public int price { get; set; }
        public int quantity { get; set; }
        public string category { get; set; }

        public Item(String name,int price,String category)
        {
            this.name = name;
            this.price = price;
            this.category = category;
            this.quantity = 1;
        }
    }
}
