<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SkillsDetails.aspx.cs" Inherits="Database_Application.SkillsDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script></head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-default">
  <div class="container-fluid" style ="background-color:aquamarine">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Web based Database Application</a>
    </div>
    <ul class="nav navbar-nav">
        <li><a href="Index.aspx"> Home</a></li>
      <li><a href="StaffDetails.aspx">Staff Details</a></li>
      <li><a href="CustomerDetails.aspx">Customer Details</a></li>
      <li><a href="ProjectDetails.aspx">Project Details</a></li>
      <li class="active"><a  href="#">Skills Details</a></li>
      <li><a href="DepartmentDetails.aspx">Department Details</a></li>
      <li><a href="ProjectScheduleForm.aspx">Project Schedule form</a></li>
      <li><a href="ProjectStaffScheduelForm.aspx">Project Staff Schedule form</a></li>
      <li><a href="StaffSkillDetail.aspx">Staff Skills Details</a></li>



    </ul>
  </div>
</nav>
        <div style="margin-left:80px;float:left; padding:10px;">
        <h4> <p> Skills Details</p></h4>
   
    
        <asp:GridView  CssClass="table-condensed" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SKILL_ID" DataSourceID="SkillsDataSource">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="SKILL_ID" HeaderText="SKILL_ID" ReadOnly="True" SortExpression="SKILL_ID" />
                <asp:BoundField DataField="SKILL_NAME" HeaderText="SKILL_NAME" SortExpression="SKILL_NAME" />
            </Columns>
        </asp:GridView>
            </div>
        <br />
       <div style="margin-top:30px; margin-left:40px; float:left">

        <asp:FormView ID="FormView1" runat="server" DataKeyNames="SKILL_ID" DataSourceID="SkillsDataSource" DefaultMode="Insert">
            
            <InsertItemTemplate>
                SKILL_ID:
                <asp:TextBox  CssClass ="form-control" ID="SKILL_IDTextBox" runat="server" Text='<%# Bind("SKILL_ID") %>' />
                <br />
                SKILL_NAME:
                <asp:TextBox  CssClass ="form-control" ID="SKILL_NAMETextBox" runat="server" Text='<%# Bind("SKILL_NAME") %>' />
                <br />
                <div>
                <asp:LinkButton  CssClass ="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton  CssClass ="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                 </div>
            </InsertItemTemplate>
            
        </asp:FormView>

       </div>
        <asp:SqlDataSource ID="SkillsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SKILLS&quot; WHERE &quot;SKILL_ID&quot; = :SKILL_ID" InsertCommand="INSERT INTO &quot;SKILLS&quot; (&quot;SKILL_ID&quot;, &quot;SKILL_NAME&quot;) VALUES (:SKILL_ID, :SKILL_NAME)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;SKILLS&quot;" UpdateCommand="UPDATE &quot;SKILLS&quot; SET &quot;SKILL_NAME&quot; = :SKILL_NAME WHERE &quot;SKILL_ID&quot; = :SKILL_ID">
            <DeleteParameters>
                <asp:Parameter Name="SKILL_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SKILL_ID" Type="String" />
                <asp:Parameter Name="SKILL_NAME" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SKILL_NAME" Type="String" />
                <asp:Parameter Name="SKILL_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
