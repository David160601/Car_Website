using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class AddCar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnSubmit.Enabled = false;
            btnAddNew.Visible = false;
            lblMes.Text = "";
            lblImgMes.Text = "";
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (ImgUpload.HasFile)
        {
            if (cId.Text.Equals("")|| cPrice.Text.Equals("")||cModel.Text.Equals("")||cDes.Text.Equals(""))
            {
                lblMes.Text = "Please complete all the car information";
            }
            else
            {
                String imgName = ImgUpload.FileName;
                ImgUpload.SaveAs(Server.MapPath("~\\Images") + "/" + ImgUpload.FileName);

                SqlConnection cnn = new SqlConnection("Data Source=DESKTOP-LBEC58U;Initial Catalog=carDb;Integrated Security=True");
                SqlCommand cmd = new SqlCommand("Insert into tblCar " +
                    "Values (@cId, @CompanyId, @tId, @ImgUrl, @cPrice, " +
                    "@cModel, @cDes)", cnn);

                cmd.Parameters.Add("@cId", System.Data.SqlDbType.NVarChar);
                cmd.Parameters["@cId"].Value = cId.Text;
                cmd.Parameters.Add("@CompanyId", System.Data.SqlDbType.Int);
                cmd.Parameters["@CompanyId"].Value = cCompany.SelectedValue;
                cmd.Parameters.Add("@tId", System.Data.SqlDbType.Int);
                cmd.Parameters["@tId"].Value = ctype.SelectedValue;
                cmd.Parameters.Add("@ImgUrl", System.Data.SqlDbType.NVarChar);
                cmd.Parameters["@ImgUrl"].Value = "Images/" + imgName;
                cmd.Parameters.Add("@cPrice", System.Data.SqlDbType.Float);
                cmd.Parameters["@cPrice"].Value = cPrice.Text;
                cmd.Parameters.Add("@cModel", System.Data.SqlDbType.NVarChar);
                cmd.Parameters["@cModel"].Value = cModel.Text;
                cmd.Parameters.Add("@cDes", System.Data.SqlDbType.NVarChar);
                cmd.Parameters["@cDes"].Value = cDes.Text;
                try
                {
                    cnn.Open();
                    cmd.ExecuteNonQuery();
                    cnn.Close();
                    cId.Enabled = false;
                    cCompany.Enabled = false;
                    ctype.Enabled = false;
                    cPrice.Enabled = false;
                    cModel.Enabled = false;
                    cDes.Enabled = false;

                    btnSubmit.Enabled = false;
                    btnSubmit.Visible = false;
                    chkAgree.Checked = false;
                    btnAddNew.Visible = true;
                    btnCancel.Visible = false;

                    lblMes.Text = "Adding The New Car Successfully !!!";
                    lblImgMes.Text = "";
                }
                catch (Exception ex)
                {
                    switch (Convert.ToString(ex.GetType().Name))
                    {
                        case "FormatException":
                            lblMes.Text = "Please input number in Price";
                            break;
                        case "SqlException":
                            lblMes.Text = "Car Id is already exist";
                            break;
                        default:
                            break;
                    }
                }
            }
    


        }
     
        else
            lblImgMes.Text = "Please choose a Photo of the Car";
    }

    protected void chkAgree_Checked(object sender, EventArgs e)
    {
        if (chkAgree.Checked == true)
            btnSubmit.Enabled = true;
        else
            btnSubmit.Enabled = false;
    }


    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        cId.Text = "";
        cPrice.Text = "";
        cModel.Text = "";
        cDes.Text = "";
        lblMes.Text = "";
        lblImgMes.Text = "";

        btnAddNew.Visible = false;

        cId.Enabled = true;
        cCompany.Enabled = true;
        ctype.Enabled = true;
        cPrice.Enabled = true;
        cModel.Enabled = true;
        cDes.Enabled = true;

        btnSubmit.Visible = true;
        btnSubmit.Enabled = false;
        btnCancel.Visible = true;
        chkAgree.Checked = false;
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        cId.Text = "";
        cPrice.Text = "";
        cModel.Text = "";
        cDes.Text = "";
        lblMes.Text = "";
        lblImgMes.Text = "";
        chkAgree.Checked = false;
    }
}