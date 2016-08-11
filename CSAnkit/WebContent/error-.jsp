<%@ page language="java" isErrorPage="true" import="java.io.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Where's my page ???</title>
</head>
<body>
	<br>
	<center>
		<a href="http://localhost:8080/CSAnkit/"><img src="res/1.png" alt="Page Not Found" /></a>
	</center>
	<br> Request that failed: ${pageContext.errorData.requestURI}
	<br> Status code: ${pageContext.errorData.statusCode}
	<br> Exception: ${pageContext.errorData.throwable}
	<br> Servlet name: ${pageContext.errorData.servletName}
	<br>
	<br> Message:
	<br>
	<%=exception.getMessage()%>
	<br> StackTrace:
	<br>
	<%
		StringWriter stringWriter = new StringWriter();
		PrintWriter printWriter = new PrintWriter(stringWriter);
		exception.printStackTrace(printWriter);
		out.println(stringWriter + "<br>");
		printWriter.close();
		stringWriter.close();
	%>
</body>
</html>