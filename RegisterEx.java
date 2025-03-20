import java.io.*; 
import javax.servlet.*; 
import java.sql.*;

public class RegisterEx extends GenericServlet
{ 
	public void service(ServletRequest req,ServletResponse res)throws IOException,ServletException
	{ 
 
		res.setContentType("text/html"); 
		PrintWriter out=res.getWriter();

	    int sid=Integer.parseInt(req.getParameter("id"));
        String sname=req.getParameter("name");
		int sage=Integer.parseInt(req.getParameter("age"));
		String saddr=req.getParameter("addr");
		String sgender=req.getParameter("gender");
		long sphno=Long.parseLong(req.getParameter("phno"));
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
			String qry="insert into student values(?,?,?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(qry);
			pstmt.setInt(1,sid);
			pstmt.setString(2,sname);
			pstmt.setInt(3,sage);
			pstmt.setString(4,saddr);
			pstmt.setString(5,sgender);
			pstmt.setLong(6,sphno);

			pstmt.executeUpdate();

            out.print("1 row inserted successfully");
			con.close();

			out.print("<a href='display'>click here to display student data</a>");
		}
		catch (Exception e)
		{
			out.print(e);
		}
		
	} 
} 
