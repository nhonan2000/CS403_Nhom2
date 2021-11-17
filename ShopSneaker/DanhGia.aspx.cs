using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DanhGia : System.Web.UI.Page
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

           
        }
        else
        {

            
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
        }
    }

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

        protected void btnSendmail_Click(object sender, EventArgs e)
        {
            // System.Web.Mail.SmtpMail.SmtpServer is obsolete in 2.0
            // System.Net.Mail.SmtpClient is the alternate class for this in 2.0
            SmtpClient smtpClient = new SmtpClient();
            MailMessage message = new MailMessage();

            try
            {
                MailAddress fromAddress = new MailAddress(txtEmail.Text, txtName.Text);

                // You can specify the host name or ipaddress of your server
                // Default in IIS will be localhost 
                smtpClient.Host = "smtp.gmail.com";

                //Default port will be 25
                smtpClient.Port = 587;

                //From address will be given as a MailAddress Object
                message.From = fromAddress;

                // To address collection of MailAddress
                message.To.Add("doank24DTU@gmail.com");
                message.Subject = "Feedback";

            
            message.CC.Add("ngochai777890@gmail.com");
            message.CC.Add("haitran888880@gmail.com");

           
            message.IsBodyHtml = false;

                // Message body content
                message.Body = txtMessage.Text;

                // Send SMTP mail
                smtpClient.Send(message);

                lblStatus.Text = "Gửi đánh giá thành công";
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Gửi đánh giá thất bại<br>" + ex.Message;
            }
        }

        #region "Reset"
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtMessage.Text = "";
            txtEmail.Text = "";
        }
        #endregion
    }

