using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cms_admin_SanPham_QuanLyDonHang_DonHang_ThemMoi : System.Web.UI.UserControl
{
    private string thaotac = "";
    private string id = "";//lấy id của sản phẩm cần chỉnh sửa
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["thaotac"] != null)
            thaotac = Request.QueryString["thaotac"];
        if (Request.QueryString["id"] != null)
            id = Request.QueryString["id"];
        if (!IsPostBack)
        {

            
            HienThiThongTin(id);
        }

    }

    private void HienThiThongTin(string id)
    {
        if (thaotac == "ChinhSua")
        {
            btChinhSua.Text = "Chỉnh Sửa";

            tbMadon.Enabled = false;
            tbNgaytao.Enabled = false;
            tbThanhTien.Enabled = false;
            tbMakh.Enabled = false;
            tbTenkh.Enabled = false;
            tbSdt.Enabled = false;
            tbEmail.Enabled = false;
            tbphuongthucthanhtoan.Enabled = false;
            DataTable dt = new DataTable();
            dt = shop.DonDatHang.Thongtin_Dondathang_by_id(id);
            if (dt.Rows.Count > 0)
            {
                tbMadon.Text = dt.Rows[0]["MaDonDatHang"].ToString();
                tbNgaytao.Text = dt.Rows[0]["NgayTao"].ToString();
                tbThanhTien.Text = dt.Rows[0]["ThanhTienDH"].ToString();
                ddltinhtrang.SelectedValue = dt.Rows[0]["TinhTrangDonHang"].ToString();
                tbMakh.Text = dt.Rows[0]["MaKH"].ToString();
                tbTenkh.Text = dt.Rows[0]["TenKH"].ToString();
                tbSdt.Text = dt.Rows[0]["sdtKH"].ToString();
                tbEmail.Text = dt.Rows[0]["EmailKH"].ToString();
                tbphuongthucthanhtoan.Text = dt.Rows[0]["PhuongThucThanhToan"].ToString();
            }
        }
        else
        {
            btChinhSua.Text = "Thêm Mới";
        }

    }
    protected void btChinhSua_Click(object sender, EventArgs e)
    {
            #region code nút chỉnh sửa
            
            
            shop.DonDatHang.Dondathang_Update(tbMadon.Text, tbNgaytao.Text, tbThanhTien.Text, ddltinhtrang.SelectedValue, tbphuongthucthanhtoan.Text,  tbMakh.Text, tbTenkh.Text, tbSdt.Text, tbEmail.Text);

            //đẩy trang về trang danh sách các damnh mục đã tạo
            Response.Redirect("Admin.aspx?modul=SanPham&modulphu=DanhSachDonHang");

            #endregion
        }
    }

    


    
    

