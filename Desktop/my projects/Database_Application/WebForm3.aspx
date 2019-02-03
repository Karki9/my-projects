<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Database_Application.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
Staff.Staff_ID,Staff.Staff_Name,Staff.Staff_Address,Staff.Staff_Phone_Number,Staff.Staff_DOB,Project.* FROM PROJECT_DETAILS INNER JOIN Staff ON PROJECT_DETAILS.Staff_ID = Staff.Staff_ID INNER JOIN PROJECT ON PROJECT_DETAILS.Project_ID = PROJECT.Project_ID"></asp:SqlDataSource>
    </form>
</body>
</html>
