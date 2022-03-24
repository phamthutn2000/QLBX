using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLBX
{
    public partial class QLBV : Form
    {
        public QLBV()
        {
            InitializeComponent();
        }

        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-C24FKSF;Initial Catalog=QLBX;Integrated Security=True");
        private void openCon()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        private void closeCon()
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        private Boolean Exe(string cmd)
        {
            openCon();
            Boolean check;
            try
            {
                SqlCommand sc = new SqlCommand(cmd, con);
                sc.ExecuteNonQuery();
                check = true;
            }
            catch (Exception)
            {
                check = false;
            }
            closeCon();
            return check;
        }

        private DataTable Red(string cmd)
        {
            openCon();
            DataTable dt = new DataTable();
            try
            {
                SqlCommand sc = new SqlCommand(cmd, con);
                SqlDataAdapter sda = new SqlDataAdapter(sc);
                sda.Fill(dt);
            }
            catch (Exception)
            {
                dt = null;
                throw;
            }
            closeCon();
            return dt;
        }

        private void load()
        {
            DataTable dt = Red("SELECT * FROM GiaoDichVe");
            if (dt != null)
            {
                dataGridView1.DataSource = dt;
            }

        }
        private void QLBV_Load(object sender, EventArgs e)
        {
            DataTable dt1 = Red("SELECT * FROM TT_Xe");
            if (dt1 != null)
            {
                cmbBKS.DisplayMember = "BKS";
                cmbBKS.DataSource = dt1;
                SoGhe.DataBindings.Add("Text", dt1, "SoGhe", true);
                SoGiuong.DataBindings.Add("Text", dt1, "SoGiuong", true);
            }

            DataTable dt2 = Red("SELECT * FROM LoaiVe");
            if (dt2 != null)
            {
                cmbLoaiVe.DisplayMember = "LoaiVe";
                cmbLoaiVe.DataSource = dt2;
                gia.DataBindings.Add("Text", dt2, "Gia", true);
            }
            load();
        }

        private void SoLuong_TextChanged(object sender, EventArgs e)
        {
            int a = Convert.ToInt32(gia.Text);
            int b = Convert.ToInt32(SoLuong.Text);
            this.TongTien.Text = (b * a).ToString();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            Exe("INSERT INTO GiaoDichVe(MaVe, LoaiVe, BKS, NguoiBan, NgayBan, SoLuong, TongTien) VALUES(N'" + MaVe.Text + "', N'" + cmbLoaiVe.Text + "', N'" + cmbBKS.Text + "', N'" + txtNguoiBan.Text + "', N'" + date.Text + "', N'" + SoLuong.Text + "', N'" + TongTien.Text + "') ");
            load();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            Exe("UPDATE GiaoDichVe SET MaVe = N'" + MaVe.Text + "', LoaiVe = N'" + cmbLoaiVe.Text + "', BKS = N'" + cmbBKS.Text + "', NguoiBan = N'" + txtNguoiBan.Text + "', NgayBan = N'" + date.Text + "', SoLuong = N'" + SoLuong.Text + "', tongTien = N'" + TongTien.Text + "' WHERE MaVe = '" + MaVe.Text + "'  ");
            load();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            MaVe.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            cmbLoaiVe.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            cmbBKS.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            txtNguoiBan.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
            date.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString();
            SoLuong.Text = dataGridView1.CurrentRow.Cells[6].Value.ToString();
            TongTien.Text = dataGridView1.CurrentRow.Cells[7].Value.ToString();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            Exe("DELETE FROM GiaoDichVe WHERE MaVe = '" + MaVe.Text + "'");
            load();
        }

        private void TimKiem_Click(object sender, EventArgs e)
        {
            DataTable dt = Red("SELECT * FROM GiaoDichVe WHERE MaVe = '" + TK.Text + "'");
            if (dt != null)
            {
                dataGridView1.DataSource = dt;
            }
        }
    }
}
