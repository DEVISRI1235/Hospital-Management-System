<%@ page import="java.sql.*" %>
<html>
    <title> Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        center {
            margin-top: 50px;
        }
        a {
            color: #007bff;
            text-decoration: none;
            margin: 10px;
        }
        a:hover {
            text-decoration: underline;
        }
        h1 {
            color: #333333;
        }
.profile-container {
 flex: 2;
 display: flex;
 align-items: center;
 justify-content: center;
}
.profile-picture {
 width: 72px;
 height: 72px;
 border-radius: 50%;
 object-fit: cover;
}
</style>
<center>
<body>
<div class="profile-container">
<img class="profile-picture" src="img/profile.jpeg" alt="">
</div>
<br>
        <a href="home.html">Click here to go to Main Page</a>
        <a href="logout.jsp">Logout</a>
<br>

<hr>

<%
String pname = (String)session.getAttribute("pname");
if(pname != null)
{

out.println("Welcome  "  + pname+"  This is your Profile");


try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
String qry="select * from pat where puname=?";
PreparedStatement pstmt=con.prepareStatement(qry);
pstmt.setString(1,pname);
ResultSet rs=pstmt.executeQuery();
while(rs.next())
{
	%>
		<table align="center" border="2">
		<tr><th colspan="2">Your Details</th></tr>
		<tr><td>ID</td><td><%=rs.getInt(1)%></td></tr>
		<tr><td>Name</td><td><%=rs.getString(2)%></td></tr>
		<tr><td>User Name</td><td><%=rs.getString(3)%></td></tr>
		<tr><td>Password</td><td><%=rs.getString(4)%></td></tr>
		<tr><td>Gender</td><td><%=rs.getString(5)%></td></tr>
		<tr><td>Address</td><td><%=rs.getString(6)%></td></tr>
		<tr><td>Mobile</td><td><%=rs.getLong(7)%></td></tr>
		<tr><td>Disease</td><td><%=rs.getString(8)%></td></tr>
		</table>
		<%
}
}
catch (Exception e)
{
    out.print(e);
}
}
else
{
out.println("please login first");
RequestDispatcher rd = request.getRequestDispatcher("login.html");
rd.include(request, response);
}
%>
</body>
</center>
</html>