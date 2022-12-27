using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class Cars : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlConnection cnn = new SqlConnection("Data Source=DESKTOP-LBEC58U;Initial Catalog=carDb;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("SELECT tblCompany.Company, tblType.Types, tblCar.* FROM tblCar INNER JOIN tblCompany ON tblCar.CompanyId = tblCompany.CompanyId INNER JOIN tblType ON tblCar.tId = tblType.tId where tblCar.CompanyId=1 and tblCar.tId=1", cnn);
            SqlDataReader rd;

            cnn.Open();

            rd = cmd.ExecuteReader();
            ListView1.DataSource = rd;
            ListView1.DataBind();
            rd.Close();
            cnn.Close();
        }

    }

    protected void ListView1_ItemCommand1(object sender, ListViewCommandEventArgs e)
    {
        TextBox tId = (TextBox)e.Item.FindControl("txtcId");

        Response.Redirect("cardetail.aspx?pid=" + tId.Text);
    }
    protected void CompanDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection("Data Source=DESKTOP-LBEC58U;Initial Catalog=carDb;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("SELECT tblCompany.Company, tblType.Types, tblCar.* FROM tblCar INNER JOIN tblCompany ON tblCar.CompanyId = tblCompany.CompanyId INNER JOIN tblType ON tblCar.tId = tblType.tId where tblCar.CompanyId=@CompanyId and tblCar.tId=@tId", cnn);
        cmd.Parameters.Add("@CompanyId", System.Data.SqlDbType.Int);
        cmd.Parameters["@CompanyId"].Value = CompanDropDownList.SelectedValue;
        cmd.Parameters.Add("@tId", System.Data.SqlDbType.Int);
        cmd.Parameters["@tId"].Value = tpeDropDownList.SelectedValue;
        SqlDataReader rd;
        cnn.Open();
        rd = cmd.ExecuteReader();
        ListView1.DataSource = rd;
        ListView1.DataBind();
        rd.Close();
        cnn.Close();

    }

    protected void tpeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection("Data Source=DESKTOP-LBEC58U;Initial Catalog=carDb;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("SELECT tblCompany.Company, tblType.Types, tblCar.* FROM tblCar INNER JOIN tblCompany ON tblCar.CompanyId = tblCompany.CompanyId INNER JOIN tblType ON tblCar.tId = tblType.tId where tblCar.CompanyId=@CompanyId and tblCar.tId=@tId", cnn);
        cmd.Parameters.Add("@CompanyId", System.Data.SqlDbType.Int);
        cmd.Parameters["@CompanyId"].Value = CompanDropDownList.SelectedValue;
        cmd.Parameters.Add("@tId", System.Data.SqlDbType.Int);
        cmd.Parameters["@tId"].Value = tpeDropDownList.SelectedValue;
        SqlDataReader rd;
        cnn.Open();
        rd = cmd.ExecuteReader();
        ListView1.DataSource = rd;
        ListView1.DataBind();
        rd.Close();
        cnn.Close();
    }


}