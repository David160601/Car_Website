<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EditCar.aspx.cs" Inherits="EditCar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminMasterPagePlaceholder" Runat="Server">
    <div>
        <h1>Search For The Car By Id To Edit The Car Information</h1>
        <asp:Label runat="server" Text="Label" ID="lblMes"></asp:Label>
        <div style="display:flex;align-items:center">
            <div style="display:flex;align-items:center;margin-right:40px"><p style="margin-right:40px"> Car ID </p>  <asp:TextBox ID="cId" runat="server"></asp:TextBox></div>
        </div>
        <div style="display:flex;align-items:center">
            <div style="display:flex;align-items:center;margin-right:40px"><p style="margin-right:40px"> Price </p>  <asp:TextBox ID="cPrice" runat="server"></asp:TextBox></div>
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
            <div style="display:flex;align-items:center;margin-right:40px"><p style="margin-right:40px"> Company </p>  <asp:DropDownList ID="cCompany" runat="server" DataSourceID="CompanyDataSource" DataTextField="Company" DataValueField="CompanyId"></asp:DropDownList>
                <asp:SqlDataSource ID="CompanyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:carDbConnectionString %>" SelectCommand="SELECT * FROM [tblCompany]"></asp:SqlDataSource>
            </div>
        </div>
        <div style="display:flex;align-items:center;margin-top:16px">
            <div style="display:flex;align-items:center;margin-right:40px"><p style="margin-right:40px"> Description </p>
                           <asp:TextBox runat="server" ID="cDes" TextMode="MultiLine"></asp:TextBox>
                        
            </div>
        </div>
        <div style="margin-top:16px">
           <asp:CheckBox runat="server" ID="chkAgree" Text="Checked mean that you have agreed to our terms and policy."  AutoPostBack="True" />
        </div>
        <div style="margin-top:16px">
             <asp:Button runat="server" ID="btnSearch" Text="Search"  OnClick="btnSearch_Click" />
             <asp:Button  ID="btnUpdate" runat="server" Text="Update" OnClick="bntupdate_click"/>
             <asp:Button runat="server" ID="btnCancel" Text="Cancel" onClick="btnCancel_Click"/>
        </div>
    </div>
</asp:Content>

