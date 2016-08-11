<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="csignin.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("userid")%><br/>
<!--<a href='clogout.jsp'>Log out</a><br/>
<a href='cstatus.jsp'>Status</a>
-->
<html>
  <head>
  <title>Search Worker</title>
  
  <meta charset='utf-8'>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="styles.css">
  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
  <script src="script.js"></script>
 
	 <div id='cssmenu'>
	<ul>
	   <li class='active'><a href='clogout.jsp'><span>Log out</span></a></li>
	   <li class='last'><a href='cstatus.jsp'><span>Status</span></a></li>
	</ul>
	</div>
  
  </head>
  <body>
  
  
  
    <br/><br/>
    <form method="post" name="frm" action="Search">
      <table border="0" width="300" align="center">
        <tr><td colspan=2 style="font-size:12pt;" align="center">
        <h3>Search Worker - Enter Task Information</h3></td></tr>
        <tr><td ><b>Field of expertise:</b></td>
          <td>: <input  type="text" name="foe" id="foe" required="required">
        </td></tr>
        <tr><td ><b>Response time required (when)</b></td>
          <td>: <input  type="text" name="time" id="time" required="required">
        </td></tr>
        <tr><td ><b>Location*</b></td>
          <td>: <input  type="text" name="loc" id="loc">
        </td></tr>
        <tr><td ><b>Budget range: from</b></td>
          <td>: <input  type="text" name="bud1" id="bud1" required="required">
        </td>
        <td ><b>to</b></td>
          <td>: <input  type="text" name="bud2" id="bud2" required="required">
        </td>
        </tr>

        <tr><td colspan=2 align="center">
        <input  type="submit" name="submit" value="Search"></td></tr>
      </table>
    </form>
  </body>
</html>

<%
    }
%>