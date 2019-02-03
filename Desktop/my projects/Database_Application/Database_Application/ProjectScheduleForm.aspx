<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectScheduleForm.aspx.cs" Inherits="Database_Application.ProjectStaffDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
    <nav class="navbar navbar-default">
          <div class="container-fluid" style ="background-color:aquamarine">
            <div class="navbar-header">
              <a class="navbar-brand" href="#">Web based Database Application</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="Index.aspx"> Home</a></li>
              <li><a  href="StaffDetails.aspx">Staff Details</a></li>
              <li><a href="CustomerDetails">Customer Details</a></li>
              <li><a href="ProjectDetails.aspx">Project Details</a></li>
              <li><a href="SkillsDetails.aspx">Skills Details</a></li>
              <li ><a href="DepartmentDetails.aspx">Department Details</a></li>
              <li class ="active"><a href="#">Project Schedule form</a></li>
              <li><a href="ProjectStaffScheduelForm.aspx">Project Staff Schedule form</a></li>
              <li><a href="StaffSkillDetail.aspx">Staff Skills Details</a></li>


            </ul>
          </div>
        </nav>
    
    <form id="form1" runat="server">
        <div style="margin-left:80px;float:left; padding:10px;">
            <h2>Project Schedule Form</h2>
        <asp:DropDownList CssClass ="dropdown" ID="DropDownList1" runat="server" DataSourceID="Project" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Project" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        <asp:GridView CssClass="table-condensed" style="margin-left100px;" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="DataSourceProject">
            <Columns>
                <asp:BoundField DataField="PROJECT_START_DATE" HeaderText="PROJECT_START_DATE" SortExpression="PROJECT_START_DATE" />
                <asp:BoundField DataField="PROJECT_END_DATE" HeaderText="PROJECT_END_DATE" SortExpression="PROJECT_END_DATE" />
                <asp:BoundField DataField="STAFF_NAME" HeaderText="STAFF_NAME" SortExpression="STAFF_NAME" />
                <asp:BoundField DataField="STAFF_ADDRESS" HeaderText="STAFF_ADDRESS" SortExpression="STAFF_ADDRESS" />
                <asp:BoundField DataField="STAFF_PHONE_NUMBER" HeaderText="STAFF_PHONE_NUMBER" SortExpression="STAFF_PHONE_NUMBER" />
                <asp:BoundField DataField="STAFF_EMAIL" HeaderText="STAFF_EMAIL" SortExpression="STAFF_EMAIL" />
                <asp:BoundField DataField="PROJECT_NAME" HeaderText="PROJECT_NAME" SortExpression="PROJECT_NAME" />
            </Columns>
        </asp:GridView>
            </div>
        <asp:SqlDataSource ID="DataSourceProject" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT PROJECT.PROJECT_START_DATE, PROJECT.PROJECT_END_DATE, STAFF.STAFF_NAME, STAFF.STAFF_ADDRESS, STAFF.STAFF_PHONE_NUMBER, STAFF.STAFF_EMAIL, PROJECT.PROJECT_NAME FROM PROJECT, PROJECT_DETAILS, STAFF WHERE PROJECT.PROJECT_ID = PROJECT_DETAILS.PROJECT_ID AND PROJECT_DETAILS.STAFF_ID = STAFF.STAFF_ID AND (PROJECT.PROJECT_ID = :PROJECT_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="PROJECT_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
