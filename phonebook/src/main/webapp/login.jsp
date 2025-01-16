<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
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
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <form action="login" method="post">
                            <h4 class="text-center mb-4">Login Page</h4>

                           
                            <%
                                String invalid = (String) session.getAttribute("invalid");
                                if (invalid != null) {
                            %>
                                <div class="alert alert-success text-center"><%= invalid %></div>
                            <%
                                session.removeAttribute("invalid");
                                }
                            %>

                            <%
                                String outmsg = (String) session.getAttribute("outmsg");
                                if (outmsg != null) {
                            %>
                                <div class="alert alert-danger text-center"><%= outmsg %></div>
                            <%
                                session.removeAttribute("outmsg");
                                }
                            %>

                        
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Email Address</label>
                                <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your email">
                            </div>

                         
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Password</label>
                                <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter your password">
                            </div>

                          
                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-primary w-100">Login</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <div class="footer">
        <%@ include file="component/footer.jsp"%>
    </div>
</body>
</html>
