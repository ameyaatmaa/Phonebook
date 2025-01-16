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
import com.entity.contact;


@WebServlet("/addcontact")
public class AddContactServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userid= Integer.parseInt(req.getParameter("userid"));
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phno=req.getParameter("phno");
		String about=req.getParameter("about");
		
		contact c= new contact(name,email,phno,about,userid);
		
		ContactDAO dao= new ContactDAO(DbConnect.getConn());
		
		HttpSession session=req.getSession();
		
		boolean f =dao.saveContact(c);
		
		if(f==true) {
			session.setAttribute("succMsg", "Contact saved succesfully");
			resp.sendRedirect("addcontact.jsp");
		}
		else {
			session.setAttribute("failMsg", "an error occured");
			resp.sendRedirect("addcontact.jsp");
			
		}
		
//		System.out.println(name+" "+email+" "+phno+" "+about+" "+userid);
	}

}
