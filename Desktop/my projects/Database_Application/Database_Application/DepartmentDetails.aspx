<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepartmentDetails.aspx.cs" Inherits="Database_Application.DepartmentDetails" %>

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
              <li><a href="CustomerDetails">Customer Details</a></li>
              <li><a href="ProjectDetails.aspx">Project Details</a></li>
              <li><a href="SkillsDetails.aspx">Skills Details</a></li>
              <li class ="active"><a href="#">Department Details</a></li>
              <li><a href="ProjectScheduleForm.aspx">Project Schedule form</a></li>
              <li><a href="ProjectStaffScheduelForm.aspx">Project Staff Schedule form</a></li>
              <li><a href="StaffSkillDetail.aspx">Staff Skills Details</a></li>


            </ul>
          </div>
        </nav>
        <div style="margin-left:80px;float:left; padding:10px;">
               <h1> <p > Department Details</p> </h1>

    <div>
    
        <asp:GridView CssClass="table-condensed" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DEPARTMENT_ID" DataSourceID="DepartmentDataSource">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="DEPARTMENT_ID" HeaderText="DEPARTMENT_ID" ReadOnly="True" SortExpression="DEPARTMENT_ID" />
                <asp:BoundField DataField="DEPARTMENT_NAME" HeaderText="DEPARTMENT_NAME" SortExpression="DEPARTMENT_NAME" />
                <asp:BoundField DataField="COM_ID" HeaderText="COM_ID" SortExpression="COM_ID" />
            </Columns>
        </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand='SELECT "COM_ID", "COM_NAME" FROM "COM"'></asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="DepartmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;DEPARTMENT&quot; WHERE &quot;DEPARTMENT_ID&quot; = :DEPARTMENT_ID" InsertCommand="INSERT INTO &quot;DEPARTMENT&quot; (&quot;DEPARTMENT_ID&quot;, &quot;DEPARTMENT_NAME&quot;, &quot;COM_ID&quot;) VALUES (:DEPARTMENT_ID, :DEPARTMENT_NAME, :COM_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;DEPARTMENT&quot;" UpdateCommand="UPDATE &quot;DEPARTMENT&quot; SET &quot;DEPARTMENT_NAME&quot; = :DEPARTMENT_NAME, &quot;COM_ID&quot; = :COM_ID WHERE &quot;DEPARTMENT_ID&quot; = :DEPARTMENT_ID">
            <DeleteParameters>
                <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
                <asp:Parameter Name="DEPARTMENT_NAME" Type="String" />
                <asp:Parameter Name="COM_ID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="DEPARTMENT_NAME" Type="String" />
                <asp:Parameter Name="COM_ID" Type="String" />
                <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <div style="margin-top:80px; margin-left:40px; float:left">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="DEPARTMENT_ID" DataSourceID="DepartmentDataSource" DefaultMode="Insert">
            <InsertItemTemplate>
                DEPARTMENT_ID:
                <asp:TextBox CssClass ="form-control" ID="DEPARTMENT_IDTextBox" runat="server" Text='<%# Bind("DEPARTMENT_ID") %>' />
                <br />
                DEPARTMENT_NAME:
                <asp:TextBox CssClass ="form-control" ID="DEPARTMENT_NAMETextBox" runat="server" Text='<%# Bind("DEPARTMENT_NAME") %>' />
                <br />
                COM_ID:
                <asp:DropDownList CssClass ="form-control" ID="COM_IDTextBox" runat="server" Text='<%# Bind("COM_ID") %>' DataSourceID="SqlDataSource1" DataTextField="COM_NAME" DataValueField="COM_ID" Style="display: block" />
                <br />
                <asp:LinkButton CssClass="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton CssClass =" btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            
        </asp:FormView>
            </div>
    </form>
</body>
</html>
