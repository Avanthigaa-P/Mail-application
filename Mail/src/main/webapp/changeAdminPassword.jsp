<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Client Server Application</title>
        <link rel="stylesheet" href="style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

</head>
<body class ="main" style="padding-top:10px">

 <%  

	   String msg = request.getParameter("msg");
	   if("notMatch".equals(msg))
	   {
	   %>
	   <h3 class = "alert">New password and confirm passowrd does not match!</h3>
	   <% }%>
		<% 
		if("wrong".equals(msg))
		{
	    %>
	    <h3 class = "alert">Old password is wrong</h3>
	    <%}%> 
	    <% 
		if("done".equals(msg))
		{
	    %>
	   <h3 class = "alert">Password changed successfully.</h3>
	   <%}%>
	    <% 
		if("invalid".equals(msg))
		{
			%>
				   <h3 class = "alert">Something went wrong.</h3>
				   
		<%}%>	

		<div class="center" >
            <div class="row" >
                <div class="column left" style="background-color:#85a3e0"><!-- b3e0ff -->
                  <div class="img-center-register"><img src ="https://cdn-icons-png.flaticon.com/128/2279/2279250.png" style="width: 80%;height: auto;padding-left:60px;"></div>
                </div>
                <div class="column right" style="background-color:white;">
                    <div>
		


	   
	   <form action="changePassowrdAction.jsp" method="post">
                           

                            <label for="password">Enter Old Password </label>
                            <input type="password" id="password" name="old" required="required" placeholder="Your name.."  class="form-control">
                        
                            <label for="password">Enter New Password </label>
                            <input type="password" id="password" name="p1" required="required" placeholder="Your name.."  class="form-control">

                            <label for="password">Enter New Password </label>
                            <input type="password" id="password" name="p2" required="required" placeholder="Your name.."  class="form-control">
                        

                            
                            <input type="submit" value="Submit" onclick="return confirm('Please check everything before submitting');">
                            <input type="reset" value="Reset">
                          </form>
                          
                           <br>
                          <center><a href="adminhome.jsp">BACK</a></center>
                      </div>
                </div>
              </div>
        </div>

</body>
</html>