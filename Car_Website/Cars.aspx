<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="Cars.aspx.cs" Inherits="Cars" %>

<asp:Content ContentPlaceHolderID="UserMasterPagePlaceholder" Runat="Server">
     <style type="text/css">
       .image{
           width:350px;
           height:100%;
           display:block;
       }
       .carDetail{
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
  
   <div style="margin:10px 0px">
         <div style="margin:10px 0px">
       Company <asp:DropDownList  AutoPostBack="true" ID="CompanDropDownList" runat="server" DataSourceID="SqlDataSource1" DataTextField="Company" DataValueField="CompanyId" OnSelectedIndexChanged="CompanDropDownList_SelectedIndexChanged">
       <%--       <Items><asp:ListItem Text="---" Value="default" />
   </Items>--%>
              </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:carDbConnectionString %>" SelectCommand="SELECT * FROM [tblCompany]">
        </asp:SqlDataSource>
       type <asp:DropDownList AutoPostBack="true" ID="tpeDropDownList" runat="server" DataSourceID="SqlDataSource2" DataTextField="Types" DataValueField="tId" OnSelectedIndexChanged="tpeDropDownList_SelectedIndexChanged"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:carDbConnectionString %>" SelectCommand="SELECT * FROM [tblType]"></asp:SqlDataSource>
    </div>
         
        <asp:ListView ID="ListView1" runat="server"  GroupItemCount="3" OnItemCommand="ListView1_ItemCommand1">
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>

            <ItemTemplate>
                <td runat="server" class="card">
                 
                 
                    <asp:image CssClass="image" ID="imgUrlLabel" runat="server" ImageUrl='<%# Eval("imgUrl") %>' />
                     <h3 style="display:contents">Model:</h3>
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
                    <asp:textbox AutoPostBack="true" Visible="false" ID="txtcId" runat="server" Text='<%# Eval("cId") %>' />
                        
                    <br />
                    Des:
                    <asp:Label ID="cDesLabel" runat="server" Text='<%# Eval("cDes") %>' />
                    <br />
                    <asp:LinkButton ID="carDetail" Text="More Detail" CssClass="carDetail" runat="server"></asp:LinkButton>
                
             
         
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
       
    </div>
</asp:Content>
