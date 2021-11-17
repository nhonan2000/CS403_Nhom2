using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;

/// <summary>
/// Summary description for ketnoi
/// </summary>
public class ketnoi
{
    SqlConnection con;
    private void layknoi()
    {
        //khởi tạo giá trị cho đối tượng SqlConnection 
        con = new SqlConnection(@"Data Source=ADMIN\SQL1;Initial Catalog=SHOP1;Integrated Security=True");
        con.Open();//mở kết nối
    }
    //y dựng hàm đóng kết nối
    private void dongketnoi()
    {
        if (con.State == ConnectionState.Open)//nếu kết nối đang mở
            con.Close();
    }
    public DataTable laydata(string sql)
    {
        DataTable dt = new DataTable();
        try
        {
            layknoi();//mở kết nối
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            adap.Fill(dt);//đổ dữ liệu vào dt
        }
        catch
        {
            dt = null;
        }
        finally
        {
            dongketnoi();
        }
        return dt;//kết quả trả về là 1 DataTable
    }
    public int xuly(string sql)
    {
        int kq = 0;
        try
        {
            layknoi();
            SqlCommand cmd = new SqlCommand(sql, con);
            kq = cmd.ExecuteNonQuery();//thuc thi cau len khong can truy van
        }
        catch
        {
            kq = 0;
        }
        finally
        {
            dongketnoi();
        }
        return kq;
    }
}