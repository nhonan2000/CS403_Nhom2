using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cms_display_ThanhVien_DoiMatKhau : System.Web.UI.UserControl
{
    ketnoi kn = new ketnoi();
    protected void Page_Load(object sender, EventArgs e)
    {
        //string email = Session["email"].ToString();
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string pass = shop.MaHoa.MaHoaMD5(txtpwd.Text);

        Session["email"] = txtemail.Text;
            SqlConnection con = new SqlConnection(@"Data Source=ADMIN\SQL1;Initial Catalog=SHOP1;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("Update KhachHang set MatKhau = '" + pass + "'where EmailKH= '" + txtemail.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        Response.Write("<script>alert ('Đổi mật khẩu thành công')</script>");
        Server.Transfer("/SanPham.aspx?modul=ThanhVien&modulphu=DangNhap");
        txtpwd.Text = "";
            txtcofrmpwd.Text = "";
        }
    }


