<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Page</title>
    <%@ include file="component/allCss.jsp"%>
    <style>
        body {
            background-color: #f7f3d1;
            font-family: 'Arial', sans-serif;
        }

        .container-fluid {
            margin-top: 50px;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: scale(1.02);
        }

        .card-body h4 {
            font-weight: bold;
            color: #333;
        }

        .form-label {
            font-weight: bold;
            color: #555;
        }

        .btn-primary {
            background-color: #5a88f7;
            border-color: #4e7edf;
        }

        .btn-primary:hover {
            background-color: #4e7edf;
            border-color: #426bd3;
        }

        .alert {
            margin-bottom: 20px;
        }

        .text-success,
        .text-danger {
            font-size: 0.9rem;
        }

        .footer {
            margin-top: 200px;
        }
    </style>
</head>
<body>
    <%@ include file="component/navbar.jsp"%>

    <div class="container-fluid">
        <div class="row p-2">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <form action="register" method="post">
                            <h4 class="text-center mb-4">Registration Page</h4>

                            <!-- Success or Error Messages -->
                            <% 
                                String sucssMsg = (String) session.getAttribute("sucssMsg");
                                String errorMsg = (String) session.getAttribute("errorMsg");

                                if (sucssMsg != null) { 
                            %>
                                <div class="alert alert-success text-center"><%= sucssMsg %></div>
                                <% session.removeAttribute("sucssMsg"); %>
                            <% 
                                }
                                if (errorMsg != null) { 
                            %>
                                <div class="alert alert-danger text-center"><%= errorMsg %></div>
                                <% session.removeAttribute("errorMsg"); %>
                            <% } %>

                            <!-- Name Input -->
                            <div class="mb-3">
                                <label for="nameInput" class="form-label">Name</label>
                                <input name="name" type="text" class="form-control" id="nameInput" placeholder="Enter your name">
                            </div>

                            <!-- Email Input -->
                            <div class="mb-3">
                                <label for="emailInput" class="form-label">Email Address</label>
                                <input name="email" type="email" class="form-control" id="emailInput" placeholder="Enter your email">
                            </div>

                            <!-- Password Input -->
                            <div class="mb-3">
                                <label for="passwordInput" class="form-label">Password</label>
                                <input name="password" type="password" class="form-control" id="passwordInput" placeholder="Enter your password">
                            </div>

                            <!-- Submit Button -->
                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-primary w-100">Register</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <%@ include file="component/footer.jsp"%>
    </div>
</body>
</html>
