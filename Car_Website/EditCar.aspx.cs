using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class EditCar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
  
            cPrice.Enabled = false;
            cModel.Enabled = false;
            cDes.Enabled = false;
            cCompany.Enabled = false;
            ctype.Enabled = false;
            btnUpdate.Enabled = false;
            chkAgree.Enabled = false;
        }
        if (chkAgree.Checked == false)
            btnUpdate.Enabled = false;
        else
            btnUpdate.Enabled = true;
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection("Data Source=DESKTOP-LBEC58U;Initial Catalog=carDb;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("Select cId, cModel, Company, Types, cPrice, cDes From ((tblCar tw Inner Join tblType twb On tw.tId=twb.tId) Inner Join tblCompany tc On tc.CompanyId=tw.CompanyId) where cId=@cId", cnn);

        cmd.Parameters.Add("@cId", System.Data.SqlDbType.NVarChar);
        cmd.Parameters["@cId"].Value = cId.Text;

        SqlDataReader rd;
        cnn.Open();
        rd = cmd.ExecuteReader();
        if (rd.Read() == true)
        {
            ctype.Enabled = true;
            cPrice.Enabled = true;
            cModel.Enabled = true;
            cDes.Enabled = true;
            cCompany.Enabled = true;
        
            cId.Text = rd[0].ToString();
            ctype.SelectedValue = ctype.Items.FindByText(rd[3].ToString()).Value;
            cCompany.SelectedValue=cCompany.Items.FindByText(rd[2].ToString()).Value;   
            cModel.Text = rd[1].ToString();
            cPrice.Text = rd[4].ToString();
            cDes.Text = rd[5].ToString();
            cId.Enabled = false;
            chkAgree.Enabled = true;
            if (chkAgree.Checked == false)
                btnUpdate.Enabled = false;
            else
                btnUpdate.Enabled = true;
            lblMes.Text = "";
        }
        else
            lblMes.Text = "There is no the file found!!!";

        rd.Close();
        cnn.Close();
    }
    protected void bntupdate_click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection("Data Source=DESKTOP-LBEC58U;Initial Catalog=carDb;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("update tblcar set tId=@tId, companyId=@companyId,  cmodel=@cmodel, cprice=@cprice, cdes=@cdes where cid=@cid ", cnn);

        cmd.Parameters.Add("@cId", System.Data.SqlDbType.NVarChar);
        cmd.Parameters["@cId"].Value = cId.Text;
        cmd.Parameters.Add("@CompanyId", System.Data.SqlDbType.Int);
        cmd.Parameters["@CompanyId"].Value = cCompany.SelectedValue;
        cmd.Parameters.Add("@tId", System.Data.SqlDbType.Int);
        cmd.Parameters["@tId"].Value = ctype.SelectedValue;
        cmd.Parameters.Add("@cPrice", System.Data.SqlDbType.Float);
        cmd.Parameters["@cPrice"].Value = cPrice.Text;
        cmd.Parameters.Add("@cModel", System.Data.SqlDbType.NVarChar);
        cmd.Parameters["@cModel"].Value = cModel.Text;
        cmd.Parameters.Add("@cDes", System.Data.SqlDbType.NVarChar);
        cmd.Parameters["@cDes"].Value = cDes.Text;
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();

        cId.Enabled = false;
        cCompany.Enabled = false;
        ctype.Enabled = false;
        cPrice.Enabled = false;
        cModel.Enabled = false;
        cDes.Enabled = false;

        btnUpdate.Enabled = false;
        chkAgree.Checked = false;
        chkAgree.Enabled = false;

        lblMes.Text = "updated successfully !!!";
        }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        cId.Text = "";
        cPrice.Text = "";
        cModel.Text = "";
        cDes.Text = "";
        lblMes.Text = "";
        chkAgree.Checked = false;
        cId.Enabled = true;
        cPrice.Enabled = false;
        cModel.Enabled = false;
        cDes.Enabled = false;
        cCompany.Enabled = false;
        ctype.Enabled = false;
        btnUpdate.Enabled = false;
        chkAgree.Enabled = false;
        if (chkAgree.Checked == false)
            btnUpdate.Enabled = false;
        else
            btnUpdate.Enabled = true;

    }
}