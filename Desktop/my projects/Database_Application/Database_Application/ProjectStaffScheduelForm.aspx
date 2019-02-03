<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectStaffScheduelForm.aspx.cs" Inherits="Database_Application.ProjectStaffScheduelForm" %>

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
    <form id="form1" runat="server">
    <div>
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
              <li><a href="DepartmentDetails.aspx">Department Details</a></li>
              <li><a href="ProjectScheduleForm.aspx">Project Schedule form</a></li>
              <li class ="active"><a href="#">Project Staff Schedule form</a></li>
              <li><a href="StaffSkillDetail.aspx">Staff Skills Details</a></li>


            </ul>
          </div>
        </nav>
        <div style="margin-left:80px;float:left; padding:10px;">
            <h2>Project Staff Schedule Form</h2>


    
        <asp:DropDownList  ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="projectlist" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID">
        </asp:DropDownList>
            <br />
            <br />
        <asp:GridView CssClass="table-condensed" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STAFF_ID,PROJECT_ID" DataSourceID="projectstafflist">
            <Columns>
                <asp:BoundField DataField="STAFF_ID" HeaderText="STAFF_ID" ReadOnly="True" SortExpression="STAFF_ID" />
                <asp:BoundField DataField="STAFF_NAME" HeaderText="STAFF_NAME" SortExpression="STAFF_NAME" />
                <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                <asp:BoundField DataField="PROJECT_NAME" HeaderText="PROJECT_NAME" SortExpression="PROJECT_NAME" />
                <asp:BoundField DataField="STAFF_ADDRESS" HeaderText="STAFF_ADDRESS" SortExpression="STAFF_ADDRESS" />
                <asp:BoundField DataField="STAFF_EMAIL" HeaderText="STAFF_EMAIL" SortExpression="STAFF_EMAIL" />
            </Columns>
        </asp:GridView>
            </div>
        <asp:SqlDataSource ID="projectstafflist" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT STAFF.STAFF_ID, STAFF.STAFF_NAME, PROJECT.PROJECT_ID, PROJECT.PROJECT_NAME, STAFF.STAFF_ADDRESS, STAFF.STAFF_EMAIL FROM PROJECT, PROJECT_DETAILS, STAFF WHERE PROJECT.PROJECT_ID = PROJECT_DETAILS.PROJECT_ID AND PROJECT_DETAILS.STAFF_ID = STAFF.STAFF_ID AND (PROJECT.PROJECT_ID = :PROJECT_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="PROJECT_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="projectlist" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
