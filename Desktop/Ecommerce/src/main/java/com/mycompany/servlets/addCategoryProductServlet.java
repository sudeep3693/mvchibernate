/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.servlets;

import com.mycompany.dao.CategoryDao;
import com.mycompany.dao.ProductDao;
import com.mycompany.helper.factoryProvider;
import com.mycompany.orm.Category;
import com.mycompany.orm.Product;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author user
 */
@MultipartConfig
public class addCategoryProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            String beh = request.getParameter("behaviour");

            if (beh.trim().equals("add-category")) {
                String categoryName = request.getParameter("category-name");
                String categoryDetail = request.getParameter("category-detail");

                try {

                    Category category = new Category(categoryName, categoryDetail);

                    CategoryDao categoryDao = new CategoryDao(factoryProvider.getFactory());
                    int catid = categoryDao.insertCategory(category);

                    HttpSession session = request.getSession();
                    session.setAttribute("message", "Category " + categoryName + " Successfully added ");

                    response.sendRedirect("admin.jsp");
                } catch (Exception e) {

                    HttpSession session = request.getSession();
                    session.setAttribute("message", "Category " + categoryName + " already exists ");

                    response.sendRedirect("admin.jsp");
                }
            } else if (beh.trim().equals("add-product")) {
                String product_title = request.getParameter("product-title");
                try {
                    
                    String product_desc = request.getParameter("product-description");
                    int categoryid = Integer.parseInt(request.getParameter("catid"));
                    long product_price = Long.parseLong(request.getParameter("product-price"));
                    int product_discount = Integer.parseInt(request.getParameter("discount"));
                    int product_quantity = Integer.parseInt(request.getParameter("product-quantity"));
                    Part part = request.getPart("product-image");

                    Product p = new Product();
                    p.setpTitle(product_title);
                    p.setpDesc(product_desc);
                    p.setpPrice(product_price);
                    p.setpQuantity(product_quantity);
                    p.setpDiscount(product_discount);
                    p.setpPhoto(part.getSubmittedFileName());

                    //CategoryDao cao = new CategoryDao(factoryProvider.getFactory());
                    //Category category = cao.getCategoryById(categoryid);

                   // p.setCategory(category);
                   
                  ServletContext cont = request.getServletContext();
                  String path = cont.getRealPath("IMG")+ File.separator + "ProductImage"+ File.separator + part.getSubmittedFileName();
                   
                   out.println(path);

//                    insert into database using product dao
                        
                        ProductDao pdao = new ProductDao(factoryProvider.getFactory());
                        pdao.insertProduct(p);
                        
//                        HttpSession session = request.getSession();
//                        session.setAttribute("message","Product "+product_title+" is added successfully");
//                        response.sendRedirect("admin.jsp");
                        

                    
                } catch (Exception e) {
                        HttpSession session = request.getSession();
                        session.setAttribute("message","Product "+product_title+" already exists");
                        response.sendRedirect("admin.jsp");
                }

            } else {
                HttpSession ses = request.getSession();
                ses.setAttribute("message","error");
                response.sendRedirect("admin.jsp");
                
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
