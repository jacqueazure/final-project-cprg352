<%-- 
    Document   : login
    Created on : 11-Nov-2022, 5:03:46 PM
    Author     : Arcto
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body class="">
        <header class="d-flex mb-5 mr-3 ml-3 mt-2 d-flex justify-content-between">
            <img src="${pageContext.request.contextPath}/logo.png" width="100" height="100">
            <p class="h1 align-self-center">Login In</p>
            <div class="align-self-center" ><a class="btn btn-primary" href="#">Contact Admin</a></div>
        </header>
        <div  class="d-flex justify-content-center">
            <div class="card p-3" style="width: 22rem;" >
                <form action="login" method="post">
                    <!-- Email input -->
                    <div class="form-outline mb-4">
                        <input required type="email" id="userEmail" name="userEmail" class="form-control" />
                        <label class="form-label" for="form2Example1">Email address</label>
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-4">
                        <input required type="password" id="userPassword" name="userPassword" class="form-control" />
                        <label class="form-label" for="form2Example2">Password</label>
                    </div>

                    <!-- 2 column grid layout for inline styling -->
                    <div class="row mb-4">
                        <div class="col d-flex justify-content-center">
                            <!-- Checkbox -->
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
                                <label class="form-check-label" for="form2Example31"> Remember me </label>
                            </div>
                        </div>

                        <div class="col">
                            <!-- Simple link -->
                            <a href="login?action=forgot">Forgot password?</a>
                        </div>
                    </div>

                    <!-- Submit button -->
                    <button type="submit"  class="btn btn-primary btn-block mb-4">Sign in</button>

                    <!-- Register buttons -->
                    <div class="text-center">
                        <p>Not a member? <a href="login?action=register">Register</a></p>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
