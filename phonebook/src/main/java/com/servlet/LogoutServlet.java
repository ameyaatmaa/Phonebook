package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		session.getAttribute("users");
		
		session.removeAttribute("users");
		
		HttpSession session2=req.getSession();
		
		session2.setAttribute("outmsg","Log out Successfull");
		
		
		resp.sendRedirect("login.jsp");
		
		
	}

}
