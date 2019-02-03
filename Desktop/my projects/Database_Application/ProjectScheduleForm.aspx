<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectScheduleForm.aspx.cs" Inherits="Database_Application.ProjectStaffDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="Project" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Project" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="DataSourceProject">
            <Columns>
                <asp:BoundField DataField="PROJECT_START_DATE" HeaderText="PROJECT_START_DATE" SortExpression="PROJECT_START_DATE" />
                <asp:BoundField DataField="PROJECT_END_DATE" HeaderText="PROJECT_END_DATE" SortExpression="PROJECT_END_DATE" />
                <asp:BoundField DataField="STAFF_NAME" HeaderText="STAFF_NAME" SortExpression="STAFF_NAME" />
                <asp:BoundField DataField="STAFF_ADDRESS" HeaderText="STAFF_ADDRESS" SortExpression="STAFF_ADDRESS" />
                <asp:BoundField DataField="STAFF_PHONE_NUMBER" HeaderText="STAFF_PHONE_NUMBER" SortExpression="STAFF_PHONE_NUMBER" />
                <asp:BoundField DataField="STAFF_EMAIL" HeaderText="STAFF_EMAIL" SortExpression="STAFF_EMAIL" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DataSourceProject" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT PROJECT.PROJECT_START_DATE, PROJECT.PROJECT_END_DATE, STAFF.STAFF_NAME, STAFF.STAFF_ADDRESS, STAFF.STAFF_PHONE_NUMBER, STAFF.STAFF_EMAIL FROM PROJECT, PROJECT_DETAILS, STAFF WHERE PROJECT.PROJECT_ID = PROJECT_DETAILS.PROJECT_ID AND PROJECT_DETAILS.STAFF_ID = STAFF.STAFF_ID AND (PROJECT.PROJECT_ID = :PROJECT_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="PROJECT_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
