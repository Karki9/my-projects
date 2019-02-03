<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffSkillDetail.aspx.cs" Inherits="Database_Application.StaffSkillDetail" %>

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
      <li ><a href="Index.aspx">Home</a></li>
      <li><a href="StaffDetails.aspx">Staff Details</a></li>
      <li><a href="CustomerDetails.aspx">Customer Details </a></li>
      <li><a href="ProjectDetails.aspx">Project Details</a></li>
      <li><a href="SkillsDetails.aspx">Skills Details</a></li>
      <li><a href="DepartmentDetails.aspx">Department Details</a></li>
      <li><a href="ProjectScheduleForm.aspx">Project Schedule form</a></li>
      <li><a href="ProjectStaffScheduelForm.aspx">Project Staff Schedule</a></li>
      <li class=" active"><a href="#">Staff Skills Details</a></li>



    </ul>
  </div>
</nav>
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STAFF_ID&quot;, &quot;STAFF_NAME&quot; FROM &quot;STAFF&quot;"></asp:SqlDataSource>
    
    </div>
        <div style="margin-left:80px;float:left; padding:10px;">
                    <h2> Staff Skills Details</h2>

        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="STAFF_NAME" DataValueField="STAFF_ID">
        </asp:DropDownList>
        <br />
        <br />
        
        <asp:GridView CssClass="table-condensed" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="STAFF_ID" HeaderText="STAFF_ID" SortExpression="STAFF_ID" />
                <asp:BoundField DataField="SKILL_ID" HeaderText="SKILL_ID" SortExpression="SKILL_ID" />
                <asp:TemplateField HeaderText="SKILL NAME">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="SKILL_NAME" DataValueField="SKILL_ID" Enabled="False" SelectedValue='<%# Bind("SKILL_ID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;SKILLS&quot;"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
            </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;STAFF_SKILLS&quot; WHERE (&quot;STAFF_ID&quot; = :STAFF_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="STAFF_ID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
    </form>
</body>
</html>
