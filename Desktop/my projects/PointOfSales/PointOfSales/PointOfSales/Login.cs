using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PointOfSales
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            if (tbLoginPassword.Text.ToString().Equals("iampassword") && tbLoginUserName.Text.ToString().Equals("admin"))
            {
               
                this.Hide();
                Home home = new Home();

                home.Closed += (s, args) => this.Close();

                home.Show();

            }
            else {
                MessageBox.Show("Please enter valid username/password","Cannot Login");
            }
        }

        private void btnLoginExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        
    }
}
