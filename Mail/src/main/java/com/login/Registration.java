package com.login;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String nname = request.getParameter("nname");
		String dob = request.getParameter("dob");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		String password1 = request.getParameter("p1");
		String password2 = request.getParameter("p2");
		Date d = new Date();
		String date = d.toString();
		RequestDispatcher dispatcher = null;
		Connection con = null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Mail?useSSL=false","root","root");
			PreparedStatement pst = con.prepareStatement("INSERT INTO `users` (`name`, `nick`, `dob`, `email`, `contact`, `password`,`date`) VALUES(?,?,?,?,?,?,?)");
			pst.setString(1,name);
			pst.setString(2,nname);
			pst.setString(3,dob);
			pst.setString(4,email);
			pst.setString(5,contact);
			pst.setString(6,password1);
			pst.setString(7,date);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("login.jsp");
			
			if(rowCount > 0) {
				request.setAttribute("status","success");
			}
			else
			{
				request.setAttribute("status","failed");

			}
			dispatcher.forward(request, response);
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}finally {
		  try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		
		
		
	}

}
