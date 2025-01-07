<%@ page import="jakarta.servlet.*, jakarta.servlet.http.*" %>
<% 

String msg = (String) session.getAttribute("message");



if(msg!=null)
{
%>
<div class="alert alert-success d-flex mb-2 p-1 justify-content-between" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="20" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
  <div>
    <%= msg%>
  </div>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<%
session.removeAttribute("message");
}
%>