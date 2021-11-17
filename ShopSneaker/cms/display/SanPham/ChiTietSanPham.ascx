<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChiTietSanPham.ascx.cs" Inherits="cms_display_SanPham_ChiTietSanPham" %>
<link href="../../../css/details.css" rel="stylesheet" />

<div class="detail">
    <div class="img">
        <asp:Literal ID="ltrAnhSanPham" runat="server"></asp:Literal>
    </div>
    <div class="info">
        <div class="name">
            <h1><asp:Literal ID="ltrTenSanPham" runat="server"></asp:Literal></h1>
        </div>
        <div class="price">
            <h5><asp:Literal ID="ltrGiaSP" runat="server"></asp:Literal>₫</h5>
        </div>
        <div class="parameter">
            <div class="size">
                <label>Kích thước: </label> <asp:Literal ID="ltrKichThuoc" runat="server"></asp:Literal>                
            </div>            
            <div class="color">
                <label>Màu sắc: </label> <asp:Literal ID="ltrMau" runat="server"></asp:Literal> 
            </div>
            <div class="quantity">
                <label>Số lượng: </label>
                <input id="quantity" type="number" name="quantity" min="1" value="1" max="10" class="tc item-quantity">
            </div>
        </div>
        <div class="add-buy">
            <div class="add"  id="add-to-cart" onclick="javascript:ThemVaoGioHang()"">
                <i class='bx bxs-cart-add'></i>
                <b>Thêm vào giỏ</b>
            </div>
            <div class="buy"  id="buy-now" onclick="javascript:MuaNgay()">
                <i class='bx bx-check'></i>
                <b>Mua ngay</b>
            </div>
        </div>
    </div>
    <div style="clear:both"></div>
    <div class="thongTinChiTietSanPham">
        <asp:Literal ID="ltrThongTinChiTiet" runat="server"></asp:Literal>
    </div>
</div>      
<%--Các script xử lý giỏ hàng--%>

<script type="text/javascript">
    function ThemVaoGioHang() {
        var id = "<%=id%>";
        var soLuong = $("#quantity").val();

        $.post("cms/display/SanPham/Ajax/XuLyGioHang.aspx",
         {
             "ThaoTac": "ThemVaoGioHang",
             "id": id,
             "soLuong": soLuong
         },
            function (data, status) {
             //alert("Data :" + data + "\n Status :" + status);
             if (data == "") {
                 //thực hiện thành công => thông báo
                 alert("Thêm vào giỏ hàng thành công");
             } else {
                
                 alert(data);
             }
         });
    }

    function MuaNgay() {
        
        var id = "<%=id%>";
        var soLuong = $("#quantity").val();

        $.post("cms/display/SanPham/Ajax/XuLyGioHang.aspx",
         {
             "ThaoTac": "ThemVaoGioHang",
             "id": id,
             "soLuong": soLuong
         },
         function (data, status) {
             //alert("Data :" + data + "\n Status :" + status);
             if (data == "") {
                 //thực hiện thành công => thông báo
                 alert("Mua sản phẩm thành công");

                 //Đẩy về trang hiển thị giỏ hàng
                 location.href = "/SanPham.aspx?modul=SanPham&modulphu=GioHang";
             } else {
                 alert(data);
             }
         });
    }
</script>