<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSupplierProduct.aspx.cs" Inherits="ApplicationDevelopmentWebApp.AddSupplierProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="supplierproductSupplierDropDown" runat="server"></asp:DropDownList>
        <asp:DropDownList ID="supplierproductProductDropDown" runat="server"></asp:DropDownList>
    </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    </form>
</body>
</html>
