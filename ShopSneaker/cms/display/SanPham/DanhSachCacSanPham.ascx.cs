using System;
using System.Data;

public partial class cms_display_SanPham_DanhSachCacSanPham : System.Web.UI.UserControl
{
    private string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
            id = Request.QueryString["id"];

        if (!IsPostBack)
        {
            ltrNhomSanPham.Text = LayDanhMucSanPham();
        }
    }

    #region Lấy nhóm và các sản phẩm
    private string LayDanhMucSanPham()
    {
        string s = "";
        DataTable dt = new DataTable();
        dt = shop.DanhMuc.Thongtin_Danhmuc_by_id(id);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            s += "<div class=''>";
            s += @"
                    <a class='title-line' href='/SanPham.aspx?modul=SanPham&modulphu=DanhSachSanPham&id=" + dt.Rows[i]["MaDM"] + @"' title='" + dt.Rows[i]["TenDM"] + @"'>
                        <h3>" + dt.Rows[i]["TenDM"] + @"</h3>
                    </a>
                    ";
            s += "<div class='container-fluid padding'>";
            s += "<div class='row padding'>";
            s += LayTatCaDanhSachSanPhamTheoDanhMuc(dt.Rows[i]["MaDM"].ToString());
            s += "</div>";
            s += "</div>";
            s += "</div>";
        }

        return s;
    }

    private string LayTatCaDanhSachSanPhamTheoDanhMuc(string MaDM)
    {
        string s = "";
        DataTable dt = new DataTable();
        dt = shop.SanPham.Thongtin_Sanpham_by_madm_tatca(MaDM);

        string link = "";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            link = "SanPham.aspx?modul=SanPham&modulphu=ChiTietSanPham&id=" + dt.Rows[i]["MaSP"];

            s += @"
                <div class='col-md-3 product'>
                    <div class='card'>
                        <a href='" + link + @"' title='" + dt.Rows[i]["TenSP"] + @"'>
                            <img class='card-img-top' src='/pic/sanpham/" + dt.Rows[i]["AnhSP"] + @"' alt='" + dt.Rows[i]["TenSP"] + @"' />
                        </a>
                        <a class='card-title' href='" + link + @"' title='" + dt.Rows[i]["TenSP"] + @"'>
                            " + dt.Rows[i]["TenSP"] + @"
                        </a>
                        <div class='desc'>
                            Giá: " + dt.Rows[i]["GiaSP"] + @"
                        </div>
                    </div>
                </div>
                ";
        }
        return s;
    }

    #endregion
}