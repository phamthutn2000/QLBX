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
    public partial class Home : Form
    {
        public Home()
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

        private DataTable Red (string cmd)
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
            DataTable dt = Red("SELECT * FROM GiaoDich");
            if (dt != null)
            {
                dataGridView1.DataSource = dt;
            }
            
        }

        private void Home_Load(object sender, EventArgs e)
        {
            load();
            DataTable dt1 = Red("SELECT * FROM TT_Xe JOIN TT_DVVT ON TT_DVVT.MaDVVT = TT_Xe.MaDVVT");
            
            if (dt1 != null)
            {
                cmbBKS.DisplayMember = "BKS";
                cmbBKS.DataSource = dt1;
                cmbDVVT.DisplayMember = "TenDVVT";
                cmbDVVT.DataSource = dt1;
                LX.DataBindings.Add("Text", dt1, "LaiXe", true);
                PX.DataBindings.Add("Text", dt1, "PhuXe", true);
            }

            DataTable dt2 = Red("SELECT * FROM DichVu");
            if (dt2 != null)
            {
                cmbDV.DisplayMember = "TenDV";
                cmbDV.ValueMember = "Hoa hong ve";
                cmbDV.DataSource = dt2;
                txtGia.DataBindings.Add("Text", dt2 ,"Gia", true);
            }

            DataTable dt3 = Red("SELECT TenHinhThuc FROM HinhThucThanhToan");
            if (dt3 != null)
            {
                HTTT.DisplayMember = "TenHinhThuc";
                HTTT.DataSource = dt3;
            }
            
        }

        private void SL_TextChanged(object sender, EventArgs e)
        {
            int a = Convert.ToInt32(txtGia.Text);
            int b = Convert.ToInt32(SL.Text);
            this.TT.Text = (b * a).ToString();
        }

        private void Add_Click(object sender, EventArgs e)
        {
            Exe("INSERT INTO GiaoDich(MaGD, BKS, TenDVVT, GioVaoben, GioRaBen, TenDV, SoLuong,TongTien, LaiXe, PhuXe, TenHinhThuc, TrangThai) VALUES(N'" + txtMGD.Text + "', N'" + cmbBKS.Text + "', N'" + cmbDVVT.Text + "', N'" + GioVao.Text + "', N'" + GioRa.Text + "', N'" + cmbDV.Text + "', N'" + SL.Text + "',N'" + TT.Text + "',N'" + LX.Text + "',N'" + PX.Text + "',N'" + HTTT.Text + "',N'Chưa thanh toán')");
            load();
        }

        private void Up_Click(object sender, EventArgs e)
        {
            Exe("UPDATE GiaoDich SET MaGD = N'" + txtMGD.Text + "', BKS = N'" + cmbBKS.Text + "', TenDVVT = N'" + cmbDVVT.Text + "', GioVaoBen = N'" + GioVao.Text + "', GioRaBen = N'" + GioRa.Text + "', TenDV = N'" + cmbDV.Text + "', SoLuong = N'" + SL.Text + "', TongTien = N'" + TT.Text + "', LaiXe = N'" + LX.Text + "', PhuXe = N'" + PX.Text + "', TenHinhThuc = N'" + HTTT.Text + "', TrangThai = N'Chưa thanh toán' WHERE MaGD = '" + txtMGD.Text + "'  ");
            load();
        }

        private void ThanhToan_Click(object sender, EventArgs e)
        {
            Exe("UPDATE GiaoDich SET MaGD = N'" + txtMGD.Text + "', BKS = N'" + cmbBKS.Text + "', TenDVVT = N'" + cmbDVVT.Text + "', GioVaoBen = N'" + GioVao.Text + "', GioRaBen = N'" + GioRa.Text + "', TenDV = N'" + cmbDV.Text + "', SoLuong = N'" + SL.Text + "', TongTien = N'" + TT.Text + "', LaiXe = N'" + LX.Text + "', PhuXe = N'" + PX.Text + "', TenHinhThuc = N'" + HTTT.Text + "', TrangThai = N'Đã thanh toán' WHERE MaGD = '" + txtMGD.Text + "'  ");
            load();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMGD.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            cmbBKS.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            cmbDVVT.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            GioVao.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
            GioRa.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString();
            cmbDV.Text = dataGridView1.CurrentRow.Cells[6].Value.ToString();
            SL.Text = dataGridView1.CurrentRow.Cells[7].Value.ToString();
            TT.Text = dataGridView1.CurrentRow.Cells[8].Value.ToString();
            LX.Text = dataGridView1.CurrentRow.Cells[9].Value.ToString();
            PX.Text = dataGridView1.CurrentRow.Cells[10].Value.ToString();
            HTTT.Text = dataGridView1.CurrentRow.Cells[11].Value.ToString();
        }

        private void Del_Click(object sender, EventArgs e)
        {
            Exe("DELETE FROM GiaoDich WHERE MaGD = '" + txtMGD.Text + "'");
        }

        private void Seach_Click(object sender, EventArgs e)
        {
            DataTable dt = Red("SELECT * FROM GiaoDich WHERE MaGD = '" + txtSeach.Text + "'");
            if(dt != null)
            {
                dataGridView1.DataSource = dt;
            }
        }

        private void BanVe_Click(object sender, EventArgs e)
        {
            this.Hide();
            QLBV form1 = new QLBV();
            form1.ShowDialog();
            this.Close();
        }

    }
}
