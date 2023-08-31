using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace MyWebsite.LogAdmin
{
   
    public partial class CourseDetails : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["MyHexaConnectionString"].ConnectionString;
        SqlConnection con,conn;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            OnDataload();
        }
        public void OnDataload()
        {
            if (Page.IsPostBack)
            {
                GridView1.DataBind();
            }
        }
        public void ClearData()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox1.Text = GridView1.SelectedRow.Cells[2].Text;
            TextBox2.Text = GridView1.SelectedRow.Cells[3].Text;
            TextBox3.Text = GridView1.SelectedRow.Cells[4].Text;
            TextBox4.Text = GridView1.SelectedRow.Cells[1].Text;
        }

       protected void LinkButton1_Click(object sender, EventArgs  e)
        {    
            if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox3.Text != "")
            {
                //using (con = new SqlConnection(cs))
                //{
                //    con.Open();
                //    cmd = new SqlCommand("Insert Into courses(coursename,coursefee,courseduration,CLevel) values(@name,@fee,@dur,@lev)", con);
                //   // cmd.Parameters.Add("@id", SqlDbType.Int).Value = 5;
                //    cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = TextBox1.Text;
                //    cmd.Parameters.Add("@fee", SqlDbType.VarChar).Value = TextBox2.Text;
                //    cmd.Parameters.Add("@dur", SqlDbType.VarChar).Value = TextBox3.Text;
                //    string v = DropLevel.SelectedValue ;
                //    cmd.Parameters.Add("@lev", SqlDbType.Int).Value =Convert.ToInt32(v) ;
                //    cmd.ExecuteNonQuery();
                //    con.Close();
                //}


                using (conn = new SqlConnection(cs))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("dbo.sp_courseInsert", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@cname", SqlDbType.VarChar).Value = TextBox1.Text;
                        cmd.Parameters.Add("@cfee", SqlDbType.Int).Value = TextBox2.Text;
                        cmd.Parameters.Add("@cdur", SqlDbType.Int).Value = TextBox3.Text;
                        string v = DropLevel.SelectedValue;
                        cmd.Parameters.Add("@lev", SqlDbType.Int).Value =Convert.ToInt32(v) ;

                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }



            }

            OnDataload();
            ClearData();



        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox3.Text != "")
            {
                //using (con = new SqlConnection(cs))
                //{
                //    con.Open();
                //    cmd = new SqlCommand("Delete From courses where courseid=@id", con);
                //    string s = TextBox4.Text;
                //     cmd.Parameters.Add("@id", SqlDbType.Int ).Value = Convert.ToInt32(s); 
                   
                //    cmd.ExecuteNonQuery();
                //    con.Close();
                //}



                using (conn = new SqlConnection(cs))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("dbo.sp_delete", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        string s = TextBox4.Text;
                        cmd.Parameters.Add("@cid", SqlDbType.Int).Value = Convert.ToInt32(s);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }



            }





            OnDataload();
            ClearData();
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adminhome.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox3.Text != "")
            {
                //using (con = new SqlConnection(cs))
                //{
                //    con.Open();
                //    cmd = new SqlCommand("Update courses set coursename=@name,coursefee=@fee,courseduration=@dur,CLevel=@lev where courseid=@id", con);
                //    cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = TextBox1.Text;
                //    cmd.Parameters.Add("@fee", SqlDbType.VarChar).Value = TextBox2.Text;
                //    cmd.Parameters.Add("@dur", SqlDbType.VarChar).Value = TextBox3.Text;

                //    cmd.Parameters.Add("@lev", SqlDbType.Int).Value = 1;
                //    string s = TextBox4.Text;
                //    cmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(s);

                //    cmd.ExecuteNonQuery();
                //    con.Close();
                //}



                using (conn = new SqlConnection(cs))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("dbo.sp_coursedit", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@cname", SqlDbType.VarChar).Value = TextBox1.Text;
                        cmd.Parameters.Add("@cfee", SqlDbType.Int).Value = TextBox2.Text;
                        cmd.Parameters.Add("@cdur", SqlDbType.Int).Value = TextBox3.Text;
                        string v = DropLevel.SelectedValue;
                        cmd.Parameters.Add("@lev", SqlDbType.Int).Value = Convert.ToInt32(v);
                        string s = TextBox4.Text;
                        cmd.Parameters.Add("@cid", SqlDbType.Int).Value = Convert.ToInt32(s);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }

            }

            OnDataload();
            ClearData();
        }
        }
        }
    
