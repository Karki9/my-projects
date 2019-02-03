<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutOfStock.aspx.cs" Inherits="ApplicationDevelopmentWebApp.OutOfStock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="searchTxtBox" runat="server"></asp:TextBox>

        <asp:Button ID="btnOutOfStock" runat="server" Text="Search" OnClick="btn_OutOfStock" />
        <asp:Button ID="btnClearStock" runat="server" Text="Clear" OnClick="btn_ClearStock" />
        <asp:Label ID="lblOutOfStock" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
