<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<%@ Register Src="~/cms/admin/AdminLoadControl.ascx" TagPrefix="uc1" TagName="AdminLoadControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang quản trị website shop sneaker</title>
    <link href="cms/admin/css/Admin.css" rel="stylesheet" />
    <script src="cms/admin/js/jquery-3.6.0.min.js"></script>
     <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link href="css/demo.css" rel="stylesheet" />
    <style>
        .FormThemMoi .thongBaoTaoThanhCong {
            color: #333;
        }
        .name_job a{
            color:white;
        }
        .name_job a:hover {
            color:red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="sidebar">
        <div class="logo_content">
            <div class="logo">
              <i class='bx bxl-redux'></i>
                <div class="logo_name">Trang Quản Trị</div>
            </div>
             
        </div>
        <ul class="nav_list">
            <li>
                <a href="Default.aspx">
                  <i class='bx bx-grid-alt'></i>
                  <span class="links_name">Trang Chủ</span>
                </a> 
               <%--<span class="khoi">Trang Chủ</span>--%>
              </li>
              <li>
                <a href="Admin.aspx?modul=SanPham">
                    <i class='bx bxs-user-circle' ></i>
                  <span class="links_name">Sản Phẩm</span>
                </a> 
               <%--  <span class="khoi">Sản Phẩm</span>   --%>            
              </li>
                 <li>
                <a href="Admin.aspx?modul=SanPham&modulphu=DanhMuc">
                    <i class='bx bxs-user-circle' ></i>
                  <span class="links_name">Danh Sách Danh Mục</span>
                </a> 
                <%-- <span class="khoi">Danh Sách Danh Mục</span>--%>
              </li>
            <li>
                <a href="Admin.aspx?modul=SanPham&modulphu=DonHang">
                    <i class='bx bxs-user-circle' ></i>
                  <span class="links_name">Danh Sách Đơn Hàng</span>
                </a> 
                <%-- <span class="khoi">Danh Sách Đơn Hàng</span>--%>
              </li>
              <li>
                <a href="Admin.aspx?modul=KhachHang">
                    <i class='bx bx-message-alt'></i>
                  <span class="links_name">Khách Hàng</span>
                </a> 
                 <%--<span class="khoi">Khách Hàng</span>--%>
              </li>
              <li>
                <a href="Admin.aspx?modul=TaiKhoan">
                    <i class='bx bx-pie-chart-alt'></i>
                  <span class="links_name">Tài Khoản</span>
                </a> 
                <%--<span class="khoi">Tài Khoản</span>--%>
              </li>
            <li>
                <a href="Admin.aspx?modul=SanPham&modulphu=BaoCao">
                    <i class='bx bx-pie-chart-alt'></i>
                  <span class="links_name">Báo cáo thống kê</span>
                </a> 
               
              </li>
        </ul>
        <div class="profile_content">
            <div class="profile">
                <div class="profile_details">
                    <img src="hinhanh/logo.png" alt="">
                   <div class="name_job">
                        
                        Xin chào:<asp:Literal ID="ltrTenDangNhap" runat="server"></asp:Literal> | <asp:LinkButton ID="lbtDangXuat" runat="server" OnClick="lbtDangXuat_Click">Đăng xuất</asp:LinkButton>
                    
                   </div>
                </div>
            </div>
        </div>
    </div>
   <%-- <div class="home_content">
        <div class="text">Home</div>
    </div>--%>

    <script>
        let btn=document.querySelector("#btn");
        let sidebar=document.querySelector(".sidebar");
        btn.onclick=function(){
sidebar.classList.toggle("active");
        }
        btn.onclick=function(){
sidebar.classList.toggle("active");
        }
        btn.onclick=function(){
sidebar.classList.toggle("active");
        }

    </script>
             <%--Nội dung trang--%>
            <uc1:AdminLoadControl runat="server" ID="AdminLoadControl" />
        </div>
    </form>
</body>
</html>


