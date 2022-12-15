<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="Cars.aspx.cs" Inherits="Cars" %>

<asp:Content ContentPlaceHolderID="UserMasterPagePlaceholder" Runat="Server">
    <div> 
       Compan <asp:DropDownList  AutoPostBack="true" ID="CompanDropDownList" runat="server" DataSourceID="SqlDataSource1" DataTextField="Company" DataValueField="CompanyId" OnSelectedIndexChanged="CompanDropDownList_SelectedIndexChanged">
       <%--       <Items><asp:ListItem Text="---" Value="default" />
   </Items>--%>
              </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carDbConnectionString %>" SelectCommand="SELECT * FROM [tblCompany]">
        </asp:SqlDataSource>
       tpe <asp:DropDownList AutoPostBack="true" ID="tpeDropDownList" runat="server" DataSourceID="SqlDataSource2" DataTextField="Types" DataValueField="tId" OnSelectedIndexChanged="tpeDropDownList_SelectedIndexChanged"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:carDbConnectionString %>" SelectCommand="SELECT * FROM [tblType]"></asp:SqlDataSource>
    </div>
    <div>
        <asp:ListView ID="ListView1" runat="server"  GroupItemCount="3" OnItemCommand="ListView1_ItemCommand1">

  
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>

            <ItemTemplate>
                <td runat="server" style="">
                 
                 
                    <asp:image ID="imgUrlLabel" runat="server" ImageUrl='<%# Eval("imgUrl") %>' />
                    <br />
                    Model:
                    <asp:Label ID="cModelLabel" runat="server" Text='<%# Eval("cModel") %>' />
                    <br />
                    Price:
                    <asp:Label ID="cPriceLabel" runat="server" Text='<%# Eval("cPrice") %>' />
                    <br />
                    Company:
                    <asp:Label ID="CompanyLabel" runat="server" Text='<%# Eval("Company") %>' />
                    <br />
                    Types:
                    <asp:Label ID="TypesLabel" runat="server" Text='<%# Eval("Types") %>' />
                    <asp:textbox Visible="false" ID="txtcId" runat="server" Text='<%# Eval("cId") %>' />
                    <br />
                    Des:
                    <asp:Label ID="cDesLabel" runat="server" Text='<%# Eval("cDes") %>' />
                    <br />
                    <asp:LinkButton ID="carDetail" Text="More Detail" runat="server"></asp:LinkButton>
                
             
         
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
                  
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
    
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:carDbConnectionString %>" SelectCommand="SELECT tblCompany.Company, tblType.Types, tblCar.* FROM tblCar INNER JOIN tblCompany ON tblCar.CompanyId = tblCompany.CompanyId INNER JOIN tblType ON tblCar.tId = tblType.tId"></asp:SqlDataSource>
    </div>
</asp:Content>
