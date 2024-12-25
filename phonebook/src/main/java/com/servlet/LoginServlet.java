package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String pass=req.getParameter("password");
		
		UserDAO dao= new UserDAO(DbConnect.getConn());
		 User u=dao.loginuser(email, pass);
		 
		 HttpSession session=req.getSession();
		 
		 if(u!=null) {
			System.out.println("user is available"+ u);
			 session.setAttribute("users", u);
			 resp.sendRedirect("index.jsp");
			 
			 
		 }
		 else {
			 System.out.println("user is not available"+ u);
			 
			 session.setAttribute("invalid","invalid credentials");
			 resp.sendRedirect("login.jsp");
		 }
	}

		

}
