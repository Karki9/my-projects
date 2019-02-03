<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Database_Application.Index" %>

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
    <div>
    <nav class="navbar navbar-default">
  <div class="container-fluid" style ="background-color:aquamarine">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Web based Database Application</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="StaffDetails.aspx">Staff Details</a></li>
      <li><a href="CustomerDetails.aspx">Customer Details</a></li>
      <li><a href="ProjectDetails.aspx">Project Details</a></li>
      <li><a href="SkillsDetails.aspx">Skills Details</a></li>
      <li><a href="DepartmentDetails.aspx">Department Details</a></li>
      <li><a href="ProjectScheduleForm.aspx">Project Schedule form</a></li>
      <li><a href="ProjectStaffScheduelForm.aspx">Project Staff Schedule</a></li>
      <li><a href="StaffSkillDetail.aspx">Staff Skills Details</a></li>



    </ul>
  </div>
</nav>
        
   <div  style="text-align:center;">

      <h1> Welcome to Web Based Application</h1>

</div>


       <div  style="background-color:white;width:300px;height:300px;margin-left:80px;margin-top:15px;float:left; border:groove; border-radius:  5px 5px 5px 5px ">
						
						<!-- for the text-->
							<article  style="background-color: white; height:270px; width: 270px; padding:50px;">
									<p style="font-size: 20px; font-family: Georgia; text-align: center;" >
									<b>
									<br>
                                        <a href="StaffDetails.aspx" >
									 		 Manage Staff Details 

                                        </a>
									 </b>
									 </p>
							</article>
					</div>

       <div  style="background-color:white;width:300px;height:300px;margin-left:80px;margin-top:15px;float:left; border:groove; border-radius:  5px 5px 5px 5px ">
						
						<!-- for the text-->
							<article style="background-color: white; height:270px; width: 270px; padding:50px;">
									<p style="font-size: 20px; font-family: Georgia; text-align: center;" >
									<b>
									<br>
                                         <a href="CustomerDetails.aspx" >
									 		 Manage Customer Details

                                        </a>
                                     </b>
									 </p>
							</article>
					</div>

        <div  style="background-color:white;width:300px;height:300px;margin-left:80px;margin-top:15px;float:left; border:groove; border-radius:  5px 5px 5px 5px ">
						
						<!-- for the text-->
							<article style="background-color: white; height:270px; width: 270px; padding:50px;">
									<p style="font-size: 20px; font-family: Georgia; text-align: center;" >
									<b>
									 		<br>
                                        <a href="ProjectDetails.aspx" >
									 		 Manage Project Details
                                            </a>
									 </b>
									 </p>
							</article>
					</div>

       <div  style="background-color:white;width:300px;height:300px;margin-left:80px;margin-top:15px;float:left; border:groove; border-radius:  5px 5px 5px 5px ">
						
						<!-- for the text-->
							<article style="background-color: white; height:270px; width: 270px; padding:50px;">
									<p style="font-size: 20px; font-family: Georgia; text-align: center;" >
									<b>
									 		<br>
                                        <a href="SkillsDetails.aspx" >
									 		 Manage Skill Details 
                                            </a>
									 </b>
									 </p>
							</article>
					</div>

        <div  style="background-color:white;width:300px;height:300px;margin-left:80px;margin-top:15px;float:left; border:groove; border-radius:  5px 5px 5px 5px ">
						
						<!-- for the text-->
							<article style="background-color: white; height:270px; width: 270px; padding:50px;">
									<p style="font-size: 20px; font-family: Georgia; text-align: center;" >
									<b>
									 		<br>
                                        <a href="DepartmentDetails.aspx" >
									 		 Manage Department Details
                                            </a>
									 </b>
									 </p>
							</article>
					</div>

        <div  style="background-color:white;width:300px;height:300px;margin-left:80px;margin-top:15px;float:left; border:groove; border-radius:  5px 5px 5px 5px ">
						
						<!-- for the text-->
							<article style="background-color: white; height:270px; width: 270px; padding:50px;">
									<p style="font-size: 20px; font-family: Georgia; text-align: center;" >
									<b>
									 		<br>
                                        <a href="ProjectScheduleForm.aspx" >
									 		 View Project Schedule Form 
                                            </a>
									 </b>
									 </p>
							</article>
					</div>

        <div  style="background-color:white;width:300px;height:300px;margin-left:250px;margin-top:15px;float:left; border:groove; border-radius:  5px 5px 5px 5px ">
						
						<!-- for the text-->
							<article style="background-color: white; height:270px; width: 270px; padding:50px;">
									<p style="font-size: 20px; font-family: Georgia; text-align: center;" >
									<b>
									 		<br>
                                        <a href="ProjectStaffScheduelForm.aspx" >
									 		  View Project Staff Schedule Form 
                                            </a>
									 </b>
									 </p>
							</article>
					</div>

        <div  style="background-color:white;width:300px;height:300px;margin-left:80px;margin-top:15px;float:left; border:groove; border-radius:  5px 5px 5px 5px ">
						
						<!-- for the text-->
							<article style="background-color: white; height:270px; width: 270px; padding:50px;">
									<p style="font-size: 20px; font-family: Georgia; text-align: center;" >
									<b>
									 		<br>
                                        <a href="StaffSkillDetail.aspx" >
									 		 View  Staff skills Details 
                                            </a>
									 </b>
									 </p>
							</article>
					</div>

        

       
  
    </form>
</body>
</html>
