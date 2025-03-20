<%@ page import="java.sql.*" %>
<%
		int pid=Integer.parseInt(request.getParameter("pid"));
		String pname=request.getParameter("pname");
		String puname=request.getParameter("puname");
		String ppwd=request.getParameter("ppwd");
		String pgender=request.getParameter("pgender");
		String paddr=request.getParameter("paddr");
		long pphno=Long.parseLong(request.getParameter("pphno"));
         String pdis=request.getParameter("pdis");
		//out.print(sid+" "+sname+" "+suname+" "+spwd+" "+sgender+" "+saddr+" "+sphno);

		try
		{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
				
				String sql="insert into pat values(?,?,?,?,?,?,?,?)";
				PreparedStatement pst=con.prepareStatement(sql);
				pst.setInt(1,pid);
				pst.setString(2,pname);
				pst.setString(3,puname);
				pst.setString(4,ppwd);
				pst.setString(5,pgender);
				pst.setString(6,paddr);
				pst.setLong(7,pphno);
				pst.setString(8,pdis);
				
				pst.executeUpdate();

				out.print("Patient Registration Successful"+"<br>");

				out.print("<a href='login.html'>click here to login</a>");

				con.close();
		}
		catch(Exception e)
		{
			out.print(e);
		}

%>