
<%@page import="com.mycompany.orm.User" %>
<%
    
User user = (User)session.getAttribute("current_user");
    
    if(user==null){
    
    session.setAttribute("message","Login First");
    response.sendRedirect("Login.jsp");
    return;
    }
    else
    {
    
    if(user.getType().equals("adminUser"))
    {
    session.setAttribute("message","No authority to access this page!!");
    response.sendRedirect("Login.jsp");
    return;
    }
    }
    %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal Page</title>
        <%@include file="Reusable/bootstrap.jsp" %>
    </head>
    <body>
        <%@include file="Reusable/navbar.jsp" %>
        
       
    </body>
</html>
