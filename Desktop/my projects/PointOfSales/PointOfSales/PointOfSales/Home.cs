using Microsoft.VisualBasic.FileIO;
using System;
using Microsoft.VisualBasic;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Collections;

namespace PointOfSales
{
    //Pratik Khadka

    public partial class Home : Form
    {
        int row = 0;
        List<Item> menuList = new List<Item>();
        List<Item> orderList = new List<Item>();

        List<ReportItem> reportItemList = new List<ReportItem>();



        public Home()
        {
            InitializeComponent();
            cbCategory.SelectedIndex = 0;
            
        }

        private void btnAddItem_Click(object sender, EventArgs e)
        {
            //adding items
            string name = tbName.Text;
            string price = tbPrice.Text;
            string category = (string)cbCategory.SelectedItem;

            string status;
            if (!containsInMenu(name))
            {
                menuList.Add(new PointOfSales.Item(name, Convert.ToInt32(price), category));
                MessageBox.Show("Record of " + name + " has been created:");
                refreshMenu();
            }
            else
            {
                MessageBox.Show("Not Available:", "Item with the name: "+name+" already exists.");
            }
        }

        private void btnImportCSV_Click(object sender, EventArgs e)
        {
           //importing CSV file
            try
            {
                OpenFileDialog fd = new OpenFileDialog();
                fd.ShowDialog();
                TextFieldParser csvParser = new TextFieldParser(fd.FileName);
                csvParser.SetDelimiters(new string[] { "," });
                csvParser.HasFieldsEnclosedInQuotes = true;

                // Skip the row with the column names
                csvParser.ReadLine();

                while (!csvParser.EndOfData)
                {
                    // Read current line fields, pointer moves to the next line.
                    string[] fields = csvParser.ReadFields();
                    menuList.Add(new Item(fields[0],Convert.ToInt32(fields[2]),fields[1]));
                }
            } catch
            {

            }
            refreshMenu();

        }

        private void refreshMenu()
        {
            menuGridView.Rows.Clear();

            for (int i = 0; i < menuList.Count; i++)
            {
                int count = menuGridView.Rows.Count;
                menuGridView.Rows.Add();
                menuGridView.Rows[count].Cells[0].Value = menuList[i].name;
                menuGridView.Rows[count].Cells[1].Value = menuList[i].category;
                menuGridView.Rows[count].Cells[2].Value = menuList[i].price;
            }

        }

        private Boolean containsInMenu(String text)
        {
            //checking the items in menulist
            for(int i=0;i<menuList.Count;i++)
            {
                if(menuList[i].name.Equals(text))
                {
                    return true;
                }
            }
            return false;
        }



        private void refreshOrder()
        {
            //
            orderGridView.Rows.Clear();
            for (int i = 0; i < orderList.Count; i++)
            {
                int count = orderGridView.Rows.Count-1;
                orderGridView.Rows.Add();
                orderGridView.Rows[count].Cells[0].Value = orderList[i].name;
                orderGridView.Rows[count].Cells[3].Value = orderList[i].category;
                orderGridView.Rows[count].Cells[2].Value = orderList[i].price;
                orderGridView.Rows[count].Cells[1].Value = orderList[i].quantity;
            }
            calculateTotal();

        }

        private Boolean containsInOrder(String text)
        {
            //check item in orderlist
            for (int i = 0; i < orderList.Count; i++)
            {
                if (orderList[i].name.Equals(text))
                {
                    return true;
                }
            }
            return false;
        }

        private Boolean containsInReport(String text)
        {
            //checking items in report arraylist
            for (int i = 0; i < reportItemList.Count; i++)
            {
                if (reportItemList[i].name.Equals(text))
                {
                    return true;
                }
            }
            return false;
        }

        private void orderGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 4)
            {
                String newValue = Interaction.InputBox("New Value of the quantity?", "Change the quantity", orderGridView.Rows[e.RowIndex].Cells[1].Value.ToString());
                // String newValue = Interaction.InputBox("New Value of the quantity?", "Change the quantity", orderList[e.RowIndex].price.ToString);
                orderGridView.Rows[e.RowIndex].Cells[1].Value = newValue;
                orderList[e.RowIndex].quantity = Convert.ToInt32(newValue);
                calculateTotal();
            }
            else if (e.ColumnIndex == 5)
            {
                DialogResult = MessageBox.Show("Are you sure you want to delete?", "Delete Item", MessageBoxButtons.OKCancel);
                if (DialogResult == DialogResult.OK)
                {
                    orderGridView.Rows.RemoveAt(e.RowIndex);
                    orderList.RemoveAt(e.RowIndex);
                    calculateTotal();

                }

            }
        }

        private void menuGridView_CellContentDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                if (orderList.Contains(menuList[e.RowIndex]))
                {
                    int index = orderList.IndexOf(menuList[e.RowIndex]);
                    orderGridView.Rows[e.RowIndex].Cells[1].Value = Convert.ToInt32(orderGridView.Rows[e.RowIndex].Cells[1].Value.ToString()) + 1;
                    orderList[index].quantity += 1;
                    refreshOrder();
                }
                else
                {
                    orderList.Add(menuList[e.RowIndex]);
                    refreshOrder();
                }

            }
        }

        private void btnSortByName_Click(object sender, EventArgs e)
        {
            //bubble sorting algorithms
            bubbleSortNameColumn();
        }

        public void bubbleSortNameColumn() 
        {
            //bubble sorting algorithms

            bool swap;
            string tempName; 
            string tempPrice; 
            string tempCategory; 

            do
            {
                swap = false;
                for (int index = 0; index < (menuGridView.Rows.Count - 1); index++)
                {

                    if (string.Compare(menuGridView.Rows[index].Cells["menuNameColumn"].Value.ToString(), menuGridView.Rows[index + 1].Cells["menuNameColumn"].Value.ToString()) > 0)
                    {
                        tempName = menuGridView.Rows[index].Cells["menuNameColumn"].Value.ToString();
                        tempPrice = menuGridView.Rows[index].Cells["menuPriceColumn"].Value.ToString();
                        tempCategory = menuGridView.Rows[index].Cells["menuCategoryColumn"].Value.ToString();

                        menuGridView.Rows[index].Cells["menuNameColumn"].Value = menuGridView.Rows[index + 1].Cells["menuNameColumn"].Value.ToString();
                        menuGridView.Rows[index].Cells["menuPriceColumn"].Value = menuGridView.Rows[index + 1].Cells["menuPriceColumn"].Value.ToString();
                        menuGridView.Rows[index].Cells["menuCategoryColumn"].Value = menuGridView.Rows[index + 1].Cells["menuCategoryColumn"].Value.ToString();

                        menuGridView.Rows[index + 1].Cells["menuNameColumn"].Value = tempName;
                        menuGridView.Rows[index + 1].Cells["menuPriceColumn"].Value = tempPrice;
                        menuGridView.Rows[index + 1].Cells["menuCategoryColumn"].Value = tempCategory;

                        swap = true;
                    }
                }

            } while (swap == true);
        }

        public void bubbleSortPriceColumn()
        {
            //bubble sorting algorithms

            bool swap;
            string tempName; 
            string tempPrice; 
            string tempCategory; 


            do
            {
                swap = false;
                for (int index = 0; index < (menuGridView.Rows.Count - 1); index++)
                {
                    if (Convert.ToInt32(menuGridView.Rows[index].Cells["menuPriceColumn"].Value.ToString()) > Convert.ToInt32(menuGridView.Rows[index + 1].Cells["menuPriceColumn"].Value.ToString()))
                    {
                        tempName = menuGridView.Rows[index].Cells["menuNameColumn"].Value.ToString();
                        tempPrice = menuGridView.Rows[index].Cells["menuPriceColumn"].Value.ToString();
                        tempCategory = menuGridView.Rows[index].Cells["menuCategoryColumn"].Value.ToString();

                        menuGridView.Rows[index].Cells["menuNameColumn"].Value = menuGridView.Rows[index + 1].Cells["menuNameColumn"].Value.ToString();
                        menuGridView.Rows[index].Cells["menuPriceColumn"].Value = menuGridView.Rows[index + 1].Cells["menuPriceColumn"].Value.ToString();
                        menuGridView.Rows[index].Cells["menuCategoryColumn"].Value = menuGridView.Rows[index + 1].Cells["menuCategoryColumn"].Value.ToString();

                        menuGridView.Rows[index + 1].Cells["menuNameColumn"].Value = tempName;
                        menuGridView.Rows[index + 1].Cells["menuPriceColumn"].Value = tempPrice;
                        menuGridView.Rows[index + 1].Cells["menuCategoryColumn"].Value = tempCategory;

                        swap = true;
                    }
                }
            } while (swap == true);
        }

        private void btnSortByPrice_Click(object sender, EventArgs e)
        {
            bubbleSortPriceColumn();
        }

        private void calculateTotal()
        {
            //showing the total price
            long totalAmount = 0;
            for (int i=0;i<orderList.Count;i++)
            {
                totalAmount += orderList[i].price * orderList[i].quantity;
            }
            lbTotalPrice.Text = totalAmount.ToString();
        }

        private void btnAddToOrder_Click(object sender, EventArgs e)
        {
            //adding items to order
            generateReport();
            orderGridView.Rows.Clear();
            orderList.Clear();
            MessageBox.Show("item has been added to order");
        }

        private void generateReport()
        {
            //gererating report
            
            for (int j = 0; j < orderList.Count; j++)
            {
                bool status = true;
                for (int i = 0; i < reportItemList.Count; i++)
                {
                    if (reportItemList[i].name.Equals(orderList[j].category))
                    {
                        reportItemList[i].value += orderList[j].quantity;
                        status = false;
                    }
                }
                if (status == true)
                {
                    reportItemList.Add(new ReportItem(orderList[j].category, orderList[j].quantity));
                }
            }
            refreshReport();
       
        }

           private void refreshReport()
            {
               //generate pie chart
                chart1.Series["ReportChart"].Points.Clear();
                for (int i = 0; i < reportItemList.Count; i++)
                {
                  //  chart1.Series.Add((string)orderList[i]);
                   // chart1.Series[(string)orderList[i]].Points.AddXY((string)orderList[i], orderTimes[i]);
                    chart1.Series["ReportChart"].Points.Add((int)reportItemList[i].value);
                    chart1.Series["ReportChart"].Points[i].Label=reportItemList[i].value.ToString();
                chart1.Series["ReportChart"].Points[i].LegendText = reportItemList[i].name;




            }
        }
        // EXTRA BUTTONS ASSIGNING TO TAB CONTROL
       private void button1_Click(object sender, EventArgs e)
       {
           tabControl1.SelectedTab = tabPage2;

       }

       private void button10_Click(object sender, EventArgs e)
       {

       }

       private void button5_Click(object sender, EventArgs e)
       {
           tabControl1.SelectedTab = tabPage3;

       }

       private void button2_Click(object sender, EventArgs e)
       {
           tabControl1.SelectedTab = tabPage1;
       }

       private void button4_Click(object sender, EventArgs e)
       {
           tabControl1.SelectedTab = tabPage2;
       }

       private void button3_Click(object sender, EventArgs e)
       {
           this.Close();
       }

       private void button10_Click_1(object sender, EventArgs e)
       {
           tabControl1.SelectedTab = tabPage1;
       }

       private void btnAddToOrder_Click_1(object sender, EventArgs e)
       {
           //adding items to order
           generateReport();
           orderGridView.Rows.Clear();
           orderList.Clear();
           MessageBox.Show("item has been added to order");
       }

       private void orderGridView_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
       {
           if (e.ColumnIndex == 4)
           {
               String newValue = Interaction.InputBox("New Value of the quantity?", "Change the quantity", orderGridView.Rows[e.RowIndex].Cells[1].Value.ToString());
               orderGridView.Rows[e.RowIndex].Cells[1].Value = newValue;
               orderList[e.RowIndex].quantity = Convert.ToInt32(newValue);
               calculateTotal();
           }
           else if (e.ColumnIndex == 5)
           {
               DialogResult = MessageBox.Show("Are you sure you want to delete?", "Delete Item", MessageBoxButtons.OKCancel);
               if (DialogResult == DialogResult.OK)
               {
                   orderGridView.Rows.RemoveAt(e.RowIndex);
                   orderList.RemoveAt(e.RowIndex);
                   calculateTotal();

               }

           }
       }

    }
}

