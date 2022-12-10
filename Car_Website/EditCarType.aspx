<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EditCarType.aspx.cs" Inherits="EditCarType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminMasterPagePlaceholder" Runat="Server">
    <div>
        <h1>Car Types</h1>
        <asp:GridView ID="TypeTable" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="tId" DataSourceID="carType" ForeColor="#333333" GridLines="None" Width="992px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="tId" HeaderText="tId" ReadOnly="True" SortExpression="tId" />
                <asp:BoundField DataField="Types" HeaderText="Types" SortExpression="Types" />
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
        <asp:SqlDataSource ID="carType" runat="server" ConnectionString="<%$ ConnectionStrings:carDbConnectionString %>" DeleteCommand="DELETE FROM [tblType] WHERE [tId] = @tId" InsertCommand="INSERT INTO [tblType] ([tId], [Types]) VALUES (@tId, @Types)" SelectCommand="SELECT * FROM [tblType]" UpdateCommand="UPDATE [tblType] SET [Types] = @Types WHERE [tId] = @tId">
            <DeleteParameters>
                <asp:Parameter Name="tId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="tId" Type="Int32" />
                <asp:Parameter Name="Types" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Types" Type="String" />
                <asp:Parameter Name="tId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

