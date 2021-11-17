<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DangNhap.ascx.cs" Inherits="cms_display_ThanhVien_DangNhap" %>
                                                        
<link href="../../../css/login-register.css" rel="stylesheet" />
<div class="body-form">
    <div class="form-login">
        <div class="title-login">
            <h3>ĐĂNG NHẬP</h3>
            <hr />
        </div>
        <div class="box">
            <%--<input name="form_type" type="hidden" value="create_customer">
            <input name="utf8" type="hidden" value="✓">--%>

            <div class="box-import">
                <div class="box-input">
                    <i class="fas fa-envelope"></i>
                    <asp:TextBox ID="tbEmail" runat="server" CssClass="" placeholder="Email" ></asp:TextBox>
                </div>            
                <div style="clear:both"></div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbEmail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ErrorMessage="<div style='color:red;padding:3px 0'>Email sai định dạng</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>

            <div class="box-import">
                <div class="box-input">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="tbMatKhau" runat="server" BorderColor="Red" CssClass="" placeholder="Mật khẩu" TextMode="Password"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbMatKhau"></asp:RequiredFieldValidator>
            </div>
            <div class="btn-login">
                <asp:LinkButton ID="lbtDangNhap" CssClass="btn" runat="server" OnClick="lbtDangNhap_Click"><b>Đăng nhập</b></asp:LinkButton>
            </div>
            <div class="req_pass">
                <p>Chưa có tài khoản<a style="color:red" href="SanPham.aspx?modul=ThanhVien&modulphu=DangKy"> Đăng Ký</a></p> 
            </div>   
            <div class="req_pass">
                <p><a class="come-backk" href="SanPham.aspx?modul=ThanhVien&modulphu=QuenMatKhau"> Quên mật khẩu</a></p> 
            </div>   
        </div>
    </div>
</div>