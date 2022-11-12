<%-- 
    Document   : Home
    Created on : 11-Nov-2022, 4:59:41 PM
    Author     : J.Pointer
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <header class="d-flex mb-5 pt-2 pb-2 d-flex justify-content-between bg-light">
            <img class="pl-3" src="${pageContext.request.contextPath}/logo.png" width="100" height="100">
            <h2 class="text-uppercase ml-5 align-self-center">HOME nVentory</h2>
            <div class="mr-2 align-self-center">
                <p>Welcome Back <c:out value="${user.firstName}"/>
                <a class="btn btn-primary" href="home?action=logout">Logout</a>
            </div>
            
        </header>    
    </body>
</html>
