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
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">
    </head>
    <body>
        <header class="navbar sticky-top d-flex mb-3 pt-2 pb-2 d-flex justify-content-between bg-light">
            <img class="pl-3" src="${pageContext.request.contextPath}/logo.png" width="50" height="50">
            <h2 class="text-uppercase ml-5 align-self-center d-flex" style="font-family: 'Oswald', sans-serif;  position: relative; left: 30px;">HOME nVentory</h2>
            <div class="mr-2 mb-0 d-flex justify-content-between align-items-between">
                <p class="align-self-center mb-0 mr-2">Welcome Back <c:out value="${user.firstName}"/>
                <a class="btn btn-primary align-self-center" href="home?action=logout">Logout</a>
            </div>
        </header>    
    </body>
</html>
