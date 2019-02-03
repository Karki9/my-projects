<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffDetails.aspx.cs" Inherits="Database_Application.WebForm1" %>

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

    <div>
                <nav class="navbar navbar-default">
  <div class="container-fluid" style ="background-color:aquamarine">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Web based Database Application</a>
    </div>
    <ul class="nav navbar-nav">
        <li><a href="Index.aspx"> Home</a></li>
      <li  class="active" ><a  href="#">Staff Details</a></li>
      <li><a href="CustomerDetails.aspx">Customer Details</a></li>
      <li><a href="ProjectDetails.aspx">Project Details</a></li>
      <li><a href="SkillsDetails.aspx">Skills Details</a></li>
      <li><a href="DepartmentDetails.aspx">Department Details</a></li>
      <li><a href="ProjectScheduleForm.aspx">Project Schedule form</a></li>
      <li><a href="ProjectStaffScheduelForm.aspx">Project Staff Schedule form</a></li>
      <li><a href="StaffSkillDetail.aspx">Staff Skills Details</a></li>



    </ul>
  </div>
</nav>

             
        <div <div style="margin-left:100px;float:left; padding:10px;">
            <div> <h3 > Staff Details</h3> </div> 
        <asp:GridView CssClass="table-condensed" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STAFF_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="STAFF_ID" HeaderText="STAFF_ID" ReadOnly="True" SortExpression="STAFF_ID" />
                <asp:BoundField DataField="STAFF_NAME" HeaderText="STAFF_NAME" SortExpression="STAFF_NAME" />
                <asp:BoundField DataField="STAFF_ADDRESS" HeaderText="STAFF_ADDRESS" SortExpression="STAFF_ADDRESS" />
                <asp:BoundField DataField="STAFF_PHONE_NUMBER" HeaderText="STAFF_PHONE_NUMBER" SortExpression="STAFF_PHONE_NUMBER" />
                <asp:BoundField DataField="STAFF_DOB" HeaderText="STAFF_DOB" SortExpression="STAFF_DOB" />
                <asp:BoundField DataField="STAFF_EMAIL" HeaderText="STAFF_EMAIL" SortExpression="STAFF_EMAIL" />
                <asp:BoundField DataField="DEPARTMENT_ID" HeaderText="DEPARTMENT_ID" SortExpression="DEPARTMENT_ID" />
            </Columns>
        </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STAFF&quot; WHERE &quot;STAFF_ID&quot; = :STAFF_ID" InsertCommand="INSERT INTO &quot;STAFF&quot; (&quot;STAFF_ID&quot;, &quot;STAFF_NAME&quot;, &quot;STAFF_ADDRESS&quot;, &quot;STAFF_PHONE_NUMBER&quot;, &quot;STAFF_DOB&quot;, &quot;STAFF_EMAIL&quot;, &quot;DEPARTMENT_ID&quot;) VALUES (:STAFF_ID, :STAFF_NAME, :STAFF_ADDRESS, :STAFF_PHONE_NUMBER, :STAFF_DOB, :STAFF_EMAIL, :DEPARTMENT_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;STAFF&quot;" UpdateCommand="UPDATE &quot;STAFF&quot; SET &quot;STAFF_NAME&quot; = :STAFF_NAME, &quot;STAFF_ADDRESS&quot; = :STAFF_ADDRESS, &quot;STAFF_PHONE_NUMBER&quot; = :STAFF_PHONE_NUMBER, &quot;STAFF_DOB&quot; = :STAFF_DOB, &quot;STAFF_EMAIL&quot; = :STAFF_EMAIL, &quot;DEPARTMENT_ID&quot; = :DEPARTMENT_ID WHERE &quot;STAFF_ID&quot; = :STAFF_ID">
            <DeleteParameters>
                <asp:Parameter Name="STAFF_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="STAFF_ID" Type="String" />
                <asp:Parameter Name="STAFF_NAME" Type="String" />
                <asp:Parameter Name="STAFF_ADDRESS" Type="String" />
                <asp:Parameter Name="STAFF_PHONE_NUMBER" Type="Decimal" />
                <asp:Parameter Name="STAFF_DOB" Type="DateTime" />
                <asp:Parameter Name="STAFF_EMAIL" Type="String" />
                <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="STAFF_NAME" Type="String" />
                <asp:Parameter Name="STAFF_ADDRESS" Type="String" />
                <asp:Parameter Name="STAFF_PHONE_NUMBER" Type="Decimal" />
                <asp:Parameter Name="STAFF_DOB" Type="DateTime" />
                <asp:Parameter Name="STAFF_EMAIL" Type="String" />
                <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
                <asp:Parameter Name="STAFF_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <br />
    
    </div>
                                
        <div style="margin-left:100px;float:left; padding:50px;">
            <div> <h3 > Add Staff Details</h3> </div> 
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="STAFF_ID" DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="210px">
            <EditItemTemplate>
                STAFF_ID:
                <asp:Label ID="STAFF_IDLabel1" runat="server" Text='<%# Eval("STAFF_ID") %>' />
                <br />
                STAFF_NAME:
                <asp:TextBox ID="STAFF_NAMETextBox" runat="server" Text='<%# Bind("STAFF_NAME") %>' />
                <br />
                STAFF_ADDRESS:
                <asp:TextBox ID="STAFF_ADDRESSTextBox" runat="server" Text='<%# Bind("STAFF_ADDRESS") %>' />
                <br />
                STAFF_PHONE_NUMBER:
                <asp:TextBox ID="STAFF_PHONE_NUMBERTextBox" runat="server" Text='<%# Bind("STAFF_PHONE_NUMBER") %>' />
                <br />
                STAFF_DOB:
                <asp:TextBox ID="STAFF_DOBTextBox" runat="server" Text='<%# Bind("STAFF_DOB") %>' />
                <br />
                STAFF_EMAIL:
                <asp:TextBox ID="STAFF_EMAILTextBox" runat="server" Text='<%# Bind("STAFF_EMAIL") %>' />
                <br />
                DEPARTMENT_ID:
                <asp:TextBox ID="DEPARTMENT_IDTextBox" runat="server" Text='<%# Bind("DEPARTMENT_ID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                STAFF_ID:
                <asp:TextBox CssClass ="form-control" ID="STAFF_IDTextBox" runat="server" Text='<%# Bind("STAFF_ID") %>' />
                <br />
                STAFF_NAME:
                <asp:TextBox CssClass ="form-control" ID="STAFF_NAMETextBox" runat="server" Text='<%# Bind("STAFF_NAME") %>' />
                <br />
                STAFF_ADDRESS:
                <asp:TextBox CssClass ="form-control" ID="STAFF_ADDRESSTextBox" runat="server" Text='<%# Bind("STAFF_ADDRESS") %>' />
                <br />
                STAFF_PHONE_NUMBER:
                <asp:TextBox CssClass ="form-control" ID="STAFF_PHONE_NUMBERTextBox" runat="server" Text='<%# Bind("STAFF_PHONE_NUMBER") %>' />
                <br />
                STAFF_DOB:
                <asp:TextBox CssClass ="form-control" ID="STAFF_DOBTextBox" runat="server" Text='<%# Bind("STAFF_DOB") %>' />
                <br />
                STAFF_EMAIL:
                <asp:TextBox CssClass ="form-control" ID="STAFF_EMAILTextBox" runat="server" Text='<%# Bind("STAFF_EMAIL") %>' />
                <br />
                DEPARTMENT_ID:
                <asp:DropDownList CssClass ="form-control" ID="DEPARTMENT_IDTextBox" runat="server" Text='<%# Bind("DEPARTMENT_ID") %>' DataSourceID="SqlDataSource2" DataTextField="DEPARTMENT_NAME" DataValueField="DEPARTMENT_ID" />
                <br />
                <asp:LinkButton CssClass ="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton CssClass =" btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                STAFF_ID:
                <asp:Label ID="STAFF_IDLabel" runat="server" Text='<%# Eval("STAFF_ID") %>' />
                <br />
                STAFF_NAME:
                <asp:Label ID="STAFF_NAMELabel" runat="server" Text='<%# Bind("STAFF_NAME") %>' />
                <br />
                STAFF_ADDRESS:
                <asp:Label ID="STAFF_ADDRESSLabel" runat="server" Text='<%# Bind("STAFF_ADDRESS") %>' />
                <br />
                STAFF_PHONE_NUMBER:
                <asp:Label ID="STAFF_PHONE_NUMBERLabel" runat="server" Text='<%# Bind("STAFF_PHONE_NUMBER") %>' />
                <br />
                STAFF_DOB:
                <asp:Label ID="STAFF_DOBLabel" runat="server" Text='<%# Bind("STAFF_DOB") %>' />
                <br />
                STAFF_EMAIL:
                <asp:Label ID="STAFF_EMAILLabel" runat="server" Text='<%# Bind("STAFF_EMAIL") %>' />
                <br />
                DEPARTMENT_ID:
                <asp:Label ID="DEPARTMENT_IDLabel" runat="server" Text='<%# Bind("DEPARTMENT_ID") %>' />
                <br />

            </ItemTemplate>
        </asp:FormView>
            </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DEPARTMENT_NAME&quot;, &quot;DEPARTMENT_ID&quot; FROM &quot;DEPARTMENT&quot;"></asp:SqlDataSource>
    </form>
</body>
</html>
