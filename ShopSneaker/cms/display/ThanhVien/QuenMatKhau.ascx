<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuenMatKhau.ascx.cs" Inherits="cms_display_ThanhVien_QuenMatKhau" %>
<link href="../../../css/login-register.css" rel="stylesheet" />
<div class="body-form">
    <div class="form-login">
        <div class="title-login">
            <h3>Quên Mật Khẩu</h3>
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
           
            <div class="btn-login">
                <asp:LinkButton ID="btnsend" CssClass="btn" runat="server" OnClick="btnsend_Click">Gửi</asp:LinkButton>
            </div>
       <asp:Label ID="Label3" runat="server"></asp:Label>
     <tr><td colspan="2">
            <asp:Label ID="lbresult" runat="server"></asp:Label>
          <asp:Label ID="txtmatkhau" runat="server"></asp:Label>
            </td></tr>
</div>
        </div>
        </div>
   
