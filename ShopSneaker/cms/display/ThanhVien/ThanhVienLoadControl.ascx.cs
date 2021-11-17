using System;

public partial class cms_display_ThanhVien_ThanhVienLoadControl : System.Web.UI.UserControl
{
    private string modulphu = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["modulphu"] != null)
            modulphu = Request.QueryString["modulphu"];
        switch (modulphu)
        {
            case "DangKy":
                plLoadControl.Controls.Add(LoadControl("DangKy.ascx"));
                break;

            case "DangNhap":
                plLoadControl.Controls.Add(LoadControl("DangNhap.ascx"));
                break;

            case "DoiMatKhau":
                plLoadControl.Controls.Add(LoadControl("DoiMatKhau.ascx"));
                break;

            case "QuenMatKhau":
                plLoadControl.Controls.Add(LoadControl("QuenMatKhau.ascx"));
                break;

            case "XacNhanEmail":
                plLoadControl.Controls.Add(LoadControl("XacNhanEmail.ascx"));
                break;

            default:
                plLoadControl.Controls.Add(LoadControl("DangNhap.ascx"));
                break;


        }
    }
}