<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="CarDetail.aspx.cs" Inherits="CarDetail" %>

<asp:Content ContentPlaceHolderID="UserMasterPagePlaceholder" Runat="Server">
    <div>
        <asp:ListView ID="ListView1" runat="server" >
            <ItemTemplate>
                <span style="">Company:
                <asp:Label ID="CompanyLabel" runat="server" Text='<%# Eval("Company") %>' />
                <br />
                Types:
                <asp:Label ID="TypesLabel" runat="server" Text='<%# Eval("Types") %>' />
                <br />
                cId:
                <asp:Label ID="cIdLabel" runat="server" Text='<%# Eval("cId") %>' />
                <br />
                cDes:
                <asp:Label ID="cDesLabel" runat="server" Text='<%# Eval("cDes") %>' />
                <br />
                cModel:
                <asp:Label ID="cModelLabel" runat="server" Text='<%# Eval("cModel") %>' />
                <br />
                cPrice:
                <asp:Label ID="cPriceLabel" runat="server" Text='<%# Eval("cPrice") %>' />
                <br />
                imgUrl:
                <asp:Label ID="imgUrlLabel" runat="server" Text='<%# Eval("imgUrl") %>' />
                <br />
               <br /></span>
            </ItemTemplate>
        </asp:ListView>
        <asp:ListView ID="ListView2" runat="server"  GroupItemCount="3">
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td runat="server" style="">ImgId:
                    <asp:Label ID="ImgIdLabel" runat="server" Text='<%# Eval("ImgId") %>' />
                    <br />cId:
                    <asp:Label ID="cIdLabel" runat="server" Text='<%# Eval("cId") %>' />
                    <br />ImgUrls:
                    <asp:Label ID="ImgUrlsLabel" runat="server" Text='<%# Eval("ImgUrls") %>' />
                    <br /></td>
            </ItemTemplate>
        </asp:ListView>

    </div>
</asp:Content>

