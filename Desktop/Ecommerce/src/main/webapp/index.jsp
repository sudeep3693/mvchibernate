<%@ page import="jakarta.servlet.*, jakarta.servlet.http.*" %>

<%@page import="com.mycompany.helper.factoryProvider"%>
<%@page import="com.mycompany.dao.CategoryDao"%>
<%@page import="com.mycompany.dao.ProductDao"%>
<%@page import="com.mycompany.orm.Category"%>
<%@page import="com.mycompany.orm.Product"%>
<%@page import="java.util.List" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dukan</title>
        <%@ include file="Reusable/navbar.jsp"%>

    </head>
    <body>
        <%@ include file="Reusable/bootstrap.jsp"%>

        <div class="container-fluid mt-5">

            <%     
            
            CategoryDao cao = new CategoryDao(factoryProvider.getFactory());
            List <Category> list = cao.fetchCategories();
            

            

            %>
            <% for(Category c:list){
            ProductDao pao = new ProductDao(factoryProvider.getFactory());
            List <Product> pro  = pao.getProducts(c); 
            
            %>
            <div class="container-fluid">
                <div class="container text-center mb-3 mt-3">
                    <div class="row"><h2><%= c.getCategoryTitle()%></h2></div> 

                </div>
                <div class="row mt-2">


                    <%
                        for(Product p: pro){
                        String productName = (String)p.getpPhoto();

                    %>

                    <div class="col-md-4 mb-3 col-sm-6" style="height:auto">
                        <div class="card">

                            <div class="card-body">
                                <div class="container-fluid text-center">
                                    <img src ="IMG/products/<%=productName%>" class="image-fluid text-center" style="max-width: 180px">

                                </div>
                                <div class="container-fluid">
                                    <div class="row text-center">
                                        <h3><%= p.getpTitle()%></h3>
                                    </div>
                                    <div class="row">

                                        <div class="col-6">
                                            <h5>Rs. <strike><%=p.getpPrice()%></strike></h5>
                                        </div>
                                        <div class="col-6">
                                            <h5>Rs.<%=p.getpPrice()-p.getpPrice()*p.getpDiscount()/100%></h5>
                                        </div>


                                    </div>
                                    <div class="row m-3">
                                        <div class="dropdown">
                                            <button class="btn btn-Primary dropdown-toggle" style="width:95%" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                                Description
                                            </button>
                                            <!--description here-->
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="width:95%;">
                                            <p class="dropdown-item" style="white-space: normal; word-wrap: break-word; max-width:98%;"><%=p.getpDesc()%></p>
                                        </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <button class="btn text-center btn-warning ">Add to cart</button>
                                        </div>
                                        <div class="col-6">
                                            <button class="btn btn-primary text-center">Buy Now</button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%
                        }
                    %>
                    <hr style="width:100%;">
                </div>

                <%
                    }
                %>
            </div>

        </div>
    </body>
</html>
