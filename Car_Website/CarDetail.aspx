<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="CarDetail.aspx.cs" Inherits="CarDetail" %>

<asp:Content ContentPlaceHolderID="UserMasterPagePlaceholder" Runat="Server">
     <style type="text/css">
       .image{
           width:500px;
       }
         .mainImage{
           width:800px;
       }
          .carList {
             width:80%;
             margin:auto;
         }
    </style>
    <div>
        <asp:ListView ID="ListView1" runat="server" >
            <ItemTemplate>
                <span style="">Company:
                <asp:Label ID="CompanyLabel" runat="server" Text='<%# Eval("Company") %>' />
                <br />
                Types:
                <asp:Label ID="TypesLabel" runat="server" Text='<%# Eval("Types") %>' />
                <br />
                Des:
                <asp:Label ID="cDesLabel" runat="server" Text='<%# Eval("cDes") %>' />
                <br />
                Model:
                <asp:Label ID="cModelLabel" runat="server" Text='<%# Eval("cModel") %>' />
                <br />
                Price:
                <asp:Label ID="cPriceLabel" runat="server" Text='<%# Eval("cPrice") %>' />
                <br />
                <asp:image ID="imgUrlLabel" CssClass="mainImage" runat="server" ImageUrl='<%# Eval("imgUrl") %>' />
                <br />
               <br /></span>
            </ItemTemplate>
        </asp:ListView>
        <h2>More Images</h2>
        <div class="carList">
              <asp:ListView ID="ListView2" runat="server"  GroupItemCount="3">
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td runat="server" style="">
                    <asp:image ID="ImgUrlsLabel" runat="server" CssClass="image" ImageUrl='<%# Eval("ImgUrls") %>' />
                    <br /></td>
            </ItemTemplate>
        </asp:ListView>
            </div>
      

    </div>
</asp:Content>

