using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.Web.UI.WebControls;

public partial class cms_display_ThanhVien_DangKy : System.Web.UI.UserControl
{
    ketnoi kn = new ketnoi();

    SqlConnection conn = new SqlConnection(@"Data Source=ADMIN\SQL1;Initial Catalog=SHOP1;Trusted_Connection=yes;");
    static string code;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lbtDangKy_Click(object sender, EventArgs e)
    {
        Random random = new Random();
        code = random.Next(1000, 9999).ToString();

        string email = tbEmail.Text;
        string matkhau = tbMatKhau.Text;
        string tenkh = tbHoTen.Text;
        string diachi = tbDiaChi.Text;
        string sdt = tbSoDienThoai.Text;
        string ktemail = ("select EmailKH from KhachHang where EmailKH ='" + email + "'");
        DataTable table1 = new DataTable();
        try
        {
            SqlDataAdapter da1 = new SqlDataAdapter(ktemail, conn);
            da1.Fill(table1);
        }
        catch (SqlException err)
        {
            Response.Write("<p><b>Error: </b>" + err.Message + "</p>");
        }

        if (table1.Rows.Count == 0)
        {
            Session["email"] = email;
            Session["matkhau"] = matkhau;
            Session["tenkh"] = tenkh;
            Session["diachi"] = diachi;
            Session["sdt"] =sdt;
            Session["macode"] = code;
            sendcode();
            Response.Redirect("SanPham.aspx?modul=ThanhVien&modulphu=XacNhanEmail");
        }
        else if (table1.Rows.Count != 0)
        {
            thongbao.Text = "Tài khoản đã được sử dụng, vui lòng nhập lại tên đăng nhập! ";
            tbEmail.Text = "";
        }
    }



    private void sendcode()
    {
        string fromaddr = "doank24DTU@gmail.com";
        string toaddr = tbEmail.Text;//TO ADDRESS HERE

        string password = "jvcsvhjodkxozcsy";

        MailMessage msg = new MailMessage();
        msg.Subject = "Mã kích hoạt để xác minh địa chỉ Email!";
        msg.From = new MailAddress(fromaddr);
        msg.Body = "Mã xác nhận của bạn là: " + code;
        msg.To.Add(new MailAddress(tbEmail.Text));
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.UseDefaultCredentials = false;
        smtp.EnableSsl = true;
        NetworkCredential nc = new NetworkCredential(fromaddr, password);
        smtp.Credentials = nc;
        smtp.Send(msg);
    }


    /// <summary>
    /// Phương thức kiểm tra xem có tồn tại bản ghi khách hàng với email này không
    /// </summary>
    /// <param name="email"></param>
    /// <returns></returns>
    //private bool DaTonTaiEmail(string email)
    //{
    //    DataTable dt=new DataTable();
    //    dt =shop.KhachHang.Thongtin_Khachhang_by_emailkh(email);
    //    if (dt.Rows.Count > 0)
    //        return true;
    //    else
    //        return false;
    //}
}