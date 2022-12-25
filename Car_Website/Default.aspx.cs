using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void ListView1_ItemCommand1(object sender, ListViewCommandEventArgs e)
    {
        TextBox tId = (TextBox)e.Item.FindControl("txtcId");


        Response.Redirect("CarDetail.aspx?pid=" + tId.Text);
    }
}