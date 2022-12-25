<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserMasterPagePlaceholder" Runat="Server">
      <asp:Login ID="Login1" runat="server"></asp:Login>
    <asp:HyperLink runat="server" NavigateUrl="~/SignUp.aspx">Sign up</asp:HyperLink>
</asp:Content>

