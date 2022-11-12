<%-- 
    Document   : register
    Created on : 11-Nov-2022, 7:02:31 PM
    Author     : Arcto
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body class="vh-100 bg-image"
          style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
        <header class="d-flex mb-5 pt-2 pb-2 d-flex justify-content-between bg-light">
            <img class="pl-3" src="${pageContext.request.contextPath}/logo.png" width="100" height="100">
            <h2 class="text-uppercase ml-5 align-self-center">HOME nVentory</h2>
            <div class="align-self-center pr-3" ><a class="btn btn-primary" href="#">Contact Admin</a></div>
        </header>
        <section>
            <div class="mask d-flex align-items-center h-100 gradient-custom-3">
                <div class="container h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="card mt-5" style="border-radius: 15px;">
                                <div class="card-body p-5">
                                    <h2 class="text-uppercase text-center mb-5">Create an account</h2>
                                    <form action="register" method="POST">
                                        <div class="form-outline mb-4">
                                            <input required type="text" name="inputFirstName" id="inputFirstName" class="form-control form-control-lg" />
                                            <label class="form-label" for="inputFirstName">First Name</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input required type="text" name="inputLastName" id="inputLastName" class="form-control form-control-lg" />
                                            <label class="form-label" for="inputLastName">Last Name</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input required type="email" name="inputEmail" id="inputEmail" class="form-control form-control-lg" />
                                            <label class="form-label" for="inputEmail">Your Email</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input required type="password" name="inputPasswordFirst" id="inputPasswordFirst" class="form-control form-control-lg" />
                                            <label class="form-label" for="inputPasswordFirst">Password</label>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <input required type="password" name="inputPasswordSecond" id="inputPasswordSecond" class="form-control form-control-lg" />
                                            <label class="form-label" for="inputPasswordSecond">Repeat your password</label>
                                        </div>
                                        <div class="d-flex justify-content-center">
                                            <button type="submit"
                                                    class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
                                        </div>

                                        <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="/finalproject/login"
                                                                                                                class="fw-bold text-body"><u>Login here</u></a></p>
                                       <c:if test="${message != null}">
                                            <div class="mt-4 text-center text-danger">
                                                <p><c:out value ="${message.toString()}"></c:out></p>
                                            </div>
                                        </c:if>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
