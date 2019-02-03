<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerDetails.aspx.cs" Inherits="Database_Application.CustomerDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Customer Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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
              <li  class="active"><a href="#">Customer Details</a></li>
              <li><a href="ProjectDetails.aspx">Project Details</a></li>
              <li><a href="SkillsDetails.aspx">Skills Details</a></li>
              <li><a href="DepartmentDetails.aspx">Department Details</a></li>
              <li><a href="ProjectScheduleForm.aspx">Project Schedule form</a></li>
              <li><a href="ProjectStaffScheduelForm.aspx">Project Staff Schedule form</a></li>
              <li><a href="StaffSkillDetail.aspx">Staff Skills Details</a></li>



            </ul>
          </div>
        </nav>  
                 
           
    </div>
          <div style="margin-left:80px;float:left; padding:10px;">
            <div> <h3 > Customer Details</h3> </div> 
        <asp:GridView CssClass="table-condensed" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DEPENDENT_ID" DataSourceID="SqlDataSource1" BackColor="White">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="STAFF_ID" HeaderText="STAFF_ID" SortExpression="STAFF_ID" />
                <asp:BoundField DataField="DEPENDENT_ID" HeaderText="DEPENDENT_ID" ReadOnly="True" SortExpression="DEPENDENT_ID" />
                <asp:BoundField DataField="DEPENDENT_NAME" HeaderText="DEPENDENT_NAME" SortExpression="DEPENDENT_NAME" />
                <asp:BoundField DataField="DEPENDENT_RELATION" HeaderText="DEPENDENT_RELATION" SortExpression="DEPENDENT_RELATION" />
                <asp:BoundField DataField="DEPENDENT_AGE" HeaderText="DEPENDENT_AGE" SortExpression="DEPENDENT_AGE" />
            </Columns>
        </asp:GridView>
              </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;DEPENDENTS&quot;" DeleteCommand="DELETE FROM &quot;DEPENDENTS&quot; WHERE &quot;DEPENDENT_ID&quot; = :DEPENDENT_ID" InsertCommand="INSERT INTO &quot;DEPENDENTS&quot; (&quot;STAFF_ID&quot;, &quot;DEPENDENT_ID&quot;, &quot;DEPENDENT_NAME&quot;, &quot;DEPENDENT_RELATION&quot;, &quot;DEPENDENT_AGE&quot;) VALUES (:STAFF_ID, :DEPENDENT_ID, :DEPENDENT_NAME, :DEPENDENT_RELATION, :DEPENDENT_AGE)" UpdateCommand="UPDATE &quot;DEPENDENTS&quot; SET &quot;STAFF_ID&quot; = :STAFF_ID, &quot;DEPENDENT_NAME&quot; = :DEPENDENT_NAME, &quot;DEPENDENT_RELATION&quot; = :DEPENDENT_RELATION, &quot;DEPENDENT_AGE&quot; = :DEPENDENT_AGE WHERE &quot;DEPENDENT_ID&quot; = :DEPENDENT_ID">
            <DeleteParameters>
                <asp:Parameter Name="DEPENDENT_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="STAFF_ID" Type="String" />
                <asp:Parameter Name="DEPENDENT_ID" Type="String" />
                <asp:Parameter Name="DEPENDENT_NAME" Type="String" />
                <asp:Parameter Name="DEPENDENT_RELATION" Type="String" />
                <asp:Parameter Name="DEPENDENT_AGE" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="STAFF_ID" Type="String" />
                <asp:Parameter Name="DEPENDENT_NAME" Type="String" />
                <asp:Parameter Name="DEPENDENT_RELATION" Type="String" />
                <asp:Parameter Name="DEPENDENT_AGE" Type="Decimal" />
                <asp:Parameter Name="DEPENDENT_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
           
        <br />
        
        <div style="margin-left:30px; float:left">
        <asp:FormView  ID="FormView1" runat="server" DataKeyNames="DEPENDENT_ID" DataSourceID="SqlDataSource1" DefaultMode="Insert" BorderColor="#3333CC" BorderStyle="None" Width="244px">
            
            <InsertItemTemplate>
                STAFF_ID:
                <asp:DropDownList CssClass ="form-control" ID="STAFF_IDTextBox" runat="server" Text='<%# Bind("STAFF_ID") %>' DataSourceID="SqlDataSource2" DataTextField="STAFF_NAME" DataValueField="STAFF_ID" />
                <br />
                DEPENDENT_ID:
                <asp:TextBox CssClass ="form-control" ID="DEPENDENT_IDTextBox" runat="server" Text='<%# Bind("DEPENDENT_ID") %>' />
                <br />
                DEPENDENT_NAME:
                <asp:TextBox CssClass ="form-control" ID="DEPENDENT_NAMETextBox" runat="server" Text='<%# Bind("DEPENDENT_NAME") %>' />
                <br />
                DEPENDENT_RELATION:
                <asp:TextBox CssClass ="form-control" ID="DEPENDENT_RELATIONTextBox" runat="server" Text='<%# Bind("DEPENDENT_RELATION") %>' />
                <br />
                DEPENDENT_AGE:
                <asp:TextBox CssClass ="form-control" ID="DEPENDENT_AGETextBox" runat="server" Text='<%# Bind("DEPENDENT_AGE") %>' />
                <br />
                <asp:LinkButton CssClass ="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton   CssClass ="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            
        </asp:FormView>
            </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STAFF_ID&quot;, &quot;STAFF_NAME&quot; FROM &quot;STAFF&quot;"></asp:SqlDataSource>
    </form>
</body>
</html>
