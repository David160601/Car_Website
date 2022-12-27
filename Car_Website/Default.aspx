<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Home" %>

<asp:Content ContentPlaceHolderID="UserMasterPagePlaceholder" Runat="Server">
     <style type="text/css">
       .image{
             width:350px;
           height:100%;
           display:block;
       }
       .detailButton {
             text-decoration:none;
         }
              .card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 40%;
      margin:30px;
      padding:30px;
}

.card:hover {

  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}
    </style>
    <div class="carList">
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="cId" DataSourceID="SqlDataSource1" GroupItemCount="3" OnItemCommand="ListView1_ItemCommand1">
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
            <td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td runat="server" class="card">
                    <asp:textbox ID="txtcId" Visible="false" runat="server" Text='<%# Eval("cId") %>' />
                    <br />
                    <asp:image CssClass="image" ID="imgUrlLabel" runat="server" ImageUrl='<%# Eval("imgUrl") %>' />
                    <h3 style="display:contents">Model:</h3>
                    <asp:Label ID="cModelLabel" runat="server" Text='<%# Eval("cModel") %>' />
                    <br />Price:
                    <asp:Label ID="cPriceLabel" runat="server" Text='<%# Eval("cPrice") %>' />
                    <br />Description:
                    <asp:Label ID="cDesLabel" runat="server" Text='<%# Eval("cDes") %>' />
                    <br />
                    <asp:LinkButton CssClass="detailButton" ID="carDetail" Text="More Detail" runat="server"></asp:LinkButton>
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
   
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carDbConnectionString %>" SelectCommand="SELECT * FROM [tblCar]"></asp:SqlDataSource>
    </div>
</asp:Content>

