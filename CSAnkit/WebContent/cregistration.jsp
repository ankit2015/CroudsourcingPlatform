<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/schema1", "root", "root");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into client(first_name, last_name, email, uname, pass, phone, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "','" + phone + "', CURDATE())");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("cwelcome.jsp");
        //out.print("Registration Successfull!"+"<a href='csignin.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("csignin.jsp");
    }
%>