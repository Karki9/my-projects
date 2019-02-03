<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectStaffScheduelForm.aspx.cs" Inherits="Database_Application.ProjectStaffScheduelForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="projectlist" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID">
        </asp:DropDownList>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STAFF_ID,PROJECT_ID" DataSourceID="projectstafflist">
            <Columns>
                <asp:BoundField DataField="STAFF_ID" HeaderText="STAFF_ID" ReadOnly="True" SortExpression="STAFF_ID" />
                <asp:BoundField DataField="STAFF_NAME" HeaderText="STAFF_NAME" SortExpression="STAFF_NAME" />
                <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                <asp:BoundField DataField="PROJECT_NAME" HeaderText="PROJECT_NAME" SortExpression="PROJECT_NAME" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="projectstafflist" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT STAFF.STAFF_ID, STAFF.STAFF_NAME, PROJECT.PROJECT_ID, PROJECT.PROJECT_NAME FROM PROJECT, PROJECT_DETAILS, STAFF WHERE PROJECT.PROJECT_ID =:PROJECT_ID AND PROJECT.PROJECT_ID = PROJECT_DETAILS.PROJECT_ID AND PROJECT_DETAILS.STAFF_ID = STAFF.STAFF_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="PROJECT_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="projectlist" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
