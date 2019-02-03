<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSales.aspx.cs" Inherits="ApplicationDevelopmentWebApp.AddSales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="css/materialize.css" rel="stylesheet" />
    <style>
        ul#profile-dropdown.dropdown-content.active {
            width: 223px !important;
        }

        .dropdown-content {
            width: 200px;
        }

        // FIX SIDENAV SPACING .side-nav li > a {
            padding: 0 16px;
        }

        //FIX SIDEBAR DIVIDERS .side-nav .divider {
            margin: 0;
            height: 10px;
            border-bottom: 1px solid #e0e0e0;
            background-color: transparent;
        }

        // SIDENAV HEADER .sidenav-header {
            background: url("../images/user-bg.jpg") no-repeat center center;
            background-size: cover;
            margin-bottom: 0px;
            padding: 15px 0 0 15px;
            .row;

        {
            margin-bottom: 0;
        }

        }

        .sidenav-footer {
            margin-bottom: 0px;
            padding: 0;
            .row;

        {
            margin-bottom: 0;
            .social-icons;

        {
            a;

        {
            opacity: 0.5;
            padding: 0;
            text-align: center;
            &:hover;

        {
            background-color: inherit;
            opacity: 1;
        }

        }
        }
        }
        }
    </style>

</head>

<body>
    <form id="form2" runat="server">
        <div class="row">
            <nav>
                <div class="nav-wrapper teal lighten-2">
                    <a href="#" data-activates="mobile-demo" class="button-collapse show-on-large"><i class="material-icons">menu</i></a>
                    <div class="center-align center" style="margin-top: -12px; padding-top: 10px;">
                        <h5>Add Stock</h5>
                    </div>


                    <ul class="side-nav grey darken-2" id="mobile-demo" style="transform: translateX(-100%);">


                        <li class="sidenav-header blue">
                            <div class="row">
                                <div class="col s8">
                                    <a class="btn-flat dropdown-button waves-effect waves-light white-text" href="#" data-activates="profile-dropdown"><asp:Label ID="headerText" runat="server"></asp:Label><i class="mdi-navigation-arrow-drop-down right"></i></a>
                                    <ul id="profile-dropdown" class="dropdown-content" style="white-space: nowrap; position: absolute; top: 23.2222px; left: 115.618px; opacity: 1; display: none;">
                                        <li><a href="ChangeUserDetails.aspx"><i class="material-icons">person</i>Profile</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#"><i class="material-icons">exit_to_app</i><asp:Button CssClass="btn waves" OnClick="btn_logout" runat="server" Text="Logout" /></a></li>
                                    </ul>

                                </div>
                            </div>
                        </li>




                        <li class="white">
                            <ul class="collapsible collapsible-accordion">
                                <li>
                                    <a class="collapsible-header waves-effect waves-blue"><i class="material-icons">add_box</i> Add Items <i class="material-icons right" style="margin-right: 0;">arrow_drop_down</i></a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a class="waves-effect waves-blue" href="AddCategory.aspx"><i class="material-icons">add</i>Add Category</a></li>
                                            <li><a class="waves-effect waves-blue" href="AddCustomer.aspx"><i class="material-icons">add</i>Add Customer</a></li>
                                            <li><a class="waves-effect waves-blue" href="AddProduct.aspx"><i class="material-icons">add</i>Add Product</a></li>
                                            <li><a class="waves-effect waves-blue" href="AddSales.aspx"><i class="material-icons">add</i>Add Sales</a></li>
                                            <li><a class="waves-effect waves-blue" href="AddStock.aspx"><i class="material-icons">add</i>Add Stock</a></li>
                                            <li><a class="waves-effect waves-blue" href="AddSupplier.aspx"><i class="material-icons">add</i>Add Supplier<span class="new badge right yellow darken-3"></span></a></li>
                                            <li>
                                                <div class="divider"></div>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="white">
                            <ul class="collapsible collapsible-accordion">
                                <li>
                                    <a class="collapsible-header waves-effect waves-blue"><i class="material-icons">desktop_mac</i>A submenu <i class="material-icons right" style="margin-right: 0;">arrow_drop_down</i></a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a class="waves-effect waves-blue" href="CustomerSearch.aspx"><i class="material-icons">desktop_windows</i>Customer Search</a></li>
                                            <li><a class="waves-effect waves-blue" href="StockedForLong.aspx"><i class="material-icons">desktop_windows</i>Long Stocked Items</a></li>

                                            <li>
                                                <div class="divider"></div>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="white"><a href="#" class="waves-effect waves-blue"><i class="material-icons">mail</i>Menu item</a></li>
                        <li class="white"><a href="#" class="waves-effect waves-blue"><i class="material-icons">call</i> Menu item</a></li>
                        <li class="white"><a href="#" class="waves-effect waves-blue"><i class="material-icons">android</i> Menu item</a></li>
                        <li class="white"><a href="#" class="waves-effect waves-blue"><i class="material-icons">dialpad</i> Menu item</a></li>
                        <li class="white">
                            <div class="divider"></div>
                        </li>
                        <li class="white"><a href="#" class="waves-effect waves-blue"><i class="material-icons">language</i> Menu item<span class="new badge right yellow darken-3"></span></a></li>





                    </ul>

                </div>


            </nav>
        </div>
        <div>
            <div class="container">
                ID<asp:TextBox ID="salesId" runat="server"></asp:TextBox>
            </div>
            <div class="container">
                Admin/User<asp:DropDownList Style="display: block; width: auto" ID="salesStockDropDown" runat="server"></asp:DropDownList>
            </div>  
            <div class="container">
                Product<asp:DropDownList Style="display: block; width: auto" ID="salesProductDropDown" runat="server"></asp:DropDownList>
            </div>
            <div class="container">
                Customer<asp:DropDownList Style="display: block; width: auto" ID="salesCustomerDropDown" runat="server"></asp:DropDownList>
            </div>
            <div class="container">
                Amount: <asp:TextBox ID="salesAmount" runat="server" disabled></asp:TextBox>
            </div>          
            <div class="container">
                Sales Quantity<asp:TextBox ID="salesQty" runat="server"></asp:TextBox>
            </div>
            <div class="container">
                Billing Date<asp:TextBox ID="billingDate" runat="server"></asp:TextBox>
            </div>
            <div class="container">
                Total Amount <asp:TextBox ID="totalAmount" runat="server"></asp:TextBox>
            </div>   
            <div class="container">
                <asp:Button CssClass="btn" ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
            </div>


        </div>


    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="js/materialize.js"></script>
    
        <script type="text/javascript">
            $(function () {
                $('#salesProductDropDown').change(function () {

                    var a = ($('#salesProductDropDown').val());
                    $.ajax({
                        type: "Post",
                        url: "AddSales.aspx/PopulateDropDownList4",
                        data: "{ itemNamed: '" + a + "'}",

                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {
                            $.each(result.d, function (key, value) {
                                console.log(value.DeptId3);

                                $("#salesAmount").val(Number(value.DeptId3));


                            });
                        },
                        error: function (err) {
                            alert(err);
                        }
                    })
                });
            });
    </script>
    <script>
        $(function () {
            $("#salesQty").on("keydown keyup", sum);
            function sum() {
                console.log("here");
                console.log(parseInt($('#salesAmount').val(), 10));
                var salesAmount = parseInt($('#salesAmount').val(), 10);
                var salesQty = parseInt($('#salesQty').val());
                console.log("here"+salesQty);
                $('#totalAmount').val(salesAmount * salesQty);

            }
        });
</script>
    <script>
        $(document).ready(function () {
            $('.button-collapse').sideNav({
                menuWidth: 300, // Default is 300
                edge: 'left', // Choose the horizontal origin
                closeOnClick: false, // Closes side-nav on <a> clicks, useful for Angular/Meteor
                draggable: true // Choose whether you can drag to open on touch screens
            }
            );
            // START OPEN
            $('.button-collapse').sideNav('hide');
        });
    </script>
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
