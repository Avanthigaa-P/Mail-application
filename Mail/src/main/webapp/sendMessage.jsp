<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
 <%@page import="java.sql.*"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%String ee = request.getParameter("del");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Mail?useSSL=false","root","root");

Statement pst1 = con.createStatement();
String sql ="SELECT * FROM draftmessage WHERE id='"+ee+"'";
ResultSet resultSet = pst1.executeQuery(sql);
String id=null;
String sender=null;
String receiver=null;
String message=null;
String date=null;

if(resultSet.next())
{
	id = resultSet.getString("id");
	sender = resultSet.getString("sender");
	receiver = resultSet.getString("receiver");
	message = resultSet.getString("msg");
	date = resultSet.getString("date");
}

PreparedStatement pst2 = con.prepareStatement("INSERT INTO `message` (`id`, `sender`, `receiver`, `msg`, `date`) VALUES(?,?,?,?,?)");
pst2.setString(1,id);
pst2.setString(2,sender);
pst2.setString(3,receiver);
pst2.setString(4,message);
pst2.setString(5,date);
pst2.executeUpdate();

Statement pst = con.createStatement();
pst.executeUpdate("DELETE FROM draftmessage WHERE id='"+ee+"'");




response.sendRedirect("draft.jsp");


%>

</body>
</html>