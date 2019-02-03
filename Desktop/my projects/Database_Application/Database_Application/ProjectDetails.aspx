<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectDetails.aspx.cs" Inherits="Database_Application.ProjectDetails" %>

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
        <nav class="navbar navbar-default">
          <div class="container-fluid" style ="background-color:aquamarine">
            <div class="navbar-header">
              <a class="navbar-brand" href="#">Web based Database Application</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="Index.aspx"> Home</a></li>
              <li><a  href="StaffDetails.aspx">Staff Details</a></li>
              <li ><a href="CustomerDetails.aspx">Customer Details</a></li>
              <li  class="active"><a href="#">Project Details</a></li>
              <li><a href="SkillsDetails.aspx">Skills Details</a></li>
              <li><a href="DepartmentDetails.aspx">Department Details</a></li>
              <li><a href="ProjectScheduleForm.aspx">Project Schedule form</a></li>
              <li><a href="ProjectStaffScheduelForm.aspx">Project Staff Schedule form</a></li>
              <li><a href="StaffSkillDetail.aspx">Staff Skills Details</a></li>



            </ul>
          </div>
        </nav>
                <div style="margin-left:80px;float:left; padding:10px;">

               <h1> <p > Project Details</p> </h1>
    
    
        
        <asp:GridView CssClass="table-condensed" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECT_ID" DataSourceID="ProjectDatasource">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="DEPARTMENT_ID" HeaderText="DEPARTMENT_ID" SortExpression="DEPARTMENT_ID" />
                <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                <asp:BoundField DataField="PROJECT_NAME" HeaderText="PROJECT_NAME" SortExpression="PROJECT_NAME" />
                <asp:BoundField DataField="PROJECT_START_DATE" HeaderText="PROJECT_START_DATE" SortExpression="PROJECT_START_DATE" />
                <asp:BoundField DataField="PROJECT_END_DATE" HeaderText="PROJECT_END_DATE" SortExpression="PROJECT_END_DATE" />
            </Columns>
        </asp:GridView>

        </div>
        <asp:SqlDataSource ID="ProjectDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECT&quot; WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID" InsertCommand="INSERT INTO &quot;PROJECT&quot; (&quot;DEPARTMENT_ID&quot;, &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot;, &quot;PROJECT_START_DATE&quot;, &quot;PROJECT_END_DATE&quot;) VALUES (:DEPARTMENT_ID, :PROJECT_ID, :PROJECT_NAME, :PROJECT_START_DATE, :PROJECT_END_DATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;PROJECT&quot;" UpdateCommand="UPDATE &quot;PROJECT&quot; SET &quot;DEPARTMENT_ID&quot; = :DEPARTMENT_ID, &quot;PROJECT_NAME&quot; = :PROJECT_NAME, &quot;PROJECT_START_DATE&quot; = :PROJECT_START_DATE, &quot;PROJECT_END_DATE&quot; = :PROJECT_END_DATE WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID">
            <DeleteParameters>
                <asp:Parameter Name="PROJECT_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
                <asp:Parameter Name="PROJECT_ID" Type="String" />
                <asp:Parameter Name="PROJECT_NAME" Type="String" />
                <asp:Parameter Name="PROJECT_START_DATE" Type="DateTime" />
                <asp:Parameter Name="PROJECT_END_DATE" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
                <asp:Parameter Name="PROJECT_NAME" Type="String" />
                <asp:Parameter Name="PROJECT_START_DATE" Type="DateTime" />
                <asp:Parameter Name="PROJECT_END_DATE" Type="DateTime" />
                <asp:Parameter Name="PROJECT_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <br />
    
  
        <div style="margin-left:50px;float:left; padding:10px; align-items:center">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECT_ID" DataSourceID="ProjectDatasource" DefaultMode="Insert">
            
            
            
            <InsertItemTemplate>
                DEPARTMENT_ID:
                <asp:DropDownList  CssClass ="form-control" ID="DEPARTMENT_IDTextBox" runat="server" Text='<%# Bind("DEPARTMENT_ID") %>' DataSourceID="SqlDataSource1" DataTextField="DEPARTMENT_NAME" DataValueField="DEPARTMENT_ID" />
                <br />
                PROJECT_ID:
                <asp:TextBox  CssClass ="form-control" ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' />
                <br />
                PROJECT_NAME:
                <asp:TextBox  CssClass ="form-control" ID="PROJECT_NAMETextBox" runat="server" Text='<%# Bind("PROJECT_NAME") %>' />
                <br />
                PROJECT_START_DATE:
                <asp:TextBox  CssClass ="form-control" ID="PROJECT_START_DATETextBox" runat="server" Text='<%# Bind("PROJECT_START_DATE") %>' />
                <br />
                PROJECT_END_DATE:
                <asp:TextBox  CssClass ="form-control" ID="PROJECT_END_DATETextBox" runat="server" Text='<%# Bind("PROJECT_END_DATE") %>' />
                <br />
                <asp:LinkButton  CssClass ="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton  CssClass ="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate> 
        </asp:FormView>
            </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DEPARTMENT_ID&quot;, &quot;DEPARTMENT_NAME&quot; FROM &quot;DEPARTMENT&quot;"></asp:SqlDataSource>
    </form>
</body>
</html>
