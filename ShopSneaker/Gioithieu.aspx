<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Gioithieu.aspx.cs" Inherits="Gioithieu" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHOP SNEAKER</title>
    <%--<link href="css/INDEX.css" rel="stylesheet" />--%>
    <script src="js/jquery-1.8.3.min.js"></script>   
    <%--<link href="css/style.css" rel="stylesheet" />--%>
    <%--<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">--%>
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">--%>
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">--%>
    <%--<link href="css/Default.css" rel="stylesheet" />--%>
    <%--<link href="css/Totop.css" rel="stylesheet" />--%>
    <%--<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">--%>
    <script src="js/backtotop.js"></script>
     <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link href="css/reponsive.css" rel="stylesheet" />--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link href="css/stylesheet.css" rel="stylesheet" />
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
</head>

<body onselectstart="return false" oncontextmenu="return false">
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
    </form>
    <ul>
    </ul>
    <div class="modau">
    <h1 style="text-align:center;">Giới thiệu về SHOP SNEAKER</h1>
        </div>
    <div style="margin-left:10%; margin-right:10%; line-height:1.5; text-indent:30px;">
        SHOP SNEAKER ra đời dựa trên niềm yêu thích giày Nike, giày Adidas, giày Vans… của chủ shop bởi vẻ đẹp mê hoặc của các mẫu giày thời thượng này!<br><br>
    </div>
    <div style="margin-left:10%; margin-right:10%; line-height:1.5; text-indent:30px;">
        Phần trở ngại lớn ở đây là giá tiền của những đôi giày Nike hay Adidas chính hãng thì quá cao so với đa phần các bạn trẻ, vì thế mình đã tìm tòi và tạo ra Giày Station để nhằm đưa đến cho các bạn có niềm yêu thích những đôi giày cá tính này với một mức giá hấp dẫn kèm với chất lượng tốt nhất trong tầm giá.<br><br>
    </div>
    <div style="margin-left:10%; margin-right:10%; line-height:1.5; text-indent:30px;">
        Với tiêu chí mức giá hợp lý, vừa túi tiền nhưng chất lượng lại tốt hơn so với những gì các bạn lại bỏ ra, Giày Station hứa sẽ luôn luôn đưa đến chân của bạn chất lượng giày đảm bảo tốt nhất.<br><br>
    </div>
    <div style="margin-left:10%; margin-right:10%; line-height:1.5; text-indent:30px;">
        Tất cả sản phẩm giày, dép tại Giày Station là những mẫu giày Nike Fake 1, giày Adidas Fake 1, giày Vans Fake 1… Đều được dựa trên nguyên bản gốc của các hãng giày Nike và Adidas, giày Vans…<br><br>
    </div>
    <div style="margin-left:10%; margin-right:10%; line-height:1.5; text-indent:30px;">
        Các website thuộc hệ thống SHOP SNEAKER:<br><br>
    </div>
    <center><a href="Default.aspx"><img src="hinhanh/logo.png" width="100px"></a></center>
    <!--Footer-->
    <div class="div" id="footer">
        <center>
            &#169 2021 Copyright by SHOP SNEAKER
        </center>
    </div>
    <script type="text/javascript" src="../css/ToTop.js"></script>
    <div id="top">
        <a href="#">
            <img src="images/feature/backtotop.png" width="40px" />
        </a>
    </div>
</body>
</html>