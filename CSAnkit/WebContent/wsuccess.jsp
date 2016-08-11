<%@page language="java" import="java.util.*" import="java.sql.*"
	contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in
<br />
<a href="wsignin.jsp">Please Login</a>
<%} else {
%>
Welcome
<%=session.getAttribute("userid")%><br>
<!-- <a href='wlogout.jsp'>Log out</a><br>
<a href='wstatus.jsp'>Status</a>
 -->
<html>
<head>
<title>Requests from Clients</title>

  <meta charset='utf-8'>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="styles.css">
  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
  <script src="script.js"></script>
 
	 <div id='cssmenu'>
	<ul>
	   <li class='active'><a href='wlogout.jsp'><span>Log out</span></a></li>
	   <li class='last'><a href='wstatus.jsp'><span>Status</span></a></li>
	</ul>
	</div>

</head>
<body>
	<table width="700px" align="center" style="border: 1px solid #000000;">
		<tr>
			<td colspan=5 align="center" style="background-color: DodgerBlue">
				<b>Current Task Requests from Clients</b>
			</td>
		</tr>
		<tr style="background-color: lightgrey;">
			<td><b>Client Name</b></td>
			<td><b>Client Email</b></td>
			<td><b>Task</b></td>
			<td><b>Accept</b></td>
			<td><b>Reject</b></td>
		</tr>
		<%
			int count = 0;
			String color = "#66b3ff";
			//String task = request.getAttribute("task").toString();
			Connection conn = null;
			String url = "jdbc:mysql://localhost:3306/";
			String dbName = "schema1";
			String driver = "com.mysql.jdbc.Driver";
			String userName = "root";
			String password = "root";

			Statement st;
		try {
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url + dbName, userName, password);
			System.out.println("wsuccess.jsp - Connected!");
			String workermail = session.getAttribute("workermail").toString();
			//String query = "select * from task where wmail='" + workermail + "'";
			String query = "select * from task where wmail='" + workermail + "' and status='CReq'";

			System.out.println("wsuccess.jsp - query: " + query);
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);

			if (rs != null) {
				System.out.println("wsuccess.jsp - rs != null");
				while (rs.next())
				{

					color = "#66b3ff";
					if ((count % 2) == 0)
					{
						color = "#99ccff";
						//System.out.println("@@@@@ count="+ count +"& color="+ color +"");
					}
					count++;

		%>
		<tr style="background-color:<%=color%>;">
			<td><%=rs.getString(2).substring(0,rs.getString(2).indexOf("@"))%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><form method="post" action="wstatus.jsp">
					<input type="hidden" name="cmail" value="<%=rs.getString(2)%>"/>
					<input type="hidden" name="task" value="<%=rs.getString(3)%>"/>
					<input type="hidden" name="status" value="CReqWAcc" />
					<input type="submit" value="Accept" />
				</form>
			</td>
			<td><form method="post" action="wstatus.jsp">
					<input type="hidden" name="cmail" value="<%=rs.getString(2)%>"/>
					<input type="hidden" name="task" value="<%=rs.getString(3)%>"/>
					<input type="hidden" name="status" value="CReqWRej" />
					<input type="submit" value="Reject" />
				</form>
			</td>
		</tr>
		<%
			}
			}
			//System.out.println("value of task:"+task);
			//request.setAttribute("ttask", task);
			if (count == 0) {
		%>
		<tr>
			<td colspan=5 align="center" style="background-color: #eeffee"><b>
					No New Requests by any client</b></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>

<%
	}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally
		{
			conn.close();
		}
    }
%>