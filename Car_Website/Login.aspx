<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserMasterPagePlaceholder" Runat="Server">
    <style>
        .signUp{
            text-decoration:none;
            margin:10px 0;
        }
    </style>
    <div style="padding:30px 0">
      <asp:Login ID="Login1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" Height="177px" Width="325px">
          <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
          <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
          <TextBoxStyle Font-Size="0.8em" />
          <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
      </asp:Login>
    <asp:HyperLink runat="server" NavigateUrl="~/SignUp.aspx" CssClass="signUp">Sign up</asp:HyperLink>

    </div>

</asp:Content>

