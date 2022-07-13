<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
 <%@page import="java.sql.*"%>
 
 <%
String uname = (String)session.getAttribute("Mail");
if(uname==null)
{
	response.sendRedirect("login.jsp");
}
%>
<%
PreparedStatement pst = null;
Connection con = null;
ResultSet resultSet = null;


Statement statement = null;
Connection connection = null;
Connection connection2 = null;
PreparedStatement pstmnt = null;
PreparedStatement pstmnt2 = null;
ResultSet rsltSt = null;
ResultSet rsltSt2 = null;

%>
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>Client Server Application</title>
    
        <link rel="stylesheet" href="style.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


</head>
<body class="main">

	<div class="sidenav">
        <ul>
                     <div><img src="https://cdn-icons-png.flaticon.com/128/3135/3135715.png" class="person-in"><br><p class="right-text">
                    <br> <span style="color: #003380;font-size:20px;margin-left:60px">Admin ID: <% out.print(uname);%></span></p>
                    </div>

                    <li><a href="#">Manage users </a></li>
                    <li><a href="changeAdminPassword.jsp">Settings</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div> 
                
   <div class="maincentral" style="margin-top:75px;margin-bottom:60px">
    <div class="maincentralinner">
        <div class="row">
            <div class="maininner2">
                <div class="innerlist clearfix">
                
                <table class="table" cellpadding="4" cellspacing="4">
                        <tr class="tableHead" style="font-size:15px;"><th>Name</th><th>Nick Name</th><th>Date of Birth</th><th>Email</th><th>Contact</th><th>Date</th>
                        <th>Delete</th></tr>        
        <%
		try{
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Mail?useSSL=false","root","root");
			statement=connection.createStatement();
			String sql ="select * from users";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
%>
			<tr>
			<td><%=resultSet.getString("name") %></td>
			<td><%=resultSet.getString("nick") %></td>
			<td><%=resultSet.getString("dob") %></td>
			<td><%=resultSet.getString("email") %></td>
			<td><%=resultSet.getString("contact") %></td>
			<td><%=resultSet.getString("date") %></td>
			<td><a href="deleteUser.jsp?del=<%=resultSet.getString("id") %>" onclick="return confirm('Are You Sure..?');">Delete</a></td></tr>
                        <?php } ?>
			
			</tr>
<%
			}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
%>

 </table>	
                </div>
               
            </div>
        </div>
        
    </div>
    </div>

</body>
</html>