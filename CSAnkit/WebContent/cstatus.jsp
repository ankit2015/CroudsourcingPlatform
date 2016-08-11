<%@ page language="java" import ="java.sql.*" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Client Status</title>
<link rel="stylesheet" href="jquery.rating.css">
<script src="jquery.js"></script>
<script src="jquery.rating.js"></script>

 <meta charset='utf-8'>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="styles.css">
  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
  <script src="script.js"></script>
 
	 <div id='cssmenu'>
	<ul>
	   <li class='active'><a href='clogout.jsp'><span>Log out</span></a></li>
	   <li class='last'><a href='csuccess.jsp'><span>Home Page</span></a></li>
	</ul>
	</div>



</head>
<body>
<br/>
<!-- ><a href='clogout.jsp'>Log out</a><br/>
<a href='csuccess.jsp'>Search worker</a> -->
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/schema1", "root", "root");
Statement st = con.createStatement();

ArrayList<String> rejByClient = null;
ArrayList<ArrayList<String>> rejByClient_list = new ArrayList<ArrayList<String>>();

ArrayList<String> asgByClient = null;
ArrayList<ArrayList<String>> asgByClient_list = new ArrayList<ArrayList<String>>();

String usermail = session.getAttribute("usermail").toString();
String status = request.getParameter("status");
if (status!=null)
{
	if (status.equals("CReq"))
	{
	    String tname = request.getParameter("task");
	    String wmail = request.getParameter("wmail");
	    System.out.println("cstatus.jsp - usermail, tname, wmail = "+usermail+", "+tname+", "+wmail);
	    //ResultSet rs;
	    int iniRating=0;
	    String q= "insert into task(cmail, tname, wmail, status, regdate, rating) values ('" + usermail + "','" + tname + "','" + wmail + "','" + status + "',CURDATE()" + ",'" + iniRating + "')";
	    System.out.println(q);
	    int i = st.executeUpdate(q);
	    if (i > 0) {
	    	out.print("Request sent successfully! "+"<a href='csuccess.jsp'>Go to search</a>");
	        //session.setAttribute("userid", user);
	        //response.sendRedirect("cwelcome.jsp");
	        //out.print("Registration Successfull!"+"<a href='csignin.jsp'>Go to Login</a>");
	    } else {
	    	out.print("An error occured - Request not sent!"+"<a href='csuccess.jsp'>Go to search</a>");
	        //response.sendRedirect("csignin.jsp");
	    }
	}
	//else if (status.equals("CReqWAcc"))	{	}
	//else if (status.equals("CReqWRej"))	{	}
	else if (status.equals("CReqWAccCAcc"))
	{
	    String tname = request.getParameter("task");
	    String wmail = request.getParameter("wmail");
	    System.out.println("cstatus.jsp - usermail, tname, wmail = "+usermail+", "+tname+", "+wmail);
	    //ResultSet rs;
	    //int i = st.executeUpdate("insert into task(cmail, tname, wmail, status, regdate) values ('" + usermail + "','" + tname + "','" + wmail + "','" + status + "', CURDATE())");
	    int i = st.executeUpdate("UPDATE task SET status='CReqWAccCAcc' WHERE tname='" + tname + "' and cmail='" + usermail + "' and status='CReqWAcc'");
	    if (i > 0) {
	    	out.print("Request accepted successfully! "+"<a href='csuccess.jsp'>Go to search</a>");
	        //session.setAttribute("userid", user);
	        //response.sendRedirect("cwelcome.jsp");
	        //out.print("Registration Successfull!"+"<a href='csignin.jsp'>Go to Login</a>");
	    } else {
	    	out.print("An error occured - Request not sent!"+"<a href='csuccess.jsp'>Go to search</a>");
	        //response.sendRedirect("csignin.jsp");
	    }
	}
	else if (status.equals("CReqWAccCRej"))
	{
	    String tname = request.getParameter("task");
	    String wmail = request.getParameter("wmail");
	    System.out.println("cstatus.jsp - usermail, tname, wmail = "+usermail+", "+tname+", "+wmail);
	    //ResultSet rs;
	    //int i = st.executeUpdate("insert into task(cmail, tname, wmail, status, regdate) values ('" + usermail + "','" + tname + "','" + wmail + "','" + status + "', CURDATE())");
	    int i = st.executeUpdate("UPDATE task SET status='CReqWAccCRej' WHERE tname='" + tname + "' and cmail='" + usermail + "' and status='CReqWAcc'");
	    if (i > 0) {
	    	out.print("Request rejected successfully! "+"<a href='csuccess.jsp'>Go to search</a>");
	        //session.setAttribute("userid", user);
	        //response.sendRedirect("cwelcome.jsp");
	        //out.print("Registration Successfull!"+"<a href='csignin.jsp'>Go to Login</a>");
	    } else {
	    	out.print("An error occured - Request not rejected!"+"<a href='csuccess.jsp'>Go to search</a>");
	        //response.sendRedirect("csignin.jsp");
	    }
	}
	else if (status.equals("over"))
	{
	    String tname = request.getParameter("task");
	    String wmail = request.getParameter("wmail");
	    System.out.println("cstatus.jsp - usermail, tname, wmail = "+usermail+", "+tname+", "+wmail);
	    //ResultSet rs;
	    //int i = st.executeUpdate("insert into task(cmail, tname, wmail, status, regdate) values ('" + usermail + "','" + tname + "','" + wmail + "','" + status + "', CURDATE())");
	    int i = st.executeUpdate("UPDATE task SET status='over' WHERE tname='" + tname + "' and cmail='" + usermail + "' and status='CReqWAccCAcc'");
	    
	    if (i > 0) {
	    	out.print("Task marked as completed successfully! "+"<a href='csuccess.jsp'>Go to search</a>");
	        //session.setAttribute("userid", user);
	        //response.sendRedirect("cwelcome.jsp");
	        //out.print("Registration Successfull!"+"<a href='csignin.jsp'>Go to Login</a>");
	    } else {
	    	out.print("An error occured - Task not marked as completed!"+"<a href='csuccess.jsp'>Go to search</a>");
	        //response.sendRedirect("csignin.jsp");
	    }

		i=0;
		
		int rating = Integer.parseInt(request.getParameter("rating"));

		i = st.executeUpdate("UPDATE task SET rating='" + rating + "' WHERE tname='" + tname + "' and cmail='" + usermail + "' and wmail='" + wmail + "' and status='over'");
	    
	    if (i > 0) {
	    	out.print("Rating saved successfully! "+"<a href='csuccess.jsp'>Go to search</a>");
	        //session.setAttribute("userid", user);
	        //response.sendRedirect("cwelcome.jsp");
	        //out.print("Registration Successfull!"+"<a href='csignin.jsp'>Go to Login</a>");
	    } else {
	    	out.print("An error occured - Rating not saved!"+"<a href='csuccess.jsp'>Go to search</a>");
	        //response.sendRedirect("csignin.jsp");
	    }


		int ratingSumI = 0;
		int taskCountI = 0;
		String query = "select * from task where wmail='" + wmail +"' and status='over'";
		System.out.println("cstatus.jsp - query: " + query);
		ResultSet rs = st.executeQuery(query);
		while (rs.next())
		{
			ratingSumI = ratingSumI + rs.getInt("rating");
			taskCountI++;
		}
		float ratingSum = ratingSumI;
		float taskCount = taskCountI;

		float newRating = ratingSum/taskCount;
		System.out.println("newRating , ratingSum , taskCount = " + newRating +", "+ ratingSum +", "+ taskCount);
		
		i = st.executeUpdate("UPDATE worker SET cperf='" + newRating + "' WHERE email='" + wmail + "'");
	    
	    if (i > 0) {
	    	out.print("Rating merged successfully! "+"<a href='csuccess.jsp'>Go to search</a>");
	        //session.setAttribute("userid", user);
	        //response.sendRedirect("cwelcome.jsp");
	        //out.print("Registration Successfull!"+"<a href='csignin.jsp'>Go to Login</a>");
	    } else {
	    	out.print("An error occured - Rating not merged!"+"<a href='csuccess.jsp'>Go to search</a>");
	        //response.sendRedirect("csignin.jsp");
	    }		
		
	}
}

	String query = "select * from task where cmail='" + usermail + "'";
	System.out.println("cstatus.jsp - query: " + query);
	ResultSet rs = st.executeQuery(query);

	if (rs != null)
	{
		System.out.println("cstatus.jsp - rs != null");
		while (rs.next())
		{
			if (rs.getString(5).equals("CReqWAcc"))
			{
				rejByClient = new ArrayList<String>();
				for(int i=2; i<6; i++)
				{
					rejByClient.add(rs.getString(i));
					System.out.println("@@@@@@ "+i+" - "+rs.getString(i));
				}
				System.out.println("rejByClient :: " + rejByClient);
				rejByClient_list.add(rejByClient);
			}
			else if (rs.getString(5).equals("CReqWAccCAcc"))
			{
				asgByClient = new ArrayList<String>();
				for(int i=2; i<6; i++)
				{
					asgByClient.add(rs.getString(i));
					System.out.println("@@@@@@ "+i+" - "+rs.getString(i));
				}
				System.out.println("asgByClient :: " + asgByClient);
				asgByClient_list.add(asgByClient);
			}
		}
	}
	st.close();
	con.close();
%>

	<table width="700px" align="center" style="border: 1px solid #000000;">
		<tr>
			<td colspan=5 align="center" style="background-color: DodgerBlue">
				<b>Requests Accepted by Workers - Assign Tasks or Reject</b>
			</td>
		</tr>
		<tr style="background-color: lightgrey;">
			<td><b>Client Mail</b></td>
			<td><b>Task</b></td>
			<td><b>Worker Mail</b></td>
			<td><b>Assign</b></td>
			<td><b>Reject</b></td>
		</tr>

			<%
			int count = 0;
			String color = "#66b3ff";
			Iterator<?> itr = rejByClient_list.iterator();
			while (itr.hasNext())
			{
				color = "#66b3ff";
				if ((count % 2) == 0)
				{
					color = "#99ccff";
					//System.out.println("@@@@@ count="+ count +"& color="+ color +"");
				}
				count++;
				ArrayList<?> pList = (ArrayList<?>) itr.next();
				System.out.println("****** pList.size() = "+pList.size());
			%>

		<tr style="background-color:<%=color%>;">
			<% for(int i=0; i<pList.size()-1; i++)
				{%>
			<td><%=pList.get(i)%></td>
			<%	System.out.println("@@@@@@ "+i+" - "+pList.get(i));
				} %>
			<td><form method="post" action="cstatus.jsp">
				<input type="hidden" name="cmail" value="<%=pList.get(0)%>"/>
				<input type="hidden" name="task" value="<%=pList.get(1)%>"/>
				<input type="hidden" name="status" value="CReqWAccCAcc" />
				<input type="submit" value="Assign" />
				</form>
			</td>
			<td><form method="post" action="cstatus.jsp">
					<input type="hidden" name="cmail" value="<%=pList.get(0)%>"/>
					<input type="hidden" name="task" value="<%=pList.get(1)%>"/>
					<input type="hidden" name="status" value="CReqWAccCRej" />
					<input type="submit" value="Reject" />
				</form>
			</td>
		</tr>
		<%
			}
			if (count == 0)
			{
		%>
		<tr>
			<td colspan=5 align="center" style="background-color: #eeffee"><b>
					No Records</b></td>
		</tr>
		<%
			}
		%>
	</table>

<br>
<br>
<%/**********************************************************/%>

	<table width="930px" align="center" style="border: 1px solid #000000;">
		<tr>
			<td colspan=7 align="center" style="background-color: DodgerBlue">
				<b>Tasks In Progress - Rate Workers</b>
			</td>
		</tr>
		<tr style="background-color: lightgrey;">
			<td><b>Client Mail</b></td>
			<td><b>Task</b></td>
			<td><b>Worker Mail</b></td>
			<td><b>Rating</b></td>
			<td><b>Payment (CAD)</b></td>
			<td><b>Comment</b></td>
			<td><b>Submit</b></td>
		</tr>

			<%
			count = 0;
			color = "#66b3ff";
			itr = asgByClient_list.iterator();
			while (itr.hasNext())
			{
				color = "#66b3ff";
				if ((count % 2) == 0)
				{
					color = "#99ccff";
					//System.out.println("@@@@@ count="+ count +"& color="+ color +"");
				}
				count++;
				ArrayList<?> pList = (ArrayList<?>) itr.next();
				System.out.println("****** pList.size() = "+pList.size());
			%>

		<tr style="background-color:<%=color%>;">
			<% for(int i=0; i<pList.size()-1; i++)
				{%>
			<td><%=pList.get(i)%></td>
			<%	System.out.println("@@@@@@ "+i+" - "+pList.get(i));
				} %>
			<td>
			<form method="post" action="cstatus.jsp">
            <input type="radio" name="rating" value="1" class="star" required="required">
            <input type="radio" name="rating" value="2" class="star">
            <input type="radio" name="rating" value="3" class="star">
            <input type="radio" name="rating" value="4" class="star">
            <input type="radio" name="rating" value="5" class="star">
            <input type="radio" name="rating" value="6" class="star">
            <input type="radio" name="rating" value="7" class="star">
            <input type="radio" name="rating" value="8" class="star">
            <input type="radio" name="rating" value="9" class="star">
            <input type="radio" name="rating" value="10" class="star">
			<td><input type="text" name="amount"  placeholder="amount in CAD" value=""  required="required"></td>
			<td><input type="text" name="comment"  placeholder="comment" value=""></td>
			<input type="hidden" name="cmail" value="<%=pList.get(0)%>"/>
			<input type="hidden" name="task" value="<%=pList.get(1)%>"/>
			<input type="hidden" name="wmail" value="<%=pList.get(2)%>"/>
			<input type="hidden" name="status" value="over" />
			<td><input type="submit" value="Submit" /></td>
			</form>
			</td>
		</tr>
		<%
			}
			if (count == 0)
			{
		%>
		<tr>
			<td colspan=7 align="center" style="background-color: #eeffee"><b>
					No Records</b></td>
		</tr>
		<%
			}
		%>
	</table>

</body>
</html>