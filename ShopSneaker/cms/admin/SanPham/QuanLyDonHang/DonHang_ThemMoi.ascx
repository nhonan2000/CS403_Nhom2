<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DonHang_ThemMoi.ascx.cs" Inherits="cms_admin_SanPham_QuanLyDonHang_DonHang_ThemMoi" %>
<div class="head">
    Chỉnh sửa tình trạng đơn hàng
</div>
<div class="FormThemMoi">
    <asp:Literal ID="ltrThongBao" runat="server"></asp:Literal>
    <div class="thongTin">
        <div class="tenTruong">Mã đơn hàng</div>
        <div class="oNhap">
            <asp:TextBox ID="tbMadon" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="tbMadon" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Ngày Tạo</div>
        <asp:TextBox ID="tbNgaytao" runat="server"></asp:TextBox>
    </div>
     <div class="thongTin">
        <div class="tenTruong">Thành tiền</div>
        <asp:TextBox ID="tbThanhTien" runat="server"></asp:TextBox>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Tình trạng</div>
        <div class="oNhap">            
            <asp:DropDownList ID="ddltinhtrang" runat="server">
                <asp:ListItem Text="Duyệt đơn hàng" Value="Duyệt đơn hàng"></asp:ListItem>
                <asp:ListItem Text="Đã giao" Value="Đã giao"></asp:ListItem>
                <asp:ListItem Text="Đang giao" Value="Đang giao"></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Mã KH</div>
        <asp:TextBox ID="tbMakh" runat="server"></asp:TextBox>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Tên KH</div>
        <asp:TextBox ID="tbTenkh" runat="server"></asp:TextBox>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Số điện thoại</div>
        <asp:TextBox ID="tbSdt" runat="server"></asp:TextBox>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Email</div>
        <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Phương thức thanh toán</div>
        <asp:TextBox ID="tbphuongthucthanhtoan" runat="server"></asp:TextBox>
    </div>
    <div class="thongTin">
        <div class="tenTruong">&nbsp;</div>
        <div class="oNhap">
            <asp:Button ID="btChinhSua" runat="server" Text="Thêm mới" CssClass="btThemMoi" OnClick="btChinhSua_Click" />
           
        </div>
    </div>
</div>