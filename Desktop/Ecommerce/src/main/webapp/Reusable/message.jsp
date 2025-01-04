<%@ page import="jakarta.servlet.*, jakarta.servlet.http.*" %>
<% 

String msg = (String) session.getAttribute("message");



if(msg!=null)
{
%>
<div class="alert alert-success d-flex align-items-center m-0" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
  <div>
    <%= msg%>
  </div>
</div>

<%
session.removeAttribute("message");
}
%>