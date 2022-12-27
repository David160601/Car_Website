﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EditImage.aspx.cs" Inherits="EditImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminMasterPagePlaceholder" Runat="Server">
    <div>
            <h2>Search For The Car By ID To Edit The Car Image </h2>
        <table style="width:90%">
        <tr>
            <td colspan="3" style="text-align:center">
                <asp:Label runat="server" ID="lblMes" ForeColor="#CC3300" Font-Bold="True" 
                    Font-Italic="True" BackColor="#FFFFCC"></asp:Label></td>
        </tr>
        <tr style="vertical-align:top">
            <td style="width:20%; padding:15px; vertical-align:top;">Car ID</td>
            <td style="width:25%; vertical-align:top;"> 
                <asp:TextBox runat="server" ID="cId" Width="180"></asp:TextBox>
                <br /><br />
                <asp:Button runat="server" ID="btnSearch" Text="Search" OnClick="btnSearch_Click"  /> 
            </td>
   
            <td style="width:50%; vertical-align:top; text-align:center"> 
                The Main Image <br />
                <asp:ListView runat="server" ID="lview1" >
                     <ItemTemplate>
                        <asp:image Width="300px" ID="mImgUrl" runat="server" 
                            ImageUrl='<%# Eval("ImgUrl") %>' />
                        <br />
                        <asp:textbox Visible="false" ID="mImgwId" runat="server" 
                            Text='<%# Eval("cId") %>' />
                    </ItemTemplate>
                </asp:ListView> 
            </td>
         </tr>
        <tr>
            <td colspan="3" style="text-align:center">
                Choose The New Main Image : 
                <asp:FileUpload ID="fmImg" runat="server" />
                <asp:Button runat="server" Text="Update the Main Image" ID="cmdUMI"  OnClick="cmdUMI_Click"
                    />
            </td>
        </tr>

        <tr>
            <td colspan="3">
                 <hr />
                <h3>More Images</h3>
       <asp:ListView ID="LView2" runat="server" DataKeyNames="ImgId"  GroupItemCount="3"   OnItemCommand="LView2_ItemCommand"
         >
           <ItemTemplate>
            <td id="Td1" runat="server" style="padding:10px; text-align:center">
                <asp:TextBox Visible="False" ID="txtImgIds" runat="server" 
                    Text='<%# Eval("ImgId") %>' />
                <asp:TextBox Visible="False" ID="TextBox1" runat="server" 
                    Text='<%# Eval("cId") %>' />
                <br />
                <asp:Image ImageAlign="Middle" ID="Image2" runat="server" Width="220" 
                    ImageUrl='<%# Eval("ImgUrls") %>' />
                <br /><br />
                 <asp:LinkButton CommandName="ImgDel" ID="ImgDel" Text="Delete" runat="server" 
                     Font-Bold="false" ForeColor="#009999" Font-Italic="true"></asp:LinkButton>
                <br />
            </td>
        </ItemTemplate>
 
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <LayoutTemplate>
            <table id="Table1" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td2" runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr2" runat="server">
                    <td id="Td3" runat="server" style="">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
     </asp:ListView>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align:center">
                Choose New Image to Upload : 
                <asp:FileUpload ID="fmImg2" runat="server" />
                <asp:Button runat="server" ID="ImgUpload" Text="Upload New Image" OnClick="ImgUpload_Click"
                   />
            </td>
        </tr>
     </table>
    </div>
</asp:Content>




