using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace shop
{
    /// <summary>
    /// Summary description for DangKy
    /// </summary>
    public class DangKy
    {
        #region Phương thức xóa tài khoản theo tên đăng nhập truyền vào
        /// <summary>
        ///  Phương thức xóa tài khoản theo tên đăng nhập truyền vào
        /// </summary>
        /// <param name="tendangnhap"></param>
        public static void Dangky_Delete(string tendangnhap)
        {
            OleDbCommand cmd = new OleDbCommand("Dangky_Delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tendangnhap", tendangnhap);
            SQLDatabase.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức thêm mới tài khoản vào bảng đăng ký
        /// <summary>
        /// Phương thức thêm mới tài khoản vào bảng đăng ký
        /// </summary>
        /// <param name="tendangnhap"></param>
        /// <param name="matkhau"></param>
        /// <param name="emaildk"></param>
        /// <param name="diachidk"></param>
        /// <param name="tendaydu"></param>
  
        /// <param name="ngaysinh"></param>
        /// <param name="gioitinhdk"></param>
        /// <param name="maquyen"></param>
        /// <param name="ret"></param>
        public static void DangKy_Insert(string tendangnhap, string matkhau, string emaildk, string diachidk, string tendaydu, string ngaysinh, string gioitinhdk, string maquyen, string ret)
        {
            OleDbCommand cmd = new OleDbCommand("DangKy_Insert");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tendangnhap", tendangnhap);
            cmd.Parameters.AddWithValue("@matkhau", matkhau);
            cmd.Parameters.AddWithValue("@emaildk", emaildk);
            cmd.Parameters.AddWithValue("@diachidk", diachidk);
            cmd.Parameters.AddWithValue("@tendaydu", tendaydu);     
            cmd.Parameters.AddWithValue("@ngaysinh", ngaysinh);
            cmd.Parameters.AddWithValue("@gioitinhdk", gioitinhdk);
            cmd.Parameters.AddWithValue("@maquyen", maquyen);
            cmd.Parameters.AddWithValue("@ret", ret);
            SQLDatabase.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region  Phương thức chỉnh sửa thông tin một tài khoản đăng ký
        /// <summary>
        /// Phương thức chỉnh sửa thông tin một tài khoản đăng ký
        /// </summary>
        /// <param name="tendangnhap"></param>
        /// <param name="matkhau"></param>
        /// <param name="emaildk"></param>
        /// <param name="diachidk"></param>
        /// <param name="tendaydu"></param>
        
        /// <param name="ngaysinh"></param>
        /// <param name="gioitinhdk"></param>
        /// <param name="maquyen"></param>
        public static void DangKy_Update(string tendangnhap, string matkhau, string emaildk, string diachidk, string tendaydu,  string ngaysinh, string gioitinhdk, string maquyen)
        {
            OleDbCommand cmd = new OleDbCommand("DangKy_Update");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tendangnhap", tendangnhap);
            cmd.Parameters.AddWithValue("@matkhau", matkhau);
            cmd.Parameters.AddWithValue("@emaildk", emaildk);
            cmd.Parameters.AddWithValue("@diachidk", diachidk);
            cmd.Parameters.AddWithValue("@tendaydu", tendaydu);           
            cmd.Parameters.AddWithValue("@ngaysinh", ngaysinh);
            cmd.Parameters.AddWithValue("@gioitinhdk", gioitinhdk);
            cmd.Parameters.AddWithValue("@maquyen", maquyen);
            SQLDatabase.ExecuteNoneQuery(cmd);
        }


        #endregion

        #region Phương thức lấy ra danh sách tất cả tài khoản đăng ký
        /// <summary>
        /// Phương thức lấy ra danh sách tất cả tài khoản đăng ký
        /// </summary>
        /// <returns></returns>
        public static DataTable Thongtin_Dangky()
        {
            OleDbCommand cmd = new OleDbCommand("Thongtin_Dangky");
            cmd.CommandType = CommandType.StoredProcedure;
            return SQLDatabase.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy ra thông tin tìa khoản theo tên đăng nhập
        /// <summary>
        /// Phương thức lấy ra thông tin tìa khoản theo tên đăng nhập
        /// <para name="TenDangNhap">Tên đăng nhập của tài khoản cần lấy thông tin</para>
        /// </summary>
        /// <returns></returns>
        public static DataTable Thongtin_DangKy_by_id(string TenDangNhap)
        {
            OleDbCommand cmd = new OleDbCommand("Thongtin_Dangky_By_Id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TenDangNhap", TenDangNhap);
            return SQLDatabase.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy ra thông tin tài khoản theo tên đăng nhập và mật khẩu
        /// <summary>
        /// Phương thức lấy ra thông tin tài khoản theo tên đăng nhập và mật khẩu
        /// </summary>
        /// <param name="TenDangNhap"></param>
        /// <param name="MatKhau"></param>
        /// <returns></returns>
        public static DataTable Thongtin_DangKy_by_id_matkhau(string TenDangNhap, string MatKhau)
        {
            OleDbCommand cmd = new OleDbCommand("Thongtin_Dangky_By_Id_Matkhau");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TenDangNhap", TenDangNhap);
            cmd.Parameters.AddWithValue("@MatKhau", MatKhau);
            return SQLDatabase.GetData(cmd);
        }
        #endregion
    }
}

