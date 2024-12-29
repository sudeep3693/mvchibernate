

<%@page import="com.mycompany.mavenproject1.factoryProvider"%>
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
        <h1>Creating session factory</h1>
        
        <%
            out.print( factoryProvider.getFactory());
            
            %>
    </body>
</html>
