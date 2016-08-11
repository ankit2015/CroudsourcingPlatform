<%@ page language="java" import="java.sql.*" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Worker Status</title>

 <meta charset='utf-8'>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="styles.css">
  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
  <script src="script.js"></script>
 
	 <div id='cssmenu'>
	<ul>
	   <li class='active'><a href='wlogout.jsp'><span>Log out</span></a></li>
	   <li class='last'><a href='wsuccess.jsp'><span>Home Page</span></a></li>
	</ul>
	</div>

</head>
<body>
<br>
<!--<a href='wlogout.jsp'>Log out</a><br>
<a href='wsuccess.jsp'>Home page</a>-->
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/schema1", "root", "root");
System.out.println("wstatus.jsp - Connected!");
Statement st = con.createStatement();

ArrayList<String> rejByClient = null;
ArrayList<ArrayList<String>> rejByClient_list = new ArrayList<ArrayList<String>>();

ArrayList<String> asgByClient = null;
ArrayList<ArrayList<String>> asgByClient_list = new ArrayList<ArrayList<String>>();

String workermail = session.getAttribute("workermail").toString();
String status = request.getParameter("status");
if (status!=null)
{
	System.out.println("wstatus.jsp - status!=null");
	if (status.equals("CReqWAcc"))
	{
	    String tname = request.getParameter("task");
	    String cmail = request.getParameter("cmail");
	    System.out.println("wstatus.jsp - usermail, tname, wmail = "+cmail+", "+tname+", "+workermail);
	    //ResultSet rs;
	    int i = st.executeUpdate("UPDATE task SET status='CReqWAcc' WHERE tname='" + tname + "' and wmail='" + workermail + "' and status='CReq'");
	    //insert into task(cmail, tname, wmail, status, regdate) values ('" + usermail + "','" + tname + "','" + wmail + "','" + status + "', CURDATE())");
	    //int i = st.executeUpdate("insert into task(cmail, tname, wmail, status, regdate) values ('" + usermail + "','" + tname + "','" + wmail + "','" + status + "', CURDATE())");
	    if (i > 0) {
	    	out.print("Request accepted successfully! "+"<a href='wsuccess.jsp'>Go to your home page</a>");
	        //session.setAttribute("userid", user);
	        //response.sendRedirect("cwelcome.jsp");
	        //out.print("Registration Successfull!"+"<a href='csignin.jsp'>Go to Login</a>");
	    } else {
	    	out.print("An error occured - Request not accepted!"+"<a href='wsuccess.jsp'>Go to your home page</a>");
	        //response.sendRedirect("csignin.jsp");
	    }
	}
	else if (status.equals("CReqWRej"))
	{
	    String tname = request.getParameter("task");
	    String cmail = request.getParameter("cmail");
	    System.out.println("wstatus.jsp - usermail, tname, wmail = "+cmail+", "+tname+", "+workermail);
	    //ResultSet rs;
	    int i = st.executeUpdate("UPDATE task SET status='CReqWRej' WHERE tname='" + tname + "' and wmail='" + workermail + "' and status='CReq'");
	    //insert into task(cmail, tname, wmail, status, regdate) values ('" + usermail + "','" + tname + "','" + wmail + "','" + status + "', CURDATE())");
	    //int i = st.executeUpdate("insert into task(cmail, tname, wmail, status, regdate) values ('" + usermail + "','" + tname + "','" + wmail + "','" + status + "', CURDATE())");
	    if (i > 0) {
	    	out.print("Request rejected successfully! "+"<a href='wsuccess.jsp'>Go to your home page</a>");
	        //session.setAttribute("userid", user);
	        //response.sendRedirect("cwelcome.jsp");
	        //out.print("Registration Successfull!"+"<a href='csignin.jsp'>Go to Login</a>");
	    } else {
	    	out.print("An error occured - Request not rejected!"+"<a href='wsuccess.jsp'>Go to your home page</a>");
	        //response.sendRedirect("csignin.jsp");
	    }
	}
}
	//else if (status.equals("CReqWAccCAcc"))	{	}
	//else if (status.equals("CReqWAccCRej"))	{	}
	
	String query = "select * from task where wmail='" + workermail + "'";
	System.out.println("wstatus.jsp - query: " + query);
	ResultSet rs = st.executeQuery(query);
	
	if (rs != null)
	{
		System.out.println("wstatus.jsp - rs != null");
		while (rs.next())
		{
			if (rs.getString(5).equals("CReqWAccCRej"))
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
				<b>Requests Rejected by Clients</b>
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
			<% for(int i=0; i<pList.size(); i++)
				{%>
			<td><%=pList.get(i)%></td>
			<%	System.out.println("@@@@@@ "+i+" - "+pList.get(i));
				} %>
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

	<table width="700px" align="center" style="border: 1px solid #000000;">
		<tr>
			<td colspan=3 align="center" style="background-color: DodgerBlue">
				<b>Tasks In Progress - Assigned by Clients</b>
			</td>
		</tr>
		<tr style="background-color: lightgrey;">
			<td><b>Client Mail</b></td>
			<td><b>Task</b></td>
			<td><b>Worker Mail</b></td>
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

</body>
</html>