using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLBX
{
    public partial class DangNhap : Form
    {
        public DangNhap()
        {
            InitializeComponent();
        }
        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            //Tài khoản = admin, Mật khẩu = 123456
            if(txtTaiKhoan.Text == "admin" && txtMatKhau.Text == "123456")
            {
                this.Hide();
                Home form2 = new Home();
                form2.ShowDialog();
                this.Close();
            }
            if (txtTaiKhoan.Text.Length == 0 && txtMatKhau.Text.Length == 0)
            {
                MessageBox.Show("Không được bỏ trống tài khoản mật khẩu!");
            }
            else if(txtTaiKhoan.Text.Length == 0) 
            {
                MessageBox.Show("Không được bỏ trống tài khoản!");
                txtMatKhau.Text = String.Empty;
            }
            else if(txtMatKhau.Text.Length == 0 && txtTaiKhoan.Text == "admin")
            {
                MessageBox.Show("Không được bỏ trống mật khẩu!");
                txtTaiKhoan.Text = String.Empty;
            }
            if (txtTaiKhoan.Text != "admin" && txtTaiKhoan.Text.Length != 0)
            {
                MessageBox.Show("Sai tài khoản hoặc mật khẩu!");
                txtTaiKhoan.Text = String.Empty;
                txtMatKhau.Text = String.Empty;
            }
            else if (txtMatKhau.Text != "123456" && txtMatKhau.Text.Length != 0)
            {
                MessageBox.Show("Sai mật khẩu!");
                txtTaiKhoan.Text = String.Empty;
                txtMatKhau.Text = String.Empty;
            }
        }
    }
}
