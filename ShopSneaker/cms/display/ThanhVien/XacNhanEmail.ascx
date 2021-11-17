<%@ Control Language="C#" AutoEventWireup="true" CodeFile="XacNhanEmail.ascx.cs" Inherits="cms_display_ThanhVien_XacNhanEmail" %>

<link href="../../../css/login-register.css" rel="stylesheet" />
<div class="body-form">
    <div class="form-login">
        <div class="title-login">
            <h3>Xác nhận Email</h3>
            <hr />
        </div>
        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
    
        <asp:Label ID="Label1" runat="server" Text="Nhập mã xác nhận:"></asp:Label>
        <asp:TextBox ID="txtcode" runat="server"></asp:TextBox>
        
        <asp:Label ID="lbthongbao" ForeColor="Red" runat="server" Display="Dynamic"></asp:Label>

        <div class="btn-login">
            <asp:LinkButton ID="Button1" CssClass="btn" runat="server" Text="Xác nhận" OnClick="Button1_Click1" />
        </div>
    </div> 
</div>