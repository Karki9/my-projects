﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ApplicationDevelopmentWebApp.WebForm" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

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
        <div class="container">
            <h2>Add Product</h2>
            <table class="container highlight">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Rate</th>
                        <th>Category</th>
                        <th>User Assigned</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <asp:TextBox CssClass="input-field" ID="productId" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox CssClass="input-field" ID="productName" runat="server"></asp:TextBox>


                        </td>
                        <td>
                            <asp:TextBox CssClass="input-field" ID="productRate" runat="server"></asp:TextBox>

                        </td>
                        <td>
                            <asp:DropDownList Style="display: block; width: auto" ID="productCategoryDropDown" runat="server"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList Style="display: block; width: auto" CssClass="form-control" ID="productUserDropDown" runat="server"></asp:DropDownList>

                        </td>
                        <td>
                            <asp:DropDownList Style="display: block; width: auto" CssClass="form-control" ID="productStockDropDown" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                </tbody>
            </table>


            <asp:Button ID="btnSubmit" runat="server" Text="Insert" CssClass="btn" OnClick="btnSubmit_Click"></asp:Button>

        </div>
        <div class="container">

            <asp:Label ID="lblTable" runat="server"></asp:Label>
        </div>
        <div class="container">
            <asp:TextBox ID="inputFld" runat="server"></asp:TextBox>
            <asp:Button ID="btn_search" runat="server" CssClass="btn center-align" OnClick="btn_search_Click" Text="Search" />
        </div>
        <div class="container">
            <asp:Label ID="dbLabel" runat="server"></asp:Label>
        </div>

    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="js/materialize.js"></script>
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
</body>
</html>