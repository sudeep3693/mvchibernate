
<%@ page import="jakarta.servlet.*, jakarta.servlet.http.*" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
   <div class="container">
    <a class="navbar-brand" href="#">Dukan</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-between" id="navbarNavDropdown">
      <ul class="navbar-nav ">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Products</a>
        </li>
        
       
      </ul>
        <%@page import="com.mycompany.orm.User" %>%>
      <%   
        User user1 = (User)session.getAttribute("current_user");
        if(user1==null){
        
        %>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
            <a class="nav-link" href="register.jsp">Register</a>
            </li>
            
              <li class="nav-item active">
          <a class="nav-link" href="Login.jsp">Login</a>
        </li>
        </ul>
        
        <%
          }
          else
    {
      %>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
            <a class="nav-link" href="#!"><%=user1.getUserName()%></a>
            </li>
            
              <li class="nav-item active">
          <a class="nav-link" href="LogoutServlet">Logout</a>
        </li>
        </ul>
        <%
            }    
        %>
  </div>
    </<div>
</nav>