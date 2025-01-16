<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Contact</title>
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

        .text-center {
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: bold;
        }


        .text-success {
            font-size: 1rem;
            margin-bottom: 15px;
            margin-right: 15px;
        }

        .text-danger {
            font-size: 1rem;
            margin-bottom: 15px;
            margin-right: 15px;
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
    <%@include file="component/navbar.jsp"%>

    <% 
    
    if (session.getAttribute("users") == null) {
        session.setAttribute("outmsg", "Please Login to access this page");
        response.sendRedirect("login.jsp");
        return; 
    }
    %>

    <div class="container-fluid">
        <div class="row p-2">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <form action="addcontact" method="post">
                            <h4 class="text-center">Add Contact</h4>

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

                            
                            <input name="userid" type="hidden" value="<%= ((com.entity.User) session.getAttribute("users")).getId() %>">

                            <div class="mb-3">
                                <label for="nameInput" class="form-label">Name</label>
                                <input name="name" type="text" class="form-control" id="nameInput" placeholder="Enter contact's name">
                            </div>

                            <div class="mb-3">
                                <label for="emailInput" class="form-label">Email Address</label>
                                <input name="email" type="email" class="form-control" id="emailInput" placeholder="Enter contact's email">
                            </div>

                            <div class="mb-3">
                                <label for="phoneInput" class="form-label">Phone Number</label>
                                <input name="phno" type="tel" class="form-control" id="phoneInput" placeholder="Enter contact's phone number" pattern="[0-9]{10}" title="Please enter a valid 10-digit phone number">
                            </div>

                            <div class="mb-3">
                                <label for="aboutInput" class="form-label">About</label>
                                <textarea name="about" class="form-control" id="aboutInput" rows="4" placeholder="Enter some information about the contact"></textarea>
                            </div>

                            <div class="text-center mt-3">
                                <button type="submit" class="btn btn-primary">Add Contact</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <%@include file="component/footer.jsp"%>
    </footer>
</body>
</html>
