<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Contacts</title>
    <%@ page import="java.util.List"%>
    <%@ page import="com.dao.ContactDAO"%>
    <%@ page import="com.entity.contact"%>
    <%@ page import="com.conn.DbConnect"%>
    <%@ include file="component/allCss.jsp"%>
    <style>
        /* General Styling */
        body {
            background-color: #f8f9fa;
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .container {
            margin-top: 50px;
            flex: 1;
        }

        .card {
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: scale(1.02);
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            background-color: #f0f0f0;
        }

        .card-body h5 {
            font-weight: bold;
            margin-bottom: 10px;
        }

        .btn {
            margin-right: 5px;
        }

        .alert {
            margin: 20px auto;
            width: 50%;
            text-align: center;
        }

        .text-muted {
            margin-top: 20px;
            font-size: 1.2rem;
        }

        /* Footer Styling */
        footer {
            background-color: #343a40;
            color: #ffffff;
            text-align: center;
            padding: 10px 0;
        }

        footer a {
            color: #ffc107;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <%@ include file="component/navbar.jsp"%>

    <%
        if (users == null) {
            session.setAttribute("outmsg", "Please Login to access this page");
            response.sendRedirect("login.jsp");
            return;
        }

        String succMsg = (String) session.getAttribute("succMsg");
        String failMsg = (String) session.getAttribute("failMsg");

        if (succMsg != null) {
            out.println("<div class='alert alert-success' role='alert'>" + succMsg + "</div>");
            session.removeAttribute("succMsg");
        }

        if (failMsg != null) {
            out.println("<div class='alert alert-danger' role='alert'>" + failMsg + "</div>");
            session.removeAttribute("failMsg");
        }

        ContactDAO dao = new ContactDAO(DbConnect.getConn());
        List<contact> contacts = dao.getAllContact(users.getId());

        if (contacts == null || contacts.isEmpty()) {
            out.println("<p class='text-center text-muted'>No contacts found.</p>");
        } else {
    %>

    <div class="container">
        <div class="row">
            <% for (contact c : contacts) { %>
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <h5>Name: <%= c.getName() %></h5>
                            <p>Phone: <%= c.getPhno() %></p>
                            <p>Email: <%= c.getEmail() %></p>
                            <p>About: <%= c.getAbout() %></p>
                            <div class="text-center">
                                <a href="editcontact.jsp?cid=<%= c.getId() %>" class="btn btn-success btn-sm">Edit</a>
                                <a href="delete?cid=<%= c.getId() %>" class="btn btn-danger btn-sm">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>

    <% } %>

    <!-- Footer -->
    <footer>
        <%@ include file="component/footer.jsp"%>
    </footer>
</body>
</html>
