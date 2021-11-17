using System;
using System.Data;

public partial class cms_display_SanPham_TimKiem : System.Web.UI.UserControl
{
    private string tukhoa = "";
    protected void Page_Load(object sender, EventArgs e)
    {        
        if (Request.QueryString["tukhoa"] != null)
            tukhoa = Request.QueryString["tukhoa"];

        if (!IsPostBack)
        {
            ltrNhomSanPham.Text = LayThongTinTimKiem();
            
        }
        
    }
    #region Lấy nhóm và các sản phẩm
    private string LayThongTinTimKiem()
    {
        
        string s = "";
        s += "<div class='sanphamnoibat'>";
        s += @"
               <a class='title-line' href='/Default.aspx?modul=SanPham&modulphu=TimKiem&tukhoa=" + tukhoa + @"' title='" + tukhoa + @"'></a>
                <h3>Kết quả tìm kiếm cho từ khóa: " + tukhoa + @"</h3>
               ";
        
        s += "<div class='container-fluid padding'>";
        s += "<div class='row padding'>";
        s += LayDanhSachSanPham();
        s += "</div>";
        s += "</div>";
        s += "</div>";
        
        return s;
        
    }
    
    private string LayDanhSachSanPham()
    {
        string s = "";
        DataTable dt = new DataTable();
        dt = shop.SanPham.Thongtin_Sanpham_by_tukhoa(tukhoa);

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