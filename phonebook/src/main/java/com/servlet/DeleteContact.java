package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.ContactDAO;


@WebServlet("/delete")
public class DeleteContact extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int cid= Integer.parseInt(req.getParameter("cid"));
		
		ContactDAO dao= new ContactDAO(DbConnect.getConn());
		
		boolean f= dao.deleteContactById(cid);
		
		HttpSession session= req.getSession();
		
		if(f) {
			
			session.setAttribute("succMsg"," Contact Deleted Succesfully");
			
			resp.sendRedirect("viewcontact.jsp");
		}else {
			
			
	session.setAttribute("failMsg","Server not working");
			
			resp.sendRedirect("viewcontact.jsp");
			
			
			
		}
		
		
	}

	
	
	
}
