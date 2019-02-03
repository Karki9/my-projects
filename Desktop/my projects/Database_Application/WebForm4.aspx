<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="Database_Application.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="STAFF_NAME" DataValueField="STAFF_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STAFF_ID&quot;, &quot;STAFF_NAME&quot; FROM &quot;STAFF&quot;"></asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="SKILL_NAME" HeaderText="SKILL_NAME" SortExpression="SKILL_NAME" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT SKILL_NAME FROM SKILLS where SKILL_ID IN (SELECT &quot;SKILL_ID&quot; FROM &quot;STAFF_SKILLS&quot; WHERE (&quot;STAFF_ID&quot; = :STAFF_ID))
">
            <SelectParameters>
                <asp:Parameter Name="Staff_ID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
