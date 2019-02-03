<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerDetails.aspx.cs" Inherits="Database_Application.CustomerDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DEPENDENT_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="STAFF_ID" HeaderText="STAFF_ID" SortExpression="STAFF_ID" />
                <asp:BoundField DataField="DEPENDENT_ID" HeaderText="DEPENDENT_ID" ReadOnly="True" SortExpression="DEPENDENT_ID" />
                <asp:BoundField DataField="DEPENDENT_NAME" HeaderText="DEPENDENT_NAME" SortExpression="DEPENDENT_NAME" />
                <asp:BoundField DataField="DEPENDENT_RELATION" HeaderText="DEPENDENT_RELATION" SortExpression="DEPENDENT_RELATION" />
                <asp:BoundField DataField="DEPENDENT_AGE" HeaderText="DEPENDENT_AGE" SortExpression="DEPENDENT_AGE" />
            </Columns>
        </asp:GridView>
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
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="DEPENDENT_ID" DataSourceID="SqlDataSource1" DefaultMode="Insert">
            <EditItemTemplate>
                STAFF_ID:
                <asp:TextBox ID="STAFF_IDTextBox" runat="server" Text='<%# Bind("STAFF_ID") %>' />
                <br />
                DEPENDENT_ID:
                <asp:Label ID="DEPENDENT_IDLabel1" runat="server" Text='<%# Eval("DEPENDENT_ID") %>' />
                <br />
                DEPENDENT_NAME:
                <asp:TextBox ID="DEPENDENT_NAMETextBox" runat="server" Text='<%# Bind("DEPENDENT_NAME") %>' />
                <br />
                DEPENDENT_RELATION:
                <asp:TextBox ID="DEPENDENT_RELATIONTextBox" runat="server" Text='<%# Bind("DEPENDENT_RELATION") %>' />
                <br />
                DEPENDENT_AGE:
                <asp:TextBox ID="DEPENDENT_AGETextBox" runat="server" Text='<%# Bind("DEPENDENT_AGE") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                STAFF_ID:
                <asp:DropDownList ID="STAFF_IDTextBox" runat="server" Text='<%# Bind("STAFF_ID") %>' DataSourceID="SqlDataSource2" DataTextField="STAFF_NAME" DataValueField="STAFF_ID" />
                <br />
                DEPENDENT_ID:
                <asp:TextBox ID="DEPENDENT_IDTextBox" runat="server" Text='<%# Bind("DEPENDENT_ID") %>' />
                <br />
                DEPENDENT_NAME:
                <asp:TextBox ID="DEPENDENT_NAMETextBox" runat="server" Text='<%# Bind("DEPENDENT_NAME") %>' />
                <br />
                DEPENDENT_RELATION:
                <asp:TextBox ID="DEPENDENT_RELATIONTextBox" runat="server" Text='<%# Bind("DEPENDENT_RELATION") %>' />
                <br />
                DEPENDENT_AGE:
                <asp:TextBox ID="DEPENDENT_AGETextBox" runat="server" Text='<%# Bind("DEPENDENT_AGE") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                STAFF_ID:
                <asp:Label ID="STAFF_IDLabel" runat="server" Text='<%# Bind("STAFF_ID") %>' />
                <br />
                DEPENDENT_ID:
                <asp:Label ID="DEPENDENT_IDLabel" runat="server" Text='<%# Eval("DEPENDENT_ID") %>' />
                <br />
                DEPENDENT_NAME:
                <asp:Label ID="DEPENDENT_NAMELabel" runat="server" Text='<%# Bind("DEPENDENT_NAME") %>' />
                <br />
                DEPENDENT_RELATION:
                <asp:Label ID="DEPENDENT_RELATIONLabel" runat="server" Text='<%# Bind("DEPENDENT_RELATION") %>' />
                <br />
                DEPENDENT_AGE:
                <asp:Label ID="DEPENDENT_AGELabel" runat="server" Text='<%# Bind("DEPENDENT_AGE") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STAFF_ID&quot;, &quot;STAFF_NAME&quot; FROM &quot;STAFF&quot;"></asp:SqlDataSource>
    </form>
</body>
</html>
