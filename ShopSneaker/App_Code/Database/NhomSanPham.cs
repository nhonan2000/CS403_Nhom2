using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;


namespace shop
{
    /// <summary>
    /// Summary description for NhomSanPham
    /// </summary>
    public class NhomSanPham
    {
        #region Phương thức xóa Nhomsanpham theo mã Nhomsanpham truyền vào
        /// <summary>
        /// Phương thức xóa Nhomsanpham theo mã Nhomsanpham truyền vào
        /// </summary>
        /// <param name="nhomid"></param>
        public static void Nhomsanpham_Delete(string nhomid)
        {
            OleDbCommand cmd = new OleDbCommand("Nhomsanpham_Delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nhomid", nhomid);
            SQLDatabase.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức thêm mới Nhomsanpham vào Nhomsanpham
        /// <summary>
        /// Phương thức thêm mới Nhomsanpham vào Nhomsanpham
        /// </summary>
        /// <param name="tennhom"></param>
       
        /// <param name="thutu"></param>
        /// <param name="soSPhienthi"></param>
        /// <param name="ret"></param>
        public static void Nhomsanpham_Insert(string tennhom,string thutu,string soSPhienthi,string ret)
        {
            OleDbCommand cmd = new OleDbCommand("Nhomsanpham_Insert");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tennhom", tennhom);
            cmd.Parameters.AddWithValue("@thutu", thutu);
            cmd.Parameters.AddWithValue("@soSPhienthi", soSPhienthi);
            cmd.Parameters.AddWithValue("@ret", ret);
            SQLDatabase.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region  Phương thức chỉnh sửa thông tin một Nhomsanpham
        /// <summary>
        /// Phương thức chỉnh sửa thông tin một Nhomsanpham
        /// </summary>
        /// <param name="nhomid"></param>
        /// <param name="tennhom"></param>
        /// <param name="thutu"></param>
        /// <param name="solanhienthi"></param>
        public static void Nhomsanpham_Update(string nhomid,string tennhom,string thutu,string solanhienthi)
        {
            OleDbCommand cmd = new OleDbCommand("Nhomsanpham_Update");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nhomid", nhomid);
            cmd.Parameters.AddWithValue("@tennhom", tennhom);
            cmd.Parameters.AddWithValue("@thutu", thutu);
            cmd.Parameters.AddWithValue("@solanhienthi", solanhienthi);
            SQLDatabase.ExecuteNoneQuery(cmd);
        }


        #endregion

        #region Phương thức lấy ra danh sách tất cả Nhomsanpham
        /// <summary>
        /// Phương thức lấy ra danh sách tất cả Nhomsanpham
        /// </summary>
        /// <returns></returns>
        public static DataTable Thongtin_Nhomsp()
        {
            OleDbCommand cmd = new OleDbCommand("Thongtin_Nhomsp");
            cmd.CommandType = CommandType.StoredProcedure;
            return SQLDatabase.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy ra thông tin nhóm sản phẩm theo id nhóm sản phẩm
        /// <summary>
        /// Phương thức lấy ra thông tin nhóm sản phẩm theo id nhóm sản phẩm
        /// <para name="NhomID">Mã của danh mục cần lấy thông tin</para>
        /// </summary>
        /// <returns></returns>
        public static DataTable Thongtin_Nhomsp_by_id(string NhomID)
        {
            OleDbCommand cmd = new OleDbCommand("Thongtin_Nhomsp_By_Id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NhomID", NhomID);
            return SQLDatabase.GetData(cmd);
        }
        #endregion
    }
}
