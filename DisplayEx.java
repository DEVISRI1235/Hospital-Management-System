import java.io.*; 
import javax.servlet.*; 
import java.sql.*;

public class DisplayEx extends GenericServlet
{ 
	public void service(ServletRequest req,ServletResponse res)throws IOException,ServletException
	{ 
 
		res.setContentType("text/html"); 
		PrintWriter out=res.getWriter();

	    
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
			String qry="select * from student";
			Statement stmt=con.createStatement();
			ResultSet rs= stmt.executeQuery(qry);
			while(rs.next())
			{
				out.print(rs.getInt(1)+""+rs.getString(2)+""+rs.getInt(3)+""+rs.getString(4)+""+rs.getString(5)+""+rs.getLong(6));
                con.close();
			}
            
            
		}
		catch (Exception e)
		{
			out.print(e);
		}
		
	} 
} 
