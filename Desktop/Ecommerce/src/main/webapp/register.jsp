<%-- 
    Document   : register
    Created on : Dec 28, 2024, 11:20:03 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="Reusable/bootstrap.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body  style="background-image: url('IMG/loginbgg.jpg');
          background-size: cover;
          background-repeat: no-repeat;">
        <%@ include file="Reusable/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row my-5">
                <div class=" col-md-4 offset-md-4">

                    <div class="card px-3 py-2">
                        <%@include file="Reusable/message.jsp"%>
                        
                        <div class="card-body">
                            <div class="container text-center">

                                <img src="IMG/signup.jpg" class="image-fluid" style="max-width:100px" alt="img not found"/>
                            </div>
                            <div class="row ">
                                <div class="col text-center text-primary">
                                    <h3 class="my-2">Sign Up Here!!</h3>
                                </div>
                            </div>

                            <form action= "RegisterServlet" method="post">

                                <div class="form-group row mt-3">
                                    <label for="inputText3" class="col-sm-4 col-form-label">Username</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="inputText3" name="user_name" placeholder="Username" style="required:required">
                                    </div>
                                </div>

                                <div class="form-group row mt-3">
                                    <label for="inputEmail3" class="col-sm-4 col-form-label">Email</label>
                                    <div class="col-sm-8">
                                        <input type="email" class="form-control" name="user_email" id="inputEmail3" placeholder="Email" style="required:required">
                                    </div>
                                </div>
                                <div class="form-group row mt-3">
                                    <label for="inputPassword3" class="col-sm-4 col-form-label">Password</label>
                                    <div class="col-sm-8">
                                        <input type="password" class="form-control" name="user_password" id="inputPassword3" placeholder="Password" style="required:required">
                                    </div>
                                </div>

                                <div class="form-group row mt-3">
                                    <label for="inputText3" class="col-sm-4 col-form-label">Phone NO</label>
                                    <div class="col-sm-8">
                                        <input type="number" class="form-control" name="user_contact" id="inputText4" placeholder="Phone no" style="required:required">
                                    </div>
                                </div>
                                <div class="form-group row mt-3">
                                    <label for="inputText3" class="col-sm-4 col-form-label">Address</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="user_address" id="inputText5" placeholder="Address" style="required:required">
                                    </div>
                                </div>
                                
                                <div class="form-group row text-center mt-3">
                                    <div class="col-md-6 offset-md-3">
                                        <button type="submit" class="btn btn-primary">Register</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
