<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DanhGia.aspx.cs" Inherits="DanhGia" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="js/jquery-1.8.3.min.js"></script>   
    <link href="css/Totop.css" rel="stylesheet" />
    <script src="js/backtotop.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <%--<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet"> --%> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
    <link href="css/stylesheet.css" rel="stylesheet" />
    <link href="css/Default.css" rel="stylesheet" />
    <link href="css/INDEX.css" rel="stylesheet" />                                               
    <link href="css/danhgia.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            $('#toggle').click(function () {
                $('nav').slideToggle();
            });
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
		 <nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
		<div class="container-fluid">
			<a class="navbar-branch" href="Default.aspx?">
				<img src="images/giay.png" height="60">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav">
					<li class="nav-item active">
						<a href="Default.aspx?" class="nav-link">Trang Chủ</a>
					</li>
					<li class="nav-item">
						<a href="SanPham.aspx?modul=SanPham&modulphu=TrangChuModulSanPham" class="nav-link">Sản Phẩm</a>
					</li>
					<li class="nav-item">
						<a href="Gioithieu.aspx" class="nav-link">Giới Thiệu</a>
					</li>
					<li class="nav-item">
						<a href="LienHe.aspx" class="nav-link">Liên Hệ</a>
					</li>
				</ul>
				<div class="navbar-nav">
					<div class="search">
						<input type="text" placeholder="Search.." name="search" value="<%=tukhoa %>" id="keysearch" onkeydown="CheckPostSearch(event)">
				      	<a href="javascript://" onclick="PostSearch()" type="submit"><i class="fa fa-search"></i></a>			    
				  	</div>
                    <script type="text/javascript">
                        function CheckPostSearch(e) {
                            if (e.keyCode === 13) {
                                PostSearch();

                                e.preventDefault();
                            }
                        }

                        function PostSearch() {
                            $("#keysearch").show().focus();
                            if ($("#keysearch").val() !== "")
                                window.location = "/SanPham.aspx?modul=SanPham&modulphu=TimKiem&tukhoa=" + $("#keysearch").val();
                        }
                    </script>
				  	<div class="cart-user">
                        <div>
                            <a href="/SanPham.aspx?modul=SanPham&modulphu=GioHang"><i class='bx bx-cart'></i></a>
                        </div>			  		
                         <div class="dropdown">
                             <a href="SanPham.aspx?modul=ThanhVien&modulphu=DangNhap"><i class='bx bxs-user-circle'></i></a>
                             <div class="dropdown-content">      
                                <asp:PlaceHolder ID="plDaDangNhap" runat="server" Visible="False">                    
                                    <asp:Literal ID="ltrTenKhachHang" runat="server"></asp:Literal>
                                    <asp:LinkButton ID="lbtDangXuat" runat="server" OnClick="lbtDangXuat_Click" CausesValidation="false">Đăng Xuất</asp:LinkButton>
                                    <asp:LinkButton ID="lbtDoiMatKhau" runat="server" OnClick="lbtDoiMatKhau_Click" CausesValidation="false">Đổi Mật Khẩu</asp:LinkButton>
                                </asp:PlaceHolder>
                            </div>
                         </div>				  		                	
	            	</div>
	            	
				</div>				
			</div>
		</div>
	</nav>
        <div class="body-form1">
    <div class="form-login1">
        <div class="title-login1">
            <h3>ĐÁNH GIÁ SẢN PHẨM</h3>
            <hr />
        </div>
        <div class="box1">
    <div class="box-import1">
                <div class="box-input1">
                    <i class="fas fa-envelope"></i>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="text"  placeholder="Email của bạn"></asp:TextBox>
                </div>
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Vui lòng nhập email</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="<div style='color:red;padding:3px 0'>Email sai định dạng</div>" SetFocusOnError="True" Display="Dynamic" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
          <div class="box-import1">
                <div class="box-input1">
                    <i class="fas fa-user"></i>
                    <asp:TextBox ID="txtName" runat="server" CssClass="text" Width="100%" placeholder="Tên của bạn"></asp:TextBox>
                </div>
            </div>
             <div class="box-import1">
                <div class="box-input2">
                    <i class="fas fa-envelope"></i>
                    <asp:TextBox ID="txtMessage" runat="server" CssClass="text" Width="100%" Height="100" placeholder="Nội dung:"></asp:TextBox>
                </div>
            </div>
            <div class="btn-login1">
                <asp:LinkButton ID="btnSendmail" CssClass="btn" runat="server" OnClick="btnSendmail_Click">Gửi đánh giá</asp:LinkButton>
            </div>
            <div class="btn-login1">
                <asp:LinkButton ID="btnReset" CssClass="btn" runat="server" OnClick="btnReset_Click">Reset</asp:LinkButton>
            </div>
       <asp:Label ID="Label2" runat="server"></asp:Label>
     <tr><td colspan="2">
            <p> Không đánh giá nhấn vào<a style="color:red" href="/"> Thoát</a></p>
         <asp:label id="lblStatus" Runat="server" EnableViewState="False"></asp:label></td>
            </tr>
</div>
        </div>
        </div>
    </form>
</body>
</html>
