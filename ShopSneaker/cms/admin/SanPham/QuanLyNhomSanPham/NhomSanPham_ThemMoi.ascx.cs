using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class cms_admin_SanPham_QuanLyNhomSanPham_NhomSanPham_ThemMoi : System.Web.UI.UserControl
{
    private string thaotac = "";
    private string id = "";//lấy id của nhóm sản phẩm cần chỉnh sửa
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
            btThemMoi.Text = "Chỉnh Sửa";
            cbThemNhieuNhom.Visible = false;

            DataTable dt = new DataTable();
            dt = shop.NhomSanPham.Thongtin_Nhomsp_by_id(id);
            if (dt.Rows.Count > 0)
            {
                tbTenNhomSP.Text = dt.Rows[0]["TenNhom"].ToString();
                tbThuTu.Text = dt.Rows[0]["ThuTu"].ToString();
                tbSoSanPhamHienThi.Text = dt.Rows[0]["SoSPHienThi"].ToString();
                
            }
        }

        else
        {
            btThemMoi.Text = "Thêm Mới";
            cbThemNhieuNhom.Visible = true;
        }

    }
    protected void btThemMoi_Click(object sender, EventArgs e)
    {
        if (thaotac == "ThemMoi")
        {
            #region code nút thêm mới


        }
        ltrThongBao.Text = "Nhập sai hoặc thiếu thông tin! Mời nhập lại";


        shop.NhomSanPham.Nhomsanpham_Insert(tbTenNhomSP.Text, tbThuTu.Text, tbSoSanPhamHienThi.Text, "");

        ltrThongBao.Text = "<div class='thongBaoTaoThanhCong' style='color:#ff006e;font-size:16px;padding-bottom:20px;text-align:center;font-weight:bold'>Đã tạo danh mục: " + tbTenNhomSP.Text + "</div>";

        if (cbThemNhieuNhom.Checked)
        {
            //viết code xử lý xóa mục đã nhập để người dùng nhập danh mục tiếp theo
            ResetControl();
        }

        else
        {
            //đẩy trang về trang danh sách các damnh mục đã tạo

            Response.Redirect("Admin.aspx?modul=SanPham&modulphu=NhomSanPham");
        
            #endregion
        


                #region code nút chỉnh sửa


                // viết đoạn code xóa ảnh đại diện cũ tại đây - tạm thời chưa viết





                shop.NhomSanPham.Nhomsanpham_Update(id, tbTenNhomSP.Text, tbThuTu.Text, tbSoSanPhamHienThi.Text);

                //đẩy trang về trang danh sách các damnh mục đã tạo
                Response.Redirect("Admin.aspx?modul=SanPham&modulphu=NhomSanPham");

                #endregion
            }
        }
    
    
    private void ResetControl()
    {
        tbTenNhomSP.Text = "";
        tbThuTu.Text = "";
        tbSoSanPhamHienThi.Text = "";

    }
    protected void btHuy_Click(object sender, EventArgs e)
    {
        ResetControl();
    }
}