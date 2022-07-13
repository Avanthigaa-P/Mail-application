<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.sql.DriverManager"%>

    
    <% 
        String uname = (String)session.getAttribute("Mail");
        String oldp = request.getParameter("old");
        String newp = request.getParameter("p1");
        String conp = request.getParameter("p2");
        Connection con = null;
        if(!conp.equals(newp))
        	response.sendRedirect("changePassword.jsp?msg=notMatch");
        else
        {
        	int check = 0;
        	try{
        		Class.forName("com.mysql.cj.jdbc.Driver");

    		    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Mail?useSSL=false","root","root");
        		Statement st = con.createStatement();
        		ResultSet rs = st.executeQuery("SELECT * FROM users WHERE email='"+uname+"' and password='"+oldp+"'" );
        		while(rs.next())
        		{
        			check = 1;
        			st.executeUpdate("UPDATE users SET password='"+newp+"' WHERE email='"+uname+"'");
        			response.sendRedirect("changePassword.jsp?msg=done");
        			
        		}
        		
        		if(check == 0)
        		{
        			response.sendRedirect("changePassword.jsp?msg=wrong");

        		}
        	}
        	catch(Exception e)
        	{
        		System.out.println(e);
        	}
        }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>