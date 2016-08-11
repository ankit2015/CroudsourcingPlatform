<%@ page import="java.util.*"%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
<head>
<title>Search Results</title>
<meta charset='utf-8'>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="styles.css">
  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
  <script src="script.js"></script>
 
	 <div id='cssmenu'>
	<ul>
	   <li class='active'><a href='clogout.jsp'><span>Log out</span></a></li>
	   <li class='active'><a href='csuccess.jsp'><span>Search Again</span></a></li>
	   <li class='last'><a href='cstatus.jsp'><span>Status</span></a></li>
	</ul>
	</div>
</head>
<body>
<br/>
<!-- <a href='clogout.jsp'>Log out</a><br>
<a href='csuccess.jsp'>Search again</a><br>
<a href='cstatus.jsp'>Status</a> -->
	<table width="700px" align="center" style="border: 1px solid #000000;">
		<tr>
			<td colspan=5 align="center" style="background-color: DodgerBlue">
				<b>Search Results</b>
			</td>
		</tr>
		<tr style="background-color: lightgrey;">
			<td><b>Worker Name</b></td>
			<td><b>Worker Email</b></td>
			<td><b>Rating</b></td>
			<td><b>Registration Date</b></td>
			<td><b>Make Request</b></td>
		</tr>
		<%
			int count = 0;
			String color = "#66b3ff";
			String task = request.getAttribute("task").toString();
			if (request.getAttribute("piList") != null) {
				ArrayList<?> al = (ArrayList<?>) request.getAttribute("piList");
				System.out.println(al);
				Iterator<?> itr = al.iterator();
				while (itr.hasNext()) {

					color = "#66b3ff";
					if ((count % 2) == 0) {
						color = "#99ccff";
						//                            System.out.println("@@@@@ count="+ count +"& color="+ color +"");
					}
					count++;
					ArrayList<?> pList = (ArrayList<?>) itr.next();
					System.out.println("****** pList.size() = "+pList.size());
		%>
		<tr style="background-color:<%=color%>;">
		<% for(int i=0; i<pList.size(); i++) {%>
			<td><%=pList.get(i)%></td>
			<% System.out.println("@@@@@@ "+i+" - "+pList.get(i));} %>
			<td><form method="post" action="cstatus.jsp">
					<input type="hidden" name="wmail" value="<%=pList.get(1)%>" />
					<input type="hidden" name="task" value="<%=task%>" />
					<input type="hidden" name="status" value="CReq" />
					<input type="submit" value="Request" />
				</form></td>
		</tr>
		<%
			}
			}
			//System.out.println("value of task:"+task);
			//request.setAttribute("ttask", task);
			if (count == 0) {
		%>
		<tr>
			<td colspan=5 align="center" style="background-color: #eeffee"><b>No
					Record Found..</b></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>