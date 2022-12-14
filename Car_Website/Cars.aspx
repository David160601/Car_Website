<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="Cars.aspx.cs" Inherits="Cars" %>

<asp:Content ContentPlaceHolderID="UserMasterPagePlaceholder" Runat="Server">
    <div> 
       Compan <asp:DropDownList AppendDataBoundItems="true" AutoPostBack="true" ID="CompanDropDownList" runat="server" DataSourceID="SqlDataSource1" DataTextField="Company" DataValueField="CompanyId" OnSelectedIndexChanged="CompanDropDownList_SelectedIndexChanged">
              <Items><asp:ListItem Text="---" Value="default" />
   </Items>
              </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carDbConnectionString %>" SelectCommand="SELECT * FROM [tblCompany]">
        </asp:SqlDataSource>
       tpe <asp:DropDownList AutoPostBack="true" ID="tpeDropDownList" runat="server" DataSourceID="SqlDataSource2" DataTextField="Types" DataValueField="tId" OnSelectedIndexChanged="tpeDropDownList_SelectedIndexChanged"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:carDbConnectionString %>" SelectCommand="SELECT * FROM [tblType]"></asp:SqlDataSource>
    </div>
    <div>
        <asp:ListView ID="ListView1" runat="server"></asp:ListView>
    </div>
</asp:Content>
