<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DoiMatKhau.ascx.cs" Inherits="cms_display_ThanhVien_DoiMatKhau" %>
<link href="../../../css/login-register.css" rel="stylesheet" />
<div class="body-form">
    <div class="form-login">
        <div class="title-login">
            <h3>Đổi Mật Khẩu</h3>
            <hr />
        </div>
        <div class="box">
            <div class="box-import">
                <div class="box-input">
                    <i class="fas fa-envelope"></i>
                    <asp:TextBox ID="txtemail" runat="server" CssClass="text" placeholder="Email"></asp:TextBox>
                </div>
                <asp:Label ID="thongbao" runat="server" ForeColor="Red" Text=""></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Vui lòng nhập email</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="txtemail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Email sai định dạng</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="txtemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>

            <div class="box-import">
                <div class="box-input">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="txtpwd" runat="server" CssClass="password text" placeholder="Mật khẩu Mới" TextMode="Password" ></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Vui lòng nhập mật khẩu</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="txtpwd"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Phải > 8 ký tự, có thể số hoặc ký tự, ít nhất 1 ký tự chữ</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="txtpwd" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{9,}$"></asp:RegularExpressionValidator>
            </div>        
            <div class="box-import">
                <div class="box-input">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="txtcofrmpwd" runat="server" CssClass="password text" placeholder="Nhập lại mật khẩu" TextMode="Password"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Vui lòng nhập lại mật khẩu</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="txtcofrmpwd"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Nhập lại mật khẩu không trùng khớp</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="txtcofrmpwd" ControlToCompare="txtpwd"></asp:CompareValidator>
            </div>
            <div class="btn-login">
                <asp:LinkButton ID="btnsubmit" CssClass="btn" runat="server" OnClick="btnsubmit_Click">Gửi</asp:LinkButton>
            </div>
    </div>
    </div>
</div>