<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Contact</title>
    <%@ page import="java.util.List"%>
    <%@ page import="com.dao.ContactDAO"%>
    <%@ page import="com.entity.contact"%>
    <%@ page import="com.conn.DbConnect"%>
    <%@ include file="component/allCss.jsp"%>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container-fluid {
            margin-top: 50px;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .card-body {
            padding: 30px;
            background-color: #ffffff;
        }

        .form-label {
            font-weight: bold;
        }

        .text-success, .text-danger {
            font-size: 1rem;
            margin-bottom: 15px;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        footer {
            margin-top: 200px;
            padding: 10px 0;
            background-color: #222;
            color: #fff;
            text-align: center;
        }
    </style>
</head>
<body>
    <%@ include file="component/navbar.jsp"%>

    <%
        // Check if the user is logged in
        if (users == null) {
            session.setAttribute("outmsg", "Please Login to access this page");
            response.sendRedirect("login.jsp");
            return;
        }

        // Validate the `cid` parameter
        String cidParam = request.getParameter("cid");
        if (cidParam == null || cidParam.isEmpty()) {
            session.setAttribute("failMsg", "Invalid contact ID.");
            response.sendRedirect("viewcontact.jsp");
            return;
        }

        int cid = Integer.parseInt(cidParam);
        ContactDAO dao = new ContactDAO(DbConnect.getConn());
        contact c = dao.getContactById(cid);

        // Check if the contact exists
        if (c == null) {
            session.setAttribute("failMsg", "Contact not found.");
            response.sendRedirect("viewcontact.jsp");
            return;
        }
    %>

    <div class="container-fluid">
        <div class="row p-2">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <form action="update" method="post">
                            <h4 class="text-center">Edit Contact</h4>

                            <!-- Hidden input to pass cid -->
                            <input type="hidden" name="cid" value="<%= c.getId() %>" />

                            <% 
                            String succMsg = (String) session.getAttribute("succMsg");
                            if (succMsg != null) { 
                            %>
                                <p class="text-success text-center"><%= succMsg %></p>
                                <% session.removeAttribute("succMsg"); %>
                            <% } %>

                            <% 
                            String failMsg = (String) session.getAttribute("failMsg");
                            if (failMsg != null) { 
                            %>
                                <p class="text-danger text-center"><%= failMsg %></p>
                                <% session.removeAttribute("failMsg"); %>
                            <% } %>

                            <div class="mb-3">
                                <label for="nameInput" class="form-label">Name</label>
                                <input name="name" type="text" class="form-control" id="nameInput" placeholder="Enter contact's name" value="<%= c.getName() %>">
                            </div>

                            <div class="mb-3">
                                <label for="emailInput" class="form-label">Email address</label>
                                <input name="email" type="email" class="form-control" id="emailInput" placeholder="Enter contact's email" value="<%= c.getEmail() %>">
                            </div>

                            <div class="mb-3">
                                <label for="phoneInput" class="form-label">Phone Number</label>
                                <input name="phno" type="tel" class="form-control" id="phoneInput" placeholder="Enter contact's phone number" pattern="[0-9]{10}" title="Please enter a valid 10-digit phone number" value="<%= c.getPhno() %>">
                            </div>

                            <div class="mb-3">
                                <label for="aboutInput" class="form-label">About</label>
                                <textarea name="about" class="form-control" id="aboutInput" rows="4" placeholder="Enter some information about the contact"><%= c.getAbout() %></textarea>
                            </div>

                            <div class="text-center mt-3">
                                <button type="submit" class="btn btn-primary">Edit Contact</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <%@ include file="component/footer.jsp"%>
    </footer>
</body>
</html>
