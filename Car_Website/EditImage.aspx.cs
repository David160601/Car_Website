using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class EditImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

        SqlConnection cnn = new SqlConnection("Data Source=DESKTOP-LBEC58U;Initial Catalog=carDb;Integrated Security=True");

        SqlCommand cmd = new SqlCommand("Select cId, ImgUrl From tblCar where cId=@cId", cnn);
        cmd.Parameters.Add("@cId", System.Data.SqlDbType.NVarChar);
        cmd.Parameters["@cId"].Value = cId.Text;

        SqlCommand cmd1 = new SqlCommand("Select * From tblImages where cId=@cId", cnn);
        cmd1.Parameters.Add("@cId", System.Data.SqlDbType.NVarChar);
        cmd1.Parameters["@cId"].Value = cId.Text;

        SqlDataReader rd, rd1;
        cnn.Open();
        rd = cmd.ExecuteReader();
        lview1.DataSource = rd;
        lview1.DataBind();
        rd.Close();
        cnn.Close();

        cnn.Open();
        rd1 = cmd1.ExecuteReader();
        LView2.DataSource = rd1;
        LView2.DataBind();
        rd1.Close();
        cnn.Close();

    }

    protected void cmdUMI_Click(object sender, EventArgs e)
    {
        if (fmImg.HasFile)
        {
            String imgName = fmImg.FileName;
            fmImg.SaveAs(Server.MapPath("~\\Images") + "/" + fmImg.FileName);

            SqlConnection cnn = new SqlConnection("Data Source=DESKTOP-LBEC58U;Initial Catalog=carDb;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("Update tblCar Set ImgUrl=@ImgUrl " +
                "Where cId=@cId", cnn);

            cmd.Parameters.Add("@cId", System.Data.SqlDbType.NVarChar);
            cmd.Parameters["@cId"].Value = cId.Text;
            cmd.Parameters.Add("@ImgUrl", System.Data.SqlDbType.NVarChar);
            cmd.Parameters["@ImgUrl"].Value = "Images/" + imgName;
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();

            SqlCommand cmd1 = new SqlCommand("Select cId, ImgUrl From tblCar " +
                "where cId=@cId", cnn);

            cmd1.Parameters.Add("@cId", System.Data.SqlDbType.NVarChar);
            cmd1.Parameters["@cId"].Value = cId.Text;

            SqlDataReader rd1;
            cnn.Open();
            rd1 = cmd1.ExecuteReader();
            lview1.DataSource = rd1;
            lview1.DataBind();
            rd1.Close();
            cnn.Close();
        }
    }

    protected void ImgUpload_Click(object sender, EventArgs e)
    {
        if (fmImg2.HasFile)
        {
            String imgName2 = fmImg2.FileName;
            fmImg2.SaveAs(Server.MapPath("~\\Images") + "/" + fmImg2.FileName);

            SqlConnection cnn = new SqlConnection("Data Source=DESKTOP-LBEC58U;Initial Catalog=carDb;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("Insert Into tblImages Values(@cId, @ImgUrls)", cnn);
            cmd.Parameters.Add("@cId", System.Data.SqlDbType.NVarChar);
            cmd.Parameters["@cId"].Value = cId.Text;
            cmd.Parameters.Add("@ImgUrls", System.Data.SqlDbType.NVarChar);
            cmd.Parameters["@ImgUrls"].Value = "Images/" + imgName2;
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
            SqlCommand cmd1 = new SqlCommand("Select * From tblImages where cId=@cId", cnn);
            cmd1.Parameters.Add("@cId", System.Data.SqlDbType.NVarChar);
            cmd1.Parameters["@cId"].Value = cId.Text;
            SqlDataReader rd1;
            cnn.Open();
            rd1 = cmd1.ExecuteReader();
            LView2.DataSource = rd1;
            LView2.DataBind();
            rd1.Close();
            cnn.Close();
        }

    }



    protected void LView2_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        TextBox tIdD = (TextBox)e.Item.FindControl("txtImgIds");
        SqlConnection cnn = new SqlConnection("Data Source=DESKTOP-LBEC58U;Initial Catalog=carDb;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("Delete From tblImages Where ImgId=@ImgIdD", cnn);
        cmd.Parameters.Add("@ImgIdD", System.Data.SqlDbType.Int);
        cmd.Parameters["@ImgIdD"].Value = tIdD.Text;
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
        //Showing after Deleting
        SqlCommand cmd1 = new SqlCommand("Select * From tblImages where cId=@cId", cnn);
        cmd1.Parameters.Add("@cId", System.Data.SqlDbType.NVarChar);
        cmd1.Parameters["@cId"].Value = cId.Text;
        SqlDataReader rd1;
        cnn.Open();
        rd1 = cmd1.ExecuteReader();
        LView2.DataSource = rd1;
        LView2.DataBind();
        rd1.Close();
        cnn.Close();
    }

}