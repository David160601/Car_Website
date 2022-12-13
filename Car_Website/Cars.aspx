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
        <asp:ListView ID="ListView1" runat="server" GroupItemCount="3">

          
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
 
            <ItemTemplate>
                <td runat="server" style="">cId:
                    <asp:Label ID="cIdLabel" runat="server" Text='<%# Eval("cId") %>' />
                    <br />CompanyId:
                    <asp:Label ID="CompanyIdLabel" runat="server" Text='<%# Eval("CompanyId") %>' />
                    <br />tId:
                    <asp:Label ID="tIdLabel" runat="server" Text='<%# Eval("tId") %>' />
                    <br />imgUrl:
                    <asp:Label ID="imgUrlLabel" runat="server" Text='<%# Eval("imgUrl") %>' />
                    <br />cPrice:
                    <asp:Label ID="cPriceLabel" runat="server" Text='<%# Eval("cPrice") %>' />
                    <br />cModel:
                    <asp:Label ID="cModelLabel" runat="server" Text='<%# Eval("cModel") %>' />
                    <br />cDes:
                    <asp:Label ID="cDesLabel" runat="server" Text='<%# Eval("cDes") %>' />
                    <br /></td>
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
                        <td runat="server" style=""></td>
                    </tr>
                </table>
            </LayoutTemplate>

        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:carDbConnectionString %>" SelectCommand="SELECT * FROM [tblCar]"></asp:SqlDataSource>
    </div>
</asp:Content>
