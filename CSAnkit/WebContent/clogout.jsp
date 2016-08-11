<%
session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("csignin.jsp");
%>