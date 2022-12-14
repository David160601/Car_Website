<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EditCompany.aspx.cs" Inherits="EditCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminMasterPagePlaceholder" Runat="Server">
    <div>
        <h1>Companies</h1>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CompanyId" DataSourceID="companyDataSource" ForeColor="#333333" GridLines="None" Width="1004px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="CompanyId" HeaderText="CompanyId" ReadOnly="True" SortExpression="CompanyId" />
                <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="companyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:carDbConnectionString %>" DeleteCommand="DELETE FROM [tblCompany] WHERE [CompanyId] = @CompanyId" InsertCommand="INSERT INTO [tblCompany] ([CompanyId], [Company]) VALUES (@CompanyId, @Company)" SelectCommand="SELECT * FROM [tblCompany]" UpdateCommand="UPDATE [tblCompany] SET [Company] = @Company WHERE [CompanyId] = @CompanyId">
            <DeleteParameters>
                <asp:Parameter Name="CompanyId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CompanyId" Type="Int32" />
                <asp:Parameter Name="Company" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Company" Type="String" />
                <asp:Parameter Name="CompanyId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

