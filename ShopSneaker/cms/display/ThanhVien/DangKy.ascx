<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DangKy.ascx.cs" Inherits="cms_display_ThanhVien_DangKy" %>
<%--<link href="../../../css/dangky.css" rel="stylesheet" />--%>
<link href="../../../css/login-register.css" rel="stylesheet" />
<style>
</style>
<div class="body-form">
    <div class="form-login">
        <div class="title-login">
            <h3>TẠO TÀI KHOẢN</h3>
            <hr />
        </div>
        <div class="box">
            <%--<input name="form_type" type="hidden" value="create_customer">
            <input name="utf8" type="hidden" value="✓">--%>
            <div class="box-import">
                <div class="box-input">
                    <i class="fas fa-user"></i>
                    <asp:TextBox ID="tbHoTen" runat="server" CssClass="text" placeholder="Họ tên"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Vui lòng nhập họ tên</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbHoTen"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Trường họ tên có chứa kí tự số</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbHoTen" ValidationExpression="[^123456789101112131415161718192]+"></asp:RegularExpressionValidator>
            </div>
            <div class="box-import">
                <div class="box-input">
                    <i class="fas fa-mobile-alt"></i>
                    <asp:TextBox ID="tbSoDienThoai" runat="server" CssClass="text" placeholder="Số điện thoại"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Vui lòng nhập số điện thoại</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbSoDienThoai"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Số điện thoại không quá 10 số mời nhập lại</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbSoDienThoai" ValidationExpression="^(03|05|07|08|09)+[0-9]{8}$"></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Số điện thoại không chứa kí tự đặc biệt</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbSoDienThoai" ValidationExpression="[^! # $ @ _ + , ? . -]+"></asp:RegularExpressionValidator>
            </div>
            <div class="box-import">
                <div class="box-input">
                    <i class="fas fa-map-marker-alt"></i>
                    <asp:TextBox ID="tbDiaChi" runat="server" CssClass="text" placeholder="Địa chỉ"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Vui lòng nhập địa chỉ</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbDiaChi"></asp:RequiredFieldValidator>
            </div>
            <div class="box-import">
                <div class="box-input">
                    <i class="fas fa-envelope"></i>
                    <asp:TextBox ID="tbEmail" runat="server" CssClass="text" placeholder="Email"></asp:TextBox>
                </div>
                <asp:Label ID="thongbao" runat="server" ForeColor="Red" Text=""></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Vui lòng nhập email</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbEmail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Email sai định dạng</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>

            <div class="box-import">
                <div class="box-input">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="tbMatKhau" runat="server" CssClass="password text" placeholder="Mật khẩu" TextMode="Password" ></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Vui lòng nhập mật khẩu</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbMatKhau"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Phải > 8 ký tự, có thể số hoặc ký tự, ít nhất 1 ký tự chữ</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbMatKhau" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{9,}$"></asp:RegularExpressionValidator>
            </div>        
            <div class="box-import">
                <div class="box-input">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="tbNhapLaiMatKhau" runat="server" CssClass="password text" placeholder="Nhập lại mật khẩu" TextMode="Password"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Vui lòng nhập lại mật khẩu</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbNhapLaiMatKhau"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Nhập lại mật khẩu không trùng khớp</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbNhapLaiMatKhau" ControlToCompare="tbMatKhau"></asp:CompareValidator>
            </div>
            <div class="btn-login">
                <asp:LinkButton ID="lbtDangKy" CssClass="btn" runat="server" OnClick="lbtDangKy_Click">Đăng ký</asp:LinkButton>
            </div>
         <div class="req_pass">
         <p>Đã có tài khoản nhấn vào<a class="come-backk" href="SanPham.aspx?modul=ThanhVien&modulphu=DangNhap"> Đăng Nhập</a></p> 
        </div>
        </div>
    </div>
</div>