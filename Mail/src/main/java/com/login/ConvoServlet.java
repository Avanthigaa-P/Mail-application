package com.login;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import jakarta.servlet.http.HttpSession;

import com.mysql.cj.Session;

@WebServlet("/ConvoServlet")
public class ConvoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    HttpSession session = request.getSession();
		    String sender = (String)session.getAttribute("Mail");
			String receiver = request.getParameter("user");
			String mesg = request.getParameter("msg");
			
			Date d = new Date();
			String date = d.toString();
			
			RequestDispatcher dispatcher = null;
			Connection con = null;
			

			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Mail?useSSL=false","root","root");
				PreparedStatement pst = con.prepareStatement("INSERT INTO message(sender,receiver,msg,date) VALUES(?,?,?,?)");
				pst.setString(1,sender);
				pst.setString(2,receiver);
				pst.setString(3,mesg);
				pst.setString(4,date);
				int rowCount = pst.executeUpdate();
				dispatcher = request.getRequestDispatcher("convo.jsp");
				
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
