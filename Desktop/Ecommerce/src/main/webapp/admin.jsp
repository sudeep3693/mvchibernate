<%@page import="com.mycompany.orm.User"%>
<%@ page import="jakarta.servlet.*, jakarta.servlet.http.*" %>
<%@ page import="com.mycompany.dao.CategoryDao"%>
<%@ page import="com.mycompany.dao.ProductDao"%>
<%@ page import="com.mycompany.dao.UserDao"%>
<%@ page import="com.mycompany.orm.Category"%>
<%@page import="com.mycompany.helper.factoryProvider"%>
<%@page import="java.util.List" %> 
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
            <!--access product and category dao-->
            <%
                             ProductDao pdao = new ProductDao(factoryProvider.getFactory());
                    
                             int n = pdao.countProducts();

                            CategoryDao cdao =  new CategoryDao(factoryProvider.getFactory());
                            List <Category> categories = cdao.fetchCategories();
                            
                            int c = cdao.countCategory();
                            
                            UserDao udao = new UserDao(factoryProvider.getFactory());
                            int userss = udao.countUser();
                    
                    
            %>
            <!--end of product and category dao-->

            <div class="row">   
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style=" max-width:125px" class="img-fluid rounded-circle" src="IMG/users.png" alt="user_icon"/>
                            </div>

                            <h2>
                                <%=userss%>
                            </h2>
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
                            <h2><%= c %></h2>
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
                            <h2>
                                <%=n%>

                            </h2>
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
                <div class="col-md-6" data-bs-toggle="modal" data-bs-target="#product-modal">
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



        <!--add product modal-->

        <div class="modal fade" id="product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg">
                        <h1 class="modal-title fs-5 text-white" id="exampleModalLabel">Fill Product Details</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">




                        <!--product form-->


                        <form action="addCategoryServlet" method="post" enctype="multipart/form-data">

                            <div class="row">
                                <div class="mb-3 col-md-6">
                                    <label for="exampleFormControlInput1" class="form-label">Product Title</label>
                                    <input type="text" class="form-control" name="product-title" id="product-name" placeholder="Product_name" required>
                                </div>

                                <input type="hidden" name="behaviour" value="add-product">


                                <!--add category here-->

                                <div class="form-group col-md-6">
                                    <label class="mb-2" for="adf">Select Category</label>
                                    <select name="catid" class="form-control" id="adf">


                                        <%
                                            for(Category cc: categories)
                                            {

                                        %>
                                        <option  value="<%=cc.getCategoryId()%>"><%=cc.getCategoryTitle()%></option>

                                        <%
                                            }
                                            
                                        %>

                                    </select>


                                </div>




                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlTextarea1" class="form-label">Product Description</label>
                                <textarea class="form-control" name="product-description" id="product-description" rows="3" required></textarea>
                            </div>

                            <div class="mb-3">
                                <label for="formFile" class="form-label">Product Image</label>
                                <input class="form-control" name="product-image" type="file" id="formFile" required>
                            </div>

                            <div class="row">

                                <div class="col-md-4 mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Product Price</label>
                                    <input type="number" class="form-control" name="product-price" id="product-price" required>
                                </div>

                                <div class="col-md-4 mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Product Quantity</label>
                                    <input type="number" class="form-control" name="product-quantity" id="product-quantity" required>
                                </div>

                                <div class="col-md-4 mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Discount</label>
                                    <input type="number" class="form-control" name="discount" id="discount">
                                </div>

                            </div>



                            <hr>
                            <div class="container text-center justify-content-between">
                                <button type="submit" class="btn btn-primary">Save changes</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>

                        </form>



                        <!--end of product form -->



                    </div>

                </div>
            </div>
        </div>


        <!--end of add product modal-->

    </body>

    <script src="JS/script.js"></script>

</html>
