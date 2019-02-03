<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterUser.aspx.cs" Inherits="ApplicationDevelopmentWebApp.AddUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/materialize.css" rel="stylesheet" />
    <script src="js/materialize.js"></script>
    <script type="text/Javascript">
        function alert_meth() {
            alert("Client Side MessageBox");
        }
</script>

    <script>
        $('.datepicker').pickadate({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 15, // Creates a dropdown of 15 years to control year,
            today: 'Today',
            clear: 'Clear',
            close: 'Ok',
            closeOnSelect: false // Close upon selecting a date,
        });
    </script>
</head>

<body>
    <form id="form1" runat="server">
    <div>
        <div class="container">
            <h2> Add User </h2>
        </div>
        
        <div class="container">
            <p> User ID: </p>
             <asp:TextBox ID="userId" runat="server"></asp:TextBox>  

        </div>
        
        <div class="container">
            <p> Username: </p>
            <asp:TextBox ID="uuname" runat="server"></asp:TextBox>
        </div>
        
        <div class="container">
            <p> Password: </p> 
            <asp:TextBox ID="userpassword" runat="server"></asp:TextBox> 

        </div>
        
        <div class="container">
            <p> First Name: </p> 
            <asp:TextBox ID="userfirstname" runat="server"></asp:TextBox> 

        </div>
        
        <div class="container">
            <p> Last Name: </p> 
            <asp:TextBox ID ="userlastname" runat="server"></asp:TextBox> 

        </div>
        
        <div class="container">
            <p> Address: </p> 
            <asp:TextBox ID="useraddress" runat="server"></asp:TextBox>
        </div>
        
        <div class="container">
            <p> Email Address: </p> 
            <asp:TextBox ID="useremail" runat="server"></asp:TextBox> 

        </div>
        
        <div class="container">
            <p> Date Of Birth: </p> 
            <asp:TextBox CssClass="datepicker" ID="userdob" runat="server"></asp:TextBox>
        </div>
        
        <div class="container">
            <p> User Type </p> 
            <asp:RadioButtonList ID="typeOfUser" runat="server">
                <asp:ListItem Value="Admin"> Admin </asp:ListItem>
                <asp:ListItem Value="Moderator"> Moderator </asp:ListItem>
            </asp:RadioButtonList>  

        <div class="container">
            <asp:Button CssClass="btn" ID="Button1" runat="server" OnClick="btn_addUser" Text="Insert" />
        </div>

        </div>    
        <div class="container">
            <asp:Label ID ="lblCategory" runat="server"></asp:Label>
        </div>
        
        


      </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="js/materialize.js"></script>
    <script>
        $('.datepicker').pickadate({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 15, // Creates a dropdown of 15 years to control year
            selectDay: true,
            format: 'mm/dd/yyyy',
            onStart: function () {
                var date = new Date();
                this.set('select', [date.getFullYear(), date.getMonth(), date.getDate()])
            },

        });
    </script>
</body>
</html>
