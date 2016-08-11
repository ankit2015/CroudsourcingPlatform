<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Worker Registration</title>
    </head>
    <body>
        <form method="post" action="wregistration.jsp">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="fname" placeholder="First name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>Phone number</td>
                        <td><input type="tel" name="phone" value="" /></td>
                    </tr>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="uname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass" value="" /></td>
                    </tr>
                    <tr>
                        <td>Field of Expertise</td>
                        <td><input type="text" name="foe" value="" /></td>
                    </tr>
                    <tr>
                        <td>Location</td>
                        <td><input type="text" name="loc" value="" /></td>
                    </tr>
                    <tr>
                        <td>Professional Reference</td>
                        <td><input type="text" name="proref" value="" /></td>
                    </tr>
                    <tr>
                        <td>Experience</td>
                        <td><input type="text" name="experf" value="" /></td>
                    </tr>
                    <tr>
                        <td>Fee ($CAD)</td>
                        <td><input type="text" name="fperf" value="" /></td>
                    </tr>
                    <tr>
                        <td>Period of Availability (24-hour clock)</td>
                        <td><input type="text" name="aperf" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">Already registered!! <a href="wsignin.jsp">Login Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>