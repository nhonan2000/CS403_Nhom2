using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Drawing;
using System.Net;
using System.Web.Mail;
using System.Net.Mail;
using MailMessage = System.Net.Mail.MailMessage;

public partial class cms_display_ThanhVien_QuenMatKhau : System.Web.UI.UserControl
{
    SqlConnection con = new SqlConnection(@"Data Source=ADMIN\SQL1;Initial Catalog=SHOP1;Integrated Security=True");

    DataTable dt = new DataTable();


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsend_Click(object sender, EventArgs e)
    {
        

        try
        {
            
            string pass = shop.MaHoa.MaHoaMD5(txtmatkhau.Text);
            Session["email"] = txtemail.Text;

            SqlDataAdapter adp = new SqlDataAdapter("select * from KhachHang where EmailKH=@email", con);
            con.Open();

            adp.SelectCommand.Parameters.AddWithValue("@email", txtemail.Text);

            adp.Fill(dt);
            //Update KhachHang set MatKhau = 1 where EmailKH = '" + txtemail.Text + "'", con

            if (dt.Rows.Count > 0)
            {

                SqlCommand cmd = new SqlCommand("Update KhachHang set MatKhau = '" + pass + "'where EmailKH= '" + txtemail.Text + "'", con);

                cmd.ExecuteNonQuery();
                SendEmail();

                lbresult.Text = "đã gửi thành công";
                
                con.Close();
                
                cmd.Dispose();

                txtemail.Text = "";

            }
            else
            {

                lbresult.Text = "Gửi thất bại";

            }

        }

        catch (Exception ex)
        {

        }

    }

    // using this method we sent the mail to reciever

    private void SendEmail()
    {

        try
        {

            StringBuilder sb = new StringBuilder();
            sb.Append("Hi,<br/> Click on below given link to Reset Your Password<br/>");
            sb.Append("<a href=http://localhost:50503/SanPham.aspx?modul=ThanhVien&modulphu=DoiMatKhau" /*+ GetUserEmail(txtemail.Text)*/);
            sb.Append("&email=" + txtemail.Text + ">Click here to change your password</a><br/>");
            sb.Append("<b>Thanks</b>,<br> Code Solution <br/>");
            sb.Append("<br/><b> for more post </b> <br/>");
            sb.Append("thanks");

            MailMessage message = new System.Net.Mail.MailMessage("neerajsrivastava@gmail.com", txtemail.Text.Trim(), "Reset Your Password", sb.ToString());

            SmtpClient smtp = new SmtpClient();

            smtp.Host = "smtp.gmail.com";

            smtp.Port = 587;

            smtp.Credentials = new System.Net.NetworkCredential("doank24DTU@gmail.com", "jvcsvhjodkxozcsy");

            smtp.EnableSsl = true;

            message.IsBodyHtml = true;

            smtp.Send(message);

        }

        catch (Exception ex)
        {

        }
    }
   
    private string GetUserEmail(string Email)
    {
        SqlCommand cmd = new SqlCommand("select EmailKH from KhachHang WHERE EmailKH = @email", con);
        cmd.Parameters.AddWithValue("@email", txtemail.Text);
        string username = cmd.ExecuteScalar().ToString();
        return username;
    }
}



















