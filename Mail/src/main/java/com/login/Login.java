package com.login;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;

		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Mail?useSSL=false","root","root");
			PreparedStatement pst = con.prepareStatement("SELECT * FROM users WHERE email = ? and password = ?");
			pst.setString(1,email);
			pst.setString(2,password);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next())
			{
				String id = "avanthigaa.cs19@bitsathy.ac.in";
				session.setAttribute("Mail", rs.getString("email"));
				if(id.equals(session.getAttribute("Mail")))
					dispatcher = request.getRequestDispatcher("adminhome.jsp");
				else
					dispatcher = request.getRequestDispatcher("convo.jsp");
			

			}
			else
			{
				request.setAttribute("status","failed");
				dispatcher = request.getRequestDispatcher("login.jsp");				
			}
			dispatcher.forward(request, response);

		}
		catch(Exception e)
		{
			e.printStackTrace();

		}
	}

}
