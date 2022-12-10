<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddCar.aspx.cs" Inherits="AddCar" %>

<%-- Add content controls here --%>
<asp:Content ContentPlaceHolderID="AdminMasterPagePlaceHolder" Runat="Server">
    <div>
        <h1>Complete The Information To Add a New Car</h1>
        <asp:Label runat="server" Text="Label" ID="lblMes"></asp:Label>
        <div style="display:flex;align-items:center">
            <div style="display:flex;align-items:center;margin-right:40px"><p style="margin-right:40px"> Car ID </p>  <asp:TextBox ID="cId" runat="server"></asp:TextBox></div>
        </div>
         <div style="display:flex;align-items:center">
            <div style="display:flex;align-items:center;margin-right:40px"><p style="margin-right:40px"> Model </p>  <asp:TextBox ID="cModel" runat="server"></asp:TextBox></div>
            </div>
        </div>
        <div style="display:flex;align-items:center">
            <div style="display:flex;align-items:center;margin-right:40px"><p style="margin-right:40px"> Type </p> <asp:DropDownList ID="ctype" runat="server" DataSourceID="typeDataSource" DataTextField="Types" DataValueField="tId"></asp:DropDownList> 
                <asp:SqlDataSource ID="typeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:carDbConnectionString %>" SelectCommand="SELECT * FROM [tblType]"></asp:SqlDataSource>
            </div>
        </div>
        <div style="display:flex;align-items:center">
            <div style="display:flex;align-items:center;margin-right:40px"><p style="margin-right:40px"> Company </p>  <asp:DropDownList ID="cCompany" runat="server" DataSourceID="companyDataSource" DataTextField="Company" DataValueField="CompanyId"></asp:DropDownList>
                <asp:SqlDataSource ID="companyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:carDbConnectionString %>" SelectCommand="SELECT * FROM [tblCompany]"></asp:SqlDataSource>
            </div>
        </div>
        <div style="display:flex;align-items:center;margin-top:16px">
            <div style="display:flex;align-items:center;margin-right:40px"><p style="margin-right:40px"> Description </p>
                <asp:TextBox runat="server" ID="wDes"></asp:TextBox> </div>
        </div>
        <div style="margin-top:16px">
            <asp:FileUpload ID="ImgUpload" runat="server" />
             <asp:Label runat="server" Text="Label" ID="lblImgMes"></asp:Label>
        </div>
        <div style="margin-top:16px">
           <asp:CheckBox runat="server" ID="chkAgree" Text="Checked mean that you have agreed to our terms and policy."  AutoPostBack="True" />
        </div>
        <div style="margin-top:16px">
             <asp:Button runat="server" ID="btnAddNew" Text="Add new" />
             <asp:Button  ID="btnSubmit" runat="server" Text="Submit" />
             <asp:Button runat="server" Text="Cancel" />
        </div>
    </div>
</asp:Content>