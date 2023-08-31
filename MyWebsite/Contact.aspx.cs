using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

namespace MyWebsite
{
    public partial class Contact : Page
    {
        string cs = ConfigurationManager.ConnectionStrings["MyHexaConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd,cnt;
        SqlDataAdapter adapter;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (con= new SqlConnection(cs)) {
                con.Open();
                cmd = new SqlCommand("Insert Into student(stdid,stdname,stdaddress,stdmob,stdcourse,stdemail) values(@id, @name, @address,@mob,@course,@email)", con);
                cnt = new SqlCommand("select count(*) as count from student", con);
                var c=(int)cnt.ExecuteScalar();
                
                c = c + 1;
                
                
                cmd.Parameters.Add("@id", SqlDbType.Int ).Value = c;
                cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = TextName.Text ;
                cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = TextAddr.Text;
                cmd.Parameters.Add("@mob", SqlDbType.VarChar ).Value  = TextPh.Text;
                cmd.Parameters.Add("@course", SqlDbType.VarChar).Value = DropDownList1.Text;
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = TextMail.Text;
                cmd.ExecuteNonQuery();
                con.Close();

            }
        }
    }
}