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


@WebServlet("/update")
public class EditContact extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ContactDAO dao = new ContactDAO(DbConnect.getConn());
		 HttpSession session = req.getSession();
		
	    int cid = Integer.parseInt(req.getParameter("cid"));

	    String name = req.getParameter("name");
	    String email = req.getParameter("email");
	    String phno = req.getParameter("phno");
	    String about = req.getParameter("about");

	    contact c = new contact();
	    c.setId(cid);
	    c.setName(name);
	    c.setEmail(email);
	    c.setPhno(phno);
	    c.setAbout(about);

	   

	   

	    boolean f = dao.updateContact(c);

	    if (f) {
	        session.setAttribute("succMsg", "Contact updated successfully.");
	        resp.sendRedirect("viewcontact.jsp?cid=" + cid);
	    } else {
	        session.setAttribute("failMsg", "An error occurred while updating the contact.");
	        resp.sendRedirect("editcontact.jsp?cid=" + cid);
	    }
	}

	
}
