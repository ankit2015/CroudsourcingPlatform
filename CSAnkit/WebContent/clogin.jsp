<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/schema1", "root", "root");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from client where uname='" + userid + "' and pass='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        session.setAttribute("usermail", rs.getString("email"));
        //session.setAttribute("usermail", rs.getString(4));
        //out.println("welcome " + userid);
        //out.println("<a href='clogout.jsp'>Log out</a>");
        response.sendRedirect("csuccess.jsp");
    } else {
        out.println("Invalid password <a href='csignin.jsp'>try again</a>");
    }
%>