<%-- 
    Document   : Login
    Created on : Dec 30, 2024, 7:16:50 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Servlet</title>
        <%@include file="Reusable/bootstrap.jsp" %>
    </head>
    <body style="background-image: url('IMG/loginbgg.jpg');
          background-size: cover;
          background-repeat: no-repeat;">

        <%@include file="Reusable/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4 col-sm-10 offset-sm-1 manualOpacity">

                    <div class="card mt-5">  
                        <div class="card-header text-center text-white bg-primary">
                            <h3>Login Here!!!</h3>
                        </div>
                        <div class="card-body">


                            <form action="LoginServlet" method="post">
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <div class="container text-center d-block mb-3">
                                    <a href="register.jsp" class="text-center">If not registered click here</a>
                                    
                                </div>
                               <div class="container text-center">
                                <button type="submit" class="btn btn-primary border-0">Submit</button>
                                <button type="reset" class="btn btn-warning border-0">Reset</button>
                                </div>
                                
                                
                                    
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
