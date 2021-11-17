using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;


public partial class cms_admin_SanPham_QuanLyDanhMuc_DanhMuc_ThemMoi : System.Web.UI.UserControl
{
    private string thaotac = "";
    private string id = "";//lấy id của danh mục cần chỉnh sửa
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["thaotac"] != null)
            thaotac = Request.QueryString["thaotac"];
        if (Request.QueryString["id"] != null)
            id = Request.QueryString["id"];
        if (!IsPostBack)
        {

            LayDanhMucCha();

            HienThiThongTin(id);
        }

    }

    private void HienThiThongTin(string id)
    {
        if (thaotac == "ChinhSua")
        {
            btThemMoi.Text = "Chỉnh Sửa";


            DataTable dt = new DataTable();
            dt = shop.DanhMuc.Thongtin_Danhmuc_by_id(id);
            if (dt.Rows.Count > 0)
            {
                ddlDanhMucCha.SelectedValue = dt.Rows[0]["MaDMCha"].ToString();
                tbTenDanhMuc.Text = dt.Rows[0]["TenDM"].ToString();
                tbThuTu.Text = dt.Rows[0]["ThuTu"].ToString();

                //ltrAnhDaiDien.Text = "<img class='anhDaiDien'src='/pic/SanPham/" + dt.Rows[0]["AnhDaiDien"] + @"'/>";
                //hdTenAnhDaiDienCu.Value = dt.Rows[0]["AnhDaiDien"].ToString();
            }
        }

        else
        {
            btThemMoi.Text = "Thêm Mới";

        }

    }
    private void LayDanhMucCha()
    {
        DataTable dt = new DataTable();
        dt = shop.DanhMuc.Thongtin_Danhmuc_by_MaDMCha("0");
        ddlDanhMucCha.Items.Clear();

        ddlDanhMucCha.Items.Add(new ListItem("Danh mục gốc", "0"));
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ddlDanhMucCha.Items.Add(new ListItem(dt.Rows[i]["TenDM"].ToString(), dt.Rows[i]["MaDM"].ToString()));
            LayDanhMucCon(dt.Rows[i]["MaDM"].ToString(), "___");
        }
    }

    private void LayDanhMucCon(string MaDMCha, string KhoangCach)
    {
        DataTable dt = new DataTable();
        dt = shop.DanhMuc.Thongtin_Danhmuc_by_MaDMCha(MaDMCha);

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ddlDanhMucCha.Items.Add(new ListItem(KhoangCach + dt.Rows[i]["TenDM"].ToString(), dt.Rows[i]["MaDM"].ToString()));
            LayDanhMucCon(dt.Rows[i]["MaDM"].ToString(), KhoangCach + "___");
        }
    }
    protected void btThemMoi_Click(object sender, EventArgs e)
    {
        if (thaotac == "ThemMoi")
        {
            #region code nút thêm mới


            ltrThongBao.Text = "Nhập sai hoặc thiếu thông tin! Mời nhập lại";


            shop.DanhMuc.DanhMuc_Insert(tbTenDanhMuc.Text, tbThuTu.Text, ddlDanhMucCha.SelectedValue, "");

            ltrThongBao.Text = "<div class='thongBaoTaoThanhCong' style='color:#333;font-size:16px;padding-bottom:20px;text-align:center;font-weight:bold'>Đã tạo danh mục: " + tbTenDanhMuc.Text + "</div>";
        }
        #endregion
        else
        {
            #region code nút chỉnh sửa
            //string tenAnhDaiDien = "";
            shop.DanhMuc.DanhMuc_Update(id, tbTenDanhMuc.Text, tbThuTu.Text, ddlDanhMucCha.SelectedValue);

            //đẩy trang về trang danh sách các damnh mục đã tạo
            Response.Redirect("Admin.aspx?modul=SanPham&modulphu=DanhMuc");

            #endregion
        }
        }
    private void ResetControl()
    {
        tbTenDanhMuc.Text = "";
        tbThuTu.Text = "";

    }
    protected void btHuy_Click(object sender, EventArgs e)
    {
        ResetControl();
    }
}