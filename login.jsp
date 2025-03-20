<%@ page import="java.sql.*"%>
<%
		String un=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
			String qry="select * from pat where puname=? and ppwd=?";
			PreparedStatement pstmt=con.prepareStatement(qry);
			pstmt.setString(1,un);
			pstmt.setString(2,pwd);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				//out.print("login success<br>");
				session.setAttribute("pname",un);
				%>
					
					<jsp:forward page="home.html">
					   <jsp:param name="uname" value="<%=un%>"/>
					</jsp:forward>
				
				<%
		    
			}
	        else
            {
				out.print("login failed & invalid credentials");
				%>
					<jsp:include page="login.html"/>
				<%
			}
			con.close();
		}
		catch(Exception e)
		{
			out.print(e);
		}
		   
%>
