<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
String uname = (String)session.getAttribute("Mail");
if(uname==null)
{
	response.sendRedirect("login.jsp");
}
%>

<%

String driver = "com.mysql.jdbc.Driver";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
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
                    <br> <span style="color: #003380;font-size:20px;margin-left:60px">User ID: <% out.print(uname);%></span></p>
                    </div>

                    <li><a href="groupchat.jsp">Group Chat</a></li>
                    <li><a href="viewdeletedmessage.jsp">Deleted Message</a></li>
                    <li><a href="draft.jsp">Draft Message</a></li>                    
                    <li><a href="changePassword.jsp">Settings</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div> 
    
    <div class="maincentral" style="height:500px;margin-top:75px;margin-bottom:60px">
    <div class="maincentralinner">
        <div class="row">
            <div class="maininner2">
                <div class="innerlist clearfix">
                
                <table class="table" cellpadding="4" cellspacing="4">
                        <tr class="tableHead" style="font-size:15px;"><th>Sender</th><th>Receiver</th><th>Message</th><th>Date</th>
                       </tr>  

							<%
							try{
							connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Mail?useSSL=false","root","root");
							statement=connection.createStatement();
							String sql ="select * from deletedmessage";
							resultSet = statement.executeQuery(sql);
							while(resultSet.next()){
							%>
							<tr>
							<td><%=resultSet.getString("sender") %></td>
							<td><%=resultSet.getString("receiver") %></td>
							<td><%=resultSet.getString("msg") %></td>
							<td><%=resultSet.getString("date") %></td>
							
							</tr>
							<%
							}
							connection.close();
							} catch (Exception e) {
							e.printStackTrace();
							}
							%>

				</table>	
			          <br></br>	
				     <center><a href="convo.jsp"style="padding-left:3%">Back</a><a href="deleteAllMessages.jsp"style="padding-left:3%">Delete All Messages</a></center>
				    
				     
				
                </div>
               
            </div>
            
        </div>
        
    </div>
    </div>
</body>
</html>