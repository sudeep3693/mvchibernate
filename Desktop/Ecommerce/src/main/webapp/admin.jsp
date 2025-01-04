<%@page import="com.mycompany.orm.User"%>
<%@ page import="jakarta.servlet.*, jakarta.servlet.http.*" %>

<%
   User user = (User) session.getAttribute("current_user");
    
    if(user==null)
    {
        session.setAttribute("message","You are not logged in yet");
        response.sendRedirect("Login.jsp");
        return;
    }
    
    else{
    
    if(user.getType().equals("normalUser"))
    {
    session.setAttribute("message","Yor are not authorized to login");
    
            response.sendRedirect("Login.jsp");
            session.removeAttribute("current_user");
            
    return;
    }
            }
    
%>









<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file="Reusable/bootstrap.jsp" %>
    </head>
    <body>
        <%@include file="Reusable/navbar.jsp" %>

        <div class="container mt-3 admin"> 
              <%@include file="Reusable/message.jsp" %>
            <div class="row">   
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style=" max-width:125px" class="img-fluid rounded-circle" src="IMG/users.png" alt="user_icon"/>
                            </div>

                            <h2>12343</h2>
                            <h2 class="text-muted text-uppercase">Users</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style=" max-width:125px" class="img-fluid rounded-circle" src="IMG/categories.png" alt="category_icon"/>
                            </div>
                            <h2>2345234</h2>
                            <h2 class="text-muted text-uppercase">Categories</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body text-center">
                            <div class="container">
                                <img style=" max-width:125px" class="img-fluid rounded-circle" src="IMG/product.png" alt="category_icon"/>
                            </div>
                            <h2>2342</h2>
                            <h2 class="text-muted text-uppercase">Products</h2>
                        </div>
                    </div>
                </div>


            </div>


            <!<!-- second row -->

            <div class="row mt-3">

                <div class="col-md-6">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid " src="IMG/add_category.png" alt="addCategories_icon"/>
                            </div>
                            <p class="mt-2">Click to add</p>

                            <h2 class="mt-3 text-uppercase text-muted">Add Category</h2>
                        </div>
                    </div>

                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid " src="IMG/add-product.png" alt="addCategories_icon"/>
                            </div>
                            <p class="mt-2">Click to add</p>
                            <h2 class="mt-3 text-uppercase text-muted">Add Product</h2>
                        </div>
                    </div>

                </div>
            </div>
        </div>

  

        <!-- add category Modal -->




        <div class="modal fade" id="category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg">
                        <h1 class="modal-title fs-5 text-white" id="exampleModalLabel">Fill Category Details</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <!--category form-->

                        <form method="post" action="addCategoryServlet">
                            
                       
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Category Name</label>
                            <input type="text" class="form-control" name="category-name" id="category-name" placeholder="Agriculture.." required>
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" class="form-label">Category Detail</label>
                            <textarea class="form-control" name="category-detail" id="category-detail" rows="4" required></textarea>
                        </div>
                            
                            <input type ="hidden" name ="behaviour" value="add-category">
                            <hr>
                            <div class="container text-center justify-content-between">
                                <button type="submit" class="btn btn-primary">Save changes</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                            

                         </form>
                        <!--end of category form-->
                    </div>
                  
                </div>
            </div>
        </div>

        <!--End of category modal-->
    </body>
</html>
