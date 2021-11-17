<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GioHang.ascx.cs" Inherits="cms_display_SanPham_GioHang" %>
<link href="../../../css/giohang.css" rel="stylesheet" />
<div class="modal-content">
    <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLabel">Bạn có <span class="TongSoSPTrongGioHang">0</span> sản phẩm trong giỏ hàng.</h4>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <a href="#" aria-hidden="true"></a>
        </button>

    </div>
    <div>
        <div class="form-cart" id="BangThongTinGioHang">
            <%--Khự vực chứa dữ liệu về giỏ hàng được lấy qua ajax--%>
            <%--<table style="width:100%;" id="cart-table">
                <tbody>
                    <tr>
                        <th></th>
                        <th>Tên sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Giá tiền</th>
                        <th></th>
                    </tr>
                    <tr class="line-item original">
                        <td class="item-image"></td>
                        <td class="item-title">
                            <a></a>
                        </td>
                        <td class="item-quantity"></td>
                        <td class="item-price"></td>
                        <td class="item-delete"></td>
                    </tr>
                    <tr class="line-item">
                        <td class="item-image">
                            <img src="../pic/dangnhap/sp1.jpg" /></td>
                        <td class="item-title">
                            <a href="/products/ao-len-hoa-h-m-logo-mau-trang-hoa-chim-2-4t">Áo len hoa H&amp;M logo màu trắng hoa chim 2-4T<br><span>2</span></a>
                        </td>
                        <td class="item-quantity"><input id="quantity1" name="updates[]" min="1" type="number" value="1" class=""></td>
                        <td class="item-price">240,000</td>
                        <td class="item-delete"><a href="#" onclick="deleteCart(1007742474)">Xóa</a></td>
                    </tr>
                  
                </tbody>
            </table>--%>
        </div>
        
        <div class="footer-cart">
            <div class="info-user">
                <div class="">
                    <span>Quý khách vui lòng điền đầy đủ thông tin theo form phía dưới và nhấn nút Mua hàng.</span> 
                    <br/>
                </div>
                <div class="box-input">
                    <p>Họ tên(*):</p>
                    <input id="tbHoTen" type="text" value="<%=hoTen %>"/>                    
                </div>
                <div class="box-input">                       
                    <p>Địa chỉ:</p>
                    <input id="tbDiaChi" type="text" value="<%=diaChi %>"/>
                </div>
                <div class="box-input">
                    <p>Số điện thoại(*):</p>
                    <input id="tbSoDienThoai" type="text" value="<%=soDienThoai %>"/>
                </div>            
                <div class="box-input">
                    <p>Email:</p>
                    <input id="tbEmail" type="text" value="<%=email %>"/>
                </div>
            </div>

            <div class="thanhtoan">
                <div class="goiY">
                    Chọn một trong các hình thức thanh toán để thanh toán đơn hàng
                </div>
                <div>
                    <input id="rbThanhToanSauKhiNhanHang" type="radio" name="rbHinhThucThanhToan"/>
                    <label for="rbThanhToanSauKhiNhanHang">Thanh toán sau khi nhận hàng</label>
                </div><br />
                <div>
                    <input id="rbOnepay" type="radio" name="rbHinhThucThanhToan" checked="checked"/><label for="rbOnepay">Thanh toán trực tuyến qua thẻ ATM</label>
                                        
                    <div class="paymentInfo">       
                        <%-- <script type="text/javascript"src="http://202.9.84.88/documents/payment/logoscript.jsp?logos=at&lang=vi" style="width:100%;"></script> --%>
                        <div class="cb"><!----></div>
                    </div>
                    <br />
                </div>
            <div class="cb" style="padding-right:10px">
                <div class="sum-price">
                    Tổng cộng : <span id="TongTienTrongGioHang">0</span><span>VND</span> 
                </div>
            </div>

            <div class="btn">
                <div class="">
                        <a href="/">
                            <i class="fas fa-arrow-circle-left"></i>Tiếp tục mua hàng
                        </a>
                </div>
                <div class="btn-buy" onclick="javascript:GuiDonHang()">
                    <b>Mua hàng</b> <i class="fas fa-chevron-right"></i>
                </div>
                
            </div>
        </div>
    </div>
</div>

    </div>
<div class="modal-content" style="margin-top: 15px">
    <div class="modal-header">
        <h4 class="modal-title">Lịch sử mua hàng</h4>
    </div>
    <table>
        <tr>
            <td>Mã đơn hàng</td>
            <td>Hình ảnh</td>
            <td>Số lượng</td>
            <td>Ngày Mua</td>
            <td>Tổng giá</td>
            <td>Tình trạng</td>
            <td>Hủy</td> 
        </tr>
        <asp:Literal ID="ltrLichSuMuaHang" runat="server"></asp:Literal>

    </table>
        
    </div>
<script type="text/javascript">
    function XoaDonHang(id) {
        if (confirm("Bạn chắc chắn muốn hủy đơn hàng này")) {
            //Viết code xóa danh mục tại đây

            $.post("cms/display/SanPham/Ajax/XuLyGioHang.aspx",
                {
                    "ThaoTac": "XoaDonHang",
                    "id": id
                },
                function (data, status) {
                    //alert("Data :" + data + "\n Status :" + status);
                    if (data == 1) {
                        $("#maDong_" + id).remove();
                    }
                });
        }
    }
    //Viết ajax lấy thông tin giỏ hàng từ session
    function LayThongTinGioHang() {        
        $.post("cms/display/SanPham/Ajax/XuLyGioHang.aspx",
         {
             "ThaoTac": "LayThongTinGioHang"
         },
         function (data, status) {
             //alert("Data :" + data + "\n Status :" + status);
             $("#BangThongTinGioHang").html(data);
         });
    }
    
    function LayTongSoSanPhamTrongGioHang() {
        $.post("cms/display/SanPham/Ajax/XuLyGioHang.aspx",
         {
             "ThaoTac": "LayTongSoSanPhamTrongGioHang"
         },
         function (data, status) {
             //alert("Data :" + data + "\n Status :" + status);
             $(".TongSoSPTrongGioHang").html(data);
         });
    }

    function LayTongTienTrongGioHang() {
        $.post("cms/display/SanPham/Ajax/XuLyGioHang.aspx",
         {
             "ThaoTac": "LayTongTienTrongGioHang"
         },
         function (data, status) {
             //alert("Data :" + data + "\n Status :" + status);
             $("#TongTienTrongGioHang").html(data);
         });
    }


    //Gọi hàm lần đầu để khi load trang sẽ lấy ra thông tin luôn
    $(document)
        .ready(function() {
            LayThongTinGioHang();
            LayTongSoSanPhamTrongGioHang();
            LayTongTienTrongGioHang();
        });



    //Hàm xóa 1 sản phẩm trong giỏ hàng
    function XoaSPTrongGioHang(idSanPham) {
        //Hỏi để xác nhận lại yêu cầu xóa từ người dùng
        if (confirm("Bạn muốn xóa sản phẩm này khỏi giỏ hàng?")) {

            $.post("cms/display/SanPham/Ajax/XuLyGioHang.aspx",
                {
                    "ThaoTac": "XoaSPTrongGioHang",
                    "idSanPham": idSanPham
                },
                function(data, status) {
                    //alert("Data :" + data + "\n Status :" + status);

                    //Nếu không có lỗi (tức là xóa thành công) --> ẩn dòng chứa sản phẩm khỏi bảng hiển thị giỏ hàng --> Gọi hàm cập nhật số lượng, tổng tiền
                    if (data === "") {
                        $("#tr_" + idSanPham).remove();

                        LayTongSoSanPhamTrongGioHang();
                        LayTongTienTrongGioHang();
                    }
                });
        }
    }


    //Hàm cập nhật số lượng cho một sản phẩm trong giỏ hàng
    function CapNhatSoLuongVaoGioHang(idSanPham) {

        //Lấy số lượng mới sửa từ textbox
        var soLuongMoi = $("#quantity_" + idSanPham).val();

        $.post("cms/display/SanPham/Ajax/XuLyGioHang.aspx",
               {
                   "ThaoTac": "CapNhatSoLuongVaoGioHang",
                   "idSanPham": idSanPham,
                   "soLuongMoi": soLuongMoi
               },
               function (data, status) {
                   //alert("Data :" + data + "\n Status :" + status);

                   //Nếu không có lỗi (tức là xóa thành công) --> ẩn dòng chứa sản phẩm khỏi bảng hiển thị giỏ hàng --> Gọi hàm cập nhật số lượng, tổng tiền
                   if (data === "") {                       
                       LayTongSoSanPhamTrongGioHang();
                       LayTongTienTrongGioHang();
                   }
               });
    }


    
    //Hàm gửi đơn hàng
    function GuiDonHang() {
        //Kiểm tra xem khách hàng đã nhập đủ họ tên và số điện thoại chưa
        if ($("#tbHoTen").val() !== "" && $("#tbSoDienThoai").val() !== "") {

            var phuongthucthanhtoan = "";
            if ($("#rbThanhToanSauKhiNhanHang").is(":checked")) phuongthucthanhtoan = "ThanhToanSauKhiNhanHang";
            if ($("#rbOnepay").is(":checked")) phuongthucthanhtoan = "Onepay";
            

            $.post("cms/display/SanPham/Ajax/XuLyGioHang.aspx",
                   {
                       "ThaoTac": "GuiDonHang",
                       "hoTen": $("#tbHoTen").val(),
                       "diaChi": $("#tbDiaChi").val(),
                       "soDienThoai": $("#tbSoDienThoai").val(),
                       "email": $("#tbEmail").val(),
                       "phuongThucThanhToan": phuongthucthanhtoan
                   },
                   function (data, status) {
                       //alert("Data :" + data + "\n Status :" + status);

                       //Nếu không có lỗi (tức là xóa thành công) --> thông báo đặt hàng thành công --> đẩy về trang chủ
                       if (phuongthucthanhtoan === "ThanhToanSauKhiNhanHang") {
                           if (data === "") {
                               alert("Bạn đã gửi đơn hàng thành công");
                               location.href = "/DanhGia.aspx";
                           }
                       } else {//Trường hợp thanh toán online --> đẩy tới trang thanh toán của đơn vị tích hợp
                           location.href = data;
                       }
                   });
        } else {
            alert("Vui lòng nhập đầy đủ Họ tên và Số điện thoại để đặt hàng");
        }
    }
</script>