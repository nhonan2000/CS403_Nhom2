using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace shop
{
    /// <summary>
    /// Class thực hiện truy vấn liên quan đế bảng SanPham
    /// </summary>
    public class SanPham
    {
#region Phương thức xóa sản phẩm theo mã sản phẩm truyền vào
		 /// <summary>
        /// Phương thức xóa sản phẩm theo mã sản phẩm truyền vào
        /// </summary>
        /// <param name="masp">mã sản phẩm cần xóa</param>
        public static void Sanpham_Delete(string masp)
        {
            OleDbCommand cmd = new OleDbCommand("Sanpham_Delete");
            cmd.CommandType=CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@masp", masp);
            SQLDatabase.ExecuteNoneQuery(cmd);
        }
#endregion
        
#region Phương thức thêm mới sản phẩm vào bảng sản phẩm
		 /// <summary>
        /// Phương thức thêm mới sản phẩm vào bảng sản phẩm
        /// </summary>
        /// <param name="tensp"></param>
        /// <param name="mauID"></param>
        /// <param name="sizeID"></param>
        /// <param name="anhsanpham"></param>
        /// <param name="soluongsp"></param>
        /// <param name="giasp"></param>
        /// <param name="maDM"></param>
        /// <param name="nhomID"></param>
        /// <param name="ret"></param>
        public static void Sanpham_Insert(string tensp,string mauID, string sizeID,string anhsanpham,string soluongsp,string giasp,string maDM,string nhomID,string ret)
        {
            OleDbCommand cmd = new OleDbCommand("Sanpham_Insert");
            cmd.CommandType=CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tensp", tensp);
            cmd.Parameters.AddWithValue("@mauID", mauID);
            cmd.Parameters.AddWithValue("@sizeID", sizeID);
            cmd.Parameters.AddWithValue("@anhsanpham", anhsanpham);

            cmd.Parameters.AddWithValue("@soluongsp", soluongsp);
            cmd.Parameters.AddWithValue("@giasp", giasp);
           

            cmd.Parameters.AddWithValue("@maDM", maDM);
            cmd.Parameters.AddWithValue("@nhomID", nhomID);
            cmd.Parameters.AddWithValue("@ret", ret);
            SQLDatabase.ExecuteNoneQuery(cmd);
        }
#endregion
        
#region  Phương thức chỉnh sửa thông tin một sản phẩm
        /// <summary>
        /// Phương thức chỉnh sửa thông tin một sản phẩm
        /// </summary>
        /// <param name="masp"></param>
        /// <param name="tensp"></param>
        /// <param name="mauid"></param>
        /// <param name="sizeid"></param>
        /// <param name="anhsp"></param>
        /// <param name="soluongsp"></param>
        /// <param name="giasp"></param>
        /// <param name="madm"></param>
        /// <param name="nhomid"></param>
        public static void Sanpham_Update(string masp,string tensp,string mauid,string sizeid,string anhsp,string soluongsp,string giasp,string madm,string nhomid)
        {
            OleDbCommand cmd = new OleDbCommand("Sanpham_Update");
            cmd.CommandType=CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@masp", masp);
            cmd.Parameters.AddWithValue("@tensp", tensp);
            cmd.Parameters.AddWithValue("@mauid", mauid);
            cmd.Parameters.AddWithValue("@sizeid", sizeid);
            cmd.Parameters.AddWithValue("@anhsp", anhsp);

            cmd.Parameters.AddWithValue("@soluongsp", soluongsp);
            cmd.Parameters.AddWithValue("@giasp", giasp);

            cmd.Parameters.AddWithValue("@madm", madm);
            cmd.Parameters.AddWithValue("@nhomid", nhomid);
            SQLDatabase.ExecuteNoneQuery(cmd);
        }


	#endregion        
       
#region Phương thức lấy ra danh sách tất cả sản phẩm
		/// <summary>
        /// Phương thức lấy ra danh sách tất cả sản phẩm
        /// </summary>
        /// <returns></returns>
         public static DataTable Thongtin_Sanpham()
        {
            OleDbCommand cmd = new OleDbCommand("Thongtin_Sanpham");
            cmd.CommandType=CommandType.StoredProcedure;
            return SQLDatabase.GetData(cmd);
        } 
#endregion

         #region Phương thức lấy ra thông tin sản phẩm theo id sản phẩm
         /// <summary>
         /// Phương thức lấy ra thông tin size theo id size
         /// <para name="MaSP">Mã của sản phẩm cần lấy thông tin</para>
         /// </summary>
         /// <returns></returns>
         public static DataTable Thongtin_Sanpham_by_id(string MaSP)
         {
             OleDbCommand cmd = new OleDbCommand("Thongtin_Sanpham_By_Id");
             cmd.CommandType = CommandType.StoredProcedure;
             cmd.Parameters.AddWithValue("@MaSP", MaSP);
             return SQLDatabase.GetData(cmd);
         }
        #endregion


        #region Lấy danh sách sản phẩm theo nhóm id
        public static DataTable Thongtin_Sanpham_by_nhomid(string NhomID, string SoSPHienThi)
        {
            OleDbCommand cmd = new OleDbCommand("Thongtin_Sanpham_By_Nhomid");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NhomID", NhomID);
            cmd.Parameters.AddWithValue("@SoSPHienThi", SoSPHienThi);
            return SQLDatabase.GetData(cmd);
        }
        #endregion

        #region Lấy danh sách sản phẩm theo mã danh mục - chỉ 3 sản phẩm đầu
        public static DataTable Thongtin_Sanpham_by_madm(string MaDM)
        {
            OleDbCommand cmd = new OleDbCommand("Thongtin_Sanpham_By_Madm");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaDM", MaDM);
            return SQLDatabase.GetData(cmd);
        }

        public static DataTable Thongtin_Sanpham_by_madm_tatca(string MaDM)
        {
            OleDbCommand cmd = new OleDbCommand("Thongtin_Sanpham_By_Madm_Tatca");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaDM", MaDM);
            return SQLDatabase.GetData(cmd);
        }
        #endregion


        #region Lấy danh sách sản phẩm theo từ khóa tìm kiếm: sẽ tìm theo tên hoặc mã sản phẩm
        public static DataTable Thongtin_Sanpham_by_tukhoa(string tukhoa)
        {
            OleDbCommand cmd = new OleDbCommand("Thongtin_Sanpham_By_Tukhoa");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TuKhoa", tukhoa);
            return SQLDatabase.GetData(cmd);
        }
        #endregion

    }
}
