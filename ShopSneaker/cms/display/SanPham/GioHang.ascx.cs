using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cms_display_SanPham_GioHang : System.Web.UI.UserControl
{
    #region Khai báo các biến lấy ra thông tin của khách hàng nếu họ đã đăng nhập

    protected string hoTen = "";
    protected string diaChi = "";
    protected string email = "";
    protected string soDienThoai = "";
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        
        //Kiểm tra nếu đã đăng nhập thì mới cho vào trang này
        if (Session["KhachHang"] != null && Session["KhachHang"].ToString() == "2")
        {

        }
        else
        {
            //Nếu chưa đăng nhập --> đẩy về trang login
            Response.Redirect("/SanPham.aspx?modul=ThanhVien&modulphu=DangNhap");

        }
        if (!IsPostBack)
                LayRaThongTinKhachHangDaDangNhap();
        LayLichSuMuaHang();
        }
    private void LayLichSuMuaHang()
    {
        ketnoi kn = new ketnoi();
        string email = Session["EmailKH"].ToString();
        DataTable dt = kn.laydata("SELECT * FROM((DonDatHang " +
            "INNER JOIN ChiTietDonDatHang On DonDatHang.MaDonDatHang = ChiTietDonDatHang.MaDonDatHang) " +
            "INNER JOIN SanPham on SanPham.MaSP = ChiTietDonDatHang.MaSP) " +
            "where EmailKH = '" + email + "'");

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ltrLichSuMuaHang.Text += @"
                <tr id='maDong_" + dt.Rows[i]["MaDonDatHang"] + @"'>
                    <td class='cotMa'>" + dt.Rows[i]["MaDonDatHang"] + @"</td>
                    <td class='item-img'><img src='pic/SanPham/" + dt.Rows[i]["AnhSP"] + @"' /></td>
                    <td class='cotMa'>" + dt.Rows[i]["SoLuongDat"] + @"</td>
                    <td class='cotDonGia'>" + dt.Rows[i]["NgayTao"] + @"</td>
                    <td class='cotDonGia'>" + dt.Rows[i]["ThanhTienDH"] + @"</td>
                    <td class='cotDonGia'>" + (dt.Rows[i]["TinhTrangDonHang"].ToString()) + @"</td>
                    
                ";
            if (dt.Rows[i]["TinhTrangDonHang"].ToString() == "Đang chờ duyệt")
            {
                ltrLichSuMuaHang.Text += @"
                    <td class='cotCongCu'>
                        <a href='javascript:XoaDonHang(" + dt.Rows[i]["MaDonDatHang"] + @")'>Hủy</a>
                    </td> 
                </tr>
                ";
            }
            else
            {
                ltrLichSuMuaHang.Text += @"
                    <td></td>
                </tr>
                ";
            }
        }
    }
        private void LayRaThongTinKhachHangDaDangNhap()
    {
        //Nếu khách hàng đã đăng nhập
        if (Session["KhachHang"] != null && Session["KhachHang"].ToString() == "2")
        {
            //Lấy thông tin đã lưu khi khách hàng đăng nhập
            hoTen = Session["TenKh"].ToString();
            diaChi=Session["DiaChiKH"].ToString();
            soDienThoai =Session["sdtKH"].ToString();
            email =Session["EmailKH"].ToString();
        }
    }
}