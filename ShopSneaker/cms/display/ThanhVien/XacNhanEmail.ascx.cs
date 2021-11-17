using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;


public partial class cms_display_ThanhVien_XacNhanEmail : System.Web.UI.UserControl
{
    ketnoi kn = new ketnoi();
    protected void Page_Load(object sender, EventArgs e)
    {
        Label3.Text = "Đã gửi mã xác nhận vào địa chỉ Email của bạn!";
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        //XAC NHAN

        string maxacnhan = txtcode.Text;
        if (maxacnhan == Session["macode"].ToString())
        {
            insert();
        }
        else
        {
            lbthongbao.Text = "Sai mã xác nhận. Vui lòng kiểm tra lại!";
            //Response.Write("<script>alert('sai code');</script>");
        }

    }
    private void insert()
    {
        string email = Session["email"].ToString();
        string matkhau = Session["matkhau"].ToString();
        string tenkh = Session["tenkh"].ToString();
        string diachi = Session["diachi"].ToString();
        string sdt = Session["sdt"].ToString();

        string pass = shop.MaHoa.MaHoaMD5(matkhau);

        int kq = kn.xuly("insert into KhachHang(TenKh,DIACHIKH,SDTKH,EMAILKH,MATKHAU) values(N'" + tenkh + "',N'" + diachi + "'," + sdt + " ,'" + email + "','" + pass + "')");

        if (kq > 0) // neu cap nhat duoc thi hien thi khong bao
        {
            
                Response.Write("<script>alert('Đăng ký tài khoản mới thành công');</script>");
            Server.Transfer("/SanPham.aspx?modul=ThanhVien&modulphu=DangNhap");
        }
        
            
        
        else
        {
            
            Response.Write("<script>alert('Đăng ký tài khoản không thành công');</script>");
        }
  }
    }


