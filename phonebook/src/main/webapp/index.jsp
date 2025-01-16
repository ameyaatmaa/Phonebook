<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.conn.DbConnect" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PhoneBook</title>
    <%@ include file="component/allCss.jsp"%>

    <style type="text/css">
        
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

       
        .navbar {
            margin-bottom: 0;
        }

   
        .back-img {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), 
                        url("img/download2.jpg");
            width: 100%;
            height: calc(100vh - 56px); 
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            color: #fff; 
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

       
        .back-img h1 {
            font-size: 3rem; 
            font-weight: bold;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.7); 
            margin: 0;
            padding: 10px;
        }

       
        footer {
            padding: 10px 0;
            background-color: #222;
            color: #fff;
            text-align: center;
        }

        
        @media (max-width: 768px) {
            .back-img h1 {
                font-size: 2rem; 
            }
        }
    </style>
</head>

<body>
    <%@ include file="component/navbar.jsp"%>

    <% 
        Connection conn = DbConnect.getConn();
        if (conn == null) {
            out.print("Internal Error");
        } 
    %>

    <div class="container-fluid back-img text-center">
        <h1>Welcome to PhoneBook!</h1>
    </div>

    <%@ include file="component/footer.jsp"%>
</body>
</html>
