<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TaiKhoan_ThemMoi.ascx.cs" Inherits="cms_admin_TaiKhoan_TaiKhoan_ThemMoi" %>
<div class="head">
    Thêm mới, chỉnh sửa tài khoản
</div>
<div class="FormThemMoi">
    <asp:Literal ID="ltrThongBao" runat="server"></asp:Literal>
    <div class="thongTin">
        <div class="tenTruong">Chọn quyền</div>
        <div class="oNhap"><asp:DropDownList ID="ddlQuyenDangNhap" runat="server"></asp:DropDownList></div>
    </div>   
    <div class="thongTin">
        <div class="tenTruong">Tên đăng nhập</div>
        <div class="oNhap">            
            <asp:TextBox ID="tbTenDangNhap" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn chưa nhập tên đăng nhập" ControlToValidate="tbTenDangNhap" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Mật khẩu</div>
        <div class="oNhap"> 
            <asp:HiddenField ID="hdMatKhauCu" runat="server" />           
            <asp:TextBox ID="tbMatKhau" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="tbMatKhau" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Phải >= 6 ký tự, có thể số hoặc ký tự, ít nhất 1 ký tự chữ</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbMatKhau" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$"></asp:RegularExpressionValidator>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Email</div>
        <div class="oNhap">            
            <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbEmail" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Email sai định dạng</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="tbEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Địa chỉ</div>
        <div class="oNhap">            
            <asp:TextBox ID="tbDiaChi" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Họ tên</div>
        <div class="oNhap">            
            <asp:TextBox ID="tbHoTen" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Ngày sinh (Tháng/Ngày/Năm)</div>
        <div class="oNhap">            
            <asp:TextBox ID="tbNgaySinh" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Giới tính</div>
        <div class="oNhap">            
            <asp:DropDownList ID="ddlGioiTinh" runat="server">
                <asp:ListItem Text="Nam" Value="Nam"></asp:ListItem>
                <asp:ListItem Text="Nữ" Value="Nữ"></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">&nbsp;</div>
        <div class="oNhap">
            <asp:Button ID="btThemMoi" runat="server" Text="Thêm mới" CssClass="btThemMoi" OnClick="btThemMoi_Click" />
            <asp:Button ID="btHuy" runat="server" Text="Hủy" CssClass="btHuy" OnClick="btHuy_Click" CausesValidation="false" />
        </div>
    </div>
</div>