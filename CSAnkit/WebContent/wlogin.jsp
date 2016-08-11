<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/schema1", "root", "root");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from worker where uname='" + userid + "' and pass='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        session.setAttribute("workermail", rs.getString("email"));
        //out.println("welcome " + userid);
        //out.println("<a href='wlogout.jsp'>Log out</a>");
        response.sendRedirect("wsuccess.jsp");
    } else {
        out.println("Invalid password <a href='wsignin.jsp'>try again</a>");
    }
%>