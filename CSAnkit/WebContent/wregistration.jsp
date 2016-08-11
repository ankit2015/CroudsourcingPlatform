<%@ page import="java.sql.*"%>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String foe = request.getParameter("foe");
    String loc = request.getParameter("loc");
    String proref = request.getParameter("proref");
    String experf = request.getParameter("experf");
    String fperf = request.getParameter("fperf");
    String aperf = request.getParameter("aperf");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/schema1", "root", "root");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into worker(first_name, last_name, email, uname, pass, phone, foe, loc, proref, experf, fperf, aperf, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "','" + phone + "','" + foe + "','" + loc + "','" + proref + "','" + experf + "','" + fperf + "','" + aperf + "', CURDATE())");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("wwelcome.jsp");
        //out.print("Registration Successfull!"+"<a href='wsignin.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("wsignin.jsp");
    }
%>