using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SanPham : System.Web.UI.Page
{
        private string modul = "";
    protected string tukhoa = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["tukhoa"] != null)
            tukhoa = Request.QueryString["tukhoa"];

        #region Nếu là modul tin tức --> Hiện danh mục tin., Các modul khác --> Hiện danh mục sản phẩm
        if (Request.QueryString["modul"] != null)
            modul = Request.QueryString["modul"];

        if (modul == "TinTuc")
        {

            plDanhMucSanPham.Visible = false;
        }
        else
        {

            plDanhMucSanPham.Visible = true;
        }
        #endregion

        if (!IsPostBack)
        {
            #region Kiểm tra đã đăng nhập hay chưa

            if (Session["KhachHang"] != null && Session["KhachHang"].ToString() == "2")
            {
                //Đã đăng nhập
                plDaDangNhap.Visible = true;


                if (Session["KhachHang"] != null)
                    ltrTenKhachHang.Text = Session["TenKh"].ToString();
            }
            else
            {
                plDaDangNhap.Visible = false;

            }
            #endregion

            //ltrLogo.Text = LayLogo();



            ltrDanhMucSanPham.Text = LayDanhMucSanPham();

        }
    }


    #region Lấy danh mục sản phẩm
    private string LayDanhMucSanPham()
    {
        string s = "";
        DataTable dt = new DataTable();
        dt = shop.DanhMuc.Thongtin_Danhmuc_by_MaDMCha("0");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            s += @"<li><a href='/SanPham.aspx?modul=SanPham&modulphu=DanhSachSanPham&id=" + dt.Rows[i]["MaDM"] + @"' title='" + dt.Rows[i]["TenDM"] + @"'>" + dt.Rows[i]["TenDM"] + @"</a></li>";
        }
        return s;
    }
    #endregion
    protected void lbtDangXuat_Click(object sender, EventArgs e)
    {
        //Xóa các session đã lưu
        Session["KhachHang"] = null;

        Session["MaKH"] = null;
        Session["TenKh"] = null;
        Session["DiaChiKH"] = null;
        Session["sdtKH"] = null;
        Session["EmailKH"] = null;

        //đẩy về trang đăng nhập
        Response.Redirect("/Default.aspx");
    }
    protected void lbtDoiMatKhau_Click(object sender, EventArgs e)
    {

        Response.Redirect("/SanPham.aspx?modul=ThanhVien&modulphu=DoiMatKhau");
    }
}
