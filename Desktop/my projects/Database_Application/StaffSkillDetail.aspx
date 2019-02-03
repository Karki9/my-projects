<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffSkillDetail.aspx.cs" Inherits="Database_Application.StaffSkillDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 315px;
            width: 414px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STAFF_ID&quot;, &quot;STAFF_NAME&quot; FROM &quot;STAFF&quot;"></asp:SqlDataSource>
    
    </div>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="STAFF_NAME" DataValueField="STAFF_ID">
        </asp:DropDownList>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="STAFF_ID" HeaderText="STAFF_ID" SortExpression="STAFF_ID" />
                <asp:BoundField DataField="SKILL_ID" HeaderText="SKILL_ID" SortExpression="SKILL_ID" />
                <asp:TemplateField HeaderText="Skill_Name">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="SKILL_NAME" DataValueField="SKILL_ID" Enabled="False" SelectedValue='<%# Bind("SKILL_ID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;SKILLS&quot;"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
