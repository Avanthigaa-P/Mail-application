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
PreparedStatement pst5 = null;
Connection con5 = null;
ResultSet resultSet5 = null;


Statement statement5 = null;
Connection connection5 = null;
Connection connection6 = null;
PreparedStatement pstmnt5 = null;
PreparedStatement pstmnt6 = null;
ResultSet rsltSt5 = null;
ResultSet rsltSt6 = null;

%>

    
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
<body class="main">

    <div class="sidenav">
        <ul>
                    <div><img src="https://cdn-icons-png.flaticon.com/128/3135/3135715.png" class="person-in"><br><p class="right-text">
                    <br> <span style="color: #003380;font-size:20px;margin-left:60px">User ID: <% out.print(uname);%></span></p>
                    </div>

                    <li><a href="groupchat.jsp">Group Chat</a></li>
                    <li><a href="changePassword.jsp">Settings</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div> 
   

    <div class="maincentral" style="margin-top:80px;margin-bottom:60px">

        <div class="maincentralinner">
            <div class="row">
                <div class="maininner2">
                    <div class="innerlist clearfix">

 <form method="post" action="GroupchatServlet">
        <tr>
           <td colspan="5"><div class="fields" style="overflow:scroll;height:250px;word-wrap:normal;width:800px;">
           
           <%
		           Class.forName("com.mysql.cj.jdbc.Driver");
		           connection5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/Mail?useSSL=false","root","root");
		           pstmnt5 = connection5.prepareStatement("SELECT * FROM box");
			       rsltSt5 = pstmnt5.executeQuery();
          
			       while(rsltSt5.next()){
                 %>
                     <span class="nick">
                     			<%=rsltSt5.getString("sender") %>
                     </span> : <span class="msg">
                     			<%=rsltSt5.getString("msg") %>
                     </span><br />
                  <% } 
                  %>
      
                     
                     
                     </div></td></tr>
                     <input type="text" name="msg"  id="id" placeholder="Your message..." style="width:500px;margin-left:50px"class="form-control" required="required"/>

    
                      <input type="submit" style="float:right;width:100px;margin-right:140px;height:40px;padding-top:10px" value="Send">
                        
                      <br><br>

                      <center><a href="groupchat.jsp">Refresh</a><a href="convo.jsp"style="padding-left:3%">Back</a></center>
            </td>
        </tr>

                        </table>
 </form>
 <br />
                        <br />

                        </div>
               
               </div>
           </div>
           
       </div>
       
   </div>

</body>
</html>