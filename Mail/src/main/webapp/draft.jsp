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
                    <br> <span style="color: #003380;font-size:20px;margin-left:60px">User ID: <% out.print(uname);%></span></p>
                    </div>

                    <li><a href="groupchat.jsp">Group Chat</a></li>
                    <li><a href="#" onclick="draftForm()">Compose Draft mail </a></li>
                    <li><a href="viewdeletedmessage.jsp">Deleted Message</a></li>
                    <li><a href="changePassword.jsp">Settings</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div> 

          
         <div class="maincentral" style="height:500px;margin-top:75px;margin-bottom:60px">
    <div class="maincentralinner">
        <div class="row">
            <div class="maininner2">
                <div class="innerlist clearfix">
			<% 
				 Class.forName("com.mysql.cj.jdbc.Driver");
			     connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Mail?useSSL=false","root","root");
			     pstmnt = connection.prepareStatement("SELECT * FROM draftmessage WHERE sender=?");
				 pstmnt.setString(1, uname);
				 rsltSt = pstmnt.executeQuery();
			%>
				 <table cellpadding="4" cellspacing="4" class="table">
			     <tr><td class="tableHead" align="center" colspan="2" style="text-decoration:underline;">Saved Messages</td></tr>
			<% 
				 while(rsltSt.next()){
				     connection2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/Mail?useSSL=false","root","root");
			
					 String s = rsltSt.getString("receiver");
					 pstmnt2 = connection2.prepareStatement("SELECT * FROM users WHERE email=?");
					 pstmnt2.setString(1, s);
					 rsltSt2 = pstmnt2.executeQuery();
					 rsltSt2.next();
			%>
			     <tr>
			     	<td class="msg" style="font-size:12px;">
			     			<%=rsltSt.getString("msg") %>
			     					<span style="color:#F39;"> 
			     							( To <%=rsltSt2.getString("nick") %> on <%=rsltSt.getString("date") %>)
			     					</span>
			     	</td>
			     	<td>
			     		<a href="sendMessage.jsp?del=<%=rsltSt.getString("id") %>" style="font-size:12px;">Send</a>
			     	</td>
			     </tr>
			
			
				
				
				
			<% 
			     }
			%>
			     </table>
			           
			                             <center><a href="convo.jsp"style="padding-left:3%">Back</a></center>
			           
			         </div>
               
            </div>
            
        </div>
        
    </div>
    </div>    
			           
			</div>

          
          
<div class="form-popup" id="changedoc">
    <div align="center">
<form action="DraftServlet" method="post" >

        <table class="table" cellpadding="4" cellspacing="4">
        <tr><td class="tableHead" colspan="2" align="center" style="text-decoration:underline;">Save Messages</td></tr>
        <tr><td class="info" colspan="2" align="center"><?php echo $info;?></td></tr>
        <tr><td class="labels">Select User : </td><td>
        <select name="user" class="fields" style="background-color:white;">
            <option disabled="disabled" selected="selected"> - - - - - - - - - </option>
                <%
    			Class.forName("com.mysql.cj.jdbc.Driver");

    			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Mail?useSSL=false","root","root");
    			
					 pst = con.prepareStatement("select * from users  WHERE email!=?");
					 pst.setString(1, uname);
                	resultSet = pst.executeQuery();
                	while(resultSet.next()){
                		String email = resultSet.getString("email");
                		String name = resultSet.getString("name");
                %>
			<option value="<%= email %>"><% out.println(name); %>           
 			<%}  resultSet.close(); pst.close(); %>
        </select></td></tr>
        <tr><td class="labels">Message : </td><td><textarea name="msg" class="fields" rows="2" cols="30" required="required"></textarea></td></tr>
        <tr><td colspan="2" align="center"><input type="submit" value="SAVE" class="commandButton" /></td></tr>
        </table>
        </form> 
          </div>
          
</div>
          
        <script>
        function draftForm() {
        document.getElementById("changedoc").style.display = "block";
        }

        function draftcloseForm() {
        document.getElementById("changedoc").style.display = "none";
        }
        </script>

</body>
</html>