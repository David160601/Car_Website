using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class CarDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String sId = Request.QueryString.Get("pid");
            SqlConnection cnn = new SqlConnection("Data Source=DESKTOP-LBEC58U;Initial Catalog=carDb;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("SELECT tblCompany.Company, tblType.Types, tblCar.cId, tblCar.cDes, tblCar.cModel, tblCar.cPrice, tblCar.imgUrl FROM tblCar INNER JOIN tblCompany ON tblCar.CompanyId = tblCompany.CompanyId INNER JOIN tblType ON tblCar.tId = tblType.tId where cId=@cId", cnn);
            cmd.Parameters.Add("@cId", System.Data.SqlDbType.NVarChar);
            cmd.Parameters["@cId"].Value = sId;
            SqlDataReader rd;
            cnn.Open();
            rd = cmd.ExecuteReader();
            ListView1.DataSource = rd;
            ListView1.DataBind();
            rd.Close();
            cnn.Close();

            SqlCommand cmd1 = new SqlCommand("Select * From tblImages where cId=@cId", cnn);
            cmd1.Parameters.Add("@cId", System.Data.SqlDbType.NVarChar);
            cmd1.Parameters["@cId"].Value = sId;
            SqlDataReader rd1;
            cnn.Open();
            rd1 = cmd1.ExecuteReader();
            ListView2.DataSource = rd1;
            ListView2.DataBind();
            rd1.Close();
            cnn.Close();

        }
    }

    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}